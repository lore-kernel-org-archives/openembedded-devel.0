Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id F3A7C6A97D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:27 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so2936328eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Kemx1fa+YykWTo42LZ5GraYIXZfRDgMbpiFuNtPy7Gw=;
	b=jIKyOsRzRQcG2vSDznOZudBWKuFJipS/2GAfXtq+YxFZOgRqGEUNpbX2JTlBLC8AtU
	5R23bjX/Tjx8SQIfvDsZld/c/HsQ13XXiv2tygSlg6jmzxzu9H4ISP1F+sOBrIwb/nXi
	7DAnZJspaxbF1K9kErpUcTt5Ty2igtInNj/HQMm9sygQECGO5Hxgm3widWx6Nmvvl/Eh
	i8EqhbRnvAtR9D+vZ0bv1iKOoTCrwVzmxYr7t6iROaXWegMKZxrMa+zX0SkWfNsklAEM
	FOsc0iYIVHsydNFQsSR3g5YrdCg6E9uzbFMeuVTHbRqBatYtKa+mZf21+wV/riQUP3pi
	1J1g==
X-Received: by 10.14.176.199 with SMTP id b47mr20600557eem.117.1374332907947; 
	Sat, 20 Jul 2013 08:08:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm35853918eeh.15.2013.07.20.08.08.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:32 +0200
Message-Id: <380ac7dc1483d263bcbe6ce0cb2c69d9bcd4bcc7.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/11] libunwind: add PACKAGECONFIG for lzma
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2013 15:08:28 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libunwind/libunwind.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
index 2e1504e..a5b7482 100644
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
 SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
 inherit autotools
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,lzma"
+
 EXTRA_OECONF_arm = "--enable-debug-frame"
 
 CFLAGS += "${ATOMICOPS}"
-- 
1.8.3.2


