Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D63C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:21:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.16790.1739521271365793661
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRTZ8nQe;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso1441147f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 00:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739521270; x=1740126070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPWmz8YHxBn9qANz45xmdS1S4TKN0VCNzl58kGZwx8c=;
        b=BRTZ8nQeY0cKFvcjz47tsFHX6/VIEioyq8g+nXzPPH7fVJNQU9poRr3P5noWgzkYiH
         tPcKvvE6L1ZXCfleLvM1aCpW5fEucTSj5uaFfKW78CHdgoTwhNyPg9xDzuTx/vWxziS9
         17HejI+tF9UIJahps2WrgEb5Z0gInHQ/08aVNljL88wlQIHJUs/5v7+YWyzzPxSVexZ1
         qGH7kWBqz/gQAR+ptQvEiyShjXL60+/TIfl1HAkffL1Chd9ch6eqrhtP6ZSSxHN1S+CY
         nQVOTKGDX0SQKRXa96uyJmo9AP41QqYZfaULW+tHgxz1aldew9JCsInGFmp5crf2UPGA
         C3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739521270; x=1740126070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPWmz8YHxBn9qANz45xmdS1S4TKN0VCNzl58kGZwx8c=;
        b=ts4t1qX/Pj+viFEE9h7eBJE8QHi+33u1Nsc21ZwoDjqYB/uvS6n27s8T9FMl3SoHvx
         4Wo0b4uOMNFN01UkfL8CBU4w7KoA2kIZqDgHmOyl5IoYyZJr+zIq5JZQSBFLUwPvDuhT
         rQq0+hh4a5W9nWckMWDFtnUYJ5c4eTDwyyj5l3L0TmDTpQCUCIKgUb1RjLQGUR0TbA34
         Z/Ze3/OPaecdx00f4Iye9eTGJVOGAbIxPvSXCKPePvAEcWQ7HMOzKzwSavKL7gDcEhCF
         ohBrGNKXxqBU51fADCk4nHzdaesVEn5lt9LQ556IPJRYJg3Te2peCuFPvTTe7Q/pVlx+
         +xSQ==
X-Gm-Message-State: AOJu0YzFXwqKbw/CsHSTdMDF+/b+ryTvKfyNgDhXnmo6EbO5PoJ8lta+
	X7odV+me/1HmaG0AtpdQfwkb20Oz1M/85pvgLjhzaEyFXVJcK73+MS+0Jw==
X-Gm-Gg: ASbGnctw5gVBYmBu+ntuU8+Hu50JiIdh4AA0XDmJw1Poet/uPP8nBqfaLnFf+Dm9h2c
	WqF+jPzyVPKlXEa0UMdWvzZ5gu/GT2PTvOirlSvDZUmZl5p0RmfajV14/nUEZccZsdeBtlLTFPp
	EEjMWpsd/b2z9zV7O3X34gVKiuh9LnejK7hOt0NAFWYXKWf2lpIQKPnaWKIYUP9g2CFzy3oDQg9
	nFoWMv0Haymn2uauvBC8kpBgjhBIdX7NpDemokcDn6rMxdpYZM+2mlxTvHRdxKqk9wPl3GVTpSj
	2Khnlph9RDtA9Gqzk+8soEFnu13qEkI=
X-Google-Smtp-Source: AGHT+IHGMKtOJsyg+cdubYZ8fXeI6bV8M6vLbA6RSFGMCmSJ61XdmD9VxdaRZdF7Mh3UBcl9Fn9eyQ==
X-Received: by 2002:a05:6000:1f81:b0:38d:cab2:921a with SMTP id ffacd0b85a97d-38f244d9f9emr7625566f8f.1.1739521269403;
        Fri, 14 Feb 2025 00:21:09 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcc45sm3999129f8f.33.2025.02.14.00.21.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:21:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ltrace: fix unwind PACKAGECONFIG
Date: Fri, 14 Feb 2025 09:21:07 +0100
Message-ID: <20250214082107.1158848-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115476

In case unwind PACKAGECONFIG is enabled, do_configure task
fails with the following error message:

| configure: error: Cannot enable both --with-libunwind and --with-elfutils

To avoid this error, disable elfutils with this PACKAGECONFIG.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index a3ddf2a76b..58cfcb2f06 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -36,7 +36,7 @@ S = "${WORKDIR}/git"
 inherit autotools
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[unwind] = "--with-libunwind --without-elfutils,--without-libunwind,libunwind"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
 COMPATIBLE_HOST:riscv64 = "null"

