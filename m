Return-Path: <kristofer.hansson-aspman@pelagicore.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD5F6D36E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 13:39:48 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id el20so1931462lab.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 06:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yQXtBCOdMsziAT+f0X4p85MGVknb55C7xwCGjbbIxJw=;
	b=VEzr8AEvQW76p1K0XgpeKKQHN4AkZcIELU/A43HQ85/aNlMln61+73/4DIS7L+ImNa
	+SOsyZVvseNII8CI/HE2Zxklxej96WmpK03MGeFyXYoxeiKsRIw2t401WJv3HGc6Y+uD
	LVZRCHddhrocP315JzuXNi4Pvg622jLapKWuAlOQ+S/FMywCdWdE0vwshjFCqPakhBcC
	LpP3bYp7S+21i+kUBRMBx0Ae9uUGSDPSoR6Kh2ousGo96FtKCASmTXnOPBx+NqqmAuXC
	9oNfcWuxuuWrvTvwsENSPxed3tZWS7OChzD0Ie+lXhmBXW7FkewCdUBkcXY1fpQsJMFY
	pKtQ==
X-Gm-Message-State: ALoCoQlJCgwxXrH4dcMXau2r4v20olxKy9X9sfTkj6eZ71CkvrMVBHSWvDrdhmQOe/XIp4+kbZOz
X-Received: by 10.112.159.166 with SMTP id xd6mr2019535lbb.22.1382621989497;
	Thu, 24 Oct 2013 06:39:49 -0700 (PDT)
Received: from K-Ubuntu-13.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id b6sm1676463lae.0.2013.10.24.06.39.48
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 06:39:48 -0700 (PDT)
From: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2013 15:39:33 +0200
Message-Id: <1382621973-3677-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCH] qtconnectivity: Added recipe.
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
X-List-Received-Date: Thu, 24 Oct 2013 13:39:49 -0000

Signed-off-by: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
---
 recipes-qt/qt5/qtconnectivity.inc    | 3 +++
 recipes-qt/qt5/qtconnectivity_git.bb | 4 ++++
 2 files changed, 7 insertions(+)
 create mode 100644 recipes-qt/qt5/qtconnectivity.inc
 create mode 100644 recipes-qt/qt5/qtconnectivity_git.bb

diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
new file mode 100644
index 0000000..b2147f1
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -0,0 +1,3 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
new file mode 100644
index 0000000..2bd016b
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -0,0 +1,4 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "c21addb23f2eb67dc55853b115e5b735df065891"
-- 
1.8.1.2


