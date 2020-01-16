Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 502BD7F8A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 19:12:20 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q10so10684939pfs.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 11:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DohSfSkp2i/EziTMH6dWESRzIBK4CPdDo15YRyMXfRs=;
	b=fZ2++EIOtUYKiqkG2P3NthTDUgIbr8OpgYHIhmqSPWfANH/Tpw0EnKSU5BX3z65ZAI
	1gieMvvSi0euJYu6bbcGQq/gHxzNCYHs6XqJ28gEQpL5A1JCSYQGIqaj4EomZbuwdtiF
	Gyv5TtWGGweiqQQIjsr3VzXhE/zTfZnPFlWiXKJ1w1k7ns+wHD5aaVmAE3kVVbzaBRHN
	8y3ZROr4r0GD2qa/wn0MdB5lepRcy6I9+jVQ6MHxnd5FfohUDk7hoqGYqhXf3PLUWxqC
	z9f1MVHdC8xiR9pmxGOqroU2CZv/2oVt+NOmYA1dHPC+Qu1kUa2Zx5giP8+OdJ4v2KbS
	gQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DohSfSkp2i/EziTMH6dWESRzIBK4CPdDo15YRyMXfRs=;
	b=STqAch9ymhb8PrtzzRU2klvutjMOl50s0m91nYcAR6q/l7HuRB4xVKFQy5BwTC5+rh
	anpAAsOW+Pmzy4dKjDneEF8usKGW4027FnfPdUALGtYdAIxrDYKiopL29pD88zws0cZT
	v7J/PKuGbYiEB5TRevtrrRrIAyGm5WtJ3+M100WVyG6h4DTV294RRSmicWX1JBnCmgBz
	us3lehJS04lUQ2a9mWL4T3PeWhaJHxTfhjwTKRSI4jxMpSjoNnc6TQe8Rwr4LxXVp5Nf
	W7hYwgoAjAD3pwuV37VPSiB8ghM3nosNhfHwRtoVlwuLv10j1I/ceFgr6OUgBN7YtUo9
	O4hQ==
X-Gm-Message-State: APjAAAXvmlk5cg7v2VxejZ15VZxtvWNmm3wedqMYhXNKHW6bHk78uTnm
	4QJi9BYtlFKghwZFWs9ZQIeOHlEeYTI=
X-Google-Smtp-Source: APXvYqxMS1LCOBa6MN1s5HZHfGMHu8LA9P+GaBnqD74Y9S2eprJte02NGbEB3SYM47rUoeKscyxoZw==
X-Received: by 2002:a62:87c5:: with SMTP id i188mr38772062pfe.52.1579201941108;
	Thu, 16 Jan 2020 11:12:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l10sm4539199pjy.5.2020.01.16.11.12.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 11:12:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 11:12:15 -0800
Message-Id: <20200116191218.2768160-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116191218.2768160-1-raj.khem@gmail.com>
References: <20200116191218.2768160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] grpc: Link with libatomic on powerpc
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
X-List-Received-Date: Thu, 16 Jan 2020 19:12:20 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
index 3cde6f79cc..6ab15dae40 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -44,6 +44,10 @@ do_configure_prepend_mipsarch() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
 
+do_configure_prepend_powerpc() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
 do_configure_prepend_toolchain-clang_x86() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
-- 
2.25.0


