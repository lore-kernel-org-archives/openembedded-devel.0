Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6EFD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:40:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10653.1765294796792893601
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 07:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=naVDSYzD;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so45710995e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765294795; x=1765899595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIeswjZjL0S2WD+jxXX1gtEX0Y6nIx189ZdoBP5HiWc=;
        b=naVDSYzD4YeIMbHXZJ5thEME8kftQwKQc3L27DbYjI7h0oVqmq2ZxbHkucrQz1aX1q
         KPGw0jJ0pswiBVGzPbWWwHqT6xin4qQC/alnMLqj8ri42CwL4AiLWAvGMUSxYDTCWoTM
         u+frKW/fatGQQfYycxUq8/QXnkI0WmI7BIH6loEpuJGUr+KaVpDV7VrDpmfF7OtIxY5g
         ITIgPnnf5lo5lFmCCCtEwAezvZg0Mrfgr6FeXiHjZpVRsPeclcSRqbTNmGpy5g6UVxIN
         7KkpXtgmI6N6+kl76PFo4Oqxs44FJZ4zfMbb+42UhKlmLO3PCTp0D5EimOa55Ib5moo+
         MuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294795; x=1765899595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EIeswjZjL0S2WD+jxXX1gtEX0Y6nIx189ZdoBP5HiWc=;
        b=nJOhBpzFlIvhNDFqS9PaZchHqqpDAREcRpPgWwPSWMHo3S5lOZvL7hUASHGQKii5nm
         sqdo+x1bJ0JaO+bCuLYN9miP8JY47BgsB9c1lIIwcVlTlmnmKQ//TWB3YA+944+2hDYm
         6iqWH1Lj9tC1phtLCH65odthG/+ceR1YDRRhshxzOculLrweRiUafF2nPeVBKZS9k3AZ
         KK4HiUpd2uWIObUUMS+SbwuymU87eKCd39rP5nGWZUJZU9wVApLEIyzgo/Q+CS0OUNpL
         xFlgL9Q7jwR9zFQ6YO1ailT9iAAzpUPVOYqjBBkBf/24MHraNqsVnMuSqjs2lp/4O+hs
         F7CQ==
X-Gm-Message-State: AOJu0YzmdAzLQnbo86XUkuKK1g2lddckIdmxa9F6MlCsujRLaQ+r4l1m
	efxLhfJ50f2QTizGP83g2Odv/4sIsnWz+9pDGAHX7OCB7yF9CgAZoWKpXeW7Nw==
X-Gm-Gg: ASbGncv2BSugA49yr0JsHipihFfauw0R70huPWYWE5HNbBkmUl5GDcynUJPidxFxuu2
	3ACAjKegRj9gmPIvvz9vZxTgnMceAPCem+fIyvwNgaJ9bG8dCASg4tBX7hvw/jlO4F+eVAJQJO/
	nchlbSfWH/2x/fJuddQSlWBPXD4H73OaVWDgrEH28tkhU4B9V35xFUFpsDCaeOnydmWKphPQ1kl
	Iaj14yw1+hIQv+3e1XR/Sx8//SP7cKdRVs++zRTu4uuB23XTwkifJvvCSnn/l41OaPBX3NpydCW
	OXngPjLLPuoQmFnIiTurLpXX/ZGlN39W4P8GsvcsWucueIw7I1Mh9MSKhQ6aQ8PbRjji0SNHcrg
	MItOp/v3Cx6ACEHWIk9nOUYgyoc5cfag6gj5BrFMBJ4ajsOAMXQJ53eERzVhG+J2QZFBIkKdsaB
	ozVPZh0onR
X-Google-Smtp-Source: AGHT+IEj3yfs9rEdE8YAU75Uio8IoYKOe91TcZ4ZukTJygJYdfLuapgKB30eh6wxrx5+HSIYvoNv5A==
X-Received: by 2002:a05:600c:3593:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-47939df8334mr122005135e9.10.1765294795084;
        Tue, 09 Dec 2025 07:39:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d632cebsm46375495e9.7.2025.12.09.07.39.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:39:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] civetweb: ignore CVE-2025-9648
Date: Tue,  9 Dec 2025 16:39:50 +0100
Message-ID: <20251209153953.951218-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209153953.951218-1-skandigraun@gmail.com>
References: <20251209153953.951218-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122461

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-9648

It is already fixed in the currently used version.

Also, update CVE-2025-55763's status to "fixed-version" (so it will be
marked as "Patched" in the CVE report instead of "Ignored")

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 1d0207edb1..0e13bc6deb 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -10,7 +10,8 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
 
-CVE_STATUS[CVE-2025-55763] = "cpe-incorrect: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2025-55763] = "fixed-version: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2025-9648] = "fixed-version: The vulnerability is fixed in the used revision"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

