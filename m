Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50B3C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 19:39:07 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.25788.1639251546901326691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 11:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Wy+IWpNy;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.182, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f182.google.com with SMTP id u22so18244797lju.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 11:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfXaLvnbmKKFI7EzW+6iSivjP7DC6rjlPPsLLQQp7LM=;
        b=Wy+IWpNysJs69jfj75WL/VuBf6PSjlPyvnHSpgFjBMLUKg3SepvSjlICOX1HzwSuxV
         AIi91r+5Q/zfofZjBpciCjKzi9x/Q5J0xybQ0H0aiNuDTyGdhoKslsMVi9e0/g6dAn4N
         ProAMRqb0yTtJsQuP7Wkpk/oiqLQGQtBOnCnCp3bDLpn9mcXFiT2y8gWKKj/gn3dLPqX
         0Y8xrGfOnMVuGWYZudnmmt2Ok8RJF9VaiXk8nVZfnA/6jUvkAkS47cScdcBj7mM8hY33
         madE+GwHgJacqkFOY2FNI88JfMIuDvRjz0OiJgmkpjqD9REgWA3j3LmkskUtdqBckoBj
         w48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfXaLvnbmKKFI7EzW+6iSivjP7DC6rjlPPsLLQQp7LM=;
        b=aYXfM++gX9NNK+hLIiUNnplt+1qeeqizdzMBJGi/BDO3nkuDLX6xVgAgGE6Ooiz1yp
         GMxommlKkVAABZwc2JEqdEsQJoBLP6Jgh7ajMSYcwCjI0psrvYrlZeRBFT5b1gqSoE6T
         pRvnIaVG41zON311/EJX2WE9WvDhrgQz2xJ0ktWVVSQOMz8ZeF/dB1Y0ZN2WFMuC8oP8
         omy/viiPGmj60UUG2sT7OHm4zpm7kkXt1t2mbPdLuyPoZqjA4CM9E2XO3+KkXvg8H+lX
         65o5R86Wqm44L+ZShiteu2ozzW7IrHp8CACCCG7GJRYr5v9Jp3kIo73D8iAMF9RnPuV1
         0row==
X-Gm-Message-State: AOAM53136272AVeF0ako8W7RinYs93TNcaED1W+RuKB/JFeKoXHZaU5Q
	e7j1kmfIQWhBP9Zka19e1yse/w45iHxOuQic
X-Google-Smtp-Source: 
 ABdhPJz8fwUVsiXUj+n5PYe3tpuuHGBQE8KX+FWh9bd/gQ0hpwMuoiZ1NEs5Xk5c6yjBMwFhSAhC/Q==
X-Received: by 2002:a2e:bf1e:: with SMTP id
 c30mr13085519ljr.408.1639251544641;
        Sat, 11 Dec 2021 11:39:04 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 q1sm738853lfo.255.2021.12.11.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:39:04 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-ldap: update to 3.4.0
Date: Sat, 11 Dec 2021 20:39:02 +0100
Message-Id: <20211211193902.2578276-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 19:39:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94298

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-ldap_3.3.1.bb => python3-ldap_3.4.0.bb} | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-devtools/python/{python3-ldap_3.3.1.bb => python3-ldap_3.4.0.bb} (81%)

diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.3.1.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
similarity index 81%
rename from meta-networking/recipes-devtools/python/python3-ldap_3.3.1.bb
rename to meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
index cd745ee3e..42f113d5f 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.3.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
@@ -1,22 +1,19 @@
-#
-# Copyright (C) 2012 Wind River Systems, Inc.
-#
 SUMMARY = "Provides a wrapper in Python to LDAP"
 DESCRIPTION = "This module provides access to the LDAP \
 (Lightweight Directory Access Protocol) through Python operations \
 instead of C API. The module mainly acts as a wrapper for the \
 OpenLDAP 2.x libraries. Errors will appear as exceptions."
-
-LICENSE = "PSF"
 HOMEPAGE = "http://www.python-ldap.org/"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
+
 DEPENDS = "python3 openldap cyrus-sasl"
 
 PYPI_PACKAGE = "python-ldap"
+
 inherit pypi setuptools3
 
-LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
-SRC_URI[md5sum] = "7608579722c491e42f5f63b3f88a95fb"
-SRC_URI[sha256sum] = "4711cacf013e298754abd70058ccc995758177fb425f1c2d30e71adfc1d00aa5"
+SRC_URI[sha256sum] = "60464c8fc25e71e0fd40449a24eae482dcd0fb7fcf823e7de627a6525b3e0d12"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
-- 
2.25.1


