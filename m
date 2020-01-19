Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id CD4B77FCB0
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:14 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 4so14734666pfz.9
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XSgpRzddj2ij2hTZSRTkcwhbodXyEZfNPq7cvjIztd8=;
	b=HSurqzQ9XXQWY+2RIhg0GULjpjw6rHFNjFuAoV3lywyj18iv7dDhJGeEnoGl3Dz1A7
	AFNiS6fh6MIi3c9bJCjbQL+ayReEP4GvAqXE4S6TtXH1WyY9sdWxYHWJASxMlbpYIpIe
	EQUBYZGzVk+gbR6zDbiMX2A40iOvfPhnxDAl9IKZFYc+kUyjCMf2aWoRIp1tkc9piFNq
	IyCXfwSWI8H9o9YQkZz7+TF/bzu95fJPo1GWPOaZPENM/20XrycV3JvbPtmgjoBNKDWr
	dj53n17Asbdg1X64Ls3+/9+Qqi/Yj7ummQgvbG96z+DbfXdEHbs5t7R58zvMhmlXai9c
	8Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XSgpRzddj2ij2hTZSRTkcwhbodXyEZfNPq7cvjIztd8=;
	b=jIQMBoMv8Vl55ATu+m+by4YD9DCSw5DBRgnzUtivu4NcYGKqao3UZ8tBRidNGIzcmV
	mxINHqA2QXjfKz97jtYRjRgW/oazqhpXsYsGseTvTQDRI2GyIaX9clDshUWc0bJGDvrw
	JmSRvmJyHxnhDItSSh1mF88pVpE5AmCzpDEeLbLL5PDgj4pSa6fa/amUJP7rlj+z6Hgt
	9Jj6cw7WFKaYogp+YgAHDunyxzWdw0UA3SQKiTHwhYq0jTY5UE7wUUUChZfsvVZ6d0+x
	nD728lDTJHPMq+21ziJrol66MyFiNtDMph58mCZJFLSEkApDuGUcefcYK7fvFPWZ0QnL
	bZng==
X-Gm-Message-State: APjAAAXxgOwmPotZq2HgE1tbmgeYlDDgIfnu9dmb5kFOpM4fbAXBhQ4B
	p4KOj+uyG/p7tZEytZ88/dvYK5bC
X-Google-Smtp-Source: APXvYqyt31tyVsSgaqzyYf0k1ER1c3bTffptidRjN9jzs9cGC9jRCI7dtWoW6imnLAmarBjtfYMtog==
X-Received: by 2002:a63:2ccc:: with SMTP id s195mr55234258pgs.75.1579467015760;
	Sun, 19 Jan 2020 12:50:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.15
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:50:05 -0800
Message-Id: <ae5aa7b7e90b248b84b48541fac9ec75d391116f.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
Subject: [zeus 7/8] websocketpp: refresh clang patch
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:15 -0000

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 45476f9d6a9d7b02a549a19f0e841957a808d3ce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
index 4217897284..f1d037fae0 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
@@ -18,7 +18,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2d13117..c17354a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -148,7 +148,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+@@ -150,7 +150,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
          endif()
          set (WEBSOCKETPP_PLATFORM_TLS_LIBS ssl crypto)
          set (WEBSOCKETPP_BOOST_LIBS system thread)
-- 
2.17.1


