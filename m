Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9580D6C0B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:15:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m1so2734060wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 07:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=X1LA3XlJ/OtQLNnKr/Tq0t3IYOGJtQYHAVe4vTajBZU=;
	b=cKKT1dRz9fznIgDRKDix7wuBkHE027OFpYQ058cSU+ckhzDFP7Is+8I8CeXKtoX1pK
	Oy0UgnDtoZDxHRf7mofloHeGN6XejJ3m5bW3iXKzktYufqNP82t4H4inZZmmFHxzJH6M
	NxOZz7FtHqgInbUEmdOyl6Yy1WgvWtJlYwj/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X1LA3XlJ/OtQLNnKr/Tq0t3IYOGJtQYHAVe4vTajBZU=;
	b=Kc4/zgzBlFLsJ3XXL8UuBOAwfHeDeOqBCECekOv5fhx6dtCzZEeRNW1UFjCr9Hi70P
	LemVUpD75RrKlrdPSBR8/Zq9vOcw7usKI4Bj93U7r/jqCRdpYTkG25Wjt68lggUM7wC/
	vguJ5xqsca+zm59MNoWnErSABKCcd0t0vYqIrRF3P1olghfSw1E7q3gnI4vkqwtH6HHz
	YWujZZgMADKzxhOi2C0uannvyfPxod7MnlOeh0jj87MJBr1XFk1CYri7qiRs1n0z0VRF
	Ggr7ZlADnsQFe2X1iQOyosqT8VslgXfeAnid+mZ/buDMFt4tHJjp6m78HbaWeCiQVuCY
	FE2g==
X-Gm-Message-State: AA+aEWbn0lViaa6KgauhWVek0cFZgQNz1LNhoyEk0M2YKBvVGEtC0PO1
	aGa+pwXWjAB9GFzXIBT1BQ7Qxf8UR8k=
X-Google-Smtp-Source: AFSGD/XOCkJq2TMIiaPsuRoKEnXPh/q0VIRbZaVFo38eNEqrh7fSjvuwm+wIGslB3W7w1rbeq1Wutg==
X-Received: by 2002:a1c:864f:: with SMTP id i76mr10279892wmd.83.1544714151845; 
	Thu, 13 Dec 2018 07:15:51 -0800 (PST)
Received: from localhost.localdomain (146-241-196-218.dyn.eolo.it.
	[146.241.196.218]) by smtp.gmail.com with ESMTPSA id
	i186sm2689240wmd.19.2018.12.13.07.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 07:15:51 -0800 (PST)
From: Paolo Valente <paolo.valente@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2018 16:15:33 +0100
Message-Id: <20181213151533.13730-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
Cc: ulf.hansson@linaro.org, broonie@linaro.org
Subject: [meta-oe][PATCH] s-suite: push SRCREV to version 3.0
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
X-List-Received-Date: Thu, 13 Dec 2018 15:15:51 -0000

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 77d172814..166f3000a 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
+SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
 PV = "0.0+git${SRCPV}"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
@@ -21,7 +21,8 @@ do_install() {
     install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
 }
 
-RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
+RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
+		  psmisc git"
 
 FILES_${PN} = "/opt/S-suite/"
 
-- 
2.16.1


