Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 73CA7771FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so16767866wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Tqb1EDc3aCHCy7bEdhrScjp/rIfPgrUeKBQO28KnuhU=;
	b=dnahKBEhZ68zj9Cjm69kteV5OzXIvQ9bbkCsMV0UFI+mhEk+0SRT8S0LJJvF0Wuv+s
	CUMBvE2CsVMrS1oQLOS1JnoUBqBRjhTmUkK5xL9KFLU0HN+aMb47vCR+HEmL431tQlhl
	WLA9KfRE90wU3VIAiacMgdhhwZqfozU23SatyO2ZgdL7v+N5eu89SlekTH/LXIDPoa3l
	akFPZOYwC15Tqqxo65PgNhaM7jT0n5OM/Uffgrhy/VJOYOQ6yjbBSoe/WMdXyAyROL4f
	kbMeSCskCohBdA1H7gArmCkrVFh13QHAAVO8d92gLx1YOV5RwOZ3WhT2jqau6uOMlZpp
	OYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tqb1EDc3aCHCy7bEdhrScjp/rIfPgrUeKBQO28KnuhU=;
	b=L1v02UXRjl4qzfBAdLXGZ5NKUHweuAJAWqkkh66oK+cMby4pEOAAQJKpHWRvfg9Rm0
	RbdjFjuvLQqyxLV67lykkVsDRCkhpCU6ZwQjL9beAyOK2VOi9DKUMb1jOm1B3y3BItEk
	4vSM0KCb49beDtWGrsSWc8wpmSPYcrAmrET5vG+uleBw8+4m/spBmJjIKmKWaHy/BaEi
	nB3f5sPO2tm8GjuznqRFx0pTCZ2hfyeRbPtlL9d7EXiMAIBj6U3mjEuMD35EuvazU/jU
	E5UiOW5wTgBiWjRYfzDf1A9cKKrhYB6Azv0C/jynZXehEU3EW2C1DuyW8YBmKoLyL4kc
	PTUQ==
X-Gm-Message-State: AD7BkJK4gMWgQNI/xwi/xCaD3DloEadRC5gDYKZ+1BxnRJHWcHyjSQ26PGjPuQOsvkpmfA==
X-Received: by 10.194.222.234 with SMTP id qp10mr19799087wjc.138.1460317330108;
	Sun, 10 Apr 2016 12:42:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:29 +0200
Message-Id: <1460317290-4787-31-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 30/31] qt5-git.inc: set packages version to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt5-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f6149fb..8a6d93e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.99+5.6.0-rc+git${SRCPV}"
+PV = "5.6.0+git${SRCPV}"
-- 
2.5.5


