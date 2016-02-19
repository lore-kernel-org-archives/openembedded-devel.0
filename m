Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8B63A6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 13:15:15 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g62so75606438wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nsg6FIFKRiZX1v15XgkaqpPFXFxi3aombist1ZFbfhM=;
	b=t1Oe1r78a8r4V4INN/FTKtDoUv36Wvq0SX5ve6qi1axS+pBx39dUk8PmxhL4jcrx76
	sY+rLirc5FP+qQH+vVKUgmhshN/tx3Xi3uW4CGjFDpy+SKXjNX/W0qrHVw5EQpIvGF7g
	TDHZfzYOYAj7DOX3T2PcuhOvNpPxsM+ppwpCdAzNBjbYXvrITbNTj1lPLx9DFLx4ye6h
	sOiz+O+eLa/4SozoIG5P+toZEbCOBo9zF+vYrEDirDS/deCxrQC8IL9d5G7DXAbAQFeM
	kxTpargnTHcCU/6mGZ28jUXMQD5pPbSCHfn0NkQWBMM7MFas7bYqZ1j+QrfQiIEvHgua
	GmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nsg6FIFKRiZX1v15XgkaqpPFXFxi3aombist1ZFbfhM=;
	b=Bvb6VabXKdMnr4Cq4/HmsV3u3jxntn03UNvqTuT+QEied74CF754/xyO89zi46fERE
	Nkx/hh1cDZ59/BVKRY5Ju8lql5VkFuc2FVGVoOXkPO1WqcOZJVyZKBA2IvrM1ViHkRb7
	p74CHiyBjroLtMcUnxODOGi1k1I9SB/nOzFvD79bDgyj6z8dsREnMtYoy+/vRz3cES4d
	sH01fMg1ZR7kXtJttV762a81kTVrrb4d1MlczNxO1w/OQXZ2LlKZpbohexo6REn/STZn
	wF4OiQSYL6YA1h8wceEgvjmpgtlamoaTUtqEvdlawBqHaBO0RK0h45qRJgyTw3aZuDZT
	A6mw==
X-Gm-Message-State: AG10YORXSwPwxsXaifkJWjj8OXxznUGHt6u2AZ+XMNTjLwUIYZsDzR8NojNXZzHQtQuXUw==
X-Received: by 10.194.61.19 with SMTP id l19mr13060379wjr.148.1455887716031;
	Fri, 19 Feb 2016 05:15:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x65sm7655214wmg.4.2016.02.19.05.15.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 05:15:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 14:15:35 +0100
Message-Id: <1455887735-6148-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455887735-6148-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455887735-6148-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][WIP-for-5.7][meta-qt5 2/2] qtsystems: use 'dev' branch again
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2016 13:15:16 -0000

* 5.7 branch was created in qtsystems and then removed again
  OE @ ~/projects/qt-project/qtsystems $ git remote prune origin
  Pruning origin
  URL: git://code.qt.io/qt/qtsystems.git
    * [pruned] origin/5.3
    * [pruned] origin/5.7

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtsystems_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 56d6a5c..868e051 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -28,4 +28,9 @@ do_install_append() {
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
 }
 
+QT_MODULE_BRANCH = "dev"
+
+# qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
+# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
+
 SRCREV = "cc2077700bd5503d1fcf53aef83cbb76975e745a"
-- 
2.7.1


