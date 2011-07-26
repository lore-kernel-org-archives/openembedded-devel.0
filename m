Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlYyu-0003sb-GT
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 06:10:56 +0200
Received: by pzk1 with SMTP id 1so111823pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 21:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bM5SIT0s+61IFih3NBsGsmQ5959JcHMVufZzQkCPcMQ=;
	b=fh0uBW5uyTJ9hb9/+tNmTePVf0mq7u1JvJ3f2lJ8YlTRPJCrWsF0BGweUHS+WFZWHw
	e4IQKtfBGOP0JWCNc0sk70eLNbj+GPwpDvYsijm8Sqlk7HY6d2Ji5ymbAJWMWw9D9GEO
	Nm1zSjx4fpNGziqOpYi/RcXuMrPYhcf/IfKWA=
Received: by 10.68.62.74 with SMTP id w10mr9149810pbr.349.1311653202803;
	Mon, 25 Jul 2011 21:06:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k3sm106217pbj.29.2011.07.25.21.06.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 21:06:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 21:06:32 -0700
Message-Id: <1311653193-29753-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH 1/2] espeak: Use SITEINFO_ENDIANESS instead of SITEINFO_ENDIANNESS
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
X-List-Received-Date: Tue, 26 Jul 2011 04:10:56 -0000

This spelling difference existed when siteinfo was in two places

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/espeak/espeak_1.37.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
index 6cc4cd4..5f9fcc1 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -1,12 +1,14 @@
 require espeak.inc
 inherit siteinfo
 
-EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}'
+EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANESS", "be",  "espeak-data (= ${PV})", "", d)}'
 RDEPENDS_${PN} = "portaudio-v19 ${EXTRA_PHONEMES}"
 
 SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02"
 SRC_URI[sha256sum] = "77f406c345362185ec4f362bf49f61d202e01ac9b9cd5c14f803195a544ce6d3"
 
+PR = "r1"
+
 CXXFLAGS += "-DUSE_PORTAUDIO"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -33,7 +35,7 @@ do_install() {
         install -m 0644 ${S}/src/speak_lib.h ${D}${includedir}
         oe_libinstall -so -C src libespeak ${D}${libdir}
 
-	if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
+	if [ "${SITEINFO_ENDIANESS}" = "be" ] ; then
 		# the big-endian phon* files are provided by the package espeak-data
 		rm -f ${S}/espeak-data/phon*
 	fi
-- 
1.7.4.1



