Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB51CA601C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31282.1768811344599364558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqobjJio;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so40247075ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811344; x=1769416144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hCoqeB4CS/wzZOEd6uBAVkwukzIrYr8jQaBMKJwODw=;
        b=hqobjJio/6tTz8xq3kIsKtJybN+MJcickdPUMGdUVXyTZZHhAfkHTrw38Lel00oh66
         iTN4RXIkTc2qb3lAdWu9em5Jg4uBhLmkalruWy6wnwhcTJ5sgIrGJtU+0B/HBHUmJSU2
         7ahZAgdUBiyXSsNRTaViMxrz08ze9IDGCDVtCz1ydlynZ2JOWVKzSfTQgdQECq2bl9wi
         5WLoA4heers2X2FnqR7SrV5ULXZ12vr7/0n+V+UvwkAd5mUkeJYxBkzELY1tla7FOUZ4
         YTZP0hk9R3y0vyW6giX66cubMPk+Ez73QA7iTl5lgAlSAtFWPc12v3kj6hzqAis1sgOj
         MFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811344; x=1769416144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9hCoqeB4CS/wzZOEd6uBAVkwukzIrYr8jQaBMKJwODw=;
        b=Wg9lE7OSBhH4S5HBVbuamvZXcRwQYtGY42kBv2IV6j2FXkeNexSH5Jzx6DyOLvENwv
         X9eeSV3fcLUUa+f1Fw4uj7Xxds1uULs9/79j9s+NVSFRois4IlmZVgNJfQDvLHwEu9sH
         HPejqdenU587wlICecOj28W8Rnvyf30BoRIOTELDHiGjIxoHYvNMvXmdXz37ESeMY6zY
         eLHePx/h2zrJfm8dA0zCo1QFuJCZ8mPq/DFbqU2q13zOjJopO+lnMjOeMkyX+dKY4f0e
         LQuQQ4zK2F3mQfH1uDd3yxtITzNXWKsD/gXeDeUeSXr2Rvo5OzryR+AOEhT8Uq5Gjpha
         29rQ==
X-Gm-Message-State: AOJu0Yy1nr1Wtz+p5JX7gnRfpi3Lk5oC4PHLSmqPAAPk/fcyfY0nsgQC
	oTf0Eg1MFYa9d2/+kPNu8IXpVSIKwesWxJUdxSdPu6VWcl2To5TbPed35Jd3cQ==
X-Gm-Gg: AZuq6aKkT5OxaHfmxwMf+07PYewDCKx0LW4Aro6aJA2AehmeJaF0Ds0sPE0SQJtlLwr
	eobJzgoC6S9kUNA2IVVvT6ee2oc+ebT7Vg8CR5/FZhMUK9tcdHYFS4PziTS3eBLRdxI2NJEPzmt
	69G9kce1Y0LhNBDEorydRVz1mwFKM5KeMuqvMbpqoeaZ4E0dw07sMJ0GBX/b2hA7SaymflKQOL+
	f9SLvTudBaLozlKOrm9/Nx2SFFFaOIQSjcDRnD0X4ejGeCq7Cv2PdTQdKn2howSaG18q1YpVsSW
	w0E68c/slNjS4EtRQMuicux4q+SNhB2HmxqwEzWSsXoyzEztBb3Jmvil3qTqnGRMfr4LaBzcLK6
	OehtMHKeHIrNcTWExUpNkxDwDCWgjyNF94mHhOEnfq3JCjXV4KNZ7ox3ntURYDvFe4GVNHYRg8P
	r6qnLuBCg8uEsp7Lnxyh3senw=
X-Received: by 2002:a17:902:fc4e:b0:2a0:980a:4f0b with SMTP id d9443c01a7336-2a7175bc84cmr104380005ad.40.1768811343832;
        Mon, 19 Jan 2026 00:29:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:29:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 24/28] boinc-client: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:46 +1300
Message-ID: <20260119082752.4120991-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123618

From: Gyorgy Sarvari <skandigraun@gmail.com>

The relevant CVEs are tracked with underscore in their name.

See CVE db query:
sqlite> select vendor, product, count(*) from PRODUCTs where product like '%boinc%' group by 1, 2;
berkeley|boinc_client|2
berkeley|boinc_forum|1
universityofcalifornia|boinc_client|165
universityofcalifornia|boinc_server|5

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 31de060b48c57194ea2e6c6844d746eb59a0d056)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index 3e626f32d9..aed6fe6edd 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -29,6 +29,9 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+3 wxwidgets libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
+
+CVE_PRODUCT = "boinc_client"
+
 SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
 BRANCH = "client_release/7/7.20"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \

