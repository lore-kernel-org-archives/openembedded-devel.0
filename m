Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0730A72491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:14 +0000 (UTC)
Received: by wivr20 with SMTP id r20so3008789wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vdwOl/6AWSHZlGAU12iP57Tuz/OHV6dzoK6JLB7qDik=;
	b=QMJBeLYhjTe028GkLyIOWHbTlQBGt1NfTMyZQIXcz3FFztGDiHLdIAGdh+lpwsdNTi
	quD13rhO1YyeadO/YtZvWBnnd1A2KOeozDEaRDMC68e5kPo3TpLnjLMqJAcXLEmoeFmP
	B2D5l53rsLDTk9arsGnvszl/drW9qMLUfiSK/B0kobgknT3ho6fuM1eBrxJjbW97XaUR
	i/rRenrUuLE+RmTQkJlD3PP0lkU0jlJRR1W2fTiCxlgAE3gz4JoJd6r1JNQ6/99BXmX9
	uCIu4AKro9jo97CT/6x4zZ26lHJO0IaT3GxR6vz6uxjHUB/5AkyYBHI6zci0DdG3iVGQ
	PK7A==
X-Received: by 10.180.87.33 with SMTP id u1mr10344063wiz.20.1425070575354;
	Fri, 27 Feb 2015 12:56:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	17sm5739239wjt.45.2015.02.27.12.56.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:26 +0100
Message-Id: <1425070591-28158-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/7] qtsystems: rename to 5.4.1
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
X-List-Received-Date: Fri, 27 Feb 2015 20:56:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/{qtsystems_5.4.0+git.bb => qtsystems_5.4.1+git.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-qt/qt5/{qtsystems_5.4.0+git.bb => qtsystems_5.4.1+git.bb} (88%)

diff --git a/recipes-qt/qt5/qtsystems_5.4.0+git.bb b/recipes-qt/qt5/qtsystems_5.4.1+git.bb
similarity index 88%
rename from recipes-qt/qt5/qtsystems_5.4.0+git.bb
rename to recipes-qt/qt5/qtsystems_5.4.1+git.bb
index 5814cf7..7d46d7d 100644
--- a/recipes-qt/qt5/qtsystems_5.4.0+git.bb
+++ b/recipes-qt/qt5/qtsystems_5.4.1+git.bb
@@ -2,8 +2,8 @@ require qt5-git.inc
 require ${PN}.inc
 
 # this wasn't released, the PV is set just to signify that this SRCREV was tested together
-# with 5.4.0 version of other modules
-PV = "5.4.0"
+# with 5.4.1 version of other modules
+PV = "5.4.1"
 DEFAULT_PREFERENCE = "1"
 
 QT_MODULE_BRANCH = "dev"
-- 
2.3.1


