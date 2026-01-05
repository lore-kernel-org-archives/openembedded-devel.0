Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFB7C2A075
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 08:32:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60299.1767601925308575277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 00:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YKM67OCV;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432777da980so3997798f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 00:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601924; x=1768206724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HhqKOr6mK3i69viet7ksfVlS0Toltkzm4W05wkVNXVI=;
        b=YKM67OCV5SSzaAdUXzyHqCIdhP4BhMg+/r03hsz4f1xAllSW2xyDTs8wvB/wJmmHFB
         r1I0MRQITHH5j3RJ8fpIpkhdGH8b27p1rXPGde47qsKL7RxWEm0qEPQSL2CSfPoiWLD5
         rMO7K4srHseGEtfeKUFNZ+CUPsX7qny+N9NtmuaWR+qc8SQN+2Bu1bzCsh63tyJEKEdn
         nrI5Eg8kAa9fHziN3FWus0Ya5qREYJ6vm08TEoG90IEmA1RWZP7f5N+wR2CWQHE08nGF
         dC26QN9WC1hMo9Pdc5ZRDnRV3VzNGnf6YfcEUTOFFJ2JEB9psP/hWm+pAHnqytThaEzY
         2O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601924; x=1768206724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhqKOr6mK3i69viet7ksfVlS0Toltkzm4W05wkVNXVI=;
        b=bZ6OfSt2IqRInnM1eqDyWJB3A1U54QB6gMd4AMW+CefuAG7GDQjrB8wNsRO7YB5pbP
         Zp4NHPinujtNfJbjn9kuWPd3BVCaFGqveq3VcD2YoNDdXinGY4/+HsenKmXTViGbUIfz
         KV+Z65eVg6JMSVpHfyBdj25oml8+P5PDp/iVE1fLoH64lP//ZscLmKzYNDp/TDF8WLDV
         0SScvrb6ukW86OUv/SZ/0TWYuMJGuL/aLG4oIMxeGMs+5wzNYTHuNsGhO5r5XEp7CfZN
         k9ArR9JE36C5e9TXoOBhwX1o+ckD3KD7M87ScTqJXy6K5cVNfv0oa4SJJ3WA2UaS6dBk
         IM9A==
X-Gm-Message-State: AOJu0Yw3WTLhqIBm/VpvCcWDzEjl/t+F+Rxog3b97iUuMsv3cxQW2rQW
	O9fgWWRfl+vPMYgRfngb9Br7FycJs3hI7WSi4HSwQOKf95seS8M83XfkGDrkkA==
X-Gm-Gg: AY/fxX44WGEzgFUS9Bq79AYZGRqvI++rObf1xnTJL56/65lvou8Ybp6UMfejCMuiJHe
	bXCxzferdQvkBhYMuIrYJLKTq92sGme+VxFhPSVJI2/qKRVVN+Ocwia4diMdEsDt6Cn3j7+Q4qr
	EJzCRZBXy91p47I+Pvr6pDDrDN6pjJM5TqV70h24hGxB2c/G2orqbynZ3zlM5kuxqHS2MTBfTzs
	CCpfbK35IM+naq0235sI15PegT3cByTFz8z3f5/GPqPGioJcud3tlj2JHlZ6ytttBbTCfAutMdE
	9ZkRguGYh7cSIIgVqgVBYtpe1KCvOLywRgaA+lD2dEk04kxFqXGNZb49ylZjAGUq/4+1js1pOWG
	KIzhYrbTW9jxnDlgMe8xbcUN5opsUao5ynzw1uOkzo8E9Ago/sdzH5hxmz7Y/kc/ShfSIcMUPYC
	aD6xB4EOXb
X-Google-Smtp-Source: AGHT+IGccI8N5lNx9w4GTCM2aii2A+fQKDLgOCWOZYN/3KrevziUwCRLcAbjRfX3PJup+u04ph40ow==
X-Received: by 2002:a05:600c:4e8f:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-47d1959c74fmr576412275e9.36.1767601923131;
        Mon, 05 Jan 2026 00:32:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be53a0csm54867635e9.3.2026.01.05.00.32.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:32:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python-grpcio(-tools): add grpc:grpc to cve product
Date: Mon,  5 Jan 2026 09:31:57 +0100
Message-ID: <20260105083201.1225143-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 08:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123127

From: Peter Marko <peter.marko@siemens.com>

These grpc python modules contain parts of grpc core.
Each CVE needs to be assessed if the patch applies also to core parts
included in each module.

Note that so far there was never a CVE specific for python module, only
for grpc:grpc and many of those needed to be fixed at leasts in grpcio:

sqlite> select vendor, product, count(*) from products where product like '%grpc%' group by vendor, product;
grpc|grpc|21
grpck|grpck|1
linuxfoundation|grpc_swift|9
microsoft|grpconv|1
opentelemetry|configgrpc|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f993cb2ecb62193bcce8d3d0e06e180a7fef44b8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.45.0.bb      | 2 ++
 meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
index be851ba990..1f74d25aee 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
@@ -19,3 +19,5 @@ do_compile:prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT += "grpc:grpc"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
index 56b84dab72..2671e5c738 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
@@ -47,4 +47,6 @@ CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
+CVE_PRODUCT += "grpc:grpc"
+
 CCACHE_DISABLE = "1"

