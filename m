Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880A6C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27819.1786651822291852105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fzLyvrsz;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8485ef63b68so241518b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651822; x=1787256622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcE2kbuSJqzxlPe5zKUKwnhg3GdDJVVs73f63pT0uvM=;
        b=fzLyvrsz44uoFbObR0vaCcNk+3F1sHwk3L7//SP3F5fdHhDhbgEJsoiFHPGNC/K3fC
         RhKF79866il6Zu+FlWoKLrZcd8JAqq3YqMiTsH8GLAHhV56OxXNql4B3HxgbzAkIMCoN
         cJqE0AYA7onJQhXeBvw6mM6ukeC3PJaCfAuxkKVOx/3TF0ztMp6AiUYYDPuysJ/TOx6X
         dmQumPh3oW2ZOkL+t8O9SmiC7e8rFN73UtdzjeF8GV5yqbrQ5ltbPK2atIfzdGUXDTFJ
         SrqpaQUarn3SEaYSN+3/+X/H5154Id//J/Gl7K6ACk2MywwnHmbSffNTKkYECbvy/8GZ
         701Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651822; x=1787256622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PcE2kbuSJqzxlPe5zKUKwnhg3GdDJVVs73f63pT0uvM=;
        b=OY2raYcAbIGxL8RI1jQb0WgYYVVfl/1P0E9rUG/u6HyyTJG05KEyWw/IKG0E6a5PRL
         JB3bnjDBK8VmbLctvrbiaRLJJj5GDGPvPi6rIcKIlrdkBpivkOpqqL4YTZLzKMSQpz1t
         cCixtPZZJem2wNRWkNS0upsO1A4BtxXhddpJVux05grbAr/UqwI3OM8MO1IBcpblNXWM
         NoXg+W03QJ56Oeo//PP7/t5FhEa2jbUWWTJCEUC9aAaYi3s4c4M9HQyhvWbteD+BUIDe
         a5zwZHWamzoYdA7I+zGHvvmZlOeNyDXb04mP2OxUchoxVer1/4av6dfRPtCv816LEw+v
         L67g==
X-Gm-Message-State: AOJu0YwHyTm2KaaJKJiiEy1az0Xai5iMbWeWRcTJBGviu5ucawOOoX8J
	2fCUk9tPynNiIwwTho48/e3o5ReKWscEWU7EUG7ZTdBCfjcyavqy9Oc+Swbk1eci
X-Gm-Gg: AR+sD10RXm8NtKV9mUSMqpyMO03fKDA4jCRrAC4BXGKzIlafz9XVPQzvhIOHTfXPfsn
	FxzNH+OOTr8C1zHZ4Tu6AtSP4YU6rCmoFpzQ+dK2avCh5JkGaS06ylv6HklxbxxLNkYYPK1MgqG
	NLchF7In7yyB6dg7kpfz1NbGAOF9A9iRdWnVMXRj9XsCdZbJaPSacVU16xbK/IFcHgavMQ+KISR
	qhroocZPWKXX6L5CHXr7OXg0WhR0PWhf3pIQeCWQD5gSjhTYQ4CGk62YYd2JNKXowg3MzmS7fw7
	wgu0Ymr1adiPIhol21qM/piQMfhjQRqBM6q/FROBaI41yP6kvt17Un7HiuaxOS7sR3hngBQJr0D
	nYDSKYjgQ0wkW2ESbm3GaaCXAHDx1QeFOLZlmHVkK0Zd3jzdgMZYybWTVqyI1UVs3aZUFHDHOvQ
	SpFlGjPsjFCgjrRBVnVEidXEOnJBQsno0i9tps8jOkqgQRBa1wdyu9mBqcsbq3U0gANUGgRGqUm
	G7eCGy/IZ4eC9ZCTidXNayynmctrAyQB5JpM8nQtUYgLWqt6osaYE9cAfMj6tz89kh/yEGVwyI8
	bo4zm53sG6UuLrpzPG8tpsg/Tojv1Oz7V9WWP/bswLMr81rh/I4B6Tvk9vM2N+N+6/fUiwrPrMU
	wpYMvSXqpj4/peRSzl5WniOqig3U7ZpAjW27KWQMpFgQDVA==
X-Received: by 2002:a05:6a20:cf82:b0:3cc:1dcc:b079 with SMTP id adf61e73a8af0-3cc71ccfba1mr376449637.19.1786651821498;
        Thu, 13 Aug 2026 13:10:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 57/80] python3-pyrad: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:11 -0700
Message-ID: <20260813200834.1302829-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129001

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
index 96cadcbf43..d4d061540a 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "e039c48a026c988d49276bd7c75795f55e0e4c2788f7ddf09419ce0e19
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += " \
     python3-crypt \
     python3-io \

