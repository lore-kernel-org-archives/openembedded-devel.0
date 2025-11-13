Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB332CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17884.1763014804282947499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HoKD2wSZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so366012b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014803; x=1763619603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNhsOJcURz60tr1zEYkQlFElcTo/gkYV6OMc9s4noM8=;
        b=HoKD2wSZuMomChbmhgJ481g0gLziGYE8gUQaX1AXPn60H86qnjRe7VWpPZ4f2HGxcG
         jteEQVoDl51qQFgzVx8i9BSIUukLq7tr9AoNCDfQor92z3EYqU7jRbstCaZvgjJmbKJr
         8waH+ZB2Ng6cCw5AKR8lIf1I4l/BfZJ0rgWP5HOFyPmG+MckNyKttHL48GohVpk9xc0D
         L/Y3e0xghObeKNMurlJcufk4RnIPdt8XHmiMsl5v2pIt+b366gnORHVvDcIUCAgKpcyD
         gDTWxV+9VJHyjLZiySsUXbqCvy30xa73+AYLvs33JXsDxbnxMAv0180FIE1+ndG+IcjT
         33HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014803; x=1763619603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VNhsOJcURz60tr1zEYkQlFElcTo/gkYV6OMc9s4noM8=;
        b=KfpP+fk0QYm4i72THP5uCgD0p8IThMZBVUgYTAyGCPppicCoWrn6jDHtRUW/4++C1p
         QBTINM629zU1XQMZZ+G6smun/w2pj5/i8KQ6ipbUpAQbewA3mAfCfVoD3KBz6LpF7cWv
         vCETAU5VLQaBwoxvaFrm39wlHYpfqz5bAhAweFWyRCmLmzgTPURGF+cKSMFS0BGffa4t
         DZRnboNMO3gLLC55ciAUt/lzn2ZSOws4EO7fwXs6nMtcW23iujOAsm4igePl5L85mIv1
         PaDNs4h4CvvLO8jiAyCNhgiDkVmR9H5mW77DA3rp7+HRtK+B7zx5hhlCpFYNKGUr6IHk
         NCsA==
X-Gm-Message-State: AOJu0Yx34vOvmTuQYUxIN3Q/o97l11JiP8oJVLvQRCGeKjA4sW55AAnE
	8wzPSI7Jmu1KU+qKiapkxOVQSK8oU1dph+V16hNoQ101VyPMtBQQ9opkxbX3dw==
X-Gm-Gg: ASbGnct+ooGSLQuA1y9p4U1qlPork1ALGt6WmEKN+RixsNYe8JfzxCB3fjvDF7G6Q1v
	7ZaF1WZcqPiaQ/rmjZ3MrtloegOZGrnJpHmGdzehcGf41Vlsw5irL41JDqtkEsNKGDuBe3/z6nh
	u8c4kKwBgeyKz5BnGpwtGbYHVsm4YsKEA4zF7wN/s9mQj6Ykam1A3SsM079is9yazzbFmJ0AYcD
	12ACaWR1S3BSox9ilfxiV9fwpGuQ6R9kdg0sBU2hHQRRnt6QpjmIz/kh1iP8Cu/MHrpWEQnMKIc
	7tK3wLcbWwougmsI4z74mo25CdZJVQh5Jpu6cdxtCGfo8ubUlLW3KQv09lIhBGo5Yzur39bEwo+
	sEnpsdggsgrqBL8xgRfOHeyI1pg3VK/iVJgF97UzRbaRBvvjBAzY1PxfWaJwwNPEfjUmYJDyVdr
	AHM0b+5WM1DTQf8w==
X-Google-Smtp-Source: AGHT+IFglpHwIBfu5mpMo4Bnv3Ja13MwmG5PqAVT3QSZF+Hd+3k4NtZTgUr4cFZBuTwzKZtS5O5m6g==
X-Received: by 2002:a05:6a00:928b:b0:781:2291:1045 with SMTP id d2e1a72fcca58-7b7a2b92e8fmr6194694b3a.8.1763014803463;
        Wed, 12 Nov 2025 22:20:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ethan Roderick <Ethan.Roderick@digi.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 11/38] openldap: make license match spdx identifier
Date: Thu, 13 Nov 2025 19:18:46 +1300
Message-ID: <20251113061914.3756301-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121609

From: Ethan Roderick <Ethan.Roderick@digi.com>

The OpenLDAP license is versioned. As such, listing the license as
simply "OpenLDAP" does not convey a complete picture of what license the
component is actually using.

Update the LICENSE variable to use the SPDX identifier for OpenLDAP
licenses, with the appropriate version number, "OLDAP-2.8".

Rename the license file for the OpenLDAP license to "OLDAP-2.8" from
"OpenLDAP".

Signed-off-by: Ethan Roderick <Ethan.Roderick@digi.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0bd728bfd9f86d136a22edd34b2274336084430a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/licenses/{OpenLDAP => OLDAP-2.8}           | 0
 meta-oe/recipes-support/openldap/openldap_2.6.9.bb | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/licenses/{OpenLDAP => OLDAP-2.8} (100%)

diff --git a/meta-oe/licenses/OpenLDAP b/meta-oe/licenses/OLDAP-2.8
similarity index 100%
rename from meta-oe/licenses/OpenLDAP
rename to meta-oe/licenses/OLDAP-2.8
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
index 02f292a7de..595f87050c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # The OpenLDAP Public License - see the HOMEPAGE - defines
 # the license.  www.openldap.org claims this is Open Source
 # (see http://www.openldap.org), the license appears to be
-# basically BSD.  opensource.org does not record this license
-# at present (so it is apparently not OSI certified).
-LICENSE = "OpenLDAP"
+# basically BSD.  opensource.org has listed this license
+# since August 2019.
+LICENSE = "OLDAP-2.8"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a41b4ed95ab4a20f366a8d82536afe4 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "

