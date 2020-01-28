Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14BF67D265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 21:53:52 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x185so7352876pfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 13:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mM0N6FZBgyX+uX+W7Vd0oDbEcwxuXq87f23Q2Smyt8U=;
	b=mykiwXWmfQbUrFX0jNvGoF+WTf/v4wx5JqnmEVK+AojIolAvBk98m7038xhR5h9dzg
	3VMV6VIAwhhpg/Flg+9lRonz/kgs38Ni+rxIKuZjJguDrB3yqsAPXFwC5aPs/ANFeGDv
	WPqhhuBZVJCFiAkMmPZUWd0grhsJTT9SQV4qIungadW3epNZFSuQqhwG8gl9tsFg1fE6
	raQYjNfmBao8M4gDML2STtXY2JCYZwpNr3TR3ymV3oNe0tgICQa1UF3p+xVKfj/8DSY+
	vUHEIxAWrYA7EIIEAu/X7INKBnelgpBRKrHgZmXXeuwg8oW/Cre2MJxhXDsdcmrasjZ4
	lm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mM0N6FZBgyX+uX+W7Vd0oDbEcwxuXq87f23Q2Smyt8U=;
	b=E7y2YSgvguVXXNgxcGkLviVcN2HAAldSQOFEhbRXqw/fIQBZtjS2weLeeWNiuezAqr
	dU+GI9LP6MqAOrKWA+XMAxlnfZvwk3OpUN2GhctJCd7Ii0YtovPCIS9XSnj2/+S7wimS
	w5FhZBIExTtKO/f4ILu+auQM0k5IkJuNjX7ieixz4AzVTkh5XigPvKIRvbyi9B6JrsR6
	z1JDqNWjKmKUUqoSHnBLECtL8sK20Hw/BPa43/AjcMRiwNJHuh72Hw4DW2WZGRAZAwli
	TAnFj2OWz7Q1PTfAfnuLKbChRxrSSy79k6k+6i53oKQbLHe1iDh8/JsGcI43kam4vHQv
	NPjw==
X-Gm-Message-State: APjAAAV9MLR7PkcekGAg832WDC7kV8e6i90zEtGBRWxOyoEkptabmzGw
	t4N5Dtdk0A8+f7hLvijog6/UX5kL5no=
X-Google-Smtp-Source: APXvYqzhISBrkoojpIah2nfo1bVww6lBd0H7QxEnCoAL5hoat/ICeUKrvvjFZnZAZe5QM7s5S+/Img==
X-Received: by 2002:aa7:8b17:: with SMTP id f23mr6067700pfd.197.1580248433652; 
	Tue, 28 Jan 2020 13:53:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id g8sm26217pfh.43.2020.01.28.13.53.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 13:53:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 13:53:52 -0800
Message-Id: <20200128215353.3594210-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200128215353.3594210-1-raj.khem@gmail.com>
References: <20200128215353.3594210-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] grpc: Link with libatomic on riscv
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
X-List-Received-Date: Tue, 28 Jan 2020 21:53:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
index 6ab15dae40..752562eb33 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
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
2.25.0


