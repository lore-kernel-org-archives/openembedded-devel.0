Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3699CD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 23:27:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7261.1765236467800857741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 15:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfoZYc9d;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298144fb9bcso51515535ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 15:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765236467; x=1765841267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqfeHfXidlSAI2rUbts9k3fEh7qJwVG1DBpp5FdRU0c=;
        b=BfoZYc9dm6Kr58XlGEczOMuf/RuO83Jbe7wIajt/rm8dcuhP2MtslhOxB95RIswBJG
         bxY/iIiqvjo8fPahRfh9LxvjX6nSjRVsUh/X9q/0tLxzpxJ4Upb/FabixAnaGVm330r0
         kJl548HKOKMOrjYr+oddzEjIzp7GgmfXczX7j9dIyRZdWlvhPaYq4xWRW2PpADhg+ONv
         oG2W+eKwgT+TIY8ra/BvAYAcE2VI7QxBpjMeYEwnCshpTiT5+ZfbG15wwgsY10ocP83m
         +v+DN7noALpGOtabpedHDkzIuNsj8dXIuff6xRaRkcXmY081vgOx1HcirHNfLef9ka/8
         yAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765236467; x=1765841267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqfeHfXidlSAI2rUbts9k3fEh7qJwVG1DBpp5FdRU0c=;
        b=JupNsFn3FyIRNRY8jb++KfmUrXVeuBnNguuAMqwkMib3JvNlwIlRNGB2KBXjyrtqVC
         8rM/zpPaycJHg+15XupswBhZsU15kgYiSh3QnplTG45oGGZAF2B+5AjXdtT4CWJ+pD1u
         +e8TjI7o99guhKB8z/FwbgAkxwXbOGdWwjdf058UcVyj66v1WpfLI/sMXKD2nS7TB0Qk
         snZM9tG+HI1G6OGI9keCU8FYqizTr7wNd2DEWjNMTL+yC/HQKuh1K35apwgpC79+MX3P
         JUReXmnb42ZPBsC1oyx/vAb/MS4y0h30alTdW2aniMH6sEKOwPKNq1yOYjqQFkLOCUpS
         xwew==
X-Gm-Message-State: AOJu0Yz9zEsHR23qLzRZ0rup4Fwt+gvnB3ndP8f+BlTfgD9rtrdjH7PQ
	aq+rnVOxI8Ot9tiZ782HHEgGpolsSxdriMFHcoWCKg9KObPgOs1v04Cw+ZUhYK+7Zv8=
X-Gm-Gg: ASbGncsfp469RbQgALkNokQWNhGjh9d37KSsv7fay5hzRWuZXLEW8PmjaL82j2qBjM4
	98MYQgqL5ZggshrwWU0aQiz2/wl6nvPDHAKbdvbK1repdVW1T5ORF0YRM2ldvwDFju/h2oPilOt
	zisTiaJYdo1HnlDVhFqpr7ZsLn2pYUOSB6OugHkWeWEWXGuNFkk/Rb6ai5I1YWbMmEkfyzcEZ7g
	qLPyO1ExbVNk7k0ckMcqnn3JOyCKdZgjtLWAjTf1LcBb6JzK8DMs4n/HUUWw7QgVvZQxJ4xxzaw
	zNecqzYjolsPQoAGD01NLLabP9DLjxNY+A4X6ep0TOMFqoKedXoS1FofqMckKpMY5SqfTA3BzVZ
	zLxZGxhlXICIex99bVU4eTcKrsmY95GYA1DvAHAIcS6DnAIDmne+5ISp3Zm4jrBRsfahCPZ3uYR
	iWKnRFh5WWotLG6NdvXYf09I4bo6CLQQK9vJaX7UB/mRX4h8SF1JvwIgWrA2WiyIQxH3fqBFuWT
	eDCoEjkWmrbunQnui/NtYKjjclyrD+O
X-Google-Smtp-Source: AGHT+IHYieVdcbRdkawjNhh3B/ltN/MzQyOuy+rzqq9lpdisaEEcANb0KYVBEynuT7CLNac0TXrgoQ==
X-Received: by 2002:a05:7022:f89:b0:11b:95fe:bedf with SMTP id a92af1059eb24-11e032aa331mr5738744c88.27.1765236466647;
        Mon, 08 Dec 2025 15:27:46 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552defsm62291904c88.2.2025.12.08.15.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 15:27:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Provide cached value for sendmail program
Date: Mon,  8 Dec 2025 15:27:44 -0800
Message-ID: <20251208232744.1944383-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 23:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122391

Left to its own volition, configure goes on a hunt in
usual paths in /usr which means it pokes at build system
for sendmail existence. This could also be under different
paths e.g. /usr/lib or /usr/sbin depending upong build distro

The paths where sendmail will be installed on target is
usual paths e.g. /bin or /usr/bin on OE, which are added
to program search paths anyway.

This fixes reproducibility issues, since this string gets
its way into the PHP binaries.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.0.bb b/meta-oe/recipes-devtools/php/php_8.5.0.bb
index 412ffd9f06..6db7ee7c82 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.0.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.0.bb
@@ -72,6 +72,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
                 ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
+                ac_cv_path_PROG_SENDMAIL=sendmail \
                 ${COMMON_EXTRA_OECONF} \
 "


