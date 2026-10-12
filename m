Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC24CA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3503.1791763822096179702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jTx00P+h;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso970130a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763821; x=1792368621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4h5NSqmncAof+0pUgPXZEK5PPc25rRE+KsDPDf+OJ4=;
        b=jTx00P+hUfNUiqvUG/igK1Vblw7FOKHYrzjfLd+eYwQVBt/PSfJ8HoFHy9feX5AWA0
         DqZ0/IRv/aQ4SVbn2MtaEESagE2KYIv0YvjOZgFl2ovWy6sb4qn0KzSeOANpSDQz+hr8
         wxUhO4KVaE2QFV/ssqZUcKMOn0JPPpvhqRSMLJvOlqoyiTmHqMsMLiaK1gzqUGLHYOIO
         EtJGWp+QqlV3jlqFg47EONMuiMyIqJVSIphrMxGuWmcHzlVmbo0ew9F+5KkWoSUWCpXz
         4xBaYJ1t+9kxoMKra4qnTBt4O/WLm4TIEMvVxGwunvHEQcpxHdvj/1ON+Vqf5+QD7q0Y
         s2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763821; x=1792368621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g4h5NSqmncAof+0pUgPXZEK5PPc25rRE+KsDPDf+OJ4=;
        b=c7eei+iUp0Ozxj3PxSV9Zq4eKnbg1ZdcERStGP+xg4sFCVjQdG5P6LYnKB93tVYejR
         gYVZ9MtBIbt2sZsaVsYgI7B3pKCRA1+PyKAyI+DrSsmGHVUvNtYxTeATX3dfhkVcNYNh
         GnNeRFdeLDuQU/XGI4kdzWBOgZJ0wxLbaXont5j8You2a1yvqNXWJcD422gHVTsIQb1o
         l+GAa+Ry2g5Qdc2tsl/Gj5xsW1otrRRIeJNLSm3c9I3J9gGqWYEe4YmLp9rjLQf2/Qj2
         CEyWoBb2+FBk4dH/2fnVo9Eg0TeUSdLWAY/KuQCBj9O2VuIHobSRRqOvRrY5k6j8Tic0
         dczg==
X-Gm-Message-State: AFq9FYLJgQQzVAUE2FJEa9z9D46xCIuLlrxHbZUHEIYQ2j+u5Hbi6Gyd
	UDBkwn/T7d5IaB+/XgS6aldR3AvlMKRe7xHtzhGmomzXavK/9AdMDUpPAtep8baaMrM=
X-Gm-Gg: AYBFou2g7/gAWs5R/2PCkopqRbQMvyuPrWex7OgE7PphLEX+KifeNslgIqeDSamC/Ur
	1npdCHm3cMJlySsro4WycfaCU7l1O4I+lGYcP3ruiec4pHfSb06/5gmwoRgzyZN+DUQZZSs5hnF
	VJ3T9Xn3CnqjYGk/r07Juh1tI7n726EWynqpcFVOFgglp5bzj7SFkClaRaA6V0fyiHvY/uCpYmn
	WhNnuVo0LnTbc4PGpwEQJldaGYgk1npb337WYhmEn8kolh6xySNcgBiSE46OBhUenI5NtrMmRUq
	zL4YIb6rwOyggM4m/sl6sB74R5DNCWWVf+cJr0neDliuDpIhECoHNhtsX+x1a9b/4OEncjYbjZ5
	EkckqC3FLxwlfaGAAR+xnqjQRSLbFOrkRqinnIEPbOMk1OBmHgJspVhQ3Cf51JpbdiS0fiT1ZIe
	UBScR07oyNfONCWiEKpvRJ5qkbRqaktm8WftlKwNPiBrSwKDVYkyCOAh+mMFwx6sYDooseUV9Tx
	SmCqzqGwaloldeUSE6v4RfbeEYg/izYf5a1nQs=
X-Received: by 2002:a17:90b:5883:b0:3a7:db88:348d with SMTP id 98e67ed59e1d1-3abcaf0acf4mr2041884a91.54.1791763821481;
        Sun, 11 Oct 2026 17:10:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 3/28] dovecot: ignore already fixed CVEs
Date: Mon, 12 Oct 2026 13:09:41 +1300
Message-ID: <20261012001007.2541673-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130728

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream has confirmed that these vulnerabilities are fixed,
and Debian has also identified the relevant commits:

CVE-2025-59028: https://security-tracker.debian.org/tracker/CVE-2025-59028
CVE-2025-59032: https://security-tracker.debian.org/tracker/CVE-2025-59032
CVE-2026-27859: https://security-tracker.debian.org/tracker/CVE-2026-27859
CVE-2026-27851: https://security-tracker.debian.org/tracker/CVE-2026-27851
CVE-2026-33603: https://security-tracker.debian.org/tracker/CVE-2026-33603
CVE-2026-40016: https://security-tracker.debian.org/tracker/CVE-2026-40016
CVE-2026-40020: https://security-tracker.debian.org/tracker/CVE-2026-40020
CVE-2026-42006: https://security-tracker.debian.org/tracker/CVE-2026-42006

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 86a9ad852a7180edf8b03fca7d0a69e9f1d9e550)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
index 993453eaa30..06e6ee39fa3 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
@@ -89,3 +89,11 @@ CVE_STATUS[CVE-2026-0394] = "fixed-version: fixed since v2.4.1"
 CVE_STATUS[CVE-2026-24031] = "fixed-version: fixed since v2.4.3"
 CVE_STATUS[CVE-2026-27855] = "fixed-version: fixed since v2.4.3"
 CVE_STATUS[CVE-2026-27860] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2025-59028] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2025-59032] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27859] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27851] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-33603] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-40016] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-40020] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-42006] = "fixed-version: fixed in v2.4.4"

