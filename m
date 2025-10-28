Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BD8CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:20:27 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.4240.1761643221603258222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e0pGlOs8;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b62e7221351so5034614a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761643221; x=1762248021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7iyFYb5gL5Fp7VIHQiSD3SgOWHARbzqbhaJWdw42As=;
        b=e0pGlOs8d3NDpaGqvxo2w/OSlDUj1SCQfFqY8nSxR9ScQvWCQvDoeaGOopsxh83R8X
         QnYsQ9qpFrc/RYKG1S1GP/7dieFAOFL9OPZrS8XsxCzqJcBs7HzMBFHwqXupJzrnQo4n
         VOnjShtvA9LyhMgwj8g9dycxMT9uRQzWqYquschFRs5GPlxauhJ/qyM9UKIWV7Kzd3PF
         7qR3UP5O6yb0CryAMxOk8zBEC9f9vZ44onmeKW/uuhcPRa1fvaLhkZ3Ltbzwf4RVDxYf
         tdsSRWr2ADdpiWopQ1M/AuGdl97Aqlmh5gIhv/er+THyYKj1APq8CgMtt0BPEleI9t1/
         2IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643221; x=1762248021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7iyFYb5gL5Fp7VIHQiSD3SgOWHARbzqbhaJWdw42As=;
        b=W7XuxvHl4zAg3ehW1tQGH/iOuFCXEnMTHNY5MtCqA8Dy7TkGMwxBxetgj+mkC2hlgL
         fZMa5otkcO91Ilz/X3OKIzAQssSG3ew+fgeSFy5/gUY+W14TsVirdZiCdjRJY/AIznh2
         CuG+BaE86CrqV0nN7Ig1Zqaj+Uww9+sJlvEgDu+EIEJWyCRyijMmd4vDSmuEjlPNpuRc
         UNQ5SBI4XwoUsdEA/6PQmQiMNma3bFvaInQDfVyxFp28Z+SIw1kv5bqItwZ1rLdsu1cM
         WLg/q0vQtxf9AbVuaPAGGUtqmBHPF3GiR7MA0/SUeP7cwyMYMnGT5jNKvTxn6nguBc+n
         8zDA==
X-Gm-Message-State: AOJu0YwrAtRVcMWYWntWDHAW6ehmk+yNkWKTP7dFl1h/SrRjVfohesB6
	yhgct5AnkZ8y9lvEL2wydg41h0eLDc/deBGOhlEZAzWKfZCmqFjxVftijgtx2A==
X-Gm-Gg: ASbGncuSVpHxXV48/wnPxv/x/qJQewEZiG+4U0QtPA7NxxvENCuvXx/gOB3FwzfZyXu
	9D8Xy4eewN8B1Jcnjyx52XcOQZ/6aJA9OWUUF4Tc4sySiWqA8Sv0b1CeL2ZOKB9lsoRoDruw6m6
	oiHA8uhnbqfnB5I1uUs/8CC68qiy4coC1j4uybW80xW5CspiJfuJs0CA8lzVwlwScgGhHYAodTB
	+7pLuRHGRbHL/oL7ow5xURY+BsrR7t7uYVOKRwSZCDAt1SR5yojNCXbjpYdEuEmzKak5LymDwOS
	1nlfkfPqjS/1uNaFhAeW2Owy2wBdEXIfL/sPNmESEQIUzfkuna5gzZk2jpi2OIjJwJR1HiMbxaE
	2g0H9ebAsHenveuqSCl84GvhStmXaG5+xTcydx7V7vZ/RHQdeS+lIqW6u+DzcJwQ8AJYyXb4wz7
	/cHSzqG7II3ZasFg==
X-Google-Smtp-Source: AGHT+IEfg58bvUqh4j4XXptRrfFl+wNUGjGZYMxdOH5APtlu6iAExAv2oF26/2aCC/5iZDN3CsfDfg==
X-Received: by 2002:a17:902:e5cc:b0:290:cd73:33f1 with SMTP id d9443c01a7336-294cb65b9d4mr47844975ad.59.1761643220557;
        Tue, 28 Oct 2025 02:20:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e46664sm108363575ad.109.2025.10.28.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:20:20 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH] mbedtls: upgrade 3.6.4 -> 3.6.5
Date: Tue, 28 Oct 2025 22:20:14 +1300
Message-ID: <20251028092014.1194534-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121073

Fixes security vulnerabilities CVE-2025-59438, CVE-2025-54764

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
index a0dc6a689a..3e46d16ce5 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
+SRCREV = "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

