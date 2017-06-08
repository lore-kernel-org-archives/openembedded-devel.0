Return-Path: <acfoltzer@galois.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 50C5478219
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 17:35:36 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id x63so19449061pff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 10:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=J8IhMFGU8jCdXAZayQcARVDRaJivRuanS9ObxM36qQc=;
	b=qTkA1yeXk1xUth43dN3bf2IiwlL/UeLJ1N1joodRM/Cw6JKxzO/9WtIIgn8Kk55VvE
	hMqJTOWseTisFIBrNTu1c1PcScWQn2IE2ePLSxCHbRpE7n/M2nMxARASm+dPcwS9sRf+
	mV4CLJaZZzlPcFMcUpw+mdSlEuIC98UGwmSwPoCTxh3azPeR89t/+7/U3SzrcitlHVf9
	+FZkg9SYejFAyYRoXHD+eMXCio4l1kyLkXa2ZHm3FfF/wzadmffZcGQZC51dPO6LF3W6
	YsunW8kEqWEnKb21P/sveLYxH3iAj6U7ICDaNQVqnJCiOcMpqXZs/GDFGdjCCq7UfMHE
	Fc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=J8IhMFGU8jCdXAZayQcARVDRaJivRuanS9ObxM36qQc=;
	b=blEEN5eNtqL+AtWpy/SVRL4vQaly8Fb52s7hyHgRdXYzK06y1q1rmhaU6jn4ixUilE
	KuyfGBvziDLlLL7eBYE69SOwCSJCUzG2glg1qwuTJm/IHaPGW05p0bPC+q3b/d3/DNpG
	HTGs9xvzArJruwdYqz1n0a4uSMXjO2athy6oJzrBzlRAreLBU1NPdtohNzOBDF+qlrja
	tOt+FCd2IkzMSIggPoQ9NqlTCmgX3eLop0Gu6mW7LX/QrJ3uzK3AVjq6H+cgGA8Z0uZJ
	ftPKyhYzrTLDCAfITMcFpWX5LMs74rPVbcXAGLQ8XJ7OyYFSWafewyA/kJY8Bma6fYxP
	Wwpw==
X-Gm-Message-State: AODbwcDtX6iO65BxN7h5FUhlqrsxx9qfX2MRnuwjvqJG80d4gcuiZqSS
	ts82lpSxYyyMh8a7Io+nWg==
X-Received: by 10.84.142.129 with SMTP id 1mr35007356plx.84.1496943338233;
	Thu, 08 Jun 2017 10:35:38 -0700 (PDT)
Received: from svarog.localdomain (75-164-184-208.ptld.qwest.net.
	[75.164.184.208]) by smtp.gmail.com with ESMTPSA id
	t79sm12051846pfk.106.2017.06.08.10.35.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 10:35:37 -0700 (PDT)
From: "Adam C. Foltzer" <acfoltzer@galois.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Jun 2017 10:34:14 -0700
Message-Id: <20170608173414.29852-2-acfoltzer@galois.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170608173414.29852-1-acfoltzer@galois.com>
References: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
	<20170608173414.29852-1-acfoltzer@galois.com>
Subject: [meta-oe][PATCH v2] meson: add LDFLAGS to bbclass C/C++ link arguments
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
X-List-Received-Date: Thu, 08 Jun 2017 17:35:37 -0000

This adds compiler flags for C++ projects, and fixes the linker
arguments for both C and C++ to avoid the GNU_HASH qa failure

Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
---
 meta-oe/classes/meson.bbclass                  | 11 ++++++-----
 meta-oe/recipes-devtools/meson/meson_0.40.1.bb |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index d2ae626..2c48a7e 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -32,7 +32,8 @@ MESONOPTS = " --prefix ${prefix} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir}"
 
-MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
 
 MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
 MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
@@ -61,9 +62,9 @@ pkgconfig = 'pkg-config'
 
 [properties]
 c_args = [${@meson_array('MESON_C_ARGS', d)}]
-cpp_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
-c_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
-cpp_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
+c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
+cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
+cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
 
 [host_machine]
 system = '${BUILD_OS}'
@@ -74,7 +75,7 @@ endian = '${MESON_HOST_ENDIAN}'
 [target_machine]
 system = '${TARGET_OS}'
 cpu_family = '${TARGET_ARCH}'
-cpu = '${TARGET_ARCH}'
+cpu = '${TUNE_PKGARCH}'
 endian = '${MESON_TARGET_ENDIAN}'
 EOF
 }
diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index fd96b42..a2c5e4d 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = " \
     git://github.com/mesonbuild/meson.git \
-    file://native_bindir.patch \
 "
 
 SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
-- 
2.9.4


