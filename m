Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id A8A8560CD0
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:31 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id d5so3085575pjz.5
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qZIy5kbYst66x4zN0Uet/5f/LHeqC9Gnq2b+yXT8SI0=;
	b=cikmQwY6BDjBfCizMHxA81Lp19k52WauZ5tgP/ggGVALf/5cBpkq5xFC8UMjNe6CTR
	8MzpnqyNJGOUhPeU302uLixvkyFiVU7nl838m4aT/CDE1YhM5Yxy2Ijul/mjYggX76Gk
	OEp6uumIAIdacJrOij+3kdcbqc1YXcBnawFL1304e27bVEF7npiaNgLfCsXrzMZo91JD
	CWRGOdjgwVvXGN51KsmycVIvIJpf7luHDGOpz1jNodlggaK4Yl0m8AMqWckFpVtGU9k0
	o2yJDSA2/vTFyw9SDpJNN1+IO3eTB16GGBneokcNY3V3yvT9R7j+bRBp2Ue6vLwiPwu9
	2wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qZIy5kbYst66x4zN0Uet/5f/LHeqC9Gnq2b+yXT8SI0=;
	b=CbcN9jX4u7Ju6fOjuI6n2mWfidExtxGnNqw3/Engg8uPBh8I08Z2BQ/c3PI3VWQ8XP
	CwYrlIQEogdsoHIdMf6six2I6ctuZomqTxWPjGPCNfKf4L/M/lnkIDAgG3i6JnVupORB
	9Nw08rXfHNX3kCcnNYQEyOAxkGy3OpxkGpmXDvahayHQnhLf9RX3Ij9oPAHN203VZmwS
	a1V/WSM0jDBHY3K5nu9IkTsV8kN4jGjiLOkHfw9KkCpEEziVCdQwpPdaOmCYnDnwHW9H
	R2ACewyKrDizIqJPI69Z+xLOvErrTiz7RNPy+YFS0ET2ZBtS0xfvE4tDEsmlBXjp+1Ez
	9edQ==
X-Gm-Message-State: APjAAAULTD2hElD6RZkBZy8yYDS74b0sUoc02DTP6US7eRvtfhP82bM0
	JNqNe9NFdZSTkPEm4Qwsl5xQzUQD
X-Google-Smtp-Source: APXvYqxjGkAgAmU2OXTpZ/HFr8rMiuWCkrGrbwiapHN0k3YCmBOXwD1gxji7i/9mbJRjWQjopIh6iA==
X-Received: by 2002:a17:902:103:: with SMTP id 3mr8794827plb.34.1581265052695; 
	Sun, 09 Feb 2020 08:17:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.31
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:17 -0800
Message-Id: <40d92260341d9c46d33f6e149298138759b0c14b.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 09/11] grpc: Link with libatomic on riscv
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:31 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e82f1802a60d451f978cdef0f2ff69feb1f12039)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
index 34b4e317be..0b5e5c3361 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
@@ -48,6 +48,14 @@ do_configure_prepend_powerpc() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
 
+do_configure_prepend_riscv64() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
+do_configure_prepend_riscv32() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
 do_configure_prepend_toolchain-clang_x86() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
-- 
2.17.1


