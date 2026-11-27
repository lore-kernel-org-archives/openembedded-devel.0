Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10285.1795753067561784908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PKGdlDl5;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so11426911c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753067; x=1796357867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xupMvQ+dQ2AXdCzKOOcnpbEScMn6Bp/oqCR6+uiqHHE=;
        b=PKGdlDl5eJbyOe40+cMYHijtXTymUxrDAhkmHUp9WBmR3uSTgrXF5V4oXCGRRAp3/k
         G5ZBGUJXZG2YsQCI08rzxwq1l2YedMwZwpSX33NeypLJCn642wtz7L84muhvtCCzQ8/t
         bvKgkUKSmxyJw23EFaAbCWy6bbM4qQ32MJLWqxeXfsAIb9ZyT7r3m7GuJE32U93NKki9
         MAERnXmnvus0Qh0LmCtcZ3ZmSoJ672azr2leRJxceSj4d8MON/Ke4ILbWcrkc54n21Ku
         OrwZUre/bxuqz77mmqLUAhe66RpdoSKQom3SncCcg/DpXIWk4yb/tf6rgEJqTzUnVRj3
         0H0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753067; x=1796357867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xupMvQ+dQ2AXdCzKOOcnpbEScMn6Bp/oqCR6+uiqHHE=;
        b=Hmguamx2WYu2+bvPpxyWgEjlB//rO9hOEoyKa4eBeULGDju0QqDQpz6/y89H7y2wwk
         N1w3QeBzR2la83YlEemH1ZwGZ8tUHOPkv7LPNpNNR6DqeaYxYGbfuZu6i1NRu3Ww4Vhl
         dPMiAeeB6pnNtfOQL/E6UchueAF8zfEXVnDCAf/S/yaL+6FPimdYY80aE2RK+HzwrE8e
         cdX+NM/lcOzwbPXbYmcmAzqz+BHX/RyMM+xQ5S/Ac1GOVU6PBESuIohAf3nDfxGL7Fby
         ySmoMZipqLqpb4IdTbYIxV92HXUSqzOSEyj/sjsV1WYptLYrjGxWjZZTQdSA3fE1IHBT
         IMkQ==
X-Gm-Message-State: APuU4Z82UAQIBLuURzkXCmGqYLDFH40XuCtpr/U+UBPPN5vcm1Z4hCPq
	apSA7A2kDXbgmWpUn23GKTUrbSMWWk8J/VD9aC7xV66qBaFNpB+uOjyew9BhxFbd
X-Gm-Gg: AZFdTZdM3Rw7RBXQs18iA9TdVU/eSCC1rm/yM3pU+Rv8PWMko6ISBRGDmCgoGjf3eXt
	/KHocWPi72+pr8x/Y5ypPqwKvMqoJSR8Q7tW03dakn82ugTG/y/9h9BILkK8drnS05uGjL/LpfT
	nittgDN/Bb0W2YqfJDadGQ4hiQDClTMJijc0rJZ1JthN5pclkj5hKk9bwAgJ8yiCrTRfohk4v9s
	6DxjAKLRgCE20PI2yzXaHOeULH9DXwCDYTVyrYC2Dku+kjW2XyWsxF4Q0SRnEPhMd2Eq52TBucZ
	4Q2hg7Lj+8SlWCmd+gLWEyU00gxagFqd1aZYePU4fGZEcBHOVcnDpFtdcdAxYeSwyCitELOdgS0
	ueMkviWdjlqTY64DKC9bpqkltkmUVJ4vhk5tp6T/QDBu3MtuiHzpfccE1g4ClbVBX8pI4Vz85HF
	UOaZ6EfG00jjpPrB3zX0X1InZathu8BC84dS+74tSXuKI5/0X7jFgi+8hitMDORMF3XV3bq+kQS
	pv4rD5tKGQ1jzgXlNIjobg2GrTnI35wPsSc+hjdF0G9er1e4dJ95BPEK2+v3q0gdjUM2dcPltTY
	g2e0w/Bfo7RPcQnZ4oiGw7f+IUV2qWFL+G9+PHqgaOCFZ12SjO06LcEdJJTv0kANTRTVyYkpaLG
	aK+dVCJ40ht30X8f52yQMXOXmdOUdpD+t/WMnP2d4fudxGpDNmW89c+poQtpYbvgW9lg4+mWR1g
	eFNpxYEdXi1sAy2vB9eyG/UIHWAaScLE918c9kbuvAc/G182QWkNTX/MsDxf6WWYY/xg7qxGoMe
	scSGGdJo7lkqux9/UVv9A0bl0pOlftXMD1qtMbmjG3Lz+/q5pWSHAPdxk1735lkFN6MEBkYGIFA
	JA45
X-Received: by 2002:a05:701b:428a:10b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5568a287cmr24108753c88.21.1795753066871;
        Thu, 26 Nov 2026 20:17:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 26/35] fetchmail: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:06 -0800
Message-ID: <20261127041715.1776485-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133278
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the branch_6.6 folder, which fetchmail.info links as the
current stable download.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
index 815b11b0bd..2147e5eec8 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
@@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] = "da99f8c573c4d9e63f493c7e24447126aea25b53b4c076ec79266874e29b1975"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/fetchmail/files/branch_6.6/"
+UPSTREAM_CHECK_REGEX = "fetchmail-(?P<pver>\d+(\.\d+)+)\.tar\.xz"
+
 inherit autotools gettext pkgconfig python3-dir python3native
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix} --disable-rpath "
