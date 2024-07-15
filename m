Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F766C3DA42
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 02:04:23 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.28874.1721009054956472079
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jul 2024 19:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ahFf5/Eb;
 spf=pass (domain: mvista.com, ip: 209.85.128.172, mailfrom: vanusuri@mvista.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64b05fab14eso36001547b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jul 2024 19:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721009053; x=1721613853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BjJ7bUwODFvY1BvsyoxWyS8RA5d5EEyoZozy6EZvuU=;
        b=ahFf5/EbnLEpCDEnayQKd/jZDcyVf9Y1f6D0fz5otd9X8UzXFKIw3gpi+dtOyU9csS
         5iU5vPd0frvWgO3ihTJzRxHFoUbBnhxyuietyTwejrpJ+6zbrg8Bb1FCkFI1M1OILSCJ
         bNTxUpV8sUC1yFGcDpe1jpqYeCPX/VXaZ1mOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721009053; x=1721613853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BjJ7bUwODFvY1BvsyoxWyS8RA5d5EEyoZozy6EZvuU=;
        b=LZ4zp3DqDDkspdriUI2iGHOubOu4TV5uYGBqQWyH/vWqA4rg8hKtllJjrmH3fMS8S+
         UW8MnRReMHNPzwqCxKsCau8gpE2ehqjBJrz0lM0Ptz5K6BquO3OXJUC/ynEcyK5HWK/Y
         TdoJb7Pvs7lcXIYEwb7gcAWarirb9U5vJ5C4FjAqLcw8R3lpjI9ul4Pg5OP0uPuocOq3
         u8m6w1NESucZUI1PLT+9JugLc/mSSbHgY7lSzxGXsVVVZbz60b63ZKu7tZ8XXT/XEKoE
         g1waVELoh4AwsxHG/+NyTVbI/vriUU0eczDXWhnlJvUwNgsoRXzLJONwwNUpsl9NZVHW
         vh7Q==
X-Gm-Message-State: AOJu0Yya/K0FMSNr6+lIksfjcKv3cWoXvgI7HCSgMmztZRsw2TqRirU9
	McxB1veFwDuMBZVcZeEZU8bkrjbft1ckrhY319HbRb6k6D67Lbq5Ugoebx9ODhjMLG1+tvMzGcw
	XGyQ=
X-Google-Smtp-Source: AGHT+IEf2NSahkVe56dA5gj4s0KMMlKx7X/3ez74TPKNTjy6jQSLNW95ZrkUN880HWeKLbbs4OS7Kg==
X-Received: by 2002:a05:690c:a87:b0:64a:4161:4f91 with SMTP id 00721157ae682-658eed5df43mr233586937b3.14.1721009053665;
        Sun, 14 Jul 2024 19:04:13 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:7959:921e:41e9:3d39:7e28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc4450782sm6282647b3.107.2024.07.14.19.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 19:04:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] wireshark: upgrade 4.2.4 -> 4.2.5
Date: Mon, 15 Jul 2024 07:34:02 +0530
Message-Id: <20240715020402.7663-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 02:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111321

From: Vijay Anusuri <vanusuri@mvista.com>

The following vulnerabilities have been fixed:

    wnpa-sec-2024-07 MONGO and ZigBee TLV dissector infinite loops. Issue 19726. CVE-2024-4854.

    wnpa-sec-2024-08 The editcap command line utility could crash when chopping bytes from the beginning of a packet. Issue 19724. CVE-2024-4853.

    wnpa-sec-2024-09 The editcap command line utility could crash when injecting secrets while writing multiple files. Issue 19782. CVE-2024-4855.

Release Notes: https://www.wireshark.org/docs/relnotes/wireshark-4.2.5.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.4.bb => wireshark_4.2.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.4.bb => wireshark_4.2.5.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
index 95db2efc4..7cbe3e632 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "46bd0f4474337144b30816fb2d8f14e72a26d0391f24fe0b7b619acdcdad8c0c"
+SRC_URI[sha256sum] = "55e793ab87a9a73aac44336235c92cb76c52180c469b362ed3a54f26fbb1261f"
 
 PE = "1"
 
-- 
2.25.1


