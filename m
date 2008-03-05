Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1JWyaB-0000oM-K4
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Mar 2008 19:43:17 +0100
Received: from andromeda (e180172199.adsl.alicedsl.de [85.180.172.199])
	by drlauer-research.com (Postfix) with ESMTP id 84C33584BEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2008 19:48:33 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 5 Mar 2008 19:42:12 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200803051942.12586.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: sysroot vs. finding header files
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
X-List-Received-Date: Wed, 05 Mar 2008 18:43:17 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

with the new sysroot stuff in, we have a problem when autotoolized packages 
like xorg-lib/libx11_*.bb abuse pkgconfig like that:

PKG_CHECK_MODULES(XPROTO, [xproto >= 7.0.6])
AC_SUBST(XPROTO_CFLAGS)

...

# Find keysymdef.h
#
KEYSYMDEF=""
AC_MSG_CHECKING([keysymdef.h])
for flag in $XPROTO_CFLAGS -I/usr/include; do
        case "$KEYSYMDEF" in
        "")
                case "$flag" in
                *-I*)
                        dir=`echo "$flag" | sed 's/ *-I//'`
                        file="$dir/X11/keysymdef.h"
                        if test -f "$file"; then
                                KEYSYMDEF="$file"
                        fi
                        ;;
                esac
                ;;
        esac
done

With pkgconfig now pointing to /usr (and friends), this no longer finds a 
keysymdef.h until you have X on your buildhost.

Any ideas how to fix that in the best way? (I hope there are not more of these 
things hidden)

Cheers,

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


