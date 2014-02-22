Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0096DC16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 14:26:42 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1299633eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 06:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t/DHtOwAH5gzPYXZ9dMPBrOmVEKsAE/GZxyujyarRUc=;
	b=L0ob/wTFGzAX/29+yi3tKrHW2mPV9b9kyHKdTTXomuXMqgLk0hRxbV2gnsN0HlxTIS
	Rng/3cB5Wy9HLwbC+qhfS1DOrniXpHxz4oNjNzL/jy5aEnOK60g+1f5Vf2xl0XTDKHrj
	7EEmh+RVGM7y/MlfdIXp11nqqs98pHcDKjViuKBvdOR7dDMsjctLNvv/dMjuFQJ5eqtZ
	RV3wbYjTcssflSKCOQekzbplX9YXVIsK2lxpscZjcRWGRGx5Zvvoavc+jwyShqlbftuy
	qs/UBi8gFbEs5jbvchEKCK6bO1e61yE7NCGYoy0vwx3ANwhKugI7GC7++YPR5sMhzv8K
	Ajlg==
X-Received: by 10.14.223.201 with SMTP id v49mr14345139eep.31.1393079202061;
	Sat, 22 Feb 2014 06:26:42 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm39439571eep.11.2014.02.22.06.26.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 06:26:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Feb 2014 15:27:16 +0100
Message-Id: <1393079236-23935-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <20140222133327.GO3854@jama>
References: <20140222133327.GO3854@jama>
Subject: [PATCH] e-tasks: Fix building against old e_dbus
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
X-List-Received-Date: Sat, 22 Feb 2014 14:26:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-tasks_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index a445abc..d17e4e7 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -8,12 +8,10 @@ DEPENDS = "elementary eina edbus sqlite3"
 
 inherit autotools
 
-SRCREV = "b640f0e7287877983645d9d9a36f85a0b6a54631"
+SRCREV = "890f5ee37d1a5fd1ceb2495950d15151d4cf756b"
 PV = "0.0.2+gitr${SRCPV}"
-PR = "r1"
 
-SRC_URI = "git://github.com/shr-project/e-tasks.git;branch=master \
-"
+SRC_URI = "git://github.com/shr-project/e-tasks.git"
 S = "${WORKDIR}/git"
 
 do_install_append() {
-- 
1.8.5.3


