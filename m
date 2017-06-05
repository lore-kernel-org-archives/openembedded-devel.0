Return-Path: <acfoltzer@galois.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id F2ED3780D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 17:23:46 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 83so28318227pfr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6BXMdMXagPZCSGO4wTCT3FW31k7RTLlajJj8+F+6AMc=;
	b=lBzltPqqS/bK4l+UX2JvN6LEHLSxph9nF5KYuutfODfo0GMWvjVPXAoXDOCfumNMPe
	E9d5FUuYhCjuvMmPPwQmvmweNHTJ/LHRMnVmNeCB+OdHFIOOoAYAfLp+CqoNH6IJtxuF
	ZlU65E2NgwP+cV40r2jPgM+C4vAUeOKuJIDl05qhtxOgFWFWD/emKls6VOWgEgTR/wSg
	7lVJyTk7/xgTJCOWfBDMtvqiYNDi8L252lpU6K9cKtgzosqWdKiji0suzUs0LQriFEZR
	9ZJChjbd0F0lKmgblt0uiDbT+rhfaNBUB2KrxF2A17iF4xRLsi9Mm/41iybZCFKBbJbf
	+6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6BXMdMXagPZCSGO4wTCT3FW31k7RTLlajJj8+F+6AMc=;
	b=hh/H2FZzOpQgQTjtvpmMtyKAx4oK0OATMO3imliL4AlONsmGTOoRi44dpVL37w5Khr
	kiraPvXfzhR0FVIGQ1YI8dAvIABlejRc9WOT7ovD0NVgvy4DhY22aPd7Uyu5qGFvCe3T
	YQMop6LH3whDG99DqHxIs4rhvYMAPBLcr5GkxTtz3IHviOF3Q47WxREU+cGoQO5aozRO
	ElTYrAIeUWIwSA2Vl9GEzu97PkrP9oeSCOOErpoIUFY1N9z7G8kglksMt4mO0lnnQEI0
	5XEAPP2g8u78u/Obo2bfgo5Kut9pmIn9rhhCAP11yPIC41NHNYTciejb+ehQ1ypjsU4p
	f71w==
X-Gm-Message-State: AODbwcASLQahNcjwD3wWEJBzFhysI6neyoxe0MrKBnkWsyxFrOUFpLJv
	ji3wFEi46IsKYv+WJCxTyA==
X-Received: by 10.84.229.70 with SMTP id d6mr16283502pln.263.1496683427862;
	Mon, 05 Jun 2017 10:23:47 -0700 (PDT)
Received: from svarog.galois.com ([2001:428:6002:405:8055:63c1:97d2:1da1])
	by smtp.gmail.com with ESMTPSA id
	71sm35220907pgd.57.2017.06.05.10.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jun 2017 10:23:47 -0700 (PDT)
From: "Adam C. Foltzer" <acfoltzer@galois.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jun 2017 10:23:21 -0700
Message-Id: <20170605172321.12557-3-acfoltzer@galois.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170605172321.12557-1-acfoltzer@galois.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
Subject: [meta-oe][PATCH 3/3] meson: add LDFLAGS to bbclass C/C++ link arguments
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
X-List-Received-Date: Mon, 05 Jun 2017 17:23:47 -0000

This adds compiler flags for C++ projects, and fixes the linker
arguments for both C and C++ to avoid the GNU_HASH qa failure

Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
---
 meta-oe/classes/meson.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index d2ae626..11c8d34 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -32,7 +32,8 @@ MESONOPTS = " --prefix ${prefix} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir}"
 
-MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_LINK_ARGS = "${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
 
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
-- 
2.9.4


