Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A544778A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:13 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r137so11754911pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a7jmU0i8epXleOyolgS41E990pEx1soF0aQfJCDcBXU=;
	b=AZfnzvo653+KFxuJGK3MxsEQJsch+SOZef1M2gcUioD8zsWSOw/zCjcHZmAKSsdt1a
	xOcoGacFSUs0qlND79SDUbxY11twVD3ArdEPr078TyOV2uCgx2C3JPcC70fuHM2y5sX5
	c7RYpTaxJi1T9PIg/xTHd06wm7ZDi7vnp+H5kwWS6X/CJHoh+u8XNfAXLEInH8P7Raqu
	ORHzHfJJQe1MEXfF72Lw6RvH3Vq5rFfGf6kZIDAiCMIAHwvOoSeLOr/0fxzP3migPQpN
	AL2L1NaFoDtuPmKqnOHrLGHBn9re6g7Apuwzy4Lp8AVMmMqf8+mdjl6A7q5WkDADGIt/
	u4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a7jmU0i8epXleOyolgS41E990pEx1soF0aQfJCDcBXU=;
	b=WhgTvIBHi5Q1xqLQPObZw6lc9RDSLipIF/ctaYQwh117XXN41UZkL1j9Q3jwC7xLzk
	69f2i/WND0Euug/t6BkHHxHIYya948VKH7E5BaI2Vb4rS7plt/93Yg0mu49cPt9as2j+
	DCOwGVv7qQiNHogJOVHUGlbkWr7dYQ0l5dHaeVmT/WslKD5LP3YBtYnp2TedhQvM+Hx9
	fc0BFXD5rawH8KaXDQPm4Jf4wd1HRnoSvsRMmUSxPcK1ZG5+Rfmt6cIxJHBJ9ADX0d0t
	aOMhi2sjg6RZ28YmMAjq/MdcurhonOi9sMs1glj2FT8y5n5ygLNgJw9d1Wb4AIkOys+3
	NV4g==
X-Gm-Message-State: AFeK/H27aPU5HR8LJFCQyuBMYgsqNMjzmNDtW5z/VhZOjmY+b2KBOclB9yGlYLSZRr4azQ==
X-Received: by 10.98.82.78 with SMTP id g75mr30670740pfb.245.1489987934990;
	Sun, 19 Mar 2017 22:32:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:43 -0700
Message-Id: <20170320053152.29352-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/16] smstools3: Fix GNU_HASH errors
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:13 -0000

pass correct LDFLAGS to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
index b8a9d4a23..310a13c22 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234
 
 S = "${WORKDIR}/${BPN}"
 
+EXTRA_OEMAKE += "LFLAGS='${LDFLAGS}'"
+
 RDEPENDS_${PN} = "bash"
 INITSCRIPT_NAME = "sms3"
 INITSCRIPT_PARAMS = "defaults"
-- 
2.12.0


