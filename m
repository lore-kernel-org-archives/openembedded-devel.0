Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 970F47FE78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:10:35 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id t14so3123422plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YHueINraLROCxuUQIQXdhmkiNbdR9CnOHzy0moW3Qp0=;
	b=IT4vo9qL2nsQLsDI08c+RrnfqLHCjSGmDGmKmXJx4/XDNZEdCCRbXpXytfLdaWJIGv
	X+fmg6Z+qAFlFZakr9heRd25HAxizlIG1KLItrUv6v6vCmt588bI+27qYSrcKDxQxh0R
	YQ5ixsci859/BvH4aQcoEWYxSCHAJagYGARdXkYQDKs6imHgzcyRQKtU8w21t+whwUHK
	6c88j4WrXjL5ZzxF7if7/oWXmDwejIRYOliCgq8ml7Q4hXWABFOqIn0uGknxFpMbYikD
	PsXIu2U0ynUKYP7Rvx4LN81J45J1YX8vzaZeNL85yUFUZMVH0RuuXU8hmNs34zc4vpyL
	khiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YHueINraLROCxuUQIQXdhmkiNbdR9CnOHzy0moW3Qp0=;
	b=k8zczvyc6Q2gaMT0kB1+PVTH9YzSZAeD1swAZ/JghWtzuuKI5JvhAhH0lykdF8QwRD
	G98hBLHLxy4n4XjXuokKb4+VGNjW1GmYCLA84VJsEPUY0RB4S3xhWyMs1k2x5FpFDZj1
	tfDYrNk/obnewOVxvP9I6E9WixV6qO9oPUPDdu8oYqJ4alLt/tfdL+5IVBIG9RMXjPzc
	5epvD02ONsqX/SobUJFDyCjj7DJ07wufnl0D/Bnx3LRouHO2fLKuYBnrfL/0k4/QS7XZ
	QBEPtZZZ2trhZheu/6LzWvfpMBGmtYRx+hP5MuFo8b4LY+kPw9Pif3AFN3wUaqowvPtw
	q15A==
X-Gm-Message-State: APjAAAXqHmZNBlsb7FB1tGr48MHrVvRiSiKzweJm44JTtRnDZO5MyYv/
	3M1Gx4zujKOoR1mSOez+BJCALkAOIWA=
X-Google-Smtp-Source: APXvYqx19Ywa6UuOUMy9BMqlL/vdzJ66SU9mlo7op7rlBHKdO+rEqQ5UlEfhvZc1k5AQKuEPp1DF1w==
X-Received: by 2002:a17:90a:cb8c:: with SMTP id
	a12mr3656058pju.71.1579705836510; 
	Wed, 22 Jan 2020 07:10:36 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b92a:2299:32b4:21fd])
	by smtp.gmail.com with ESMTPSA id l2sm3714391pjt.31.2020.01.22.07.10.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 07:10:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 07:10:28 -0800
Message-Id: <20200122151028.38210-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] kas-meta-python2-ptest-image: add python2 test
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
X-List-Received-Date: Wed, 22 Jan 2020 15:10:35 -0000
Content-Transfer-Encoding: 8bit

In addition to ping, ssh and ptest, run python2 test(s).

Run python2 before ptest (fail early).

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 kas-meta-python2-ptest-image.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas-meta-python2-ptest-image.yml b/kas-meta-python2-ptest-image.yml
index 3a15add5..1dc0f4b8 100644
--- a/kas-meta-python2-ptest-image.yml
+++ b/kas-meta-python2-ptest-image.yml
@@ -14,7 +14,7 @@ local_conf_header:
     DISTRO_FEAURES_append = " ptest"
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
     TESTIMAGE_AUTO = "1"
-    TEST_SUITES = " ping ssh ptest"
+    TEST_SUITES = " ping ssh python2 ptest"
     TEST_QEMUPARAMS += "-smp 4 -m 8192"
     TEST_RUNQEMUPARAMS += "kvm gl"
     IMAGE_ROOTFS_SIZE ?= "8192"
-- 
2.25.0


