Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JFTlH-0006R8-01
	for openembedded-devel@openembedded.org; Thu, 17 Jan 2008 13:22:23 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0HCME0k004000 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 13:22:15 +0100
Message-ID: <478F4876.9030405@student.utwente.nl>
Date: Thu, 17 Jan 2008 13:22:14 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
In-Reply-To: <413710907.20080117131841@gmail.com>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Thu, 17 Jan 2008 12:22:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
| How workarounds for specific buggy wifi cards relate to a generic APM
| daemon? Or from other side, why everyone should endure more latency
| during suspend/resume, with that latency already being >1s, because 5%
| or less of those "everyone" use buggy cards?
|
| Please move this workaround to a packages of the buggy driver, or to a
| separate package which is RDEPEND'ed by buggy driver. See
| bluez-dtl1-workaround_1.0.bb for similar conversion performed.

IIRC this is a workaround for cards that have their firmware in RAM
(i.e. almost all hostap cards). They loose their firmware on suspend and
our scripts don't reload it. This is actually a bug in our firmware
loading scripts and I think this solution is acceptable medium-term, but
~ longterm we should fix our firmware loading scripts.

regards,

Koen



| This is a forwarded message
| From: Laibsch commit <openembedded-commits@lists.openembedded.org>
| To: openembedded-commits@lists.openembedded.org
| Date: Wednesday, January 16, 2008, 3:03:20 PM
| Subject: [oe-commits] org.oe.dev apm: turn off wifi cards before
suspend so they are fully reloaded upon resume. closes 3664.
|
| ===8<==============Original message text===============
| apm: turn off wifi cards before suspend so they are fully reloaded
upon resume. closes 3664.
|
| Author: Laibsch@openembedded.org
| Branch: org.openembedded.dev
| Revision: 1b0acc215822890043b4d815ac222a6c2e77a15b
| ViewMTN:
http://monotone.openembedded.org/revision/info/1b0acc215822890043b4d815ac222a6c2e77a15b
| Files:
| 1
| packages/apmd/apmd-3.2.2/90-wifi-off
| packages/apmd/apmd_3.2.2.bb
| Diffs:
|
| #
| # mt diff -rad00788d9e2f2f3b509d80f534463b293eecccb5
- -r1b0acc215822890043b4d815ac222a6c2e77a15b
| #
| #
| #
| # add_file "packages/apmd/apmd-3.2.2/90-wifi-off"
| #  content [dd2b60322fc6d9136495d7c41f7c1f9e73ed8937]
| #
| # patch "packages/apmd/apmd_3.2.2.bb"
| #  from [468e386d67d32dcf673ffd462940acdf206daeee]
| #    to [7e1be5e159f4f8ae062efeda347fda7056e83fc8]
| #
| ============================================================
| --- packages/apmd/apmd-3.2.2/90-wifi-off
dd2b60322fc6d9136495d7c41f7c1f9e73ed8937
| +++ packages/apmd/apmd-3.2.2/90-wifi-off
dd2b60322fc6d9136495d7c41f7c1f9e73ed8937
| @@ -0,0 +1,12 @@
| +#!/bin/sh
| +#Author: Rolf Leggewie
| +#
| +# turn off wifi cards before suspend so they are fully reloaded upon
resume
| +
| +wifislot = `pccardctl ls|egrep '(hostap|orinoco)'|cut -f 2 -d " "`
| +if test $wifislot
| +then
| +  for slot in $wifislot; do
| +    pccardctl eject $wifislot
| +  done
| +fi
| ============================================================
| --- packages/apmd/apmd_3.2.2.bb	468e386d67d32dcf673ffd462940acdf206daeee
| +++ packages/apmd/apmd_3.2.2.bb	7e1be5e159f4f8ae062efeda347fda7056e83fc8
| @@ -1,9 +1,9 @@ LICENSE = "GPL"
|  DESCRIPTION = "Set of tools for managing notebook power consumption."
|  SECTION = "base"
|  PRIORITY = "required"
|  DEPENDS = "libtool-cross"
|  LICENSE = "GPL"
| -PR = "r8"
| +PR = "r9"
|
|  SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_${PV}.orig.tar.gz \
|             file://debian.patch;patch=1 \
| @@ -12,6 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/
|            file://unlinux.patch;patch=1 \
|             file://init \
|             file://default \
| +           file://90-wifi-off \
|             file://apmd_proxy \
|             file://apmd_proxy.conf"
|
| @@ -49,6 +50,7 @@ do_install() {
|
|         install -m 4755 ${S}/.libs/apm ${D}${bindir}/apm
|         install -m 0755 ${S}/.libs/apmd ${D}${sbindir}/apmd
| +       install -m 0755 ${WORKDIR}/90-wifi-off
${D}${sysconfdir}/apm/suspend.d
|         install -m 0755 ${WORKDIR}/apmd_proxy ${D}${sysconfdir}/apm/
|         install -m 0644 ${WORKDIR}/apmd_proxy.conf ${D}${datadir}/apmd/
|         install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/apmd
|
|
|
| _______________________________________________
| Openembedded-commits mailing list
| Openembedded-commits@lists.openembedded.org
| http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
|
| ===8<===========End of original message text===========
|
|
|


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHj0h2MkyGM64RGpERAtIcAJ9JUdGF1sA/S91U0LyNNqPTkZ//lgCeP2F9
Dg7wYUW2xM6Vq8rqIr8zuT4=
=+ZmV
-----END PGP SIGNATURE-----


