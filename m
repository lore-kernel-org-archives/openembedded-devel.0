Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A870D6FEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:19 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id k14so2057331wgh.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CFNpSpbTJf9mgEPWqj2Rxg97Q3KmFz0/HOPGeujumFY=;
	b=0B9UuQLxs15wz9s+FtLpUSsBsHlZR5xx1Ue+fhMU3L4O6pRcOCeb9oA+mHSsNy+XSz
	A0W10PQkQKA+BierIMCuEOXbV6el5194SpxFqcl8YERTv3CtzMyao1avw1mY9+1x64ho
	Hks9AHchEH0FAO5juMSF5qidLRJ9MxcK/bMftWpImuSMT4taPBg5ksKVqML5jH2ZrkPK
	hUGM2MsRWgTk7uAs6r2jexKlAWfyo4tjgBCKN2tATIvKRLIPB3WugnvoT97pZgdusB5e
	pH+LzjYYHpfpnOBLX7GLBGVJ0SJXIzCUyMVWyU79JpuYj476PnE5Fro78fI2YaicLx5+
	UYcQ==
X-Received: by 10.180.211.36 with SMTP id mz4mr5184955wic.20.1403172019787;
	Thu, 19 Jun 2014 03:00:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft17sm7683987wjc.14.2014.06.19.03.00.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:49 +0200
Message-Id: <1403171993-26208-21-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 21/25] talloc: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 6b7e4f1..98d0fc7 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://NEWS;md5=5fe776b23a711c9153ee94bc87e47334"
 
 inherit autotools pkgconfig
 
+PNBLACKLIST[talloc] = "BROKEN: doesn't build with B!=S (gnu-configize executed in ${B})"
+
 SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
            file://install-swig-interface-in-SWINGLIBDIR.patch \
 "
-- 
2.0.0


