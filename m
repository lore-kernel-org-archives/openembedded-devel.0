Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9195FC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 13:32:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8496.1783517573232121185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 06:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dLlNCoFx;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so7305775e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783517571; x=1784122371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDKsLG0sTU4/+R4DvM+T9gx50dvHj0MfqnCiMDgbMcA=;
        b=dLlNCoFx9lT6Djk4Jw/oQRvF8AgZcjat7Q7jLh0iG7Qil09T0Jsol6y1EfhWc/0GvG
         8AL58d/2au1E8evRDh9N65q+IFJpnlUObGNr/q960FY+qHTw1rzNgi5+ASR0+nTzL5zt
         e2Xhv5i9c8Dn53YNo7RkEXAiz1QJ42K2173To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517571; x=1784122371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDKsLG0sTU4/+R4DvM+T9gx50dvHj0MfqnCiMDgbMcA=;
        b=gXtXlx8oxAdXUsWZV/rWhBcJVkkAky15NNVMCN27EH1qLrbT7oTTDERufAhd9wuBB0
         Li3vzCYOn0K9fq8LsC/yyyjV35Jqg+dlhNzvLiNpKTxiQIWpFCFp1vAHHbaZ8tOFVfN2
         UJS7RFUEDQ+uUIweoMD8AzQ3rYxpLa6LmLQ6IMpUXIcg5dDK4Mwxyp1M7yydol+Fu8c7
         29uptDyilNBjtfPKmgpybbe9bm1Vc72zOolehozy3utV4LO7tvXDDPHQznTxr28jlw+0
         ulyZneto2CrexhIt9psQXiUu94ae+R0mJflBHd2TMF5YOcMXgGBInsurMRquQi2G+9vR
         vpkg==
X-Gm-Message-State: AOJu0YwFqMc1b2lUFxCl8oBqpC45OsyxubNPA52g93VaOqzimqTiHx2b
	Kt7qBUVGPyuBWFxxlEJlYMnfUFuFMCMNdmYW0nxCaQakFD/PZYkn+BcPhSa7JZ/GpWful0NavGE
	MNfqU
X-Gm-Gg: AfdE7ckvWhHk2UNAJPXKMAHUA8tGIen8MAxelIndMFU+hQR9CWcB9UKEG+M0wq366HD
	e6VNheDqNhFhm2uOfBbAjiWdpKw1U29v6/gi0rPCKCgKvirbIAOufRcjnAu+/stRnjpfVtca94R
	YeLpVXzu++nq2X2yCXUJmHYIDh/zdlOqmqquQ1LJwbYuM8A7490VzsV5zy/IFgyPGNzT6YzKlEW
	yL5s0WlUS2g1Bs5S1QoGUEkBd0AfMPMqV2338IwuPF0c1WpS8mOjFHv4WKwT0ryavv6YqiKu4E+
	OOWYbTTiic/FiymUXqyBgTiDBQ5EVIai43QTEtG0qpFWs8w6+ZDKpdQb+eueOWj9XOsotVj9+hg
	6RLYty2Rexfuht0dyaI57mJ9t0FuAwOZYKFAZhjbtCvmeBUWmZcxzr0V/TMFOY6Ap+dNqF3bc9Z
	Rsh48sg/ITYsr6nEZc8L6+8wBsJWuF3CXBU1hMU2Q2cDhGDemEpwlGkT+T/gKNcr+wxx+cyuW5b
	iZzxssKZzls/qz4HRkk4WKDnFujF/dok0LAqwBPKQ8q01HBdSh6
X-Received: by 2002:a05:600c:1da8:b0:493:c14a:a1ca with SMTP id 5b1f17b1804b1-493e68b806dmr24844455e9.3.1783517571390;
        Wed, 08 Jul 2026 06:32:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f294a6sm262333915e9.1.2026.07.08.06.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:32:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-pybind11: Upgrade 3.0.1 -> 3.0.4
Date: Wed,  8 Jul 2026 16:32:45 +0300
Message-ID: <20260708133248.1765250-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128109

Upgrade to release 3.0.4:

- Fixed test builds with installed Eigen 5 by improving Eigen3
  CMake package detection.
- Fixed move semantics of scoped_ostream_redirect to preserve
  buffered output and avoid crashes when moved redirects restore
  stream buffers.
- Fixed py::dynamic_attr() traversal on Python 3.13+ to correctly
  propagate PyObject_VisitManagedDict() results.
- Fixed std::shared_ptr<T> fallback casting to avoid unnecessary
  copy-constructor instantiation in reference_internal paths.
- Updated setup-uv to the maintained GitHub Action tag scheme.
- Updated pre-commit hooks.
- Updated GitHub Actions dependencies, including actions-setup-cmake
  and cibuildwheel.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybind11_3.0.1.bb => python3-pybind11_3.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_3.0.1.bb => python3-pybind11_3.0.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_3.0.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pybind11_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_3.0.4.bb
index cc2f0c66dc..f3efed38b6 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_3.0.4.bb
@@ -7,7 +7,7 @@ DEPENDS = "\
     python3-ninja-native \
 "
 
-SRCREV = "f5fbe867d2d26e4a0a9177a51f6e568868ad3dc8"
+SRCREV = "d03662f0984f652b60e7ddce53d3868002275197"
 SRC_URI = "\
     git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
 "
-- 
2.47.3


