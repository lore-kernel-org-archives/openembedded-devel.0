Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlL0w-0002SD-Lo
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 15:53:06 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Dec 2012 06:38:09 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so1696888wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 06:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=nA7JmpQVoa1aYSvjU2u731mDm0hg716llge/1UG9NI4=;
	b=dyHgZskQRGKsmZSlIFeNKTB1OMhVXoHZZ37llON3GeKvmmXuQSCbDVPxsh2W1wTWZk
	RFFLAUlCYPx1N71eqY9d3U7ihgADBgAWnFuUOfRuGLQtYgN7jAH3tEV+7cK3EvwiFdyB
	9HETGSH6c1FhZiUAtMC6SJVgSmV8LALOOMaGoRottK85nPICTTkcNJIbqwLcs4onJDqN
	Fqnjz2Af1HMAaNUubwfiRMIoku/bQr/y/CF/FgvV4lBXuuqAFiamVf4FLm4fUI1hsYmr
	RLDK12bger6Nj0A50dj8OEwFjVcomQQORteh10By6K05ES85C3KtoAQ3t+0YeisZYdSm
	6klA==
X-Received: by 10.194.82.168 with SMTP id j8mr12044166wjy.15.1355927888491;
	Wed, 19 Dec 2012 06:38:08 -0800 (PST)
X-Received: by 10.194.82.168 with SMTP id j8mr12044147wjy.15.1355927888294;
	Wed, 19 Dec 2012 06:38:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo10sm8201274wib.9.2012.12.19.06.38.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 06:38:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2012 14:36:24 +0000
Message-Id: <1355927784-13401-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm4RipFOhBVJP1gE+UP88tbmpqSZv4/90ensdIHGSA54wE6RtYV1wJkZxelSCPvNpncg7qyE9NaQNkoys33oXCrXcD+Hl2rcja2ZBssRMF1Cz+sQvH4Ty5srYiajg47AJIuSaFMOhkb5IJnzJ/kKxtGCNz3XcH7vhvIGnBuUcSvFe2HpNwigRLSpzvmWI+EOaokep02
Subject: [PATCH V2] python-mako: install standalone, not as an egg
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
X-List-Received-Date: Wed, 19 Dec 2012 14:53:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
index 9113666..d2222d6 100644
--- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
+++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
 SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
@@ -13,6 +13,10 @@ S = "${WORKDIR}/Mako-${PV}"
 
 inherit distutils
 
+DISTUTILS_INSTALL_ARGS = "--single-version-externally-managed \
+                          --root=${D} \
+                          --install-lib=${PYTHON_SITEPACKAGES_DIR}"
+
 RDEPENDS_${PN} = "python-threading \
                   python-netclient \
                   python-html \
-- 
1.7.10



