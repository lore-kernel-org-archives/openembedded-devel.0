Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ADCD29C59
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:45:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41826.1768848306184944825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hkRZHqc0;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4327555464cso2345247f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768848304; x=1769453104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=39E+q3dexHMqqiOZ5Zdqmj8Rh4QuuBcB3GwaiCdxkk0=;
        b=hkRZHqc0uFV0qybcFbxNpiN+8RaEUxWp6wro8UZPQy3H66tSZwqHWt0Vmny+DDDOcj
         bw/pcJ6s6T5MKG+jKly0atn49wuE014ixWUQl8a/aXAOmXQZ1TbB3uZIWGpkO1MuIe6B
         r8ttmbT1x4YSVjWeP6QibKNsDEbHfVsWsbLNRF11T2BNi251llTOkCdSiBOX2wSIuHzx
         LHn+ISFg27wWKcPux8nco/G144uisj2ORYfgDaVGHVlB23FrxR2vsq4B+Y+fpi6Hzjap
         MpW+Cm3XbgcMDABpqXWsUrorGDhb/RMYI+qRhGdhYMffbfAmiQyTprR5es3k7qQEkK7Y
         wMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768848304; x=1769453104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39E+q3dexHMqqiOZ5Zdqmj8Rh4QuuBcB3GwaiCdxkk0=;
        b=POjVaIvkFEKMRvMvu5UFbpZ/x9e4yWOLLaBP+EQFVVBO4PgvqeJeQXLoV+5oqsZAtc
         JXc6djmD9IBv5Yhvaz08VwUh2jsRDVg1rXuNj0xOBw+zSL4XITUs5tBwweS7kTjHN2Bh
         nqyAivKvQhlmkPe+R8bLrp8IHZ6UZF2a5Eo/N29UI/1KnGn0s8Yjqgac4C/GuahygyNL
         oxionOTTZF4AUTgt15y7CDPJqwRT0peA06wfWriGpB6fNcqZYkXDjbNEILM/UaKHFJVO
         p6/4VSPtEpnXjlO4/5UWD/vRAbB+iT+B/PgwSdUeXupZfS5Euk+RUttbh2hw8MHT5j3f
         usfQ==
X-Gm-Message-State: AOJu0YzIWbc7WJyb+tg5TRYTUEdouSAI6hB441mkZw6nD8fS1bmJAtyS
	RIq9p/4zaO97Jq5a4pDpYUEoMjTsq0W5jk77r8unz5FX5Oxoo+JRrbomQAcWEw==
X-Gm-Gg: AZuq6aKkV/ccw7tvEhOzmPq8XULi7CIEjT+qKAqtCA53Ca8QAoIL608goUh0VXvKpoI
	MDE9UENXV7Lnc71etizvu+jxoqEahWgjZ+YxRMEJYTDjAJEwQB3HwTVBScfXzQOXrvDBFfe/Y2l
	6jShO30fgjBggyqX2GELcTQ56ZP4bTC7HYCJz0B7p7yuQtnM5qByIrLn4OzbMLp77XBsu9PIxwq
	nmmS/+8J4ti6O/S67R68hPU5XQTMLNbuSKaa94+QEbqyOTXCXc3/LktX6dhBuH109zWYL87Jruj
	jJ4ZiOZjP98HL+YM45q1MPThfNgfCrW5PGiG88KyJRMcHSQddHKTvk6Aje7A16epCm7+T70ZcIb
	XSovCpMEiotS3EGDjGWGPCcvBfvmy1JY1Udh6JQfNjdmiQiDRBLZBbMEWvJ+y5mCMH2B6ZSaBem
	C7OT2x3xlT
X-Received: by 2002:a5d:5583:0:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-4358ad80b92mr972040f8f.46.1768848304479;
        Mon, 19 Jan 2026 10:45:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm22365714f8f.30.2026.01.19.10.45.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:45:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] boinc-client: mark CVE-2013-2018 patched
Date: Mon, 19 Jan 2026 19:45:01 +0100
Message-ID: <20260119184502.785819-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 18:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123649

Details: https://nvd.nist.gov/vuln/detail/CVE-2013-2018

According to oss-security email[1], version 7.0.45 included
the fixes[2][3][4]

[1]: https://www.openwall.com/lists/oss-security/2013/04/29/11
[2]: https://github.com/BOINC/boinc/commit/6e205de096da83b12ffb2f0183b43e51261eb0c4
[3]: https://github.com/BOINC/boinc/commit/e8d6c33fe158129a5616e18eb84a7a9d44aca15f
[4]: https://github.com/BOINC/boinc/commit/ce3110489bc139b8218252ba1cb0862d69f72ae3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2a78ad8813845677132ad0f1552fcaa4961c3e15)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index 8f85a508e7..098a6796e3 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -31,6 +31,10 @@ DEPENDS = "curl \
 "
 SRCREV = "b49adfb118211e11c719766c0d71e7bdfe7f3363"
 BRANCH = "client_release/7/7.18"
+
+# fixed-version: fixed in version 7.0.45 and later"
+CVE_CHECK_IGNORE += "CVE-2013-2018"
+
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://gtk-configure.patch \

