Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF77C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:31:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9439.1635327096417674987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cKH3o2nR;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id g7so1916632wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HMrnhvw3zw1XRsz66okK3QDehdAuoe6NxT/kP8Enoxc=;
        b=cKH3o2nRwoQI+xn7RT3mUpmvTfnBEL4coUVtaSvUMWk2+k/oEa38YfW0IYLy0RxIcT
         9xON52fxsS/9GGFGVaYSFS1rWdCNzMt98A4s7yqUDeUNA+1yRPwUjp6SMUeOgswzDj9Q
         mUDLELbqdREgrCunAixn0WiuHihLKrCxd2YYeA4nugx/n9CaH/QpHZNYeA6kgWpn5rkp
         QvEQJXUhlQ77862x+8UAYlCNrllvxBeL0B3ZiZt30ypJq2h71d7BG0pgg++DdCOpoY+W
         h20nUw4PThHLL1geMLDtVk5vbLeAc81O4jUeoXjEtsVjREbh0c8AHiNsvCos7ToqXDNQ
         5KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HMrnhvw3zw1XRsz66okK3QDehdAuoe6NxT/kP8Enoxc=;
        b=YT5avpSoev22yUqU2ygEPBEEHpxlbdnqT1fAe79EcmlJY1uHS8g/Nk4hENxhIg2Ze8
         sd9bjaPP7Q0vM31YXYPC/cNlGZrNanw2QTOoTVcPumHWvLohYqdFwgLzkT0S8MUt+usX
         jIOexUnAYunULDeCZ5w6bI49mpmlrbDYFsPzS78LAdFx+erG/fHrbrzQYCTCRi4R5KuB
         beN5wYBDgC5TKyv1pWdErGTe9ItHVoqJfytD9i8u8eikykO5CebGGEeDJ4D3O8KXHeIQ
         qV/YVyBW6G9S3kSSmrx0PF7x6Rs3oxSg5qEHys9m9mq7gNR57KKTz0MU3wm1RgsEe806
         JmRQ==
X-Gm-Message-State: AOAM5306o7bRXdExlddQL4B+fv2WDmeS8/d1WmRKFuHzoL3/CjbNv2YY
	10MXB4LgAYlGEJCFBzHOvgILBz0g870=
X-Google-Smtp-Source: 
 ABdhPJzz2jffLVoqxK1MpoGYmUMjrnE0Eie0tIUaDR4jcCbadsGuQkUEqhQI6oOPUV4nD6EAU1mDGA==
X-Received: by 2002:a05:6000:151:: with SMTP id
 r17mr11201799wrx.19.1635327094671;
        Wed, 27 Oct 2021 02:31:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 t12sm3009880wmq.44.2021.10.27.02.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:31:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-pywbem-native: openlmi-tools: blacklist
 due to openssl-3
Date: Wed, 27 Oct 2021 11:31:32 +0200
Message-Id: <20211027093132.11352-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 09:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93625

* blacklist python-pywbem-native as well, because native python-m2crypto is blacklisted:
  ERROR: Nothing PROVIDES 'python-m2crypto-native' (but virtual:native:meta-python2/recipes-extended/pywbem/python-pywbem_0.15.0.bb DEPENDS on or otherwise requires it)
  python-m2crypto-native was skipped: Recipe is blacklisted: Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?

* move openlmi-tools blacklist from python2-target-recipes-blacklist.inc to
  layer.conf, because python-pywbem/python-m2crypto are blacklisted even
  when python2-target-recipes-blacklist.inc isn't included in DISTRO config
  so openlmi-tools need the same to fix:

  ERROR: Nothing PROVIDES 'python-m2crypto' (but meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb DEPENDS on or otherwise requires it)
  python-m2crypto was skipped: Recipe is blacklisted: Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?
  ERROR: Nothing PROVIDES 'python-pywbem' (but meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb DEPENDS on or otherwise requires it)
  python-pywbem was skipped: Recipe is blacklisted: depends on python-m2crypto which fails to build with openssl-3
  ERROR: Nothing RPROVIDES 'openlmi-tools' (but meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'openlmi-tools'
  NOTE: Runtime target 'openlmi-tools' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['openlmi-tools']
  ERROR: Nothing RPROVIDES 'openlmi-tools-dev' (but meta-openembedded/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'openlmi-tools-dev'
  NOTE: Runtime target 'openlmi-tools-dev' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['openlmi-tools-dev']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 3 ---
 conf/layer.conf                                          | 4 ++++
 recipes-extended/pywbem/python-pywbem_0.15.0.bb          | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index 9480297..9b9a0eb 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -7,6 +7,3 @@ RDEPENDS:packagegroup-meta-oe-dbs-python2:remove = "${@bb.utils.contains('I_SWEA
 # meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
 PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 RDEPENDS:packagegroup-meta-oe-support-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
-# meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
-PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-RDEPENDS:packagegroup-meta-oe-extended-python2:remove = "openlmi-tools"
diff --git a/conf/layer.conf b/conf/layer.conf
index 2142b9a..4b3a106 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -17,3 +17,7 @@ LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 LAYERSERIES_COMPAT_meta-python2 = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+# meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS:packagegroup-meta-oe-extended-python2:remove = "openlmi-tools"
diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index 6604452..40a0545 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -68,3 +68,4 @@ ALTERNATIVE_PRIORITY = "30"
 BBCLASSEXTEND = "native"
 
 PNBLACKLIST[python-pywbem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+PNBLACKLIST[python-pywbem-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-- 
2.32.0


