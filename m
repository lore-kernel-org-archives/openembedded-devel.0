Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 87A1E6B96C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 20:08:51 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y84so9403220oia.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EIvDU9ioo2ihpWS6pR5m/hYibZaxJqOyEfeTdyp6qkQ=;
	b=lFvCq7B1yyZbOO/4yg0ZTCxmj+oyhUT0yq+RS+XyJ2XOpsMCWAB8uWVob+BJTBRNqD
	nvRpXvaJzIfnq4s0K5wUNTctkgRV3QMQq2j76BNRsn+sLJEyOe6aQUlR8vh1bqlUg4Q0
	010GKWodhmZx29iWd32qqRol2QACz4VxIN7qmEK0IykflpsBlAl2ArfeJNBJg4AOe2oK
	kJ2cxdEsbSaWGxY+WT1cWL767vepbRHm6AMNf1jLDTuiNRontZVr5sjptmqcnjVLjaKZ
	gO1k6OoaWBIpiPfwUm6KUfqRej0hrWcI6igF/F5038T2LVBxV4E5w6QIwBRDKpK2hKBm
	RN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EIvDU9ioo2ihpWS6pR5m/hYibZaxJqOyEfeTdyp6qkQ=;
	b=oVdRxEcS5A/nwgOuLqOpWImnRj8TSq6DT5OGascqOlw1Ns5gQ1nZzr++ZEPqoa8eTQ
	0WQDrgniFxaC4ob87Two832RgQt2JDIq9q3mJkasZJQPusYfjE4I0199wBNOl+SDZvGf
	Vk18brhzBqEZiYy0Lx9TNyy4x9sk+M4V22Racl4Kt0Q4OB8AbN3gqEFhXoV9TwlABSzt
	qZxxOC7PWOzBMSOdBK5vVkD2a6h8gU0aS7s13uipdoj2XLd/oSAuIIMlH0+QRE3d+GBK
	aP+nBoAZVzqrUcpPiqGqZd8T9GCkv1oWbxzpRSp3/LAqkU/yjArWIsxo3x6Uywo9bRZn
	Ijig==
X-Gm-Message-State: APjAAAVNRTAfCQQnkNCyNaDzEycfLQgRA1pg0vhLHXHh/YhFhVlPLeCn
	cTssrlg1aY3C15DCCTQQiWEGBHAQLqQ=
X-Google-Smtp-Source: APXvYqy/WsnqDFqJt0jO0GAkfp3YLoWv89zwv5nLKYTiICERGDIbwenqpwXjGQCL9YV76Qut9SlBmA==
X-Received: by 2002:aca:4c48:: with SMTP id z69mr11259712oia.147.1555963731930;
	Mon, 22 Apr 2019 13:08:51 -0700 (PDT)
Received: from alago.cortijodelrio.net
	(CableLink-189-218-30-19.Hosts.InterCable.net. [189.218.30.19])
	by smtp.googlemail.com with ESMTPSA id
	k65sm6189560oia.16.2019.04.22.13.08.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 13:08:51 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2019 15:08:45 -0500
Message-Id: <20190422200845.14343-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cpupower: update license file checksum
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
X-List-Received-Date: Mon, 22 Apr 2019 20:08:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Linux kernel is GPLv2, at least as far cpupower is
concerned. Because this recipe reuses the kernel code, and
said source code can (does) vary across different releases,
it's best to refer to license by its name.

Use GPL-2.0 from OE common license dir.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 928973871..c7ea087a5 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -2,7 +2,7 @@ SUMMARY = "Shows and sets processor power related values"
 DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
 saving related features of your processor."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-- 
2.17.1


