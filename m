Return-Path: <armccurdy@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD17072F3D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 21:41:21 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id z67so19299777itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RMcTTzc3Reuvd3VwcuSTumqSToEvi+ALzCR3Y6bFRdE=;
	b=dl+oi+t/LwpUHkz5FxTQXqSbUzB+E4pC4D/HQ+tMXw3MFOmReJds8oDV1iSnPEtCZi
	pjLWbMu3f3h822Qa6O1YNHgMEJfVON4bFLb/ZW4aqpi82rVfZvDzQNRW1Be6Vvos8jAf
	bd6Fik+GrW57xfeIrKIX1NizmG+11nZLEOuTQczb+9WJUVGVvD+1R+PMIqEfJNhgamUx
	iq7hB8TCkHJz/3NmWfUPlWuMmCEHd3rM6w1o7pSu5PLsYDc5ZUy0cg2k1M/siyLep+7u
	Lcw5eXTu/kSKRSdMowG0qb5D7SVQv84LB95DrX74vWBAFDHAIPvjuMdMaVH4P6LTLiMN
	KXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RMcTTzc3Reuvd3VwcuSTumqSToEvi+ALzCR3Y6bFRdE=;
	b=Cc9oNx1ZbvGYpFjOJ4+ySfIduixD2tuTnhKIpgXq+usUIqQYjCcRxDuFn/ltnvCbB9
	IpMx7hphm+M2EfHxuEVI+m7b1lwW74ZkwvCJvD7iTjt+gBOHvWMmIT/+G1t46ejYxA4e
	6dSA3F6qSSJXIJfHrod+K37jg3g/t5A1HHMfU30wALJZ5nuHfQH9f+sGRNMllQx2oAKV
	fiVXp1HPhSMZKKhmkutfS8EkVnWHf80tKcGVnX0mUXiNfm1U5W5fIvEroXfbGuPJUJxe
	fj+il7RHDi1USlaNxilSyvo/V/rPoHiBIWU7/ESQjfx7RTUr9Re0aVT00pC6tSV1i/7O
	EXBA==
X-Gm-Message-State: AN3rC/6I6hlrkFRfEpWB8h/3Y5MXez16ai9sMg17HnVjXDG67nRWw62W
	LJJD+Kwz4L5qDw==
X-Received: by 10.36.9.17 with SMTP id 17mr15897819itm.79.1493070083475;
	Mon, 24 Apr 2017 14:41:23 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id 139sm8478288ioz.2.2017.04.24.14.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Apr 2017 14:41:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 14:41:15 -0700
Message-Id: <1493070075-24467-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] mozjs: prevent target CFLAGS etc being passed to the host
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
X-List-Received-Date: Mon, 24 Apr 2017 21:41:22 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 3424669..77d76c9 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -27,6 +27,11 @@ inherit autotools pkgconfig perlnative pythonnative
 
 DEPENDS += "nspr zlib"
 
+# Host specific flags need to be defined, otherwise target flags will be passed to the host
+export HOST_CFLAGS = "${BUILD_CFLAGS}"
+export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
+export HOST_LDFLAGS = "${BUILD_LDFLAGS}"
+
 # nspr's package-config is ignored so set libs manually
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
-- 
1.9.1


