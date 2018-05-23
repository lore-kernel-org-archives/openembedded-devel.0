Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1AD74749
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 22:39:38 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c41-v6so13866532plj.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=atQ6nxa3oqgCfM8+/7uvJ+war30t8pjhfJQEHOjwvYU=;
	b=Ks+n8Pm+hrBPjbbw5wpVdi8ei9vBbxc0UX0JojJdQwFUBJQutKwMBqyAquZUIu/b+l
	EgiEKwvc4vQiz5R6jNdHVmNg1Dq+ZFqbTJmC1TrP1dWZ/UEbMX4fXYUsHAmkR6j4IJ7c
	ITCmXGNmDN3Tqmay3hgBNJYBqFN77inOhAKI47hmOK9TZOq7mFpZngEUklvNJunFUMqy
	CJB2gztwbOrm6ze4lOhff1+2jTP/xEHf2bkk23vOYX1t3DZ8Si/rN5NkBTdmGliuYryR
	5YnCExAO7jaokNNfWxh7LiOqSj0exdKQgHm45CoO3MFfDa/gahI+Az3hyQmN7fVf8Vto
	RIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=atQ6nxa3oqgCfM8+/7uvJ+war30t8pjhfJQEHOjwvYU=;
	b=i7AhujX0UCsbqMJDl63fCMJ4PVvmLX/FzCWO9nC/LzMZuCkpN4JnosZBu55ccFvjW9
	IMYeu/XathrK4J4/s3inFH5hzyv8C1/5mLFUIlpca/oiQyTzfmwOJKl0r4Y8fxizE2IA
	6U4oR/Hg04+id71e+DJ4jt1lFCDdYzbri0aPKN9EMCBgPxffuyHp3lwSLZota23R167P
	nqZrFabrsYJPF4IS+WoHf1ZXZtrrlhHc+COsI0Tr5dakPkjxG37Ubk+0CnZBQyGqVzRi
	0rKZe+An+uc3LyDxhrIaqPf06ewKb+p3GL8J0EikDO8PzYlExhA/e2amAKzzVfCHT8Xy
	6wIQ==
X-Gm-Message-State: ALKqPwcGYuKDyfxVOEFQETxIVwaFQ0SQFB8Mk4ajpL2I48K49lsw4G//
	5D1vx7SkHQRt/MrTjjNIUfC5uw==
X-Google-Smtp-Source: AB8JxZrwz56JvKfFLc5X7FQk1KdB0M9SsHadvsctCyr3P6d3E2Jk1Itiai7pPNCsiz819cShM1VOUw==
X-Received: by 2002:a17:902:5a4b:: with SMTP id
	f11-v6mr142027plm.85.1527115179194; 
	Wed, 23 May 2018 15:39:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	g15-v6sm25900272pgv.58.2018.05.23.15.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 May 2018 15:39:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 15:39:28 -0700
Message-Id: <20180523223928.21302-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180523223928.21302-1-raj.khem@gmail.com>
References: <20180523223928.21302-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] libmusicbrainz: Set CMAKE_EXE_LINKER_FLAGS to build linker flags
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
X-List-Received-Date: Wed, 23 May 2018 22:39:38 -0000

Some older compilers do not support security flags like -fstack-protector=strong
and if we do not set this then it will use the target flags to pass here
which will fail with gcc < 5.x, especially a problem building distros with
security flags on host with 4.x gcc e.g. ubuntu 14.04

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 16e52134bd..ca9d94a19c 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -22,10 +22,12 @@ do_configure_prepend() {
     git clean -dfx -e /.pc/ -e /patches/ .
     mkdir build-native
     cd build-native
-    cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
+    LDFLAGS="${BUILD_LDFLAGS}" \
+          cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
           -DCMAKE_C_COMPILER=${BUILD_CC} \
           -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
           -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
+          -DCMAKE_EXE_LINKER_FLAGS=${BUILD_LDFLAGS} \
           ..
     make make-c-interface
     cd ..
-- 
2.17.0


