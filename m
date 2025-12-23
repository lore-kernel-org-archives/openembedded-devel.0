Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32A8E6FE29
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 19:34:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107190.1766518485196535744
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 11:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bw89eL7e;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a1c28778so60916835e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 11:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766518483; x=1767123283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBxOsG4D+gid82ONvDGWxhCiU3lXo9rQg1e7ZhlZ5PA=;
        b=bw89eL7eM1uTIa2V+QR8QitNYFiK37rgncyAc5Ef7gsL1IXXb6D+uMnMtYcoWm1kjq
         LpUiB8sJCOz7eUL1rWUE7P9AhoDUa4UhHTXddBYi6K1W7KXJ8zjfqMQHo9JFjSuYEPs7
         EUFbfB9KOLsBsZ2aTk2HECc13q3k2+xZzyXPj9c/IasQ8cjE/CjIyg5Hs94ywRCRvv5a
         Ev5ZhrtMUiGJvn2oH2G4kLpkpr0s9POFJ8Fk/OYNm/X9/+qB+vUBYCApgL3WW9JaAVjp
         O7A2mrXJrGvTKWS18TkVx31cflRE+nKKqKXE5q9Qnbzmp5VcVvOQbj2DERIz+kzm5OcY
         5/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518483; x=1767123283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBxOsG4D+gid82ONvDGWxhCiU3lXo9rQg1e7ZhlZ5PA=;
        b=LoXkdcwQ9GjlLXvlpUFbB31MbWQKmtkoc9EmQFN2n6l8wn5vvt6y5P+HVqQmr1EqHv
         VV74u9sGM8MBDCRbLMjxt5WCRXgWs1gC6eMcojLq1A5ndVfQBqEgY6Sfl/gVe+U/rZa/
         +hYH+n3wM9smwkqK8JLVLTL+MjYS4+i80cwDNGmNDBQ/JTmX3LzzKdxFC40zb8685HpD
         kmOKY4zhZ6zlpPiOWpeG+CMbIuksuzo/trc5TQTXDvSrHZpCNPkYi87yiwx/OjEHE3U0
         ozBo3AnC1MsfNBQss4yATDeYxowrSzhWe+KJhIqH5mO1RPb0MQ3jYrD2pnsa32fh6Dhd
         lqDA==
X-Gm-Message-State: AOJu0Yy3zTJEAxiQmKtdJnExytAzkFtcFJc8agJBwAiUbgmEgpCni5Y3
	flEKRvxip6VjCorV3AvVlL2Vu/PjJgl7PIjB27heT2N8CfkECByIlLZOx9BjcQ==
X-Gm-Gg: AY/fxX7bWo27yRfAvBQDaugHey8EODDp09gQpBpSAlo1j0xI4uW8f9rFQ/gZtJmhKMM
	02PwUW+bQjateIdtGHyt3JB/xF5BSgJ1WYEFIWGSTcVpbqQnQRGIz6U9xdvwuc6/bYldntFTeTW
	Ijm/5KNtqne8VlRMjCNdcxk7cFAbEgkkb7W+dfutwG3MzKwbfcxIEOmPQvA62rLaCCKDwz3yve3
	crseReIUJIQhE8HU+aHnjolu5jLvCuzODgkWXxx0ANMNHKhNMfBb/GPJ7Jx3EOq9vNZWR4SYRR1
	xVSqhSQ67Tsmc0nwF6YWts1oMRy+zUqQmknlZp8u/TsKKeXyTnyPc1Livx2ZIalSZ94jXsk60qx
	Td+xLHlSVBEDvLgv0ayplFW1K+zf61plX61LK1EY3QC7Nzsf0mgMdeox1r3QUxwT+11o+EpIbHq
	VtaQrXQO/8
X-Google-Smtp-Source: AGHT+IF9TrGZdDQOCWwwFUVfseJ/TjQcrvbvxWQYJZIDvMaDrrfVz+y9PIsUJpsTOTVSiAauJ4cxEw==
X-Received: by 2002:a05:6000:430b:b0:431:8bf:f081 with SMTP id ffacd0b85a97d-4324e4cbc58mr18002348f8f.23.1766518483346;
        Tue, 23 Dec 2025 11:34:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325dacae0esm18802690f8f.12.2025.12.23.11.34.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:34:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wolfssl: ignore CVE-2025-11931 and CVE-2025-12889
Date: Tue, 23 Dec 2025 20:34:41 +0100
Message-ID: <20251223193441.1133870-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 19:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122842

NVD claims that WolfSSL 5.8.4 is affected by both of these vulnerabilities,
however actually both have been fixed in that version.

CVE-2025-11931: NVD[1] references [2] PR as a patch, which was merged in [3].
CVE-2025-12889: NVD[4] referenced [5] PR as a patch, which was merged in [6].

[1]: https://nvd.nist.gov/vuln/detail/CVE-2025-11931
[2]: https://github.com/wolfSSL/wolfssl/pull/9223
[3]: https://github.com/wolfSSL/wolfssl/commit/e497d28ae1b364e0136849996b893f55d8a8fd4a
[4]: https://nvd.nist.gov/vuln/detail/CVE-2025-12889
[5]: https://github.com/wolfSSL/wolfssl/pull/9395
[6]: https://github.com/wolfSSL/wolfssl/commit/2db1c7a522ba258d841fbce95ab84156669a5a3e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
index 8512269912..f16c8c1e68 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
@@ -46,3 +46,6 @@ do_install_ptest() {
     cp -rf ${S}/certs  ${D}${PTEST_PATH}
     cp -rf ${S}/tests  ${D}${PTEST_PATH}
 }
+
+CVE_STATUS[CVE-2025-11931] = "fixed-version: The currently used version (5.8.4) contains the fix already."
+CVE_STATUS[CVE-2025-12889] = "fixed-version: The currently used version (5.8.4) contains the fix already."

