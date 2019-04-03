Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DC3647D2D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 08:29:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s15so800794wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nf1EAj5dPPcuDCqJOI2b1YaDpZNW8m19hKfh7ZYn1fM=;
	b=HR0vKRBXrpKPM1EUte2byfo8p1Vuru7daOF8mPrZIVMz4mhJL6BvXA7S81jOsrhIK9
	0+Ds+AlZaZkkELUM2tUmL5WqLGB+eFxpURyNthGfKh2+o6uSklk23JsYvphgBRSAZc13
	hCQ5Z/mCdWQjwdbuokVB/CpdRvHKgnDdZBKtzDQmdTQg1Z/S4IgI5P1yh4xsmRhfV92K
	TNarIQcWXlTRNpove2p7OnGpps63ds2jfBoD+BIX4Dwf9N/stTz2wnGV3FCIfU2ECS2i
	S0bpMsh/X9wj8Y1MYe9wqLyHVX273JXoyGruSbBb/CzIdTJJcQsWOktgsh8zYdTFFh/H
	8rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nf1EAj5dPPcuDCqJOI2b1YaDpZNW8m19hKfh7ZYn1fM=;
	b=Z7uWVpvX5EjGus1blS4bc0S5StdIwqqiQ1sQkY05MdR0/TR9Imo2chf8cNYg/gz2kX
	y9RbwumczqxunyXEvGWOs296DI1n46g4c/qKN7N+kKZiP1FuSnuS8Ne+XDORIpBFqktL
	so2DgiSinYpHILc8G8gKa2bZ9eBAMin9Wf4SIRI8MfA9+wWYxnXEJ2CYxAbI4HgXXP5f
	MoWTle4gSa4jDkKJhI71u+KbJSHeCBaQ9uYciMO6Sltu+gHknlcMB/5P1bbWWEmnTsBt
	ggb7CWt1/JNtiwFzPloVyP6eP/sIw3bh4hMBaj2i/Y0MiFbIer+NkXMY8OWsKJWtWOs7
	SZ7w==
X-Gm-Message-State: APjAAAW0DfvHSRh1xBMsoc47fm86zEobmNjC3uZ1eW1XbGQ6hmzZ0QDh
	edbUmeiODHcIx9sFHj3ZgFNYw4w0+s0=
X-Google-Smtp-Source: APXvYqzN0oIeOZgX1Kaav5kNdKjjXQkbpE3iwc2h5b5EYjtl5Rw4R9B1WxkwmMCw3xW/mKahCDa7uw==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr5020261wro.216.1554280200406; 
	Wed, 03 Apr 2019 01:30:00 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	([2a04:cec0:1050:ef0b:a7a5:d60d:857c:6708])
	by smtp.gmail.com with ESMTPSA id l21sm6975587wme.4.2019.04.03.01.29.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 01:29:59 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 10:28:43 +0200
Message-Id: <1554280123-19112-3-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe][PATCH 3/3] czmq: bump version 4.1.1 => 4.2.0
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
X-List-Received-Date: Wed, 03 Apr 2019 08:30:00 -0000

Also, add curl and systemd to PACKAGECONFIG

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 .../zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb}            | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb} (56%)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
similarity index 56%
rename from meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
rename to meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
index f2db004..4ec1c04 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
@@ -1,15 +1,13 @@
-DESCRIPTION = "C bindings for ZeroMQ"
-HOMEPAGE = "http://www.zeromq.org"
+DESCRIPTION = "High-level C binding for 0MQ"
+HOMEPAGE = "http://czmq.zeromq.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 DEPENDS = "zeromq"
 
-SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz \
-    file://0001-Problem-out-of-date-with-zproject.patch \
-"
+SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6d3a6fdd25c2bb29897c53670dce97bf"
-SRC_URI[sha256sum] = "f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0"
+SRC_URI[md5sum] = "7e09997db6ac3b25e8ed104053040722"
+SRC_URI[sha256sum] = "cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb"
 
 inherit cmake
 
@@ -17,14 +15,16 @@ PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
 
 FILES_${PN} = "${bindir}/*"
 FILES_lib${BPN} = "${libdir}/*.so.*"
-FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir}"
+FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir} ${datadir}/cmake"
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 RDEPENDS_lib${BPN}-dev = "zeromq-dev"
 
-PACKAGECONFIG ??= "lz4 uuid"
+PACKAGECONFIG ??= "lz4 uuid curl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
 PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
+PACKAGECONFIG[curl] = ",-DCMAKE_DISABLE_FIND_PACKAGE_libcurl=TRUE,curl"
+PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.7.4


