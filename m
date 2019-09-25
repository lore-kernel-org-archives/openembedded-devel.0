Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 23F967E601
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 18:58:07 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q12so4169046pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=892swRCb5TWwTMGZMDl5q0mOZvU8BghkJtGn57wipNY=;
	b=tJecLQAyJ3rZzz/Oa3rLPaohEPZ5V+4Fr8g6GCnQ6V7c3/ulrDSDjFFj2qTuCgvTmO
	HU1CEGQ4hWFcmkZmV1WfvcMgtoenQEb2RpwtPN9PTmjcv4Vhu5bG+nRB4K4NqZqm5udB
	60h2rTWxHYSvlwclhPs1xbaQAadrKewcUb103WeLbMlo1M9Xhdw9ywfYjFnQaAdipjpm
	kmx2K47afgBRMit1iqg9cZQjlL/xzJKa4995FCG3vDBtWOa5mTKJGDVOAFgPJlthyo2K
	Q4dqoCcHya5vavs8CsqXMH+d2y+YS0Y4TT2AY0SSenvwV6q6CeOM0s9GelBOan6Kx6Gl
	yH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=892swRCb5TWwTMGZMDl5q0mOZvU8BghkJtGn57wipNY=;
	b=pG/r3zxyG/7tWjXGyb1FcH055KC+u48CLRpJqk+mXL8uOVj2f+l46bEA6CsQNQb8eI
	eZvYUkT6dWGiuUD4igEibyG7xEFNnW3bw2v+N1L77xVZ9AkXLOKPagSvOoPotuSD8BjK
	1RFNPt+kNE8HxEhaMa2RObdkILk9Q52nr3a4qpQdjPzxHTO7rUiSZLUcyHs0h9zel+1j
	skrrQSDmOQPR35gR8togoNMT1K1b2NFsuECbccRZJ/v/fQBteCBvkQjtjho83rGoUYZ0
	lC1+5rSOpGtBMVDymuyKorGyE7qhxAyErqaRqv7OmgaszNv6tK23JHrjNyTXuaMnP9lO
	29/g==
X-Gm-Message-State: APjAAAWcNe6L9A1DIt7+VhP+GiclqezhtvdpbYba2WGr4ZXH7wDMh6tk
	ZPYefC3U82IXK15MQN8C6lrG5pqEQHo=
X-Google-Smtp-Source: APXvYqwbU0pgC6BGvxb5cmf25p+j4erCglqfB/JsGbqzkDJ2VCB50Zg813FTWNGzOzChRGo6i6WXyw==
X-Received: by 2002:a63:121c:: with SMTP id h28mr806302pgl.336.1569437886255; 
	Wed, 25 Sep 2019 11:58:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p66sm13701085pfg.127.2019.09.25.11.58.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 11:58:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 11:57:54 -0700
Message-Id: <20190925185755.639757-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] mongodb: Remove non building arches from COMPATIBLE_HOST
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
X-List-Received-Date: Wed, 25 Sep 2019 18:58:07 -0000
Content-Transfer-Encoding: 8bit

c++17 is default now so we don't need to edit out c++11 options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 3e77ac32f3..e7e03a4e14 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -36,11 +36,7 @@ SRC_URI_append_toolchain-clang = "\
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
-
-COMPATIBLE_HOST_arm = "null"
-COMPATIBLE_HOST_libc-musl_x86 = "null"
-COMPATIBLE_HOST_toolchain-clang_x86 = "null"
+COMPATIBLE_HOST ?= '(x86_64|powerpc64|aarch64).*-linux'
 
 PACKAGECONFIG ??= "tcmalloc"
 # gperftools compilation fails for arm below v7 because of missing support of
@@ -66,10 +62,6 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  ${PACKAGECONFIG_CONFARGS} \
                  core"
 
-do_configure_prepend() {
-        # tests use hex floats, not supported in plain C++
-        sed -e 's|-std=c++11|-std=gnu++11|g' -i ${S}/SConstruct
-}
 scons_do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} || \
         die "scons build execution failed."
-- 
2.23.0


