Return-Path: <brgl@bgdev.pl>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE65745DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:55:14 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id h13-v6so5029763edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gLr23Xl4FJFBrxh/O5v6Cpaoc47hUtRLf1ABnXwbjNc=;
	b=OjVhCZa280lOVgKSu06uTaJ0/hQsKy10aAKiPseXlCCztBv8QGX2FIrnGE8Y7JtjL6
	YomBxzMdOvZJiZWxMJMvff6SPi5ko2Un2TmX/1QO4XL2HLTB6g214CYOLWfTgGTzsbzF
	qobbfdC4PcvooXFiRGnL3JORVHmX2dsNU4IL+eyacoTzw0Meh/wFTe1ZBPAPXdFMwDVC
	5FlDd/VNtWDvd984cTocPrm6/VFEziPxyZzOLlup9Dgmd/xsGL+jHE5dw/sdVNmauRM+
	T4x9Q1y6sFA9YDVg5v1Hern0f51HLg74y/Is+7ZKn4P5wo0CFnsax2+Fam8Tt+6U22U/
	pkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gLr23Xl4FJFBrxh/O5v6Cpaoc47hUtRLf1ABnXwbjNc=;
	b=ZbUkQgNnANfETTwypFBArBK4244UtJonewodRtvAjjKVGMmIFSaYRgY5ls94Z86Hpq
	EeJeztx7JlEH5ifPEljIrQLjcJY3d1aWozyDBXBJzL9B0IcQgUk/1sWbpG7xgJWcp/7L
	Asi28eq/FjQYL6RiD/B5O79qXyfCui1WTFgQW9upzT6OGUdHmFJiA6Ef5Or3dZr8Zwju
	KFGJGv2OByoLBdQx0eG8F4hvF5xNDi7tieoYnC5ICm5Mwc9xlFK5qshHxzWD753Ftvpr
	ZVwPkYoazqbbLIBwiB6UmYMyUGjyH8JmnBRYcLIMwRagWfGPiPq++BNsEubqDMC1kA7h
	IFaw==
X-Gm-Message-State: ABuFfogJlCSS/TJJYjlNICKG+V5C1gXcH2s234tvQrTH6UnvaPoLnVvc
	6MiYgL4FGfnMEXjZmfHWnWAppWuBjxxWCQ==
X-Google-Smtp-Source: ACcGV60mTxQA8fpPUj6un40JfH4GW4PQpJzYFZadKc1syeL1pRJymP2/N5RZGOzUsWiIUro2jb8I2A==
X-Received: by 2002:a50:ab17:: with SMTP id
	s23-v6mr24363673edc.293.1539179714712; 
	Wed, 10 Oct 2018 06:55:14 -0700 (PDT)
Received: from debian-brgl.guest.int.avast.com ([91.213.143.211])
	by smtp.gmail.com with ESMTPSA id
	l34-v6sm7650277eda.54.2018.10.10.06.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 06:55:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Wed, 10 Oct 2018 15:54:56 +0200
Message-Id: <20181010135457.22007-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010135457.22007-1-brgl@bgdev.pl>
References: <20181010135457.22007-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH 2/3] c-ares: add nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 10 Oct 2018 13:55:14 -0000
Content-Transfer-Encoding: 8bit

From: Hiram Lew <lew@avast.com>

grpc won't build as nativesdk package since it depends on nativesdk-c-ares.

Signed-off-by: Hiram Lew <lew@avast.com>
Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
index 09083d3..b31543d 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
@@ -23,4 +23,4 @@ PACKAGES =+ "${PN}-utils"
 
 FILES_${PN}-utils = "${bindir}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


