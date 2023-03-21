Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C6AC6FD20
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 20:37:29 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.25862.1679431045259168776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 13:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P2KAQy2y;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id x8so10669184qvr.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679431044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQgPa8/bVhS1xJeoOw0oaNeSxk0PEJ2mcrgt/ckEP70=;
        b=P2KAQy2yy3mtPD60T8NmNRwaHrtiw+9JgemoDICezdtNwO7wqYaQAzMbkbtfyBWOMf
         p24pZI9/pnosfFbA61ePhgU6AVWLb5cgGNIu5hAgZ+Z/sYhaPs4Cx8Ns188BDChIV+DY
         IMqXPv1yxzb9RmqgfmNapCNm674Aw08HSF0v9HL+1iGh5Z3S8r2KRS2iKjl95n251rCI
         YCmnvw9VBUniAt1sy9e4z/WznDJBjkEVAa1uCaEV9xVvrqk6RSyTKb3yX0P1CIOBTaL5
         OTMXNHhjQd+/gutBqsANIdBFUWyejGaTbX199D4EY15cP6V3b72xYF4f8eGxLIoB+LNy
         Xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679431044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQgPa8/bVhS1xJeoOw0oaNeSxk0PEJ2mcrgt/ckEP70=;
        b=A39fqxHJqEnh8bEg0zoo9I78HHA8WwEShd+BHCQzVhx6cw2ryoZ4tnYl8kC/4JU1b3
         AlKcmpFcRO6UKXDlgv3lp6slyr/V6yzjL2LjcCi8IH+biZL9tWgalthZYIdg7ILrxgz9
         yC/1N9xsa0S1f6OW0B49D27B11DaovbpI8UdvtYK3ttZmYrHMliV3lwaDUHct0qyDn0j
         hI8ygVcBhfcq0DBk9qMr481xInSYdJxRHXny4YMbgKSH0Z/J070JwIdytbcnOHNhFBeG
         sjDRH3b7duFZl6HZZijMfQjfNjkHYw8D+QU9ulYeNJkP+gwsluMQ0XQML1HBbPrGHQVn
         /vEQ==
X-Gm-Message-State: AO0yUKV08uc4WT3BnBuUXZW/P9NUmurRU5ANpfj+LxWC9QDEIt5WynnY
	fbrhK6yR6jr7uQx5G06GNIlmGQEZQGk=
X-Google-Smtp-Source: AK7set9FfAbEzWIPEa7Ji14K2wwJGtoPb2wRevI4T69fGXl5kxYSXt3atRjofe/WrUjThKErJ8tljw==
X-Received: by 2002:a05:6214:2a48:b0:5a2:7a52:f53a with SMTP id jf8-20020a0562142a4800b005a27a52f53amr2558952qvb.48.1679431044123;
        Tue, 21 Mar 2023 13:37:24 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6ffe:c97b:cba5:c767])
        by smtp.gmail.com with ESMTPSA id e14-20020a05620a014e00b0073b45004754sm10045946qkn.34.2023.03.21.13.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 13:37:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH] mbedtls: upgrade to 2.28.2 to fix CVE-2022-46392, CVE-2022-46393
Date: Tue, 21 Mar 2023 16:37:23 -0400
Message-Id: <20230321203723.432168-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 20:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101626

From: Stefan Ghinea <stefan.ghinea@windriver.com>

An issue was discovered in Mbed TLS before 2.28.2 and 3.x before 3.3.0.
An adversary with access to precise enough information about memory
accesses (typically, an untrusted operating system attacking a secure
enclave) can recover an RSA private key after observing the victim
performing a single private-key operation, if the window size
(MBEDTLS_MPI_WINDOW_SIZE) used for the exponentiation is 3 or smaller.

An issue was discovered in Mbed TLS before 2.28.2 and 3.x before 3.3.0.
There is a potential heap-based buffer overflow and heap-based buffer
over-read in DTLS if MBEDTLS_SSL_DTLS_CONNECTION_ID is enabled and
MBEDTLS_SSL_CID_IN_LEN_MAX > 2 * MBEDTLS_SSL_CID_OUT_LEN_MAX.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46392
https://nvd.nist.gov/vuln/detail/CVE-2022-46393

Upstream patches:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2ab113e8be42ae2dd61babb8e9a1742684df1f59)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mbedtls/{mbedtls_2.28.1.bb => mbedtls_2.28.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.1.bb => mbedtls_2.28.2.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index 742414dd8a..15bd7cf43d 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "dd79db10014d85b26d11fe57218431f2e5ede6f2"
+SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake
-- 
2.25.1


