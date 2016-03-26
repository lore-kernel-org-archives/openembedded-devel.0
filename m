Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 420DC6067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:17 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s5so6266503qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XiC0SyKrh2f26iqa1kbbp4ER2NXrkEesDuHmyRXjnFI=;
	b=arJsKBu8ZxRShOYl5Ir4ximvqode8vZDf4WfIDUKMT/fLeDsVIDTnDn5ZAfdm935p6
	XD3pqj6cSKMSy2t5gtNRXVKcosdfVLaKMGiVfAqKNFft5l1J6CzrY0aynfxdIxoQVLTr
	nsnLAjGoWNhiXD5NkxTniyyXB/QhGVNetfip53Ih8WmkN7P+1XFWZ+oI80JJW6hMCcN2
	ERNx/uax7+quu2YWYos+ZgI0rxxl86kRzfx7rL4o3od+5FZQpxxhFq+enq516lnjIabR
	roPVLCZHsXYDVnuuZB6l3CKt4u5RLuK0OGqJRVyKGv/USuNE0ag0412nFb7Z9zz5UyLm
	9Tfg==
X-Gm-Message-State: AD7BkJJGzpoGoMdYE4Gl7f6PX9Bd4bjm3Kdgyh8Xwka5rOUjfZ7WqZGFuGqsa1+hJHemcA==
X-Received: by 10.55.203.200 with SMTP id u69mr23610634qkl.51.1458997518037;
	Sat, 26 Mar 2016 06:05:18 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:35 -0400
Message-Id: <264924d7a262ae87447f4a034b75b9302af19533.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 15/30] python-monotonic: update to 1.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_0.6.bb => python-monotonic_1.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_0.6.bb => python-monotonic_1.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.6.bb b/meta-python/recipes-devtools/python/python-monotonic_1.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python-monotonic_0.6.bb
rename to meta-python/recipes-devtools/python/python-monotonic_1.0.bb
index 40207bf..5d237b5 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_0.6.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "2f77ba5a56051b0442b1c74fd05dafb5"
-SRC_URI[sha256sum] = "2bc780a16024427cb4bfbfff77ed328484cf6937a787cc50055b83b13b653e74"
+SRC_URI[md5sum] = "a692bff2c5e07dde22ad2128d818d15c"
+SRC_URI[sha256sum] = "47d7d045b3f2a08bffe683d761ef7f9131a2598db1cec7532a06720656cf719d"
 
 inherit pypi setuptools
 
-- 
1.9.1


