Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 30C6260CE2
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:30 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id dw13so3089534pjb.4
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LK8IIc6jbB4YHV7U6XHLJmJ4oFznLOIC4UmCwELPu1k=;
	b=IQz4427OZtehvuGFN5bSn+Kl2weM4hZ8JaAIHrtH9+uGIeGBTq1cQgIBVRCcZkQccV
	2Y45mM5Rxt6A706WmedxUGVjxreZgyQVpaS8B9BqtJtQqfIntfXcFGn6eAGF0LrOvJVL
	suKjpb6UadFdKvkhTeaASvghyi0TKIibvoiHqzKftm3b+ieFsPSTBoXfBECdfkXJWACE
	Nd9GHIZ5h54yf4NEy0sc6HX1XrRYIr7gqj+T9jH/5YYIujPHodzFnim1kJ3TwnvrmIJP
	vDHT6tX3FU1WEPpCc0kVgNpkRmPz5dlFCFMvBqRtqCDCPjFJEUrBNZ3NjbLZK2tHvoKT
	67/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LK8IIc6jbB4YHV7U6XHLJmJ4oFznLOIC4UmCwELPu1k=;
	b=f4Cjff4CSQPxFlCTi/z8ztC01eJOd9v84fDspQV6mrWq5rLo2ce8DfLorVz/IrJbzg
	tI3yIZnRNEnMjp3ROaTYkNcVs4lt13q1OkP3Zka/tYOR3PBTdoHO4Y1jS0ywJiJ9Wy3T
	RjdEhVV/oLNyqvQ936q/GIQaT0zDN/51n/+AaUWZNpa1vk8TMNTTpaQAzDjiwmVaVxoG
	OIp8YB/ynRr7lLTaGFO68dzsLMQvdPWkLHLm9LibjKu1D4rkvYpO3U4xxu1eCWcyKX4C
	ezdl08zqxRP3nZ0qH89AGGRuEyLHCXnwjUMxNx1uwCH3fZTwd60bsj8egGKBRoVWa7cS
	9ajg==
X-Gm-Message-State: APjAAAXc0gKjmJaFOHhY9Ly33VwFCUpcERDg2L15fLvc3kkJiJQpvkag
	EQK1DSKMNHBFY3bwJO8Pv0iAnMwZ
X-Google-Smtp-Source: APXvYqz4j3LUa1Ye4cG3j3PlkKrfbWzVqQA70K0N3RUktK06yY766+Clz/nDaqir1BP2SxwAlv+l6Q==
X-Received: by 2002:a17:90a:f0c8:: with SMTP id
	fa8mr15774726pjb.136.1581265050846; 
	Sun, 09 Feb 2020 08:17:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.29
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:15 -0800
Message-Id: <189ba6b49974934d0aa7b1d77996570b7a65b1a9.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 07/11] grpc: Link with libatomic on clang/x86
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:30 -0000

From: Khem Raj <raj.khem@gmail.com>

clang does delegate the atomic<double> calls to libatomic on x86 where
as gcc tries to use intrinsics, its debatable who is right, but it does
seem that clang is safe in case pointer is unaligned

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f7a7a2aafe87437aefca21612dc156fde645ac89)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
index 8d54dbeff8..c11b55669a 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
@@ -44,6 +44,10 @@ do_configure_prepend_mipsarch() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
 
+do_configure_prepend_toolchain-clang_x86() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 SYSROOT_DIRS_BLACKLIST_append_class-target = "${baselib}/cmake/grpc"
-- 
2.17.1


