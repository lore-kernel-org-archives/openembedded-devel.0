Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFPXV-00078s-If
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 14:42:17 +0200
Received: by ggcy3 with SMTP id y3so65929ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=mg8TwbT+lFuRcwStKa1cp8P+W3nHPf4AlN/PSS36EwE=;
	b=wHJj6eNkNG2r5SODmg923j8x3/HefNc7g25j8T0cveZDCc6IJGUY+tio7rZZ8mQXNZ
	Ir1NcNsbW/mBiDcqOAbWT+rBHGoQDN6gI84k84kPK5TMSGH4GAuBl2NGeQD1E1E2BIUN
	tnNQX2/YFPjWWhtvbKeGJkaNWCTOgeeQiUQrcOpkqkDB/atipwvA4PKo6HfgdRArCEqN
	wTQxEgw4JAQSiVoL47xNLQGqtOjc82Bi0Rpq7w0VaTY244TXKLzf8QDSIh4AFPvPgKKz
	jU7c5T2eHctcgon9/3LlagXHYy24Ip9FMJUWIqS/0JEFKia+zlaFoEuVBiIkzRGUyJyA
	p2tw==
Received: by 10.236.193.68 with SMTP id j44mr14740062yhn.31.1333542786848;
	Wed, 04 Apr 2012 05:33:06 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d25sm2044087yhe.4.2012.04.04.05.33.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 05:33:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 12:32:52 +0000
Message-Id: <abff6e4792aac59ecc21b5b2f37da530134a0a40.1333542709.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1333542709.git.otavio@ossystems.com.br>
References: <cover.1333542709.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1333542709.git.otavio@ossystems.com.br>
References: <cover.1333542709.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/3] xbitmaps: add 1.1.1 version
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
X-List-Received-Date: Wed, 04 Apr 2012 12:42:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-data/xbitmaps_1.1.1.bb   |   10 ++++++++++
 .../xorg-data/xorg-data-common.inc                 |   10 ++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc

diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
new file mode 100644
index 0000000..629d932
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
@@ -0,0 +1,10 @@
+require xorg-data-common.inc
+
+DESCRIPTION = "Common X11 Bitmaps"
+LICENSE = "MIT"
+DEPENDS += "libxmu"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=dbd075aaffa4a60a8d00696f2e4b9a8f"
+
+SRC_URI[md5sum] = "7444bbbd999b53bec6a60608a5301f4c"
+SRC_URI[sha256sum] = "3671b034356bbc4d32d052808cf646c940ec8b2d1913adac51b1453e41aa1e9d"
diff --git a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
new file mode 100644
index 0000000..e128763
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
@@ -0,0 +1,10 @@
+HOMEPAGE = "http://www.x.org"
+SECTION = "x11/data"
+LICENSE = "MIT-X"
+
+XORG_PN = "${PN}"
+
+SRC_URI = "${XORG_MIRROR}/individual/data/${XORG_PN}-${PV}.tar.bz2"
+S = "${WORKDIR}/${XORG_PN}-${PV}"
+
+inherit autotools pkgconfig
-- 
1.7.2.5



