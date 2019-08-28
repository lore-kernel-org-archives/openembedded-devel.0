Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id EF1AA7ECBE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 14:16:18 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id bj8so56066plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OCgeCQBGJDtCZ2sdONfUK3QPgvHwunrmkoILev74YJE=;
	b=XDUF7wL7yLSgSjvKXGgceSTW3LUZ0U8O1E5wNX2j4Jwu0MjfkqgyRhKTt1ycF3xlxL
	NA+G/HwDd6lGoP9PRvPwbIV3rvE/NUQymlVf0eQ5qv4Agr8k/pAn4RS54IqY3MyZBRGi
	0ms/Pxo8MRkHPmrqaLmw7ZJ1HwpMKI/RyVk3jX8J9DNsv6dFpuQTq70IF025/O861jvE
	aX4EaFv7Vo3PxlWGfuHQqS/LlOuhNYncarAR2H87kaWddPXvvKA0fepJtTTOYM7EO61U
	tjF0hF6POFGDvW6VWq9WCAjI2J6nGCugUItwO2hu4+3v5xuCsdVYIm4pDinqUvuLbo87
	UcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OCgeCQBGJDtCZ2sdONfUK3QPgvHwunrmkoILev74YJE=;
	b=Q916COX3XxN8VEMCgA1ZLfclkn3YQrfGdMu3gBEI9Rs2TYYMAS+IIZEH0yrcDb8lbG
	5hqyxnFyzoYhfx2yNMUBekxG5ZcxsvCQDo+UDhEyXs6hDxLY14eO//h3U3dCTaCLqe4V
	xWCGEHmxJNxKiaGrUWue2WeT18RqfBC6x6BMlFpL9aKoEQuj0HnXN9LbHNuNs61su/H3
	v5W5mUvfG0fYYvG1xE50ptTuF+WOxLfdwKZVU+4bB7fu91H1R5TGRMfDJ9jhRTQ62FWK
	NlxvYrNtg4pYGrF5D0zowOsM83VPosXiiovXhoGWWeMcsBH4enm5SEztLvBc2y3lu9bE
	SLyw==
X-Gm-Message-State: APjAAAU8irhse1eTxcb7Ie43ow+AidAbUr0CpaytUbKVtGEog6AVgsQR
	fpuLuBCNeq0Pv2tllCFCxPx8cQUrELs=
X-Google-Smtp-Source: APXvYqz+JA3AkcOdUs7ivV1xh72soQmL5now7eXP2XH5/7qf/LUZY66MRjMAJtrUsgdouvXeAVVdcg==
X-Received: by 2002:a17:902:598b:: with SMTP id
	p11mr3339319pli.96.1567001779286; 
	Wed, 28 Aug 2019 07:16:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d189sm4197428pfd.165.2019.08.28.07.16.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 07:16:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 07:16:10 -0700
Message-Id: <20190828141610.9991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] libgpiod: nherit python3native unconditionally
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
X-List-Received-Date: Wed, 28 Aug 2019 14:16:19 -0000
Content-Transfer-Encoding: 8bit

this recipe inherits python3native class conditionally, this condition
depends on a given packageconfig, however inherit ${VAR} syntax requires
VAR to be evaluated before inheriting it, therefore if someone appends
python3 to packageconfig via a bbappend, then the packageconfig will
become effective and add --enable-bindings-python to configure but
inherit wont evaluate correctly since the expression adding to
packageconfig

PACKAGECONFIG_append = " python3"

will be coming _after_ the inherit, and the builds will fail e.g.

| ../../../libgpiod-1.3/bindings/python/gpiodmodule.c:8:10: fatal error: Python.h: No such file or directory
|  #include <Python.h>

This will still mean that python3native is always inherited but the
effective configure option will be --disable-bindings-python and that
will do the right thing

See. https://github.com/openembedded/meta-openembedded/issues/140

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Inherit python3native unconditionally

 meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
index 756b143ef7..d559028989 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
@@ -12,7 +12,8 @@ PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
 
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
+
+inherit python3native
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.23.0


