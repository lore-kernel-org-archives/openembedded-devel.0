Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0C97C752
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:34:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w15so3386695wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7I5C8QxUMqzePLoFDQaXRuGHSL1xF74GBl+bFkMCq0I=;
	b=tdtQrbbaMpKJcTDERuXtHpOfgtDuwA79b4Lb/DcV28iOMyp9ukNM9NfWQij6upshWS
	er7G6Rv0NRhgGHIXeQ1lGY7m4OXrf5qAAJu//U3iaVzJvUcBAMIXzcO6PDmNupuOR6DG
	nLLyu5ecD48JeJoVXg+EDcMiDvVtL/xxp3hiIHDva82cgnY7B0ZqJNToG+DKw3G3fBSY
	h+EldHc+KjwbWMXA/7JtDR9/1C+DmnClqrCN61u585aTqFx5DMJUMbOnYXwutLPwGzOg
	lQUtRqxiOz4TK7nlCaNCYZ98ua0lgaDD/s0/en0KmA3Uiilh8/9aek//yb4Z0BfgBk4S
	UM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7I5C8QxUMqzePLoFDQaXRuGHSL1xF74GBl+bFkMCq0I=;
	b=gIqesSV2YUjspJ0sAiU/G3IDnANwOvIsEV/pIkyf+A/YXdRrzJBBhW9f81/i8nDet9
	RHK5CvT4s7GpC8f9BjuM8sXTHhCiD61K6xxbCwPVahlAuXcwkU+TFJz3xE5ZWnuYHg2J
	/052SWaGhKA1igqmJ704QO/ZPkQHm3AxAogbFNZop6jl6GluaheztO3AIZ0IDX/lGlL3
	cOakOCKM9QqszZ7M7QhRShnzTKFD7/jMUC/etEPNDxWchGQf2re5ubhFEENHI0kp4OVd
	pC/yDm2jXSnbC3eZj2E+4s5fOwQgdN506ffTQ+KZrphA7XdETTYkcfZxEtiZdVk2/mpy
	hifw==
X-Gm-Message-State: APjAAAU2bGawRUH8iYNrwkwsOURn67aJzLlUozRgZ4P7dpPI/LzafJ+0
	1CoApetQ5jqY58GyQw/3Y6NxdGLwOCw=
X-Google-Smtp-Source: APXvYqyR515FHopODlYs95DZZW8Hf1uIOXCTse6KhOpqQi2kkRmx2Q7OEZsPnTAtKzCHrvDigJ7LJQ==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr3647089wme.24.1555601680598; 
	Thu, 18 Apr 2019 08:34:40 -0700 (PDT)
Received: from localhost.localdomain (5-13-191-35.residential.rdsnet.ro.
	[5.13.191.35]) by smtp.gmail.com with ESMTPSA id
	c10sm2109000wrt.65.2019.04.18.08.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 08:34:39 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
X-Google-Original-From: Beniamin Sandu <beniamin.sandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2019 18:34:32 +0300
Message-Id: <20190418153432.16745-1-beniamin.sandu@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Thu, 18 Apr 2019 15:34:40 -0000

Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
---
 .../recipes-support/unbound/unbound_1.9.2.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb

diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
new file mode 100644
index 000000000..9e0a24187
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
+DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
+	features including enhanced security (DNSSEC) validation, Internet Protocol \
+	Version 6 (IPv6), and a client resolver library API as an integral part of the \
+	architecture"
+
+HOMEPAGE = "https://www.unbound.net/"
+SECTION = "net"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
+
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
+SRCREV="61a28c2ee5e60132f26725583b66c1cf8214bb78"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libevent libtool-native bison-native expat"
+RDEPENDS_${PN} = "bash openssl-bin"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool"
-- 
2.17.1


