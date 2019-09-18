Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 601B3901C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:26:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h7so6480995wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 04:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iNnrvXRs/0+808zvs0QOQycGQQ2Ix83oe6metS+HHVo=;
	b=pSWuwVtl9LCZjEeb7r6Xd1+IMy9sB+5WjCBcTOAdPfxb24di3Ai3FbE8hqBqFg2NXN
	8ZCSG958K4BwpaXfNTWUmB89Gdfoya+2nDt1IGbMJriPPRmeuam7SxLr2giqzVUeW2Lh
	ROVjScULyMEF/2Znubmh3nqnkj0XIsBFXdwzChhQa2x5QvVbripEKpMgf/lFrsvQeU3r
	Icn05F1s0IjZDMgucC9F3yqxp6b5SQYKrv62Eiggy9utjYv33/0mcMejCCVRBR9c3Ppz
	yKX/SqPSjtbRCUXOAAtQ5vHNtiWRY4iuTsO2aDw3opKZ4bSfIs/BGOdRmkQQIkqk1k69
	7n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iNnrvXRs/0+808zvs0QOQycGQQ2Ix83oe6metS+HHVo=;
	b=jQaqrN7MZ5MToD0+LbshYP31ndMWb9ca6B1BbAyRLBQqsEfrl2BrTx44c1AFOtd3w8
	YmJG3PRhnAa3IVh5nBpk4OcIoveVY5wqGOZJjRRuTV7w4MdjV5IkWCCTdiN5Qk7Hymyi
	TrkLgwu1tii5GcV7DkkxYQGoJKRJPXuT+KsfwKp6XiFZBAy6TcXjLBkNu3+3JKck8Q3B
	diLaRYYQYX9lYAyP/J6lgK3bPUX7eVUw7tzi0Yeq7cT1UJsDmFgnotQVwfoC1oioDosz
	igmJwXdMMQoZOd+ksFRWtxEYnGNc5tiOvLRLlkxf4jZUaeBqKHqtl5Ltg0gg10WKF9H2
	ssNQ==
X-Gm-Message-State: APjAAAW4tSJf1lq+xOwXKv/QHzn9fH3o9Mq0BJ2E+BuyrL1qAevOh2Cj
	l3ADG8GthjF+VxAQK9vVK7dyYe/PYwo6RQ==
X-Google-Smtp-Source: APXvYqxZgfbHvrh29jUqGDWD42NGe3PZj1GpzektoBECDlP6sQqyqMRBRyOjwZd0oQNuObvKSerolQ==
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr2644061wro.138.1568805994742; 
	Wed, 18 Sep 2019 04:26:34 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	(i19-lef01-t2-89-85-250-196.ft.lns.abo.bbox.fr. [89.85.250.196])
	by smtp.gmail.com with ESMTPSA id
	o193sm2191749wme.39.2019.09.18.04.26.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Sep 2019 04:26:34 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 18 Sep 2019 13:25:50 +0200
Message-Id: <1568805952-19822-3-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH 2/4] python3-cheetah: add recipe
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
X-List-Received-Date: Wed, 18 Sep 2019 11:26:34 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 .../recipes-devtools/python/python3-cheetah_3.2.3.bb      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
new file mode 100644
index 0000000..52e8576
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python template engine and code generation tool"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181"
+
+PYPI_PACKAGE = "Cheetah3"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "python3-pickle python3-pprint"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[md5sum] = "5629445e7fef9659da2b49e36aacdbff"
+SRC_URI[sha256sum] = "7c450bce04a82d34cf6d48992c736c2048246cbc00f7b4903a39cf9a8ea3990c"
+
-- 
2.7.4


