Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SLBh3-0000vp-FQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 13:08:01 +0200
Received: by wibhm17 with SMTP id hm17so559791wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 03:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=8sadKaMysZi07vXKCy4E8hmR9xmwEuEmE6xOyPpXFNw=;
	b=FV5tjfU3tGUvR1/ToBGWS7QGy+x7H0emXOcKHN5TfMGgcOSxphVgU0/SMm0YElyzP0
	uTX2UTzjBwr1JWGrYqsTbkAY4E0g5rHoBRZjH6fBVQyJf1U3vZFwuUc/K5oIdU5hBkeu
	l8RkwR+ytUifE7KdG5E/vJ1l1/RIFNxaxAf/VCabyoRrHJxQ3EhoEv1uHQYnSAUl/nRB
	LYNIe+7NcXiz1OB/pq5eS63tLgn354kdJ/5yihi0ax4pF4W+MXjevDnNuvdN6tLZp5PI
	P00L2f/QoYUuVi2NzRtiAKch9hwmGS7UCsjqgii/pLr1iySixID/5AESmPHY67xjFAIE
	JvdQ==
Received: by 10.216.132.229 with SMTP id o79mr3520472wei.64.1334919512060;
	Fri, 20 Apr 2012 03:58:32 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm4674851wib.2.2012.04.20.03.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Apr 2012 03:58:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Apr 2012 12:58:20 +0200
Message-Id: <1334919500-1010-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk/l+lEyxcpTJsmF8SUI6ONkeLR40REexH4PWUXtfwS63Jg4UnqsNLVzx4ZSivZu41Sk9lY
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] qt bbappends: play nice with bbappends in other layers by incrementing PRINC instead of overwriting it
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
X-List-Received-Date: Fri, 20 Apr 2012 11:08:01 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend |    1 +
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend |    2 +-
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend |    1 +
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend |    2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
index 9b4ede4..27cac11 100644
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
@@ -3,3 +3,4 @@ QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-
 QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
                     -I${STAGING_INCDIR}/postgresql"
 
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
index 3c1ac5e..27cac11 100644
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
@@ -3,4 +3,4 @@ QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-
 QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
                     -I${STAGING_INCDIR}/postgresql"
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
index 9b4ede4..27cac11 100644
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
@@ -3,3 +3,4 @@ QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-
 QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
                     -I${STAGING_INCDIR}/postgresql"
 
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
index 3c1ac5e..27cac11 100644
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
@@ -3,4 +3,4 @@ QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-
 QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
                     -I${STAGING_INCDIR}/postgresql"
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
-- 
1.7.7.6



