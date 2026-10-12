Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C00CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:53 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3493.1791763849657181188
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VL5Emejx;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso621830a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763849; x=1792368649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZOpdh2ofxltEUluA4G5vv652iJgziEy/5DNpaJ57go=;
        b=VL5EmejxXu4E2aO+/pYrl6uOv6XrCC34QOBDnxroi567Q1vbvCsdeL+902ldv3qmoS
         Sc2bBl+9NUmw8sRk2bxkbyaiUPdM5C76D/gmvyB6Y/MTQHQXrtRAUMZduGnJs47p/YF5
         S2GJ6XzPu56uBe1K4ObcExW6zqVYw3lXAyDUKSLmhn8e/xhtqXL9Y8qi8Y22llvZJluF
         lCmiwRruREA08Ug0yzJa70XYb1qgrj/BVl7d7gB3wHUnm/LhEdhtKMeou+lOoR7l1BGS
         oyOUiWsfJNMFc3urf+qwcnVlRQbqMeLKWIaSPnInOAPSyvZg0O4F8dlvgrqan43Uylef
         O8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763849; x=1792368649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZOpdh2ofxltEUluA4G5vv652iJgziEy/5DNpaJ57go=;
        b=2e0vPnnOxbER0p819jwnfGZ5OVg13AckibeTiMHOIgJLhFBnnUbGa1PLj/kCwKZu9X
         ijGl/X65NS/+Hh3jY9rzcUsmtaucTntjj9N5V6VoMv2lk4tRatYVlzX1gUZEEqI+7Dmw
         CHvsvaNl7l9eUtxdGz2C5bm/1Rm+x2St5LNg/dOqvPrzkFXZIX5W8HbnOQk/gYLgpUZr
         yTlSnIU7udWT0x31sYe3/TBmqgn5P4QJ2jkcY0byrG+L9Vp39cxekL57Z9qAovCEaMcZ
         S3bduYhIPdcKO0XhP0bD+B/oZbrhDM8czb2B4BLU5Hb4dgSI1SsB7+AKt5+PZFr70bEw
         S1tQ==
X-Gm-Message-State: AFq9FYIKiWupBWIqKxqyBgtNqd97Q7LP9PPHE2Oma84dH3bBNaT6Hai7
	DXDzgJxDmGz7g7LFunmS6BZimpmXo212oLU9H0ex3Nn8wH0rSAlHeftgZJlof+cBHbk=
X-Gm-Gg: AYBFou2e22RMZIC2FAmbSdpuczJImQclzqok6At3l1VefWFPq7/5BungOSbOZ2LZDDw
	HuyYYuoRgqR5JAveT8xA1T2XeLb8WmJ+krTr5WUy8U1+ZJF58bfQJ4c4N0eqaqYylXMq9d2N9Np
	9z/5lWYiHb+yYUW26HGEkJxCR6boU1WRPt0daOeToi3if8cS6FmZh7OWauWXpbuIFJ2fiBwCt9q
	PerJagGIErIFSkCjwLY5ozYPjuPhAev10VfUX/g3S8jJUhHlqoGNAhzZuoGkGyHHjyfGwFe6s7b
	F9E5QzqOCYBDYOYLWJ9+twGDo2kcQuKzXek5rzeHjVD1zM/1pgJVCDVlEo39brCztKluWCo1O2s
	UerKE896Cd6hWoe9cyn28lP/vamBzAlvW4n2VqVtAxsza/2YgjwX7epCB7u0NklV8hN2deVCnFW
	W5s84mzVss80EN5kFC0E8+mmqw/R4Cpt1fuZSpfJeRcxFZweG3qhR7oyhrvWd9OTshT+VzKIAWs
	0JD9wuuZsvtKz8kCBDUUQvaX8UaWNqTgfuNQ9M=
X-Received: by 2002:a17:90b:224c:b0:3aa:faf6:a951 with SMTP id 98e67ed59e1d1-3ab3a9a93b8mr6851755a91.37.1791763848924;
        Sun, 11 Oct 2026 17:10:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 13/28] wolfssl: mark CVEs patched
Date: Mon, 12 Oct 2026 13:09:51 +1300
Message-ID: <20261012001007.2541673-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130738

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2023-6937[1] and CVE-2024-5814[2] are patched in current version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-6937
https://nvd.nist.gov/vuln/detail/cve-2024-5814

[1]https://github.com/wolfSSL/wolfssl/blob/v5.6.6-stable/ChangeLog.md#vulnerabilities
[2]https://github.com/wolfSSL/wolfssl/blob/v5.7.2-stable/ChangeLog.md#vulnerabilities

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit c12fcc9b481d5fcd94db96cd062042301a4f24b1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
index 8fc6068560b..a2b41b2d3c7 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
@@ -72,3 +72,5 @@ CVE_STATUS[CVE-2026-5504] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5507] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5772] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5778] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2023-6937] = "fixed-version: fixed since v5.6.6"
+CVE_STATUS[CVE-2024-5814] = "fixed-version: fixed since v5.7.2"

