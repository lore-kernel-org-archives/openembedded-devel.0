Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2640561A39
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 19:43:27 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y30so3282435pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 11:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1dAbpFCv9WUg9X2pFqh8G9VrY45UW+BB3Mecu+XqpNI=;
	b=YlhkPZJ5sIEMBMj4ZX2zFSTzKzKTGAG4J2WhniNalJBgrU4XK6wMljFu7T9Tm68SJP
	iabQ9p2JomyloLDuZ7GdzeKHHglWcvbLF8OflrGweTFJ2peUE9G1dCBcnDVwQD4dNGs1
	CRDxTTtoR0Jp/og5is7rc9GUX4cuMLGc+2IvWPHnOyuPLLvqOWAUv+EX6OhESiILoou1
	GfqaTl1mxxWZe4RB6cyq1cNLDr0kkBOXl7LttmS4HTUWWYTdZDlN9FNU3n8r1sP1ewAT
	+HQWJi2FcGn+Aeoiiuk7lPpo20wNHUP0iixI/GLJ3k8Kp4Vzxa5RL9TW8hmLK6Y3lb9P
	KBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1dAbpFCv9WUg9X2pFqh8G9VrY45UW+BB3Mecu+XqpNI=;
	b=mHslLJBdbA526L8SNwqV+dvsq5fWhK93Tvedsl9zc7ofD4SjmexL59U42auWhZCxLl
	eDO1Dmlx3MBlDV0mcNB3LpUbIUbhe8HQajTwAJ8ku42W304j7ZHnt+wQoYt9KFmzRwgf
	jLTP9D68lB6vmU6OrntVf9UA1ZflYytKl/vuSxs9/B0PGsBAJxP5mD+Bym1zT2UwsDFp
	lpm3CtpEGl/gNfdco6ttbmEDB3DkMsSliTiA5OFiJqAJUlgF0MFrKoag3HGctySTOKnh
	Jb9+2Mi+ZFHIIjqmUPxBsfYSS984Mr6Rht9x4G63DxjrX8m5zO8+2CaVoRrtzus5e6UI
	RmXQ==
X-Gm-Message-State: APjAAAXeR5hJwVbQBg9sItO20NhL0KSVaJBT0Vj4gw6TbAOGDN442I9y
	mY8HQ3dIIiJjObmzCLwIfbJ5hf+lNf8=
X-Google-Smtp-Source: APXvYqzragiNbC/OVUncHtMkOt1itroNwYUyqxYO/CUb7LDyvYjb4PsvXgrd9kStQE8NNIl7EiGGBQ==
X-Received: by 2002:a63:3048:: with SMTP id w69mr11372586pgw.184.1583005407861;
	Sat, 29 Feb 2020 11:43:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	v8sm15275475pfn.172.2020.02.29.11.43.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 11:43:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Feb 2020 11:43:39 -0800
Message-Id: <20200229194339.3913240-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] phoronix-test-suite: Add python3 to safe siggen deps
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
X-List-Received-Date: Sat, 29 Feb 2020 19:43:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 8ad21d66ae..c5377362e7 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -49,7 +49,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   usb-modeswitch-data->usb-modeswitch \
   lmsensors->lmsensors-config \
   phoronix-test-suite->bash \
-  phoronix-test-suite->python \
+  phoronix-test-suite->python3 \
   phoronix-test-suite->php \
   phoronix-test-suite->lsb-release \
   phoronix-test-suite->util-linux \
-- 
2.25.1


