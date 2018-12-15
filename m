Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BE6DA7BDA9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2018 08:21:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so7475045wrt.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2018 00:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7KJ/NKvhiMebBaXp2wmHlRCWeE0gIZF1tGRoxYH6MmE=;
	b=IEGNTJEFMznJDntewODJm5GCwgFEW7a4c9nCyosqLHtzRXLwdkFKxvIoyg79Ye2dp6
	xNA9U/eO1J2NhYX54VuKzDdz9IT4EY8LBaZ/ke7xQUYlNU7rVlUlMSHaBkSPF1RKbU5u
	peorfiNcb9MP5F27pfvfDUFl60ykcbIvXu+YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7KJ/NKvhiMebBaXp2wmHlRCWeE0gIZF1tGRoxYH6MmE=;
	b=PSWmuVcdGTyuRxBRnyPPbtVBUBp/dDqQV11WWYVTLYwfuuAgkMg0kqAKFzpVsq15Sp
	q814WCNExsmXZrKillxuF9vusRnfjuOHvL6tP1mj0vbK/xiINI3w5lUZ38zTi4rUn+O9
	G74fI0Xn7qNI9zp+2vkwwkUdbutTuHKOb44nPETnlYz40E5I+Z2FNxs3F0iRpJddXxai
	SSRU6FxgjUVrgo0JxZD8ZwYZKoUnSTr0cyCvD0quQPTFD7GFJLfiQw1MNrxjfz7jw98H
	R3bZwo2YQXfuSJ4xumG9WeFwOuq1/t3ESvjKNcoGCPnfAYvUdxsPhbM8rx/VxBkw+kWI
	q+Jw==
X-Gm-Message-State: AA+aEWbLSFEoFphBxM1c7W3VVfAzZpv5I1Qvx9UwIhb2xKKvE1byuATJ
	aQJMI6AWwW67PgyEZrJRuIC5fDeaqKU=
X-Google-Smtp-Source: AFSGD/WXir5keL/bI2lgFwAgaT8tf2QI/bBCOPmyUIY6RB5kHvVohmV0nmgnU7wHEKJBRmnWQaikzQ==
X-Received: by 2002:adf:ba05:: with SMTP id o5mr4637870wrg.325.1544862084044; 
	Sat, 15 Dec 2018 00:21:24 -0800 (PST)
Received: from localhost.localdomain (146-241-179-194.dyn.eolo.it.
	[146.241.179.194]) by smtp.gmail.com with ESMTPSA id
	202sm10910651wmt.8.2018.12.15.00.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Dec 2018 00:21:23 -0800 (PST)
From: Paolo Valente <paolo.valente@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Dec 2018 09:21:06 +0100
Message-Id: <20181215082106.18613-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
Cc: ulf.hansson@linaro.org, broonie@linaro.org
Subject: [meta-oe][PATCH V2] s-suite: push SRCREV to version 3.0
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
X-List-Received-Date: Sat, 15 Dec 2018 08:21:24 -0000

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
Changes v1 -> v2:
 - Removed useless psmisc dep
 - Fixed stale install commands

 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 77d172814..8bd0afc49 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"

-SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
+SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
 PV = "0.0+git${SRCPV}"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"

@@ -17,11 +17,13 @@ do_install() {
         install -m0755 -p ${S}/$(basename $i)/* ${D}/opt/S-suite/$(basename $i)
     done

+    install -m0755 ${S}/def_config.sh ${D}/opt/S-suite
     install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
-    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
+    install -m0755 ${S}/process_config.sh ${D}/opt/S-suite
 }

-RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
+RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
+		  git"

 FILES_${PN} = "/opt/S-suite/"

--
2.16.1

