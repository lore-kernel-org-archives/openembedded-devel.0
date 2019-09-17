Return-Path: <prvs=156d039a9=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 058187FD42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568760126; x=1600296126;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=EFQZJcS1MfIiEKjFfOzgLkCauQTC1MGSDK4gGG+oyYw=;
	b=PUdFOfaScQ6VVHjcJ++xA5xn+kNwwMnQezK5OGzmaTCl8PCRdG+tsNYt
	sS+QH+/M6w2fpkcrmALL8vB+UcIYVGWdayX87EEtOqg5gwloewLI6pcSk
	RmKEXWYTAYTJyIqeXeDy03N/MciO4b9quQOF+fjSr4yQNIcR4Wnj0SQdC
	Q6zqJfLvq53Hq/ewq2zrZfmXupZSxgmvPZ3AGBVyvYboDocCn43W3YEyy
	m2MFHX/MLQTIy1qEuRCNuH2/aXlhLDGeVBs5ExXBEdBPWjITd1M1a/0Fz
	XFFnQ/DbYbtRy1KR0LDaXiWmtOVnCk9z7jyN/ZGPYW1Rw+P3WSDwNESH4 Q==;
IronPort-SDR: b0fFK0yM5QHS9N+cOwqnBfMqU9BtmcdrDyPhGdxNgfOpLzLEQdACpBpDAx8TgE7VO3ELX2ph/L
	atLMWTERmBSuPPnhRZTgjgy9O1awEf9TUnoq+h7Z0DKJvF94yG00xb84N7vPH7X8xFw+88VBhL
	Di6QwDpOeqlYDAKKdQsfq9lnxLFyOu8ZsG0VcRQe6Z64wyo//xiMqqq1u5Jvs7POKVwjxxrAzp
	igfBzHjfXuMV7BXv5ENyNF6jyeuBWcpjT8PVOItoOdRriApn5mITk9xMTDJKWVCj165QaQi6wq
	aXM=
X-IronPort-AV: E=Sophos;i="5.64,518,1559491200"; d="scan'208";a="120052160"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2019 06:42:04 +0800
IronPort-SDR: KDdOeU38uX4bZetZsLwVJDI/gtkW7gP6SRgvEJOKsUkquGwIo5snDyVdXmZm2IWgmezZnT9oDr
	J3kTSWN2qtu5vh/u5kPSudPCswhiTJJl1K5e9DvET4Ufps5t4s2pwbYXMEOuOtFlpCk7OPZezh
	3USto7bzlJQ7gmeiYM98aHHSbDTaLBvh5hlxweRYZaXu0vGRy57SrLS+wqb0iFiBNy9wAQrzb7
	w3Zg/Dur5qGJeUQUexM6VSB8ToVPmCUzTBMFgumBgOp96zTK1/6+h6ExrqaEhzKFVt1y7Zl6Ew
	VUXL17YXC9/+2TIqYtelgeCa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:38:39 -0700
IronPort-SDR: tHqw07FzGEcfJ0kI8bwGZEx9Y3GC+mjb2bbJEFaJAfjOYCreT+6XlSYoLXO7R+NL4sm2dEDL0w
	t9yjgHjlD2zTN0unx1pL1MjmIA+lSGWTC/VN6XzzNwd3QdFZ9QaxlH+G+EfXxQJIBuSjz/+XF3
	Vae//XHVerozCagbP4d9hJcuZoqAZ1cMAqI8fnD8+THn9eCeWAf/+3Qo726sHqOtlOuTf1z+6t
	cXORk7sIVfUauXC+lpD0qE+c50fEIOaV/7a3q8CjhlEFqQPR5oolV3GYiJiUlldOSSeLyjw4u2
	U6Q=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2019 15:42:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 15:37:55 -0700
Message-Id: <20190917223757.19701-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917223757.19701-1-alistair.francis@wdc.com>
References: <20190917223757.19701-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] python3-precise-runner: Initial commit of version 0.3.1
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
X-List-Received-Date: Tue, 17 Sep 2019 22:42:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-precise-runner_0.3.1.bb               | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
new file mode 100644
index 000000000..98b62d899
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A lightweight, simple-to-use, RNN wake word listener."
+HOMEPAGE = "https://github.com/MycroftAI/mycroft-precise"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.md;md5=2ad29e930f3107d52d2a55728bf62116"
+
+SRC_URI[md5sum] = "a2434be110444192e804f4dada0ccecf"
+SRC_URI[sha256sum] = "1a464209fb4bf0a3f5d5a428310cb2a70487a01a6bc3a960d1dda90af896b80d"
+
+inherit pypi setuptools3
-- 
2.23.0


