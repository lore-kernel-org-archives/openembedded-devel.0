Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8F7C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 10:49:28 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19911.1784630960110177125
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 03:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j9mPG8xg;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so5050898a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784630959; x=1785235759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJeRutP23+3+zjxnp5tnMoWesg1wrqTwM017vUa3KOg=;
        b=j9mPG8xgGJi4G2SNNDUbMXqN+Am0nVsA3HjMDYGOcF4AdxhkKmXo3+OGDIlgW+QrHz
         ToNSGPGeGtqYE2fhPrkDS69Kmi1xKlp4v/3m78LwJ6BanbXmPsVUk1ZBctC/Kc471xC9
         RekRvqLxnFSA/zUmxE0eM/H9BQ5Gm9iP5E0hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630959; x=1785235759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJeRutP23+3+zjxnp5tnMoWesg1wrqTwM017vUa3KOg=;
        b=fOXWwkZgnk1XgXlHwx6zUNgKscQINO3CFvGZWnCK2/GfpMzi2bpuVIL/q6gbbY0OOi
         L8E3Lfl1aTcjYGrJh2IdvIDLBdEatKgUE0dPDNCZAHxoOO1h8oi++TtIsXnCPTphRUNJ
         3YqUGAAt+DRX2FGUNZSSlnUHnP4TT+D+Kct9PJ3UR8/bmO0xs/2jtfCLS6bYvlEprdZc
         xRgniUZZo5/14heDNQ5Q04MQ6I/6s4kTXjPMnqukd6anvF94k5Z+MMyczI/uJHlSWRb1
         wC57vxQzP7/hVNfnuHA/YyOJMSJyAxiBygax9tUGFpdQ8rpHIDSCeuPKp/f8c4n9SCP8
         LbMA==
X-Gm-Message-State: AOJu0YxbTVqhRizp72aM0o2T8av71lOfYkdfnsaLksUjp2xKZ9Tiol2f
	HLFiKEG3K60eKNJRK/iS3Yfjz+f1dZx8APyJxgDd5nSvIsRFEtthyXCrajrQcBWh6yCtwYdp6Dz
	jaqJgANw=
X-Gm-Gg: AfdE7ckKFHwrCEC9za8C+awLSLXHMjflBljb7SiVnvHUo/w+mSZ5Q0tp4BdwmkI6bGu
	pYoPV31414lDkftPW0GwQ1y6TlXPwycszXF+StWO1FQuilH40pvTze2XaAvkJTuRCQ2rLOyQPPc
	ohJSUMCMYXtyEqLkWFveWWzKIWHmNkpTz2Q6yjKquMGzrs1G972FpC+jcLfmPDDQAMwvi83GHa0
	1c5KkChmc/ui02rYQZATtHAQprpKcwayXRzYv6a6fpV77RWHzKES8nRr42Q+2u+J46YykTWFbEg
	IrFow8EkAznGNwDgCAdGsK9b0dpd+TYJAelOlEOdOX7jPCwiXYh+5O1tKCerrxu6HVmwAVeR3x0
	7FGlZlN1Ubf87R1D3FXvKB3k0Xjmac4P3SwZBQcSioi7NlTO8dzDv+D43xofFu8KdkqTozTUzcj
	wZm+3TaYhs2iLxOf3mBilGZ1ezpw2F
X-Received: by 2002:a05:6a21:6b83:b0:3b3:486f:f2d1 with SMTP id adf61e73a8af0-3c3ad665bb0mr18971207637.3.1784630959040;
        Tue, 21 Jul 2026 03:49:19 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:6405:1d5e:4d7d:1450:61bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a129f3sm36687106c88.7.2026.07.21.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:49:18 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-webserver][scarthgap][patch] apache2: upgrade 2.4.67 -> 2.4.68
Date: Tue, 21 Jul 2026 16:19:08 +0530
Message-ID: <20260721104908.229159-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 10:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128350

From: Khem Raj <khem.raj@oss.qualcomm.com>

This upgrade incorporates the fixes for CVE-2026-49975 CVE-2026-48913
CVE-2026-44631 CVE-2026-44186 CVE-2026-44185 CVE-2026-44119
CVE-2026-43951 CVE-2026-42536 CVE-2026-42535 CVE-2026-34356
CVE-2026-34355 CVE-2026-29170 CVE-2026-29167

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 23cdc4ca431e2512aa5fc3a0dafc3c2e8d264c99)

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.68

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
index 1a091d7eff..35cbc7000a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
+SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.43.0


