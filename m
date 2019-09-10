Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 40E697E265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 07:45:30 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id n190so9369315pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 00:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TEkLlXeAw4sdoUXUhZBvPM32I9b2q1uJ0KNUxu5qAUE=;
	b=po++7iuWeaEKu9zzzqwwBLj7FMdK/MGAGiSxMJ6L2msiFO8Va/9BzjaCC1XOkiejPE
	9WZwCZ1xFN/AyKOujI9RS2XVPlHATdbAxzdzBskqEy4may6hMUcb9z4KBpM03888M4op
	5EANM15OcnfiZRN/VRpXPf1lr7nZwStUvfbCCUz1zSgz4JONPbDfd6f3SCDEEi9pwcI0
	gQiUTDYMbyisgHtYlE4VWjHnruWRsvfe/uM+7uG7BixDiXMABw267OA0W0VlIzWzc307
	ltGd0/lD/CqEHlQ3nmzGVnehGH4tZ2X05knDaXTzrDDSJX+/1naV+wwSlfMSCeodaijh
	bZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TEkLlXeAw4sdoUXUhZBvPM32I9b2q1uJ0KNUxu5qAUE=;
	b=Z+BKsPI5Bhy8wQbA1c2wjxogS5TczyfwtUrf1v/aHIh3FmZcYVSyPyjvdmI4SFbsMe
	cKAQQHcWQfnBu3EdxAJMZPndC+ACPsMOcBdJGckwVqZHvnNWjK+rlwQwVtvyy2Ej/RnP
	CEPVEAlwTs+eY5aOQYKKd4hHVVlmuuwhNygSlmytTe9GmNxSU4fSeWvfjM5+Dx68DVkz
	jo330ybp2bN/00W0/3TsnoSEMniRQJaFSSU4rR4D5fQw9vB8bXMsqNdXblb26K1zqZ15
	N/xavclkL/uuXS1emgI7gr0gmIiTrRdaZbgwjKT6K6J/jaDQkWvnhwLg1Ta2GxcXqKaE
	UbKA==
X-Gm-Message-State: APjAAAUKbZ0bX10vEb2xpoPtfQO9rjwskNlKpF9JLCMRGe5+RW1BtUD0
	eaKkr/3f6AgrSJ9T7wD+FQPYVixZQUE=
X-Google-Smtp-Source: APXvYqyu1/CZN81ymzSpRcRg1Pe5YxVXOOj4T/LNWPHhV11Kl1ZIUeTcUxbIRRRET8DkLjAz4nQvng==
X-Received: by 2002:a62:2ec7:: with SMTP id u190mr6706872pfu.121.1568101530487;
	Tue, 10 Sep 2019 00:45:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	n9sm18412114pfa.154.2019.09.10.00.45.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 00:45:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 00:45:20 -0700
Message-Id: <20190910074520.4022797-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php: Turn PCRE JIT off for riscv
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
X-List-Received-Date: Tue, 10 Sep 2019 07:45:30 -0000
Content-Transfer-Encoding: 8bit

Its not yet supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index d738d2d93f..23380da2cb 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -56,6 +56,9 @@ EXTRA_OECONF = "--enable-mbstring \
                 ${COMMON_EXTRA_OECONF} \
 "
 
+EXTRA_OECONF_append_riscv64 = " --with-pcre-jit=no"
+EXTRA_OECONF_append_riscv32 = " --with-pcre-jit=no"
+
 CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
 
 EXTRA_OECONF_class-native = " \
-- 
2.23.0


