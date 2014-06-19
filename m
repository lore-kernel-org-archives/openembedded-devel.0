Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0D44F6FD1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:09:33 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so2061277wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tFxysy11B/kI4qSelSajKxcRQx4txAUqY0wk4JAF9EM=;
	b=DytY2SLBLK9lvP1tbLATLqXzKiQDaK89id2BsByVHm4rst37ItP7ynGSXpfnMdVq20
	sHaFcMxQuU85Y3okiV5Bx2vy3n/oilHSp5iNkhbSYM9fDd1LGa4CJSfHHBjfJpj7M9FI
	PQN3Xn/ISSx2uR2w4jUYbnNwgwa/tpOMCu9eBAiBUiye35ybmo/jIE2GsRiV58G5e2Wx
	IcCBpXJPyFBxrndt+F3jWQoyvyZ8xs0ffCzfRBsRo/L/vO5or4/Sh1cBMZ5IYoD/P4za
	LtaPeXQA8iEpGvt/denwGxJ88hd0cKN2Mt2/Xyk/qQ4iugSaRtf5jYE0GO/Y2MqsPFyp
	l2Sg==
X-Received: by 10.180.210.174 with SMTP id mv14mr4551711wic.47.1403168974649; 
	Thu, 19 Jun 2014 02:09:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v17sm1536620wjr.33.2014.06.19.02.09.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:09:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:09:30 +0200
Message-Id: <1403168972-24905-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/4] libftdi: Blacklist, because of libusb-config
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
X-List-Received-Date: Thu, 19 Jun 2014 09:09:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
index a62236f..773b791 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
                    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
 "
 
+PNBLACKLIST[libftdi] = "BROKEN: needs to be updated to detect libusb with pkg-config instead of libusb-config"
+
 DEPENDS = "virtual/libusb0"
 DEPENDS_virtclass-native = "virtual/libusb0-native"
 
-- 
2.0.0


