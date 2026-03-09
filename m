Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82004EFCD90
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:44 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11130.1773052360066439305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGuC3q/O;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82995242934so1369492b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052359; x=1773657159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovA5vv24eLeYsAT3CwyjCmeFQVwppwZ8FAe38cqi7A8=;
        b=MGuC3q/OPsz/S9+8rCsLyr54Bzc5Iw3SUanksIW9seF0TesYs65GQFpjmfpCz+0wPJ
         FnFjIkQyJupuFaIXXXcpii8txNXohY390Fg9XPoZKmeI9ZqKP9GCLCbZ5UuulzjuAdE2
         Z1ZE/6pTan9c6Lpj5fI+7cxB3esgNfLOUYEFKE3HPHRX1m/qMsgKSyMaYKnEDdKSR9X9
         Av+IEA03tO/pHMeiojkBDSoTtBWqg/XUr7hJOxook/9M7ULsBpLpXPFzn7RverjZvdwJ
         RgRcXL/8sMpuizAxP9RuFIQO+5xF2ya0ACrEJmzNsKb9VSfkneqm2HbH6kR5vi+AvRyF
         hfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052359; x=1773657159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovA5vv24eLeYsAT3CwyjCmeFQVwppwZ8FAe38cqi7A8=;
        b=O+eywbfYYqYp+Pb+knTdIgJ3Xy3d3SQEEHZYjdqPZncn6ixCHPl80Yrv4n20GFpaty
         0ODJCCVpvztoolsC3SCik9xaFEyJxMfDGxljmak73DQGx0u+lvZ5Cwi0G/PJuZ23jDoE
         mSLFuMSX8MvWHXzMwKOxry2TK8SB+DSU2bbdLoyIpFZdHAPJtxjhzNl3LSvkvF1mRRkk
         6XPU5W6UWsCoJg19M9ADJtzqM/P9M0pAKJIjkK2mQB6kADA/4qFTkmQQ3UflezLGjyGZ
         DU9PfwVPnBkcD7KGcRr6onxK4ufVzIVEOaP/ZZ6VwKoG5mlUol3pTXY88x3Qx7dRQX6s
         VTSw==
X-Gm-Message-State: AOJu0YwdnK7KkHePKPFHXsfnDJdsjj3rhAmNa6o4y4AM4SbIw+tzkk9H
	jllfMZISdgeS6mXen/lcD+k30wuonca2zRhtrX+huunDnOzWO5WS27oopeF0pA==
X-Gm-Gg: ATEYQzxoqUThiA6aA+rrhxI2CqyWH1FX8C+CtgkDx9HwBu9nUwKtPQ+iUtY7/Xp0qVb
	bCT8uM2+2tz1g6oTUy1ih1vxbWmXhUFQn2gRbXX6LeMApaNGmuUlcuwqP7loCvWbHhpP282mR51
	AkwoznO2hOmyHiE1TggWYAtMm1TzXbCeAGKJh+AW+quu4w/AcPZCG2n7s6b41OwHJ5TdcYdRVgF
	sgKn9gOw0mIp0KlC6QZSxzrUtg5QotiNGbDRhSXSUdo2OAofcfPNIe5OSLLKX/DQ1jkipQlv0ap
	XDOwFgfTTZN+AyKJs4r9yKWXpRbdk30U23KMlAwv2IzrTEP1+BxtWsii+0FchsEIGzOdemsBqe1
	WlfXWiki60NoWbR/oe837BmSCWa7FNAY/js+Y0n31h9wv/ufh4hcbC61uY98vCmhul/WcoxBkgA
	pHuXPNdxBFtstfZ9oMIyQ2IWV9kUs4IHqEi6s=
X-Received: by 2002:a05:6a00:2396:b0:81f:804f:af26 with SMTP id d2e1a72fcca58-8298583c908mr12725902b3a.19.1773052359295;
        Mon, 09 Mar 2026 03:32:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 7/8] libcacard: upgrade 2.8.1 -> 2.8.2
Date: Mon,  9 Mar 2026 23:31:52 +1300
Message-ID: <20260309103153.536284-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Sort certificates by underlying objects CKA_ID to provide deterministic
  object order
- Avoid using uninitialized memory
- Improve test coverage and build scripts
- Improve compatibility with modern compilers (avoid strict warnings)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bf0ea3fc286a432e6eb6c1e538d4db4a7455d7f4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spice/{libcacard_2.8.1.bb => libcacard_2.8.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/spice/{libcacard_2.8.1.bb => libcacard_2.8.2.bb} (82%)

diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/meta-networking/recipes-support/spice/libcacard_2.8.2.bb
similarity index 82%
rename from meta-networking/recipes-support/spice/libcacard_2.8.1.bb
rename to meta-networking/recipes-support/spice/libcacard_2.8.2.bb
index 1a2d9dc9c4..f956f06814 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79ffa0ec772fa86740948cb7327a0cc7"
 
 DEPENDS = "glib-2.0 pcsc-lite nss"
 
-SRCREV = "7b07684ea6698d4885ff2062350ad8798a04de42"
+SRCREV = "df2d3c05a250741632184c2cc66df247039a70d7"
 
-SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master;tag=v${PV}"
 
 
 inherit meson pkgconfig

