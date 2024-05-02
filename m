Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08ABC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 09:56:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1407.1714643756295092025
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 May 2024 02:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=2eEsL06j;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b21ed19f5so53611905e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714643754; x=1715248554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2A07FjRWkBWugLuLm25ArVmg/szIc+dGnNt8gML9dU=;
        b=2eEsL06jYKVw27LVu+/v65Jo0305LCtdSQTwiku8epANptEgxEvpA+VlDnBXHL5EQX
         lbnoOrj4qMtbzYre7HvFXcUA9InifG8yd4Sh/plGxB/+NY0k00FEhIwbYiN43QWsinhz
         tdXHq058HoDePJEOQmfW7ADMwjboLsIYqbG7aOHWiyb4mphbyESRMJ1kJYgaLGOAwRjS
         gEBTuN97ATR3FUWXVqDMkTTCLs2j6u5noqLf82SYFzSVCZ2YeCrixj8zPvSuq6IE+gv6
         IywnqsDKOq/qycnGE92DgWsjkxgcUND9GLt53CXgqRZxCrnnZUBCCcutqCt1DudtoQKG
         uKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643754; x=1715248554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2A07FjRWkBWugLuLm25ArVmg/szIc+dGnNt8gML9dU=;
        b=gxHpXQ3LOE4l+g3/g353yccGFMGtck16bTwwbgVBt9rc5/qCnQKHirKvIx5/aveIQX
         +vFmBP3pY2mvXipCqb5OJ2veaSyozUxv79w/XR82Ci4u6IG2tAZ2YL9cHnLo2Fa0GqEE
         TCIVwS5VFbPKgDTjk0qQ/QGYxo4Xdrm2B6ImlRmzIVcLq/DeFKqXxOvZid9iHMekor+/
         sHLWptIw1SoKGnmoyYdgv1YyrooJNTNhb37jzi4UfVa6gkI6PMXzMEZrNJB7t9hCpBd3
         07Qa+KBMmYmWS8281sGfoN+wu+84R9kcLS9S2OYjmTq2WK8hJgBBXpwFvz94c/m0BIDE
         6wVw==
X-Gm-Message-State: AOJu0YxbVFDUTDLqxBITkdSyvYPe8TdAK/sVEOnl+QmtDV1F9FfCl6Vv
	i6vLFWK/wcRSAcE/4I4qXmXn5IU3vg1ZkiWQ5fohOLBGEKQZ8zSDO3AYcplqywwTTJG0Mq7R5Ym
	v
X-Google-Smtp-Source: AGHT+IFSIDYmQK3sj30K0VH6PDX0+Pxdgw8Lw2HMrvadAsjqZnpm1GlgRrzFh9V+/RdbhlTN2/+xJw==
X-Received: by 2002:adf:facf:0:b0:34d:a23c:cb4a with SMTP id a15-20020adffacf000000b0034da23ccb4amr1270710wrs.7.1714643754410;
        Thu, 02 May 2024 02:55:54 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id h1-20020a056000000100b0034e0b56a62bsm857766wrx.44.2024.05.02.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 02:55:54 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH] evince: Update status for CVE-2011-0433 and CVE-2011-5244
Date: Thu,  2 May 2024 11:55:23 +0200
Message-Id: <20240502095523.19940-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 09:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110241

The current version 46.0 is not affected by the issues.
Both issues have been fixed in commit [0].
The fix is in effect since early versions of evince (3.1.2).
Thus, both can be safely ignored.

[0]: https://gitlab.gnome.org/GNOME/evince/-/commit/efadec4ffcdde3373f6f4ca0eaac98dc963c4fd5

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-gnome/recipes-gnome/evince/evince_46.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/evince/evince_46.0.bb b/meta-gnome/recipes-gnome/evince/evince_46.0.bb
index 57eb994e1..291d32584 100644
--- a/meta-gnome/recipes-gnome/evince/evince_46.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_46.0.bb
@@ -56,3 +56,7 @@ FILES:${PN} += "${datadir}/dbus-1 \
                 ${systemd_user_unitdir} \
 "
 FILES:${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
+
+CVE_PRODUCT = "evince"
+CVE_STATUS[CVE-2011-0433] = "fixed-version: No action required. The current version (46.0) is not affected by the CVE which has been patched since version 3.1.2"
+CVE_STATUS[CVE-2011-5244] = "fixed-version: No action required. The current version (46.0) is not affected by the CVE which has been patched since version 3.1.2"
-- 
2.34.1


