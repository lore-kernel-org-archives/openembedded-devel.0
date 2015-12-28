Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 92CB260722
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 12:11:00 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l126so262231487wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 04:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=f7Lkmy522M/Dg2YmBrKmkYX51pIZlNXJIu71WQHZ9ZM=;
	b=D4C6b0EuYI5CAxBD/06TozBndtS/LEZGnfsKv6gab+WvCdUzdQDy4rZz2GNgDjVM0Y
	012t5NJkCwl1LzKZ3T3fbSf4ZLvEuqk3ZU0pcwpBlFj2pv0dJk5FZFrgi8bgZwarGf8J
	cSrJi9IxbTLobFoTEGj/l96XRS2q+u2uh8iMV0G4ObmSRmLVBIwFTlmP/t0kLmYbCAiY
	UELdTuI/EmwcJroUhupDIEpqIZM2dSTPxm4DB3FRnxiVshhMZ5sumcdfhHDy3J+48Ovx
	d182aOa4nI5201GpApB1mAJ0H3w6ta0mUwLT7e6i4/EU20WfjCpdbDJG8DwJ329NKtoq
	TycQ==
X-Received: by 10.28.64.131 with SMTP id n125mr60240923wma.103.1451304660622; 
	Mon, 28 Dec 2015 04:11:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q129sm14189924wmd.14.2015.12.28.04.10.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Dec 2015 04:10:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Dec 2015 13:14:15 +0100
Message-Id: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for libcap-ng
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
X-List-Received-Date: Mon, 28 Dec 2015 12:11:03 -0000

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
index 0ffe589..150e55f 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG ??= "openssl ipv6"
 PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
+PACKAGECONFIG[libcap-ng] = "--with-cap-ng=yes,--with-cap-ng=no,libcap-ng"
 
 EXTRA_AUTORECONF += " -I m4"
 
-- 
2.6.4


