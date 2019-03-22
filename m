Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7827CFF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 18:33:10 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z16so3652752qtn.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 11:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=Ay/A6aytBldwVoxfLkv8W5N0aqOKbxfzA+cTkt9uXaw=;
	b=dDU8kgzetca9jOrQ59EpHYFoa3NUBw14Q4C2MPGCCwW49DWjOebMUBBtN5Qa7Hsamy
	XIvq3jpzaym1D9UGqAAQ+A4Fr99eovCadPU4s4pYI75S09VozW29dsH6Ags2k0jgoaH7
	3I/ZqyC9fLfQ5T4v3X5FyiUjcrJJJCvxE27yVWszXWOaiMHuqZedD+ieHWSYIwc7OEk2
	xNb8ZuBJZm23mNm3ruD3B76Qn4ZbzrVj2PhAMGSsa/obUXtWEFOKwHboMdeOGdEO9kOu
	cBYudNVdFpUBRYczcHvzD4iMUyyX+rVF31pp4HtjBPEsrEdanhdxeWj/dFia/kOHjd/y
	9DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=Ay/A6aytBldwVoxfLkv8W5N0aqOKbxfzA+cTkt9uXaw=;
	b=gbjRUtjU5LQCeguzX4rJPXoj7cBa24UYFXYORPSSALk9npbwEgHbDVJuifIG8uosf/
	U6FR041c4CLup9x2cmWjq6DAm6GLuWMdNgXgnQ7BCVikqsJ8baSVwDMwBwuQ7MGVCPm/
	IabVK2oXsOsDTZBNs69Yn7Agx636Rb8MVXFeUdcvmswd7BBu/ox1bskRC7sWUtJB5t5V
	gPyO1Fd/AH3j+Z+dAdOJ/7dEmSf1Xb8xzIBGM/wW/Bhn67O5qEFxoVm1UTHn3YmWNIoW
	ztajwkddc5Oth4FKiSMRfZH+CvF/jQBTyV5TySYi6HCsK+dvoPGjbk6Se+VzNcOksBXi
	FzpQ==
X-Gm-Message-State: APjAAAX2cRLYbNzlDBoGJjVEfxPxqkTW3Z4y9qFRO8B+tFMeS0OLUGtT
	axsSj8rKzuTRN7vXJXhSWqP38RD47PSHOQ==
X-Google-Smtp-Source: APXvYqx7e2+DF1i/RC6JnGSCtJAKPqmxEt5r0PTJXMI8Rg43wQdIo14cXvyT4KTJy0MGWXUdFsQdUA==
X-Received: by 2002:aed:236a:: with SMTP id i39mr9073538qtc.238.1553279591843; 
	Fri, 22 Mar 2019 11:33:11 -0700 (PDT)
Received: from pikachu.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id m4sm3933567qtp.16.2019.03.22.11.33.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Mar 2019 11:33:10 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 15:32:44 -0300
Message-Id: <20190322183244.2725-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] cpuburn-arm: Add armv7ve as a valid machine
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
X-List-Received-Date: Fri, 22 Mar 2019 18:33:11 -0000
Content-Transfer-Encoding: 8bit

---
 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
index d60624c88..6189da39f 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -35,3 +35,4 @@ do_install() {
 
 COMPATIBLE_MACHINE ?= "(^$)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_armv7ve = "(.*)"
-- 
2.20.1


