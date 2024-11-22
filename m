Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E72BE65D22
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:11:43 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.16892.1732248702414064064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ij1lekZu;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6eebb54fc48so16440437b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248701; x=1732853501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xburQFCH/82Lo+vpoVBnYoxzV5H26ZWVQtdlTo8opJM=;
        b=ij1lekZuKCExBK2r+ow4UuohAxbgvamq+ykLux1BH2zU0PVFd1Twso4HDnYVnBcbB0
         MUx7yUd8k9grnkDk1bEnE0jh9dO+e9OwPYDEqx8bgvDSOb/VFJdPOFUhizVa4QiN31o/
         S61gh9MIdJZPC90nPSK9FD7dZYdLfkhIEagBIhvuwokebWYw+Ke7z20i12jLmb32Ube2
         HDJnM9qQIw7sK/gc8K0RnsLMGeW44aoMbvrc7d5+iM8hYIMqjVT/ZakE1hMB4NHYmJAA
         T0A7xXx0p6/2fS9BnAYEULFzh36CZMlYFfXq9AfWnk0WsFV7DNh3XYalhJwuuM1eRRZp
         44VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248701; x=1732853501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xburQFCH/82Lo+vpoVBnYoxzV5H26ZWVQtdlTo8opJM=;
        b=sm0vlh76IeYT3tvhLpcBAwFwxyQVSoi/NGc6TFt7gqTc0nZD/M/uC4JifGBAfzW2RV
         kZpFrG0wLiQ06Shh1z6oaKaKOxkG7hSufmcGiBCnR+SQ1yJ7PcBb7ET42+LMYOxTFhOC
         MAHY92/mc2dpZL4o1qqDBHUc3FQ/mevcvhGyD5lVY8+nlEdUMSBPql+hQ5spiBK65wMI
         q9Qz2OZOTyvOOO4gSv50czsOmb2VG8XfinFx0QmycDu6U+oXmaHIB4T8TdEbsJFJGkBk
         Tpq7JrUzwy8JyFawew+ho1YeWwjakiwi1bnrHGtmQKALzwusgL7cq93c2S/7+4v6TNh8
         JKeA==
X-Gm-Message-State: AOJu0YzKtcQnOTlodlTm33ypH/lAzn9/eFBv6WeBgUKEOTKkTMoLye6V
	uulzVDBgbfvN+GmydlpK5jcw8yhIAvLRImcj3mQ4nu5hfKsluaEGDkQHG9Ro
X-Gm-Gg: ASbGncvGb3Tcp8dzxo9nsvjmteMy1b0+1aIxZC8zGnbnEbGyrz1Y/zF2b6/1rdtIV9F
	cJfpX9LQB/z/gjvbu4MPG7h1C+6W5Y1LUq8cdsDoCheE9Hg79vXMKR6R7GaKUYn/wuqG2u8sZWv
	qMJGC7P7yNK98MX3WpgEY+rNzOct8Wl8VfK/hnQ76DEoyFSaZUVTP7H5+gq/C3nnTDtpUqJhcTt
	bl7tX8RcUaDknIrPGVOjIRjEk6XCkXZ/fxzAykYRgxM/kQyjbdKebla
X-Google-Smtp-Source: AGHT+IFc95RAx9XgysnTaDdAKN8j91a2+nAEB+0bxauyc7eiej7LrOysXeTXpdx8cUxH8h2x76d1JA==
X-Received: by 2002:a05:690c:450e:b0:6ee:781a:a29 with SMTP id 00721157ae682-6eee0a4b8e5mr22781257b3.35.1732248700862;
        Thu, 21 Nov 2024 20:11:40 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:11:40 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 3/7] libmozilla-ca-perl: Upgrade 20230807 -> 20230821
Date: Thu, 21 Nov 2024 23:10:40 -0500
Message-ID: <20241122041044.1111236-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122041044.1111236-1-schonm@gmail.com>
References: <20241122041044.1111236-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113983

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20230821

    Update from Mozilla repository to 2023-08-21
    Added certificates:
        Atos TrustedRoot Root CA ECC TLS 2021 sha256: b2fae53e14ccd7ab9212064701ae279c1d8988facb775fa8a008914e663988a8
        Atos TrustedRoot Root CA RSA TLS 2021 sha256: 81a9088ea59fb364c548a6f85559099b6f0405efbf18e5324ec9f457ba00112f
        SSL.com TLS ECC Root CA 2022 sha256: c32ffd9f46f936d16c3673990959434b9ad60aafbb9e7cf33654f144cc1ba143
        SSL.com TLS RSA Root CA 2022 sha256: 8faf7d2e2cb4709bb8e0b33666bf75a5dd45b5de480f8ea8d4bfe6bebc17f2ed
        Sectigo Public Server Authentication Root E46 sha256: c90f26f0fb1b4018b22227519b5ca2b53e2ca5b3be5cf18efe1bef47380c5383
        Sectigo Public Server Authentication Root R46 sha256: 7bb647a62aeeac88bf257aa522d01ffea395e0ab45c73f93f65654ec38f25a06
    Removed certificates:
        E-Tugra Global Root CA ECC v3 sha256: 873f4685fa7f563625252e6d36bcd7f16fc24951f264e47e1b954f4908cdca13
        E-Tugra Global Root CA RSA v3 sha256: ef66b0b10a3cdb9f2e3648c76bd2af18ead2bfe6f117655e28c4060da1a3f4c2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20230807.bb => libmozilla-ca-perl_20230821.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20230807.bb => libmozilla-ca-perl_20230821.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230807.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230821.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230807.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230821.bb
index 9e8a27e8f..27096c060 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230807.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230821.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "cac569d2f73337e6314c0a73fc12f4f6648b7fb3941b2e82623df8e1573b69aa"
+SRC_URI[sha256sum] = "32e1d0045299004045b9c4d16c2daae453a216208873deea2440f71260a7cda1"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


