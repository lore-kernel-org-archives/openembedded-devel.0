Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F25CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18184.1777549651317023164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mwKa2dOH;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-364d72f2986so227250a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549650; x=1778154450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAtGjFQJa2Fz13KX2ujH+6PhSJBIero6HzHUT2NPwW0=;
        b=mwKa2dOHVXd0lKHSsWEXa8+kcJHpEw2MSCV5whrX8j4H0wx6FCemToe5R0vOMvDYcr
         +RE7PJxz+vVT9Y1B7F+3frm1uEkSfy8CB4vFkv6MLg05WMnyYU2POo9vu73DofXweu26
         /W02kBth3mbaeFJGnc20A98R6EYJjwSYcPLUEQN1iBAqdD7G1ePWk7pU5CMwiyfdLIz4
         +CKHA7PYtcAYgJ/SmjEsfkxGtH59dNkxKZl1FbEQ1mfqwCVzLdVgIqXmWRNunWoIJUd8
         wjm0sPigO3n6HccDfMBuIJtmQ3zk4ZxLJkNs86xCWEB6pzZJ1Z/9j2P+Oe7qdorxhHEg
         TEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549650; x=1778154450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAtGjFQJa2Fz13KX2ujH+6PhSJBIero6HzHUT2NPwW0=;
        b=E21L31qhAcmvy6WjCHNfpDxTJSYFeHwI1FLhJFSEfWgze3da6sk896bdhC34R8HFJx
         k0nVt25+NvlpRX1WO6G6Uc/wPCxbQPcyVpJPULdCENb6cfU3fY4yM0H1yFgvZKZnre6Z
         rZ1FfA4yIGaSSO6FDn1udWQC8EC8+Z31jhp/ukZy62yBuWCQ3AyiBRoSfvw6aqCGRdRB
         v35w5T71ICt0rVainbD7ngCClMJDt7T8Ou5Rwu1sAfQifesu13BRvP9FqMGDyBNg0sco
         jw1dwXh6gwZ8tz+CdY5//FpMYzfFQg98rp6z10JnN+bxAlakgs6qg0tmabKUCelzIMaw
         qsPg==
X-Gm-Message-State: AOJu0YyV3f/wpHIx21khtzxaD7dR7WGJwUA5rDUv2HYd9hSzPhzvOQEb
	/hqm2tld2m0kqIll6+JlsGpxQjpY4qLofOBoSdZg77dhX0ezQKX9efVXlXPn1us0
X-Gm-Gg: AeBDiev3s8QzVLeb5A6KPwbw+9+bJxxjYAvTyIa5Uq7ZvjtBj0AMF6ce0U6aYd1W0hm
	Ca/MllpxjzQCK5DhC3ZGlSMxT7r1r1COkH9qMdIVVlZAj7AK7bJkELVmfjLWJh4KiOXDpGnpZ1+
	91xxCeaX/EzPGWihvSRHfxG1/Pn3QsBbT8cu1KS9CfGG7fkGD4vat2lee0CYiUGQjNSXH6BBceI
	BRc/kwQ1YkNYtpKUz4OF7o8NezaO5izUs2I5893I0mV/ggPwElNgTPdi6yidXDwuBai5F6yu+ER
	C8lH3DGtckdlvQBuTAZ0Gl29Muxw2+lJUBfg7dPPCQsN5ATL/j7ur6LDoHKNfIEaIUescZqSQgU
	oQo94L6fkkM5AYgKMDwbZa5Pd7RmkwVwAdQKdPzLXOW7Mv9dXbfekdcYhNpkIqHM5YRqq0v4KGG
	wg2masLKR+7NF62kjasRUnIY7RbbMhUTDSEZZuO0HPO62fHTo=
X-Received: by 2002:a17:90b:2f0f:b0:361:45df:102 with SMTP id 98e67ed59e1d1-364c308d224mr2501760a91.17.1777549650461;
        Thu, 30 Apr 2026 04:47:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 11/24] python3-tzdata: upgrade 2025.2 -> 2025.3
Date: Thu, 30 Apr 2026 23:46:34 +1200
Message-ID: <20260430114649.4184890-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126745

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2c0a4edb58da813ca3d9709baed7b5c67ae85e2e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2025.2.bb => python3-tzdata_2025.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2025.2.bb => python3-tzdata_2025.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
index d7bcb11364..1c313ea223 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b60a638fcc0daffadf82fe0f57e53d06bdec2f36c4df66280ae79bce6bd6f2b9"
+SRC_URI[sha256sum] = "de39c2ca5dc7b0344f2eba86f49d614019d29f060fc4ebc8a417896a620b56a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

