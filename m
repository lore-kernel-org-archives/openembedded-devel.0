Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E26E747D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 18:05:59 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id g20-v6so5106738plo.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z6cF6ZGVsVI+g240z2EPBi3FFSayguessnKZWZ2FjE8=;
	b=IgUBbIpwZLnNoL6R+YpFRFjEnP2hiM8KAd0ZOYTFhnLbKY7DowMorN7/bniDnYuRJs
	jz6SlJNaWOL3guNJmgphh/SFxGhd4m7NlZzIzzk8DziiQIlvgReqcxm1LquEVY92LBHC
	j1lBrIY6S4nBU2DgI5pOaSWdCKSKpLV1MwmamOYx3Cr5GvmDzO/47c1wiD8Zoa859HdM
	5E5AZAnuReXuCggefwZmxFXDU6WYXMFoMC3m0FaJd6zolugdB56AywROq/N7qIrOC4GC
	n+H2euv87g9lbvLtlA6dCTO5qugSxee2A6fGuxYfDev2mPez+srjnvY09gqzyiLB+T9q
	0dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z6cF6ZGVsVI+g240z2EPBi3FFSayguessnKZWZ2FjE8=;
	b=GgPMuL2mAC5s9yq0lyrleq0+IDP5X9fuTFkrdllM+ktMJ36bUZSti9s1vF7jx3sSL1
	XOfj+tIvTGdhPtpOCgYysu/Z5m16KjcqiqXALST5V60sGW/nDoE+AH8H9Rc278Oi7PRt
	uAYewn94xS7U8BRkxJO4cPPPy3D/8iNHLTysH78br9Dz0v6fmoIxCH4UcF+t7QotYR26
	1X/AmqF5AZfm2zYB8ODrsMeBb2VZtcO77kZwElwN5kAppFJr6PTR1Y2S8rB/EFzO/QSJ
	UMEQtfPhHcf41PoMM2Bfd0r3bKE+gNSLXSTtJpCf/tJl2j6sMoZshMUm+WRmVdYkTrMC
	dobA==
X-Gm-Message-State: AElRT7GFfCC5vGuea4MsFlsBBBmmrb4GGGXfuF96HfKtt14Kb4003JPL
	X5cIWF9CcgzDcKTDGk9A2qlvwA==
X-Google-Smtp-Source: AIpwx4/DocEdLKLwtjKlkRTFiPjkoa/y5NYe32AhwDhaei85ZIzRCM+GNJh+7m5ACC4YPWCouKpZiw==
X-Received: by 2002:a17:902:6ac1:: with SMTP id
	i1-v6mr10585014plt.152.1522692360564; 
	Mon, 02 Apr 2018 11:06:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	e4sm1788778pfa.166.2018.04.02.11.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 11:05:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 11:05:45 -0700
Message-Id: <20180402180546.38078-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <20180402180546.38078-1-raj.khem@gmail.com>
References: <20180402180546.38078-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] msgpack-c: Update to latest and fix build with gcc8
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
X-List-Received-Date: Mon, 02 Apr 2018 18:05:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-Werror-class-memaccess.patch          | 35 ++++++++++++++++++++++
 .../recipes-devtools/msgpack/msgpack-c_2.1.5.bb    |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch b/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch
new file mode 100644
index 000000000..b0d772d93
--- /dev/null
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch
@@ -0,0 +1,35 @@
+From a05d92ae85024d0648f69f95307a1d3e8e51109c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 1 Apr 2018 19:55:38 -0700
+Subject: [PATCH] Fix -Werror=class-memaccess
+
+Casting to void* make gcc happy since its upset about
+object types and rightly so
+
+Fixes
+
+'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'struct msgpack::v2::object' from an array of 'const msgpack_object' {aka 'const struct msgpack_object'} [-Werror=class-memaccess]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/msgpack/msgpack-c/pull/659]
+
+ include/msgpack/v1/object.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/msgpack/v1/object.hpp b/include/msgpack/v1/object.hpp
+index 64da8c53..9721f705 100644
+--- a/include/msgpack/v1/object.hpp
++++ b/include/msgpack/v1/object.hpp
+@@ -661,7 +661,7 @@ inline object::object(const msgpack_object& o)
+ inline void operator<< (msgpack::object& o, const msgpack_object& v)
+ {
+     // FIXME beter way?
+-    std::memcpy(&o, &v, sizeof(v));
++    std::memcpy(static_cast<void*>(&o), &v, sizeof(v));
+ }
+ 
+ inline object::operator msgpack_object() const
+-- 
+2.16.3
+
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
index d9f695669..02c0cd296 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
@@ -9,9 +9,10 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "7a98138f27f27290e680bf8fbf1f8d1b089bf138"
+SRCREV = "208595b2620cf6260ce3d6d4cf8543f13b206449"
 
 SRC_URI = "git://github.com/msgpack/msgpack-c \
+           file://0001-Fix-Werror-class-memaccess.patch \
            "
 
 inherit cmake pkgconfig
-- 
2.16.3


