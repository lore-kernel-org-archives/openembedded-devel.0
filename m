Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id B092678930
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:23 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w12-v6so9638108plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KeQCL46gPz7Edq+MjYYASiEBRv30AbZjwOy7yjGPQUs=;
	b=mSYTtkck1xHqpqsqGxMbn1FmUnxmJv9jlGM1QQa4+hEsn0ikLrKhTWoIru8Ynh3fJz
	n17z+Hq5A4kWj/0VSyql1Xw3jZRAiyvxdgBOhznj+LwwUfSJLWSketRlEDitbvqqi2rX
	h6yFV+8tOdIdO8k8Czo/YVhknGYOwdDSjYcO7cnFCYtkL4TOsP9uPWhtbOLxu4l43r2a
	Ujk/vLPsX8OsGQXKAlo2F0gKg9TIwgmXAIWK4uRLX52OQhyc8hRGxk4QnP5iGBcyUyTU
	u0nYtm8ZnyGQirFGrMapPvIUBEH375EVAmtyYJTwrG7ALUQwyMXDWU5/9kGoH+LNMVbW
	FPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KeQCL46gPz7Edq+MjYYASiEBRv30AbZjwOy7yjGPQUs=;
	b=D1h5nu++pftowyT+o1/VqFsEoTo7eQS3oCYHsW4CjVhk/pfayhAnqSwlFsqfgASCcd
	trfTDFtZNsxuYYnk646M9JXrZRZ32CqwRsVjqVP0DlMOi6YKg5VM3CM6U3LM3dlBsJpk
	GHyebqtcOq81fM3wzf8kPhDFCZO+rZV0Xetu/1iUqzUZQ7+88pecoSo3NLklJPvfWq/p
	ou5sS/D51TKT8S0Z9w75S2O4NEhYGR1yKdltTVEIjwPDDpEXx0EGXQU33csr9uh/rnSa
	pgRjDMKE3S+6idM9qK+rcGPJPHjv0QlzbpV4UaiuTy7Q1jkLrLSqwdFueOh9onWz3CDg
	tYmQ==
X-Gm-Message-State: AElRT7GwjQwI2QcNfWKL3yG5vl/L5h5PuUmWfILnfBNLP+6Aia8EIjSa
	vb10unMQmcC85vYkXVTkMk7fgg==
X-Google-Smtp-Source: AG47ELuBy3fDz9cBPjjsJgl1Z9jWSUiMu9zNmtodNKbfLy9YtrsmKLygvIrx5ID0jTXUEiH+cNGpPQ==
X-Received: by 2002:a17:902:b703:: with SMTP id
	d3-v6mr11011002pls.209.1521439404629; 
	Sun, 18 Mar 2018 23:03:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:51 -0700
Message-Id: <20180319060300.5366-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/18] keepalived: Upgrade from 1.3.5 -> 1.4.2
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../keepalived/{keepalived_1.3.5.bb => keepalived_1.4.2.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_1.3.5.bb => keepalived_1.4.2.bb} (92%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb b/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
similarity index 92%
rename from meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
index 5e7e6e49f..36417b72a 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_1.4.2.bb
@@ -11,9 +11,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "9964d295ec9d34ed3408b57d28847b68"
-SRC_URI[sha256sum] = "c0114d86ea4c896557beb0d9367819a423ffba772bc5d7c548dc455e6b3bd048"
+SRC_URI[md5sum] = "610af6e04071f02d3469191de7499f4e"
+SRC_URI[sha256sum] = "4e2d7cc01a6ee29a3955f5c622d47704ba7d9dd758189f15e9def016a2d1faa3"
 
 DEPENDS = "libnfnetlink openssl"
 
-- 
2.16.2


