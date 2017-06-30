Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4C01778268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e199so17016681pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fJ15d+kdzb5K4yqVkvyoTMsabkyRKaaccjghzyL7uGk=;
	b=B3+ggh+eCDZlQcs8W/M5W150faP/kk5a2rcuH0CdgkwTnquOn3I2LNHxSO3LgMqFbc
	D0X2iEJwB+WqnESJTUQvsmS9UHQB+H2OHPzbrdy3qycyv4+6guuZfRzAh+zBjKfcEGHV
	WckjS7poHrRZJVAscoBQ89Js7CMMwEBRxKegIsRIECex9c5GjecYJxk6M5u3VTMjb8wy
	8ROrh6MprT4EMBeEpAc9iRG1n1OWRsIblqZitwWvq3WzfFYAxuveEv77OyAp795a9rFx
	RH5vNVu8vCsrLJ3k3iQv7XNSxIwuur0rGOKvNdW9kiXwdpOKevvOY3CxrsWGmYYNGfdu
	E4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fJ15d+kdzb5K4yqVkvyoTMsabkyRKaaccjghzyL7uGk=;
	b=esBDh2yFCL/QrSKnY9TLIHuL0gAMCEVKFPCRNC9WJTPJMQU+HCa4xag5J1+1hVrJv3
	nyf7vv0cTvYNua83MaXexm/SZtuw1iATwI2huSqgrXa/XADsmFbcQeYoD8fZukE4iXrU
	jBhctPkR8hAQgClBD7wGnssliksqzaOJUB0fHvBmLWZ9bkMIoprYN0MbZejT25GzYLBL
	7GzBbc5rh9782ZV6JBrQX31x21TytN3QinzT0ThRfyr+ILCPnvwD7pr977tN1hUtE2yL
	8/5JQf9+sZCxOyivjuYtW6rmM26tyQuEy/qxtNSUatQPRBgLXxH+lqKYG1cyD/kpTBH/
	LRCA==
X-Gm-Message-State: AKS2vOy/dPeFIkS/JeftHSc0RD7fupHoUEbFPfUogYw9BpPPBmKcjXow
	qQtSUSbgXLV3RKlp
X-Received: by 10.101.73.11 with SMTP id p11mr20796460pgs.234.1498827622919;
	Fri, 30 Jun 2017 06:00:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:48 -0700
Message-Id: <20170630125957.3342-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/17] fluentbit: Fix parallel build race
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:22 -0000

Sometimes with high parallism the build fails like below

| In file included from /mnt/a/oe/workspace/sources/fluentbit/include/fluent-bit/flb_thread_libco.h:24:0,
|                  from /mnt/a/oe/workspace/sources/fluentbit/include/fluent-bit/flb_thread.h:41,
|                  from /mnt/a/oe/workspace/sources/fluentbit/include/fluent-bit/flb_io.h:26,
|                  from /mnt/a/oe/workspace/sources/fluentbit/include/fluent-bit/flb_output.h:34,
|                  from /mnt/a/oe/workspace/sources/fluentbit/include/fluent-bit/flb_plugin_proxy.h:25,
|                  from /mnt/a/oe/workspace/sources/fluentbit/src/proxy/go/go.c:22:
| /mnt/a/oe/workspace/sources/fluentbit/include/fluent-bit/flb_mem.h:31:10: fatal error: jemalloc/jemalloc.h: No such file or directory
|  #include <jemalloc/jemalloc.h>
|           ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...proxy-go-Add-missing-dependency-on-jemall.patch | 24 ++++++++++++++++++++++
 .../fluentbit/fluentbit_0.11.11.bb                 |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
new file mode 100644
index 000000000..90242aeb6
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
@@ -0,0 +1,24 @@
+From 84d70b6bc744cd348e66a0bc6c7958cdfa9ce670 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Jun 2017 12:56:21 -0700
+Subject: [PATCH] flb-plugin-proxy-go: Add missing dependency on jemalloc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/proxy/go/CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/proxy/go/CMakeLists.txt b/src/proxy/go/CMakeLists.txt
+index 3273346..02a54c2 100644
+--- a/src/proxy/go/CMakeLists.txt
++++ b/src/proxy/go/CMakeLists.txt
+@@ -2,3 +2,6 @@ set(src
+   go.c)
+ 
+ add_library(flb-plugin-proxy-go STATIC ${src})
++if(FLB_JEMALLOC)
++  target_link_libraries(flb-plugin-proxy-go libjemalloc)
++endif()
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
index 46c47fd55..83818c84d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://fluentbit.io"
 BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
 SRC_URI = "http://fluentbit.io/releases/0.11/fluent-bit-${PV}.tar.gz \
+           file://0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch \
            file://0002-msgpack-Add-comment-for-intended-fallthrough.patch \
            "
 SRC_URI[md5sum] = "7bce8091c41fb6412b7fe0185b3cb8d6"
@@ -21,3 +22,5 @@ inherit cmake systemd
 EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
 
 SYSTEMD_SERVICE_${PN} = "fluent-bit.service"
+
+TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
-- 
2.13.2


