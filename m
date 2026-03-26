Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C3210A1E72
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:04:01 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44811.1774523035911579614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fOxGcG71;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c742bc88d87so382829a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523035; x=1775127835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDwDUJyZNaab+3Vqu9kATW1MbiRLIWYhr2nmNQvYl24=;
        b=fOxGcG71RIYZmX1XZ4lwua2wBDgMMJRs8wsP8S7VqRSeaYrRw6yYy2U8YRM4/7EJZv
         96ltHYctdqdZngsqZyhirA62zuR9InDZpLCX1rnxfdQGu3v911yM0B1N2dshUp6w4auH
         gApG4WbPlovNA4y9bgbKbswHYoBZKmxRXQYULmKiHVxolI6FfVVfYy0L7IX1mFBvKynB
         nsQvTFpRHEdCEbBpM3q91nkH5jkdTarGegBg1tuBNYMa7aMqhFm37flZAmCUq2BBibyF
         YyCfrRERubNR3MN/cEqTxdYbSNwAD2HWz+lJ0KGm0nIYjB5t5JkrxsHMUYYlQ8hFtEAY
         L7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523035; x=1775127835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDwDUJyZNaab+3Vqu9kATW1MbiRLIWYhr2nmNQvYl24=;
        b=e9AX8OgFoEw1l7CGVUPiW3bCAhC5M9ruCcOKC0Mw5rU+i1Rji8pyEnXrUL95SGk/bZ
         I5M2Te0z+pg0H2sSKTGkMjt1B9X/5NQ7xC+1amL6cQn0Pj0B08Qtw9BozEBEsHrUvN9o
         XWIpPWftAKwAUC3D9oJSy98dgZZAwKN318oO/VRVs7cS4HFK2opyWEI92NtN13G0LqCy
         RsU6f1hhfLeYQv1rqEpECc/cdO+ikq85yPeX09/M+k/FUyog7FhX6kI6QauDQ3tmGFde
         Ocmu/arQX7pRzQ019ef6fkjx8DV7Xj+cQSi77ydjCKmuJ5uHCJiA7LRV1kKAX8oxy3t8
         V3zw==
X-Gm-Message-State: AOJu0Yyj422qt4fZJykQmDZM8lEl8NqBAkVTjfVSqWgoiAAFpEtOLX19
	FD6FHkjILdCDFv7+TIk/WKEpaa55v6M37GilL3PhulUndMxwDqk+YgsFdq3kOVQe
X-Gm-Gg: ATEYQzySUE7yn8amu9ZNM83pVmJ4/eFwRX6PaM5d+aE5RTftZYizeCeqExwYIeC4dGP
	MVQR+HdEiDPErJLVmYngNvhkS1JMOqpJ99Q/7KMGktodjr5dtnur5kSDt33zyRPUJ08/1tbQmzo
	iD/Wqrq4KSRvmLtPGiGj6zrcaMu/otDtfrSBV/0mN5XRynD2m+fY0PzEzeXAWbZ2DoPTedwaFmz
	xV+3DQA+KyFn4OqOHfVj+G+1FwCnB3BWjK4QEC77fRsJwYH+A/uVSnAuXi88cHntr2X2OBO4E5h
	zCnKSjcU2ZX443xK5Skuw3mzusSdBHiFheOuGTLMdPYmCGbYKI/EL02GiAmn7kJyiSr4AWOOmDo
	zNmkArPmM5PSM457QmMvFau3gbW2Fl0F30uBfeulW9+JjUujauJUYUS2XIKUbjCfHp6I2TOZwyi
	uptlL9mV0UTajT7fwYwHkJLNwug0M+eOoGSOo=
X-Received: by 2002:a05:6a20:7f84:b0:39b:be6f:3d4d with SMTP id adf61e73a8af0-39c4ab5851fmr7463294637.23.1774523035144;
        Thu, 26 Mar 2026 04:03:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 13/13] libchamplain: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:10 +1300
Message-ID: <20260326110310.1809866-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125654

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index 5aaf680e8c..af2e31a04d 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -8,7 +8,7 @@ inherit features_check gobject-introspection meson pkgconfig vala
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRCREV = "941560af497148588783db991e8135f52a82574d"
-SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https;tag=${PV}"
 
 # Compilation fails on 32-bit targets, due to GTimeVal usage, which assumes that
 # time_t is always long, which is not always the case. 

