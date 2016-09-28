Return-Path: <oliver.graute@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE9E26006E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:14:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so4906041wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=y+69rXYnfF6DN5nUXgzQkjhxiqQYWTzseB82v+o1zbI=;
	b=cUOfQHiyCCA1iNwNK5sWYaytPy9eX8jqHS4fyz03rAe1TaZmMQFQe2O16f65J+w56Y
	TsyUzmiOGnOyLXv6fZ5jKfpgIa19vxEev9J/ST86tvk7hLopnKK/ROs55F+hUlbnqe/m
	NJWbthc9Yf6Dp738xGAcUS3h+MApcnS2nTTdbXrG65RLjPFCEXn0ca6aCYi9sNPNnVRi
	VTX6Gt46JrVh/XdGG86CL8OeyLgYPr2Ure12SEtVVgPwkm9BNTvyxSo2Xh/V+AueKOvr
	O5oenF+IrKXFk02juWZAIf7Bi90KyttRCnTFKdhclJQg8ByXmBiMexw6uxepmgc/AdEj
	jprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y+69rXYnfF6DN5nUXgzQkjhxiqQYWTzseB82v+o1zbI=;
	b=LbmHsCwZq6CANnms3gp7fB8iZn3xpTImJb2BhvkOGUKjUFjiaG+2094kQPpS+EdPps
	2lmzIIgHl2t14bP2PYYmG1nVUojTy8WvVk9uHDXqHorpDpbcyjL+OmYY7i0sGP2M+6wc
	xP8nRGt4AxUPzvBLfm6mmF/ZadsajJbcQPF0cG1LbHuJsDp4urnL054Rz2aU66pUYS7F
	RY5W7hLMTK5Hj4w9HKzUX1JwVB+kJu04LjW6IMEgctXAIV4K8MriAOMRqO/51kVdPWep
	jrVgRmVaqMH+vN2BuJ9Q76e4uT1lovrhfJnsOyLzARAg/xTUX9E70AuKGIAtkuP9u5/q
	qf8w==
X-Gm-Message-State: AA6/9Rkf2Y4eEo0YB9oY6hHjpLpEhQhEtWm0AFefdyRmZFKvGDNzv152AFydtEcYW0FJ6A==
X-Received: by 10.28.174.76 with SMTP id x73mr7339745wme.60.1475054084071;
	Wed, 28 Sep 2016 02:14:44 -0700 (PDT)
Received: from localhost (x55b137ed.dyn.telefonica.de. [85.177.55.237])
	by smtp.gmail.com with ESMTPSA id
	lz5sm7248050wjb.24.2016.09.28.02.14.42
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 28 Sep 2016 02:14:43 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Sep 2016 11:14:40 +0200
Message-Id: <1475054080-20531-1-git-send-email-oliver.graute@neuhaus.de>
X-Mailer: git-send-email 1.9.1
Cc: Oliver Graute <oliver.graute@neuhaus.de>
Subject: [meta-networking][PATCH] libnetfilter-acct: added new recipe for libnetfilter-acct 1.0.3
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
X-List-Received-Date: Wed, 28 Sep 2016 09:14:43 -0000

---
 .../libnetfilter/libnetfilter-acct_1.0.3.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
new file mode 100644
index 0000000..0d71303
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "libnetfilter_acct accounting infrastructure."
+DESCRIPTION = "libnetfilter_acct is the userspace library providing interface to extended accounting infrastructure."
+HOMEPAGE = "http://netfilter.org/projects/libnetfilter_acct/index.html"
+SECTION = "libs"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS = "libnfnetlink libmnl"
+
+SRC_URI = "http://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2"
+SRC_URI[md5sum] = "814b2972b2f5c740ff87510bc109168b"
+SRC_URI[sha256sum] = "4250ceef3efe2034f4ac05906c3ee427db31b9b0a2df41b2744f4bf79a959a1a"
+
+S = "${WORKDIR}/libnetfilter_acct-${PV}"
+
+inherit autotools pkgconfig
-- 
1.9.1


