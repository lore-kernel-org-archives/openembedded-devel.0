Return-Path: <brgl@bgdev.pl>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 33017745DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:55:12 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id c22-v6so5012353edc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZTUDjZcur60EGhk+rGGjglA12Mwm3OTzjvAvdFz0nlg=;
	b=RpNNTEAmtHBl7NT12m8cd3rwniRsVNa2IURGt9ZEXiZS/xeaiWyjs5zORC/grsx8ae
	HnTzRV8PchTrK4UnNTQLDqa0l7ESBKmn3xIj0Y+JVrFJo03IkIDGk7GRLlOgwuNY2P5x
	HuuXR+Vpe0fS6dDkNMVExaGzYrkUQf0QFtwiSKEdOMkpWiOG/FivgXaw4AnbuhVBxuyV
	iNsqYGkEn2BT3VxLHwptPrwGWd7t4wac9srWmIRq/a9z+/0HJ8YbDRsNVBpp+dp3xgoM
	pPj/K6JsHSLf7vtS8an8N3QckfZLIqN6Y1feslcTRQ/AsR7s1DqRhrm8DGVN5wbxz8U0
	LDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZTUDjZcur60EGhk+rGGjglA12Mwm3OTzjvAvdFz0nlg=;
	b=NkRIEB/7MNNxDPLe10yMnyyiKXOJ8prx/+wsPQg71jBPnsLmGop5lK/2udJaKkfnzl
	S1vUrvM+GUTXdUWFKBd0EZgORuGl8faxFuNf+Lh8rkac6YBRnNNK0kN4l9FYtJrTnjKT
	/5TXCgewQiDtviQ8ph8EE3FUB4Dba/I2NvVJPcU0mFyq4YJibq9XAdBI4ihhJI9PxKwO
	n+VjCaSa7cLksRJjA7tOPQEVhkb3yQ8ccNlivYH3tHjUv7WdfwhEsXerfDP03a/posJr
	DHYpEMjREhnD5o/E+zEzngzWrT+KhN+yjrDLaEbHFUCRwC1mBVWx1R4vMjnxnlzZEVM2
	P03g==
X-Gm-Message-State: ABuFfognRrxOz4iVvKDMOTU/CAQYQQbdyhicbOd2pdr+pMdf/jC2AGn0
	+MAXWIJLVlqeq7WasEl5R47Mu+7Qcz82XQ==
X-Google-Smtp-Source: ACcGV619UmCaj8F359uLHZ+rM77XB6btA2ocqdsEU/P4AxfembDOCTsnfsjwp6bkMSw3IdUPDzrzWg==
X-Received: by 2002:a05:6402:70b:: with SMTP id
	w11mr42789781edx.92.1539179713548; 
	Wed, 10 Oct 2018 06:55:13 -0700 (PDT)
Received: from debian-brgl.guest.int.avast.com ([91.213.143.211])
	by smtp.gmail.com with ESMTPSA id
	l34-v6sm7650277eda.54.2018.10.10.06.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 06:55:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Wed, 10 Oct 2018 15:54:55 +0200
Message-Id: <20181010135457.22007-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010135457.22007-1-brgl@bgdev.pl>
References: <20181010135457.22007-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH 1/3] gflags: add nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 10 Oct 2018 13:55:13 -0000
Content-Transfer-Encoding: 8bit

From: Hiram Lew <lew@avast.com>

grpc won't build as nativesdk package since it depends on nativesdk-gflags.

Signed-off-by: Hiram Lew <lew@avast.com>
Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 1571333..29a1125 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -17,4 +17,4 @@ FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
 
 RDEPENDS_${PN}-bash-completion = "bash bash-completion"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


