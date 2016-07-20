Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABA3E606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 17:24:07 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id cf3so3647568pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I2GhhryO7HMM1TheoCl+Fst5Rr/tEko2MtMJmjYGZd0=;
	b=zvhaAaRl2y8BToaVhnNphTzL8n47b9ZXyF71U9je25mkZu8S5kFAb/no+piy0yyTNc
	IoqPmiXUeje9brxuQRJwIKS+wgTvNuZ9TpLaDqWy8gjQu3NgCLADxID4h7AfRgJOxLzU
	aHnIty6FQrHVIeG7IcixfFCEfhI7CmpgDKHx6rABFYQ0xSsxPbF/K1ch2Nd3hUerSUta
	ecdOCbl6lRHmEDC5Kg8DgDp5XLKMlKmgII+ulmMYVudnbPOAhYgNNPFPIC0Csfqr7crP
	p7uemC0bUgeKZBqVteuKQD8bpssxNvQSxYac4ncxcBtmhv06n9gzSpa1xT2wQRhTV7AG
	dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I2GhhryO7HMM1TheoCl+Fst5Rr/tEko2MtMJmjYGZd0=;
	b=aw1DkBdg8iT40lfSxmSoBsQBfgs/h3WZBg9SIWNihoPtRYGIgRzwPtzmo/cZUd2HvS
	JS5XKl/QqQnrOsjPGD5+UOdTT586OAkGR3MM6DMKhJmR8sBBWzm8nUMyQJkbZfLWu36e
	lr5FU2jmbKNlfuRGQ30L0PHuomDNEyzV0AzF8WcOwmKmtaFJ7OlqLocZZmgPjRZOHwUA
	tyocuQS8vXcTX2r56OaURSxlKUX3jfC98hVgIJ8EW1AvMbYj8VPb2ruM3LHgEW5hnTBW
	vFUg1b1ZgzlWPFG3eIS37f1QiAUezETlX72AlTrgPKbPm0/V9BF0vwiP7rjop1/mV+Cv
	Pr0Q==
X-Gm-Message-State: ALyK8tJY1v3qsEEFk/CVZY541macIFdath19JLUviNMbvnutsC7oyx6ySZw0/7W/9ZB+0Q==
X-Received: by 10.66.236.9 with SMTP id uq9mr68649917pac.145.1469035448252;
	Wed, 20 Jul 2016 10:24:08 -0700 (PDT)
Received: from cynthia-VirtualBox.int.pason.com ([69.58.16.38])
	by smtp.gmail.com with ESMTPSA id
	y10sm6052183pas.24.2016.07.20.10.24.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 10:24:07 -0700 (PDT)
From: cynthiachiu <cynthia.ms.chiu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 11:23:59 -0600
Message-Id: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
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
X-List-Received-Date: Wed, 20 Jul 2016 17:24:08 -0000

Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
---
 meta-oe/recipes-extended/canopennode/canopensocket_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
index 7c58a26..1e0f7d0 100644
--- a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
+++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux CANOpen tools"
 DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
 SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
-- 
1.9.1


