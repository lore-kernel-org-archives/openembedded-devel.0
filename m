Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CFBCC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9311.1791969926753449982
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J3YFcjIB;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89e018e466eso58987b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969926; x=1792574726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=J3YFcjIBBM0ymeSlDR+oyAAF7s7QlnFDw+sDp9KTE+3YN1NSS6492f3EbrMQUCr89T
         jF9TTNWd2Ppz/rqx42Uwe3d/gsotYPmbW+5YwTc0aOG5mjMYhBYFxsVPfqgsp5kWm/ZF
         1mAaDChMrwlcM5Lu3Y717PXpSCQQzxuIL5omBZ9SRrcW/FzECokHCZ1uqIQOwiB9Pwe7
         NQe/O/eUvudti/pKlGcfqYbsDU/t1M9ZIettuKFRwREOfKjhjgALGL6eVRK4USobjHrX
         rXIiz6k3KrweUMfCdV2IGb7kvrTNbjLNSfyQRDzrYbMFcnfpPVvlomXdckYP1czbFFDX
         KNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969926; x=1792574726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=ettsnrHWhMJ6KNbd3cl5AoVIw9e/WjP3D8a0oFT+UzmuQEidoSq+7JEWw/Ui9V7G17
         yZIKRhUiCm2dbha5x8CkGmeomiUAiIO5idXEsgznaTv7RBAbrDwRPD5D8vK/G+iQZ+iI
         wLOW6J0p2IKElPWbdSu90tIhEJAQEez7X1QLnIAXXAYy1Qgohg5m3WrI/EfyKTS7l6/O
         CAUI6IZNj3bnr52IUVHLAbVzS/E6SgwNcrYK/ObXwYWxCAmXVYL3SXH6XeTgNjIHexKR
         23vjVwK1PnxlH+sK4Jt2Q9UWRVMzDs/VRN7gGk7ucFmTKo46wbZyEpip/HJugG3QhQx9
         QUHg==
X-Gm-Message-State: AFq9FYLH5OEVo/MLH6K5DEfgwpLHA8rhxyJjiL0OtuLvTGmELRxGhnxR
	vSOvhMiGjUhisXi6+OWIhOpQE1V0pr0W568EdbejqSfbgnsvRFBVSfbkkKC3bg==
X-Gm-Gg: AYBFou2J8xOnYUE4torKWolQOKY+RIQlj6Ztqu4OHdgVvy3rKlFpvjIWOLvwNrn9Je7
	45eoyeOa+a/b1Vhrthq3s2oXTHeIPsKmeMPYeKB4TGxTVtQ1TGU8BOtb8xgChmHASQqN5i7GmFH
	kveh6ymL7aqeuS6DQZ4d6UtI8la6oI2U04hB0NEs0Huku4r+WTtvlP05izTWJ9hBjv5O3RkOXDc
	InuZDXkMQF3zwZN5lvKW6RA/wmAZ8KRua9FoeL9SYe4LbU4P9nsic0+csbu+hA5Is9IwSCmeL1z
	+lu5E02RCh7v8yGo6l3eEqrm3uKAq2P6ceSgr+dcMxdTJhmUrcNHXiDRjFMEqYaGsir2TWaE/6J
	fzHsGTzmrQ03tkwpIxPeI1DrBCrAUrmzFsWPwy6Omh+R+OQU3aCzCPqvQyuDDkDkmIdS4jW+4Z9
	5eL3eFSrEEv1ZONliZ5Q5yRJNycFBjmXaLEgn8Pu8sCWgvsKfYGUfzS2S1aTK8xh2hUx6n/20kA
	xCRwnI8PRR79GzLX3IK4VzFjTX6Ow6XPnQ0rKO6sH+A2r7o6w==
X-Received: by 2002:a05:6a00:178f:b0:886:a52a:316f with SMTP id d2e1a72fcca58-897c3ef92a1mr12568221b3a.4.1791969925981;
        Wed, 14 Oct 2026 02:25:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/17] zeroconf: ignore CVEs
Date: Wed, 14 Oct 2026 22:24:57 +1300
Message-ID: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130869

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47180
https://nvd.nist.gov/vuln/detail/cve-2026-47183
https://nvd.nist.gov/vuln/detail/cve-2026-47184
https://nvd.nist.gov/vuln/detail/cve-2026-48045
https://nvd.nist.gov/vuln/detail/cve-2026-48487

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index cb26699212..a9c19cb38f 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -35,3 +35,9 @@ do_install () {
     install -c -m 755 ${UNPACKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
     install -c ${UNPACKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
 }
+
+CVE_STATUS[CVE-2026-47180] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47183] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47184] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48045] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48487] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"

