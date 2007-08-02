Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IGTum-0001O5-71
	for openembedded-devel@openembedded.org; Thu, 02 Aug 2007 08:12:04 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l726A1j1024649 for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2007 08:10:02 +0200
Message-ID: <46B1753D.1090507@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 08:10:05 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 06:12:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

There were some report about gstreamer not finding plugins and Cliff Brake reported that
frobbing OE_LT_RPATH_ALLOW helped:

============================================================
- --- packages/gstreamer/gst-common.inc   27ceb74f764523f7d0708087bd16ae8a3627c39e
+++ packages/gstreamer/gst-common.inc   860249c91df6da7ad81a6dffba9d5529cc114c67
@@ -7,6 +7,9 @@ inherit autotools pkgconfig

 inherit autotools pkgconfig

+OE_LT_RPATH_ALLOW = "any"
+OE_LT_RPATH_ALLOW[export]="1"
+
 do_stage() {
     rm -rf ${STAGE_TEMP}
     mkdir -p ${STAGE_TEMP}
============================================================
- --- packages/gstreamer/gst-plugins.inc  6293327f294676ab88b8ec6b36906d0113b3566a
+++ packages/gstreamer/gst-plugins.inc  5dc5a74a21bc2ea4d9870acdac9615b821137cec
@@ -10,6 +10,9 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"

 acpaths = "-I ${S}/common/m4 -I ${S}/m4"

+OE_LT_RPATH_ALLOW = "any"
+OE_LT_RPATH_ALLOW[export]="1"
+
 LIBV = "0.10"

 python populate_packages_prepend () {


Could someone more familiar with gstreamer and/or the OE_LT_RPATH_ALLOW syntax make this
more finegrained?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGsXU9MkyGM64RGpERAuEwAJ9Su8/u9KTVGiUXZZBlV8d1jlXsbwCdEnjA
IiNAD5rXK8/ZHOqucqnBTKU=
=sHJu
-----END PGP SIGNATURE-----


