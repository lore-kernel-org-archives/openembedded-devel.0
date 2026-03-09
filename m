Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3DCEFCD6C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:18:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9915.1773047876574099116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvzlOzoo;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso4702625e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773047875; x=1773652675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXnkXi6Xw/0V/FrhQKF707VpUI9aMCSFW4xR2+jkxpk=;
        b=fvzlOzooFym9uLyisuF2anEUhHNM8PJRYCceGsrZfSbKTZkr/eAAl+pjMgzNyd/bhb
         +Mz4H/70D/XoIzWko/W+jXiDaTXXiZ/5EG0fQxed/nPyrbay/Sk84mUoATIAW/Pujv71
         TE/0xXklZgULGTNddmG2XwaOcA79RlQhAOj8SI2zQVEY+c16pYIIXQNFNcCUMCo4ZpWz
         0KVXKtwP2AsDXNoHrcb5o2ZAzZ11Rdlee4nDHDMTZGravJT/C9nEVJKjwVB7Axa94UrY
         cngVKvE3BzqFAMf5oUsdNC9mgxPRNUgxwYaogyTiRwHU1ulK6JPfOK9khgWR6l4A7Gfr
         /aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047875; x=1773652675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXnkXi6Xw/0V/FrhQKF707VpUI9aMCSFW4xR2+jkxpk=;
        b=C7GhR+bUlTYABnpJ3gkohuo3uds/5Pg/yZlKMUP4wioLET2Egzr4CaGcxyP3p/fRgf
         w0sryRtmQKVBlgfuPpNknRKRk2u/KBCiZG2VDLjt8o5CMZdZZM3dQ0SSsCDx3hUfNc5L
         MD01Wc9/v4E26ofJZLxkxHBIGY0TV04utXLZ6V5MxNv1ddOVd0VjvOXHr8w5yMA8l1Su
         MWnWNXzt+1PoDuQPW3VHxgwCWQ8jmeqMWMXmYeASTOdJitMf0Sm3degWsjtrLKx+DT5K
         GnKUWbL2g6p/pLeTAYNsOBOIIZkMMELc3zy33kdPA0UaNz/ew0H0O97ui+NgA310bQLl
         mZog==
X-Gm-Message-State: AOJu0YzWdMO94U/MD7zn4g0Dwp4/iamuavIXeJXOLK+wH1dc9ok8dKRV
	tOKxGZevn+ilF5POUFOZ19QvSiVsORcm3ebjltg84iDkAAd8CLaBimuxFwg16w==
X-Gm-Gg: ATEYQzyEF3KpzxwUAWlb4+YwbxOo5QKLJnXvVJlPaLl2icb8poTvmIv1WUxFRuwpJeK
	WitO4hz4X8n95Z5Vzy1OgYBpUXPfjS6OZu5zwehi2TiBYMKXBq22Oa+Sak5MF2Oc+yB7whJ8HrN
	KEOxgoKfbrPw4XTMnZBapA28DmtYADwQNJgvvlIKuIUV6wp77pKi7E+ZzaogLfD8SIE1SloO1zd
	TWt7oS588JbWfX22foJgP0RgcXpYbRj2a6dhLXQJfbZeMqI9an1NuZY15DyOJ4tWwVjLYc5NT8J
	SW2FI5PiW1IHP+E3LMsH+eGwclw+pu/T7tzEf5qN03sewE5qKsR3AjdJ7U7kjgr8OR2IZQJWonz
	0ycH4THvBKS+zXHSYSIqTrTd0R2YsvlU73EsingBarNjCAmtAA7rRJCYV36IULkseTMhkmMYZIv
	2CXeOIIPV6ey1tfhCwuuML
X-Received: by 2002:a05:600c:37cc:b0:485:3f58:da1 with SMTP id 5b1f17b1804b1-4853f580f70mr12364665e9.9.1773047874557;
        Mon, 09 Mar 2026 02:17:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853afb2011sm68556335e9.15.2026.03.09.02.17.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:17:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched
Date: Mon,  9 Mar 2026 10:17:53 +0100
Message-ID: <20260309091753.189719-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124965

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
https://nvd.nist.gov/vuln/detail/CVE-2026-1837

Both CVEs have been fixed in v0.11.2, but NVD tracks these
vulnerabilities without version information.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
index 617d3bc502..f73fd314c2 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
@@ -53,3 +53,6 @@ CXXFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2025-12474] = "fixed-version: fixed in v0.11.2"
+CVE_STATUS[CVE-2026-1837] = "fixed-version: fixed in v0.11.2"

