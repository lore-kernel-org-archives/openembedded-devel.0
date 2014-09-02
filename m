Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7A63871223
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:35:59 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so7909894pdi.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Sep 2014 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bLCLy31QTMRT3Peq6pwNjr+6IElwxi6MInuRSponnTk=;
	b=KcnIAc8cX+vBylFsxxIWfC74ZpyWTY9NfWUZVf4uTTHlbm/DydcHZoEJz/saQfJpUw
	ggae0V69w0rO3FOLCXJp1hzGI2R4e4DxQcJn5hTJfT7Byx+RPQY6MQG1wML4+33IXzDf
	Sj49pX67QHydgVv+bAJNIxYaBCgDYSSVp94Q5ss6GtemrPjUSdmaaoEzDOAqTaCIADmJ
	zXqez6AyY207bY0r33AfbGRP7N5wUi71DSVfVgnqrDpvVzr08Zb+JqRckdvfagcODfcw
	DQoaAUA22Bs9Ymo1k2mVwO3/1W7GxDQc8zROsFpMf/OZEPz2eSovu7csBzJST3AHn3TN
	C69w==
X-Received: by 10.66.178.231 with SMTP id db7mr3407688pac.63.1409643357606;
	Tue, 02 Sep 2014 00:35:57 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id q1sm4253564pdq.67.2014.09.02.00.35.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Sep 2014 00:35:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 00:39:36 -0700
Message-Id: <1409643577-4088-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
References: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] glade3: Enable gnome support in meta-gnome instead of meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 07:36:00 -0000

This decouples meta-oe dependencies on meta-gnome, right now
we have to use meta-gnome as dependent layer

ERROR: Nothing PROVIDES 'libbonoboui' (but
meta-openembedded/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
DEPENDS on or otherwise requires it)

ERROR: Required build target 'glade3' has no buildable providers.

Missing or unbuildable dependency chain was: ['glade3', 'libbonoboui']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipe-devtools/glade/glade3_%.bbappend | 1 +
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipe-devtools/glade/glade3_%.bbappend

diff --git a/meta-gnome/recipe-devtools/glade/glade3_%.bbappend b/meta-gnome/recipe-devtools/glade/glade3_%.bbappend
new file mode 100644
index 0000000..3abacfb
--- /dev/null
+++ b/meta-gnome/recipe-devtools/glade/glade3_%.bbappend
@@ -0,0 +1 @@
+PACKAGECONFIG ??= "gnome"
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
index d0657e4..69d9eae 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-PACKAGECONFIG ??= "gnome"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
 
 do_configure_prepend() {
-- 
2.1.0


