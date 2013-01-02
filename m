Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKC-0006mt-Ho
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:44 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so5725069eaa.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=8LXOgDotLzaAHK4UkQhYLfZaKM00S7rfT8lkYriQa6g=;
	b=QtRCOKcwfXdO4+LAsNXp4GcxQOc3wvJdBzqs0Ic0+IjyfrFcuu170AfLR3cm8O/1cP
	oc8vx1BSh44kTI+BZfG9eeogpxw/RVcnO9bWRBd8Sg/csno80A0N3kdnv5FYFcCe7568
	/XL8K1sc9ribZExVkzFqdraGyBg6pEtnLRV/6LbAcOiVeV6whWzV7RsYLo60HBckNAjX
	i3GKQ2PIL2X0YWX+Hs9FdAoupBrzXx/4qfMQ2n9h0XQn22UVKSMVU/JLOb48PQSyHTMm
	jtXULXW8bWBquLcIPvyr2Hzo5aioME291FUGoTWBCZITI6EXKn4lDf/tNU728gNpS0BP
	MoHA==
X-Received: by 10.14.206.197 with SMTP id l45mr126122821eeo.17.1357136082413; 
	Wed, 02 Jan 2013 06:14:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm97825594eem.14.2013.01.02.06.14.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:43 +0100
Message-Id: <c79976db15688c769cc2f41ae25bb107ae2657ae.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/6] python-sip: upgrade to 4.14.2
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python-sip_4.13.3.bb                  | 3 ---
 .../recipes-devtools/python/{python-sip.inc => python-sip_4.14.2.bb}  | 4 +++-
 2 files changed, 3 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
 rename meta-oe/recipes-devtools/python/{python-sip.inc => python-sip_4.14.2.bb} (87%)

diff --git a/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb b/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
deleted file mode 100644
index aed799d..0000000
--- a/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-sip.inc
-SRC_URI[md5sum] = "76192829cc42ec558db46e4f9e1d8ba9"
-SRC_URI[sha256sum] = "ec295f71ef339c5b98db5650865f2c6c1200c4085b7a3f33f284111e1f534ac1"
diff --git a/meta-oe/recipes-devtools/python/python-sip.inc b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
similarity index 87%
rename from meta-oe/recipes-devtools/python/python-sip.inc
rename to meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
index d42414b..1159a2a 100644
--- a/meta-oe/recipes-devtools/python/python-sip.inc
+++ b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
@@ -3,13 +3,15 @@ SECTION = "devel/python"
 HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
 AUTHOR = "Phil Thompson"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://siplib.sbf.in;endline=15;md5=e0e7b5d0c4656666df09826ea1d2071c"
+LIC_FILES_CHKSUM = "file://siplib.sbf.in;endline=15;md5=3d462bd8cb43db3e4be998fe155ae9cf"
 DEPENDS = "python"
 RDEPENDS_${PN} = "python-core"
 
 # riverbankcomputing is upstream, but keeps only latest version, sf usually have few older
 #SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
+SRC_URI[md5sum] = "b93442e745b3be2fad89de0686a76ce9"
+SRC_URI[sha256sum] = "1a9d3bf26c821f369c175f8e68946b79bc994da4f96e8f5ecff06e6ee7ac0528"
 
 S = "${WORKDIR}/sip-${PV}/siplib"
 
-- 
1.8.0.2



