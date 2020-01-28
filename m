Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 091777FDC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 14:54:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y17so16358414wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RqjPoK8QNem6NbuHb1GnQduoJO3elvPqUVmPx7wngVI=;
	b=nAJnR9mLfmaisxpPKf7cr82YJqySsJclsac7gfX3b1n3rFFRUAOd6LJNvT0xqZsP8q
	roizNWkYLS+Ewntrtx2sjGTViFgUdh6VsDKXovtfExR39N80z3Fpa9Dw0HTZA6TZMY4t
	ZmoGY6nNP1psPvTa/rgoCeamiIkZFYWN5XJFFEFKQX1GQgRJRuULTWPuoIXCsRE9ds4p
	qnfNI7qY1TTK7miEBzBLF+8J/6GWhLLlP1VyW7Jr2mjAJ+boiBcQ0dsAHDX8uv/1h6wi
	exqvBfw8NtAraEy7RstZFychu/49cjKwlTrCfp9RqMD1/mxG32kDza7zT8zB5WlKv0qD
	8utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RqjPoK8QNem6NbuHb1GnQduoJO3elvPqUVmPx7wngVI=;
	b=TeGY1d6sGfkyoXg4jd40xiGst6gOGDNhwV6KF+DTAlmRhHUNyeKFwhkysPJ6rk6dwy
	RpP7clOadvvlujW+g0s8uLhD6R460+WfO2iUZGsKRPq+QIrqLH/PDgCohXdYqluBPbT1
	xXxAKROZcSRb0S4ElOR7A4TuUouhXjqIR5FSjK1tiseJ6bJtwg0A+aAasr30ZKJstQwN
	7gT21hGi1a6yPwF4mPYZbZImrTheIdHDnVtxs0VT37b8G0TOKa88PP6Ev2I3V+ZfjcEY
	nYvcZOc2J+6kc9zMDqBUPBTqVZ6KooYF/TAaT4jX49tIZGwE/XMSAc+hnJImPRi9xwTD
	zLSA==
X-Gm-Message-State: APjAAAWrz2EwKY6882E/pnDQ8xNMM5en4fXp3l3XsaRDfPT9CyTdxKsk
	dZSSsBSKHAFSulHyFxxUkqwsi9rMbHM=
X-Google-Smtp-Source: APXvYqwjAa2Ektla8HuCXBXwdQtO1+LZZ5yNsY17w8PQbd49g+3U1huVgGbt32SC4qkp/UcV8N4xzA==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr30321161wre.372.1580223291645;
	Tue, 28 Jan 2020 06:54:51 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	y185sm3479079wmg.2.2020.01.28.06.54.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 06:54:51 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin
	<andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 14:54:46 +0000
Message-Id: <20200128145446.32247-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] fio: update recipe to use python3
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
X-List-Received-Date: Tue, 28 Jan 2020 14:54:51 -0000

From: Andrey Zhizhikin <andrey.z@gmail.com>

Update fio recipe to target python3 since python2 is EOL and has been
dropped from OE-Core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.17.bb b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
index e41c21d1e..5a9cc8334 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.17.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libaio zlib coreutils-native"
-RDEPENDS_${PN} = "python bash"
+RDEPENDS_${PN} = "python3-core bash"
 
 PACKAGECONFIG_NUMA = "numa"
 # ARM does not currently support NUMA
-- 
2.17.1


