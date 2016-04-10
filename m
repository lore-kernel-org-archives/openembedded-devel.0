Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E7EC9771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so16812833wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eVyH1qEaxAJLSOcBX9Zqc90vrUCU0DmRvqamIg1+qN4=;
	b=jInmq84L17oWEMIyGQgk3BjzlLMfPw/YS6W1Wn5cZ2zBIzddR5DxW5t5bYrAszVeDN
	Qtg0Kq6/nHbObxBOAn/UfHbJpYJ1WetI53KsdIF1Lf6aZYTHS7I2pQdd2kEMqcQ9VfIp
	tCRHt/OHuWqYZhKvblKZkYKUKBeoVdys6CIN7T8XDg/8KGL+h2vE+WI6aP0eB3bosOeK
	D5n6+JSSJ8irj215HAiuhKRuLVc0SVfbx2S2TaG72dXYmS8CbC47KGNYqQqwlhpR8gDE
	oS4jaz77EHiZkeFHTRbxtYzIJ3jKjBkFk4p4R0zwspd979MFRVkPGZ/wVwyqV7OxfPwG
	MEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eVyH1qEaxAJLSOcBX9Zqc90vrUCU0DmRvqamIg1+qN4=;
	b=cNnpMHw9PlXhta2ZH5JJ7eBkFfVvjPW1B/BitZ3LkrcHgxHSR6yU3XaBKIrdG9U+1P
	M7ZR+7OkE1SOWpJuYz4rl9qr1TwhO/hevjTzsug4jusaMhskpSxYNmfJ/YLWppoCSqPa
	Xi/tWCsRS72m8P6LGMjnJTyGohOSTXl8Rwzzq+CrvrNsdWSsK3Lk27ho0KIU0DH+7qwn
	tBhkhTjrNeTI/FynUgp1ruH8cbwlCYO4vyAt2sLL8eykEb1Lr68DhZ8scIGYLhpF+0zN
	LXcE+der9qf2VIWOPP5icDsx564mMvbzWMDsLR+OFFvh4/Iyz3mPTdYXCovfF+BPBIff
	gdVQ==
X-Gm-Message-State: AD7BkJI3GINiqZwfNzV+0m0d48YU5xRxBH1QwW2QFWhrMx/OHaITyWQM00N0P9acN5tD4A==
X-Received: by 10.28.63.73 with SMTP id m70mr15061914wma.55.1460317328572;
	Sun, 10 Apr 2016 12:42:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:27 +0200
Message-Id: <1460317290-4787-29-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 28/31] qtcanvas3d: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtcanvas3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 4990f34..205593f 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "b351fb164af327828c9bdbc414ffd8e47e387e8c"
+SRCREV = "5a17c4ca0552c9f4e6b5646f0cee2b21a55c3d18"
-- 
2.5.5


