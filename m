Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48682E6ADE4
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:27:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88051.1766435262245026382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JabYKo7t;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430fbb6012bso3406176f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 12:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766435261; x=1767040061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhFd1O+TbFXDzPw4lMNjnINQxvzZOTzrLFLiq4pdS7A=;
        b=JabYKo7tmkLDNDNdYUrHT5EYjTCe7J2bryyxp9+NSu08eJ6VbPM7u3lhvsT5GLqZio
         KXQ5Eh/DDExOl7QO7vqqC9L1Ox9uW64+CIgb39gA90T+YXhfsgA5g8fndaA5L8KR6vGL
         osI4ySReet/Z3sBvEAwxqiz6py017zu8o7muOShxRDQoTZDdf2+CwbCte3HZ8WgBfp1o
         EReU79SjIIX6bKELexlRxLmS8YTT99HeSvSfwjiCBKGuPKKp9cnUcjaOCcZHtfLBxPqs
         wGSalg9l5HcVkQu05BFF+kUvYP9lZTYXTZmITUYshtJO6aX7zInsCpWMQBjXUVqrwq6Z
         R0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435261; x=1767040061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zhFd1O+TbFXDzPw4lMNjnINQxvzZOTzrLFLiq4pdS7A=;
        b=glkxpNCoSagmo3w0lqt6urMU4rHae//fVKSHoEkEpUMvb2xlvmVMQNR7jNq+YNf2HU
         FiYoqlOMZwXpEOYEOKHZvmOcvuciyyxnmFfGCHzPSMd4piaLARzeU8YkrgGPMuj+nPYc
         elnk8cTVjXPVAAdeOLx0Nrp2IcBMb9q/+3r9NAU4MIdZ6cQKy8ddNGYFoWFlmcAi6Qof
         c2oPveSZFxScZjstjj9Q8NL/e1vCPjoWX/X+Sup9OtQkkoCmAncZ//cOPAshSDdXvZXG
         br0+buhCxM+3gMLkFkVBX1+GInXy1Zr3+pfXhKb8Zh1w0rOEinXe2LYLFRBhZ5luugFO
         jy7g==
X-Gm-Message-State: AOJu0YzADgqVHvLLJBB0sOO7rTmjLgcEh9Kev4TjyfItOr0uEXt77hkb
	liwwCUoMCvjvw8NWnxn5MDGPvhnqpWnezP4h9m/0IXDIiWUPSkJRlx6/QfHUYQ==
X-Gm-Gg: AY/fxX4GjbkJpw0194KjtQ521SRgkCqwGoqhOUFYn/DIJdoKgNN3C+FmHKSFXMsVwMy
	LdzYiiaWjfJWwmFg14SIu0UzGnX2ij4z9Sbg8MGlQVzMkftKmqJRgPxy11bqNAvEt2ntu4pDwQt
	Jeu8gpTi9JLuIYgA5ZB8HGMfCCqnxpJvZ1Xe9OGxRI6TjPytvoR/NLsORbYfj22RDj5bqGv2pD9
	Yxu22BbmSSTzBbgES3QIeBUjYMLNJyKetb3a6CFQg1lB4pRCQh31TaMwZ2mPY2ubUdNLwIVEPCW
	EEDCBdTgJ8WUz75ydJAUWM+ocxO+EVdHhB4ioM55JNDccb/CfLOv6eIELK3yk5hjq31JekP61P3
	SZb7QzRsJzXhjjjlUIHvbuRYQOx5saMhMBXHY/Ug2gSdHC+2LgjP/zIFMoukepZ+wHU3q44kTup
	1bq0pKXr1/
X-Google-Smtp-Source: AGHT+IGHA7A9/2g5Tfm5W+mKCYP126zPuN12pqNgztdz90qbHyS1cz5c3D599l0EkSuiEq2Pn+015Q==
X-Received: by 2002:a05:6000:2902:b0:430:f3ab:56af with SMTP id ffacd0b85a97d-4324e5104d2mr13647069f8f.48.1766435260533;
        Mon, 22 Dec 2025 12:27:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm24204522f8f.38.2025.12.22.12.27.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:27:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/5] postgresql: upgrade 16.10 -> 16.11
Date: Mon, 22 Dec 2025 21:27:31 +0100
Message-ID: <20251222202732.3363914-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222202732.3363914-1-skandigraun@gmail.com>
References: <20251222202732.3363914-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 20:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122810

This is a bugfix release.
Contains fixes for CVE-2025-12817 and CVE-2025-12818.

Changelog: https://www.postgresql.org/docs/16/release-16-11.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_16.10.bb => postgresql_16.11.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.10.bb => postgresql_16.11.bb} (66%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 7707d238e7..f5ee9a2e2b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 4f25567..b6b1eff 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.11], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
similarity index 66%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
index b1b8411dc7..11c830c820 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "de8485f4ce9c32e3ddfeef0b7c261eed1cecb54c9bcd170e437ff454cb292b42"
+SRC_URI[sha256sum] = "6deb08c23d03d77d8f8bd1c14049eeef64aef8968fd8891df2dfc0b42f178eac"
 
-CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
+CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."

