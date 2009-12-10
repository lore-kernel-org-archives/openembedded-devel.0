Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1NIWYS-00049J-PO
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 01:06:51 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-90-4b203b268a1f
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: OE-Dev <openembedded-devel@lists.openembedded.org>
Date: Wed, 09 Dec 2009 19:04:52 -0500
Message-Id: <1260403492.2106.17.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: libtool failing to define echo?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2009 00:06:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've got an issue building cairomm-1.8.2 (which is newer than the latest
version in OE proper).

Basically libtool is not defining $echo and this is causing compile
errors. I can work around the issue by inserting an echo=echo before the
failure, but this seems like either a cairomm bug or a libtool bug. I'm
just not sure how to go about properly patching it since I don't fully
'get' libtool. If anyone can offer some insight as to the proper fix, it
would be greatly appreciated.

I'm using libtool 1.5.24 at the moment. I seem to recall running into
issues with a newer version, but if the correct thing to do is to
upgrade libtool, let me know.


> # Darwin sucks
> eval std_shrext=\"$shrext_cmds\"

Here is my bogus workaround define
> echo=echo
> 
> disable_libs=no
> 
> # Parse our command line options once, thoroughly.
> while test "$#" -gt 0
> do
>   arg="$1"
>   shift
> 
>   case $arg in
And here is where it fails without the bogus workaround
>   -*=*) optarg=`$echo "X$arg" | $Xsed -e 's/[-_a-zA-Z0-9]*=//'` ;;
>   *) optarg= ;;
>   esac



