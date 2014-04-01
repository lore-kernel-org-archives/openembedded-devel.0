Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 53CF46F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:30 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so6501702wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R4a2hK8tjZ7LFrV4g3b4O7v8DlXdajSKrji/y20oJeI=;
	b=KLNj9We8HJUvrhm2iAewQVuHstWUu3yi7U51onopsk3Tc2YetpAja56FNJ8MH1Fq8l
	9a2zT019uCdp249ddy3Ex87wOshtZkCI9Xg60Aib0z/ONM/32Z8N0KPckUDKStcWAuct
	cTZ3lH1hWIRQVDOpNH0mrY4sTG8xNzw4HlyViV2STVncQMjmDK8cRgkmO64Lg1yW21Yl
	mjJ/sWsDFTwhjxuK26l3RaRunsYplhWoNjHvHGAMLj1q1PaIxGfMTSvnyrEjo/PsMlyP
	XXadHzMIL5OoeXU4xLotdrW2Ss1KuOfDaUqadqn40ADoyq6KXTMc//NfzQl9bAmysDu9
	RhdQ==
X-Received: by 10.180.19.98 with SMTP id d2mr21444015wie.57.1396372470954;
	Tue, 01 Apr 2014 10:14:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm41841355eex.31.2014.04.01.10.14.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:24 +0200
Message-Id: <1396372434-10710-16-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/46] elementary: remove --disable-web
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:30 -0000

* now handled by --with-elementary-web-backend in PACKAGECONFIG

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 6de749a..dd18abe 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -6,9 +6,6 @@ DEPENDS_class-native = "efl-native"
 
 inherit efl gettext
 
-EXTRA_OECONF = "\
-    --disable-web \
-"
 EXTRA_OECONF_append_class-target = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
     --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-- 
1.9.1


