Received: from [212.47.7.226] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IXNIi-0006iK-Js
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2007 22:34:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 2A2D23000ECE;
	Mon, 17 Sep 2007 22:30:57 +0200 (CEST)
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (penguin [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04957-01; Mon, 17 Sep 2007 22:30:56 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 68DC930008E2;
	Mon, 17 Sep 2007 22:30:53 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1189985156.9658.38.camel@localhost.localdomain>
References: <1189985156.9658.38.camel@localhost.localdomain>
Date: Mon, 17 Sep 2007 22:30:51 +0200
Message-Id: <1190061051.8742.20.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at penguin.cz
Cc: Ross Burton <ross@openedhand.com>
Subject: Re: RFC: Staging layout and pkgconfig sysroot support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2007 20:34:36 -0000
X-Groupsio-MsgNum: 2934
Content-Type: multipart/mixed; boundary="=-rudUdODiOWCFxmvleahn"

--=-rudUdODiOWCFxmvleahn
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

> I'm interested in people's views on whether this would be a worthwhile
> change or not? Should we change all staging layouts or leave say native
> packages as they are?
> 
> As a first step I will investigate removing some of the hardcoded layout
> assumptions I've found so far as I think they're good to remove
> regardless of whether we change staging layout or not. In theory people
> or distros could maybe then choose their own layout even!

Well, I proposed the systoot some time ago and you opposed with its
disadvantages.

I tried the second way: Write a compiler wrapper.

Here is my first proof of concept wrapper. Now it hardcodes paths and
some parts should be a subject of discussion (e. g. -nostdinc). It
already compiled a small binary+library, but I did not try bootstrap
with it yet (I don't know how to do a system-wide change of cross-CC
etc.).

Advantages of gcwrap over -sysroot:
- We can keep existing structure.
- Save storage while building for more platforms at once.

Advantages of -sysroot over gcwrap:
- A bit better support (in gcc and libtool but not automake checks).
- Simpler manipulation with one directory.

There is a particular question, whether overlay parts
noarch-platform-machine should follow target system structure.
I think that yes, even if it could break some recipes.

In all cases, I would propose a QA tool causing error of any package
embedding any staging dir or DESTDIR into any file (except debug info).

There is still a lot of stuff, which don't support any of mentioned
concepts at all (e. g. AC_CHECK_FILE, AC_CHECK_PATH checks) and could
cause bad assumption (see fileutils locate script). In these cases, one
must provide a correct ac_ value to configure script or even patch the
package.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus

--=-rudUdODiOWCFxmvleahn
Content-Description: 
Content-Type: application/x-shellscript
Content-Disposition: inline; filename=gcwrap
Content-Transfer-Encoding: 7bit

#!/bin/bash

# Warning: Your local compilation builddir musr not be inside /usr!

GCW_DIR1=/OE/tmp/staging/spitz-angstrom-linux-gnueabi
GCW_DIR2=/OE/tmp/staging/arm-angstrom-linux-gnueabi
GCW_DIR3=/OE/tmp/staging

function add_gcw_args {
    GCW_ARGS[${#GCW_ARGS[@]}]="$1"
}
GCW_ARGS=( $1 -L$GCW_DIR1/lib -L$GCW_DIR2/lib -L$GCW_DIR3/lib -nostdinc -I/OE/tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include -I$GCW_DIR1/include -I$GCW_DIR2/include -I$GCW_DIR3/include )
#GCW_ARGS=( $1 )
shift
GCW_REWRITE=false
while test $# -gt 0 ; do
    if $GCW_REWRITE ; then
	case "$1" in
	/usr* )
	    add_gcw_args "$GCW_DIR1${1#/usr}"
	    add_gcw_args $GCW_COMMAND
	    add_gcw_args "$GCW_DIR1${1#/usr}"
	    add_gcw_args $GCW_COMMAND
	    add_gcw_args "$GCW_DIR3${1#/usr}"
	    ;;
	* )
	    add_gcw_args "$1"
	    ;;
	esac
	GCW_REWRITE=false
    else
	case "$1" in
	-L | -I )
	    GCW_REWRITE=true
	    GCW_COMMAND="$1"
	    add_gcw_args "$GCW_COMMAND"
	    ;;
	-L/usr* | -I/usr* )
	    add_gcw_args "${1:0:2}$GCW_DIR1${1#-?/usr}"
	    add_gcw_args "${1:0:2}$GCW_DIR2${1#-?/usr}"
	    add_gcw_args "${1:0:2}$GCW_DIR3${1#-?/usr}"
	    ;;
	* )
	    add_gcw_args "$1"
	    ;;
	esac
    fi
    shift
done
echo "=== DEBUG gcwrap: ${GCW_ARGS[*]}"
exec ${GCW_ARGS[@]}

--=-rudUdODiOWCFxmvleahn
Content-Disposition: attachment; filename=gcwrap_test.tar.bz2
Content-Type: application/x-bzip-compressed-tar; name=gcwrap_test.tar.bz2
Content-Transfer-Encoding: base64

QlpoOTFBWSZTWXo9OzMAAhJ/pMwQABB8c//fPmb8pP/v3+oAAIABAAhQAz3uQakqtDHNMjIZMENG
EwRpo0YgaZMjAAEGSQKeBip4jUGhoYgAwCDCMCDHNMjIZMENGEwRpo0YgaZMjAAEEUlR6aJ6j0hp
6jT0mgAAAaAAABoJIQiaaJtJ6jJGmGpoyGj1NGCGQaMmjyjmcXywFxw+rE0AMToiXZq5NbKHQrjQ
iwM65Qskk606jJ192ribwuO8b8RqKniNFsh9HNHAcpijvc2VeQNhQrLBeDYdFFlTs49ZiXh9a0Tr
DokUiLfEahUGmEdpWgRBaWkID0uxUDr2EBrA4OErZIjQkETz8b6MmbHhVZUzNgweUy85jM5pNxL/
KcgOr9jl7G1WG+c/QTQt1CYOjxDWhMlJC0khTAumQLgM+abM46HONn7AKy9X7y6r8lo8kRZI5UcY
exYWZjhHXy0pC9S7yjihMmXN8QpJdcyQzwumFOlFIjr6g8yilHhFXURQmoIiupSGeIfxLCsqo/YY
HiqskqtozCoqvbwVHSZwcY8p7Z/s7vnHSGsFBpIbwHwB6+4soEKHAob7GeoXdEnQPiAn+u3jAn4A
QrqGWhc4MGoZPzXZfFyHERsjghOqMCPGknu02yHahNswRG0S5nqXwR0igYC0UzCFvsC2eEREG4Ei
04ztwk0TRkan9O0WORsH3vNzcM42rM+KQntQnqGJKuwxHozYcdRjxKTpBxStIKbbYW4rV5AmHJMM
qqYmRxidGmgiKyTLdvHIjnIOikmimSnmUrhqOUahwGRbZJJbo6TbldRoL9d95AbrYeBJgzLWTVWg
MMDeW4SkrdSctSrJZiMI1bdMr7aG4KIuWQWshxGNjFYOnQmFLAT90haGZjdQkJKm01BFLC0FeAMB
lJ5qATSLoSdyInk6C4KZZA0gHWIGL6QjpIOQoqVldwG8i4KZWW2Y1kShCyOhYcpbaowFQrlBJjax
mwnzrenlVmaYDmALGQVG2jFRSFqIO9iwvQm2FWDWD1wIoDJBs4Q2kmrWtlWbJd8HegTqSwAjZK0K
OJWmtVgYWwrjW4lRdSpWcsGW3yCItzmqVqv+LuSKcKEg9Hp2Zg==

--=-rudUdODiOWCFxmvleahn--
