Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A505CC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:39:09 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32485.1792039144168030291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DHVnnXiF;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so2472914eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 21:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792039143; x=1792643943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iC/FFzalPtzxK+BeHsBRRZT9hg4tRhSQLFwYms6brP8=;
        b=DHVnnXiFji+eEqW2rBEM7u5io7m+ukWs+3dHsah1uPHYSnlSgNOvY4p4zszT5SKKzh
         LWQBoQtapdtX9Z3EQeGiHvUCFkrnn9SyKii5Anz6aE05Ewm92Z2np0s6IxekJld9XB/S
         cuOtDrhns2q7e6KXUzzEDIkWCnYbJ8phGqKFFxa6JuldedsHWzZkvNd3OuW8kXzm4Euc
         +CIQVvNIVo2eHLhQHLGCAYSVaYRlBY8I3rBORitDxT2X5eQndqatRzx4Vk60rJMm1YW8
         1PesyfslNoxmWbvDY2MGAbEz5ryWAjWF/eULZ2sXC76KR324yV4RZNEbfovaxwNCsJZi
         RdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039143; x=1792643943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iC/FFzalPtzxK+BeHsBRRZT9hg4tRhSQLFwYms6brP8=;
        b=P5Q2jT23Y+ItN12NVbzfryFKpg9p03q5ypIQchrzOv0hy2zeXzZ/hKXYTa0Nrm9exQ
         Hxoqwka4JDKIB0/k2tk0TEgqQrlpT4UyNQ+1tpyW6rWmmTGFHUhCaXsMMWHxL5PdTHxP
         ChaGqZT5ppoQY/3GQ/Lt6KLf/qVOfMGgmhREeBLtbGIx9tbMeTqzMEYUgpyxnb47VEgA
         ut8pUNgcOxpFzRbJKZog458U8n6/B7KCGjnwdEwEzUlECK2B8oZO/naAU7o+YKCBtzVT
         ohyUTa6vU1QmCckQooRrFqEYT/F43D9HrQBMbh0ItWEzm62dJ4NrNw7q33bSAVL3QZhw
         C7bQ==
X-Gm-Message-State: AFq9FYJhCIV8ZGCAOA3Z1PE8uTsOaHO8kopbhEMYifkhAdQJGBg0wPrs
	mGj2fwjQJD8yu9C1ynIe6MAuMCmK3LpdJnFJcchL12NzYilf+gK0+kRf9r8Pjp6jL7Q=
X-Gm-Gg: AYBFou20T3CrrI4G9j4NeoKzdNEpLBDdbuGi0eyphNy7FRZVjMLf3ufF/slk8W8qSIb
	+E5/aMCY2/gznF89FMNXcSE6XKp4LnkOmRXo/rkKL6SAvaRvuWn/jVID9md5yc5+Rqkgq96q6lX
	9Stj7qRHcxliG92Vuxa3ObN4w++xTI83U/4IE/cuewmq2hicw+bJln31sFqxb6IouapMMCPtqyc
	O4VdfYYSHNwBTi8es6irfV7wUsUOx7xV+/w0tnZo4APuBYwsHovBCXGRQj3BkCnW8LKP2Tb3P2u
	V7Aw/V7UA/MrFXXeFAiK7kluQLdfG3AdC70ZpuoRikZXm5+1F80ZHw71j6K+W5d6wJJmZbe421b
	fw/FpNoP2BRmOMNLm2UtdABflxnmxKBuIuNeQybMQAALsf32tLevsdrxKB5ahQiOe1HecxbqSZJ
	zAOqZCtUvClH+Hu9HFAuS/r0rne80p3XUwpv6FBqUvuPh4koAfbXDkbDZohmLBMgRDpFUa93/Wi
	rR3wdFjWgq9oa3HXpnc/TDMpF8crCAxnCSv6XoS+Ea1nYJGhYtkOS45v+z67hguDQq+0KmKwMF/
	OTOA7tyZ8ynE6LxBLvdxDDm9eQVmbaMQpY6bkT1aX6//Emhd2LfSXYRavL/6tUHeEcitu5bnzg0
	Z+IgzeIH5gKS10Gsy2eZ2ZEPFF0/48wciN1U4SkIKOH+3+rrlkB3Izle0xLiPjieotqQDndoHti
	dr8FHVpEnEQRtJsq7z8WrfSRuZq0o5Rx09FPA9H70k8TjS2A==
X-Received: by 2002:a05:7300:caa:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-35cceb09059mr11795514eec.38.1792039143330;
        Wed, 14 Oct 2026 21:39:03 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm49199424eec.15.2026.10.14.21.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:39:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/5] python3-dnspython: seed resolv.conf from /proc/net/pnp in run-ptest
Date: Wed, 14 Oct 2026 21:38:56 -0700
Message-ID: <20261015043859.3073445-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
References: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130909

The live resolver tests use the system resolver configuration. When the
network is configured by the kernel ip= parameter and nothing in userspace
writes /etc/resolv.conf, the nameserver is only available in /proc/net/pnp
and the tests fail with "no nameservers". Seed resolv.conf from it when
it has no nameserver entry.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-dnspython/run-ptest  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython/run-ptest b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
index 8d2017d39c..cb674db8a0 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
@@ -1,3 +1,12 @@
 #!/bin/sh

+# The live resolver tests use the system resolver configuration. When the
+# network is set up by the kernel's ip= parameter and nothing in userspace
+# (e.g. systemd-resolved) writes /etc/resolv.conf from it, the nameserver is
+# only available in /proc/net/pnp, so the tests fail with "no nameservers"
+# even though the Internet is reachable. Seed resolv.conf from it in that case.
+if ! grep -qs '^nameserver' /etc/resolv.conf && grep -qs '^nameserver' /proc/net/pnp; then
+    grep '^nameserver' /proc/net/pnp >> /etc/resolv.conf
+fi
+
 pytest --automake

