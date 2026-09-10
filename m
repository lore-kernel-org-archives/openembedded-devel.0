Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051B3C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:07 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27831.1789081797508297170
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d7pf8rq2;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39675172593so297970a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081797; x=1789686597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsQnN870XmQWuvMdpafyf+ouEAY3mIjP1daGvGLa+2g=;
        b=d7pf8rq2O0XF1MKrxIKkc7GyFctRxJi8EVX0aVTpWltPI62qbsPLt6sFvLZXbAyN/Y
         KnqNfLtf2OPWoxG1vNSZPBmZ+FPiuEGAXj48V+D5zvOg/nmWIgfaiNP5I90IMQM5eByt
         fg6JzcPgBg8zWUJYePx6ky35n7pw4E1NQZxETzbKOeNOK05acW7lmx3HaxXR8DZzgKR9
         03h7/wBXmBVCgpcG70i27n6aoZZZI8dg0aGj9Tce5dMxnOgM1SgSTnwZpRtwkfZhXjvi
         raxXNm01oSZ5NK01u4BHxOjw2ff+Pxi4E+KtVJ2DDsXWhXr2dt70CfhJQrj+4Hz/BGoJ
         JfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081797; x=1789686597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsQnN870XmQWuvMdpafyf+ouEAY3mIjP1daGvGLa+2g=;
        b=cgR3cEd1br2ncarKIeRRafvfOpeNwYTuKiZnj9wGCXrHGtLqnZV17mGEJnjfKMtHEx
         tCVj/Pqf5+te4G5kOVBp0jMOCZNb3k5UoJ2gaO+RGR4idgQwiaUe+njOmDM3TrMhMB8P
         u9SWbM35OD2uAQavoqGrM4rFlGP6Vy2JlYVW8s2NPTyjon5Aa8a1WUjnUFb0Au/sKDR3
         uPI5LxrR/Mpd0zdWOd0SWNy/u1sZoOrHWneBvFQs/BtpwariWaxTj1TT+ZbQoHU5XVDk
         meYvo88jc2DetGSUcxNdaSQWIxx+bTcEW8yDFmIjuurUy06C6gvC4yJPCnrv2UdbzOGJ
         HxSw==
X-Gm-Message-State: AFuF++kruYnpmv0HJXJWEidNsOKw/hM8uVP719fNZyiOAKE4RMNkyok8
	5fF3f1485q6ObHol2dEhwIV9Gi2f+QdreHHvnY+O2JOd65K1i2Rl1fY0ocpuuw==
X-Gm-Gg: AYBFou0Q7lqfEPu9tPNM7k/uvW/qe+Y4un15F2l7LSUY0nRtS98y1aDY7yBeNvP0ZjF
	NEk+733ruuXTr3NF5sX+OkG/RWRJ3IHvm//p9QFS6+VI0ffNB2dNIbzl4CNGmjjZ80ppK3pyVo2
	cOinh9sT4av84DpA2W4wgA8Q41w7eEI9jT/XAJXumDvoM/pORMBG3kCXPWJVf4YvosZlGEfk1vV
	yiBGfdNX0tfiDf8endXLGnDNvkPCk9I3Kq8lQovp1DHQMhzD1qPZO1pGCWWGHBFH9JqMXfclEwq
	cggDPeME/3x/MpOFS/XXSxql73WSP20Kfn4fH+droTyQNJ6kHJrnRxh1eTMR+eNf+wKdP6D3En7
	DVsChau/fULsbzyVnNrDpqxF8EQ3cyscAmmvU+fXzWeWHNNbNeTHNj0MdohkaYWcxTOenDRYNcO
	QD9CJpIszD0vw80Y+rQjKeudiLltEZnDKPE+2va9GLA+PKOQmNupVJ58NIg07lJVqLQ5yl/XDsG
	ufzBbIc63530LhZEOi/+uR7oA==
X-Received: by 2002:a17:90b:57c5:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39d9bc1b0eemr1830063a91.5.1789081796774;
        Thu, 10 Sep 2026 16:09:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:09:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 5/32] unbound: patch CVE-2026-32792
Date: Fri, 11 Sep 2026 11:09:04 +1200
Message-ID: <20260910230932.173913-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129923

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32792

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-32792.patch      | 31 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-32792.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-32792.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-32792.patch
new file mode 100644
index 0000000000..5b1a248979
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-32792.patch
@@ -0,0 +1,31 @@
+From 14bb8321708507fe138d3d6e77e51a9b86ea75b8 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:15:30 +0200
+Subject: [PATCH] - Fix CVE-2026-32792, Packet of death with DNSCrypt. Thanks
+ to Andrew   Griffiths from 'calif.io' for the report.
+
+(cherry picked from commit a587535c5dd8a5ea8259507152f055be318367df)
+
+CVE: CVE-2026-32792
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/a587535c5dd8a5ea8259507152f055be318367df]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ dnscrypt/dnscrypt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnscrypt/dnscrypt.c b/dnscrypt/dnscrypt.c
+index 4902447fd..173484cdf 100644
+--- a/dnscrypt/dnscrypt.c
++++ b/dnscrypt/dnscrypt.c
+@@ -361,7 +361,7 @@ dnscrypt_server_uncurve(struct dnsc_env* env,
+ 
+     len -= DNSCRYPT_QUERY_HEADER_SIZE;
+ 
+-    while (*sldns_buffer_at(buffer, --len) == 0)
++    while (len>0 && *sldns_buffer_at(buffer, --len) == 0)
+         ;
+ 
+     if (*sldns_buffer_at(buffer, len) != 0x80) {
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 3adc98621e..1225cb99c2 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42944-1.patch \
            file://CVE-2026-42944-2.patch \
            file://CVE-2026-42959.patch \
+           file://CVE-2026-32792.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

