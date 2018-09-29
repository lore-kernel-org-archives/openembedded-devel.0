Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0E778E65
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:43:44 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id a23-v6so6421277pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AnlLwaKPCl3fpFBt2UUDWzRyiK7i5i5QA6x9DRkw7FE=;
	b=Lm5g2hlGv0j1vcTOfJaxO4tKs3apkNSAVvt4NMyhhqQKR01xnAgiT4FPcpd7arYARi
	Ytd9KQgRHGU/sGE9d0/Pu8mDMCEVypsK+qHTjPknvxXCRf8tbOFsaymbqmVlUvMaC0TW
	lOOX0JYtJrhHBOggqp+Pl6TFmYRYhDHCe+SFqUpHU83Lc9FT9onDoWZn6MpEajrCSwqx
	yOSGtWD2GoR1aq38UwHfJIsd4Jpay0Igqi96b0FwrbmoKfXSJugs7N/JMCK8h7jPIuT+
	zTxWKV09khmVeZbSVDVKd6JE0l+Xh0UZ/yibmU2irYaU+5/RPo2J2RMeKrpvbysJnM5M
	Oyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AnlLwaKPCl3fpFBt2UUDWzRyiK7i5i5QA6x9DRkw7FE=;
	b=XHaRUyS6RL5ABWsaBIdLXlamyKZszxlwvZns5k9pyP81Z/+QNiNA3f/XoNBIPtxorl
	QA0a0Y05+5gxRO8esfDZXs6ZxTEwM7kFRoBtXvuzVMYiu9gYV3RQbEiYT5ymefXrCzK8
	C6G76XDqqhiG9451mzPe3TMTf2PFhN+qbNrR+2gfX8It8cWPa5e4hPfb2yqw6GZsbusS
	vk/ak+FlS6v94eg9uOJyYexnJYshr6OdPk2Gld7YZ2yp1blIyEh5j/5EGRxyLc5LZd/7
	ILFf6rQcWya8yuotzcCuLmPGiEJd0rtK30SZzkzrO0aDaGjCLnUPDp7NA8MC+2P9YSU2
	3tcQ==
X-Gm-Message-State: ABuFfoi2VLi4WN+7dK4XBJ75kJWRm3VZCFlb5X++bWhpZjQzfRWxj14f
	a2WBkAee+mmhFa8wa8zSMO463Xkb
X-Google-Smtp-Source: ACcGV62QLWqTKz8OEtFm2Dxzx51OMYt/vjV0usFAmOhT5B6ZLQHEof9CuqZeIo4viNzL+Ygk6LapXw==
X-Received: by 2002:a62:d206:: with SMTP id c6-v6mr4175207pfg.8.1538246624935; 
	Sat, 29 Sep 2018 11:43:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	g6-v6sm12276815pgg.7.2018.09.29.11.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 11:43:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Sep 2018 11:43:35 -0700
Message-Id: <20180929184335.39059-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180929184335.39059-1-raj.khem@gmail.com>
References: <20180929184335.39059-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] grpc-native: Fix buld on ubuntu 14.04 with gcc 4.8
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
X-List-Received-Date: Sat, 29 Sep 2018 18:43:44 -0000
Content-Transfer-Encoding: 8bit

Fixes a compiler error

terminate called after throwing an instance of 'std::system_error'
  what():  Enable multithreading to use std::thread: Operation not
permitted

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
index 784e0d2b4b..7b3f73657c 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
@@ -17,6 +17,9 @@ SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
            "
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
+# Fixes build with older compilers 4.8 especially on ubuntu 14.04
+CXXFLAGS_append_class-native = " -Wl,--no-as-needed"
+
 inherit cmake
 
 EXTRA_OECMAKE = " \
-- 
2.19.0


