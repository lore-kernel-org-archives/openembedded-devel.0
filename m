Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED71EC4743E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.8091.1649749309262271389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jrE44lB1;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649749309; x=1681285309;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WCAU5CJcRx9ebYJcrjktfJn0dOEfyZQBz22r+s1AUDQ=;
  b=jrE44lB1gkf7KyPFC8Km7O6oWYo5goYaK780CAdxTF08/Cz7p3tcFnT7
   7bSlu8xyKE8M+2Z7mSfcNJFlVX62YzeIBFQtsm5WhnNBhE+7ToK6MI7Jr
   EmgHPfJZHhv+8QB1T1rv/AcN5pwwekVcDyK7RlCEGdYt6PLb1NEcjargC
   0plvuOiOrxde6O1i0/cA6ZlsEefcDx8hrAp2ub4RJ2/+ASMZeOIPPbuvT
   LGNlTKWtKDYOW7hh6lgzbmaVw2zjbQjwrIqLAiDWJ5bdJoZn1U7vxI5u5
   65jxwtXolj/8nrujxOBlY7ijSKWGbmiDD21T0u4tBu8CELecZu6vGnN1G
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="348741097"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400";
   d="scan'208";a="348741097"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 00:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400";
   d="scan'208";a="724332830"
Received: from laukarnkye-ilabpg12.png.intel.com ([10.88.229.19])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 00:41:47 -0700
From: karn.jye.lau@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] icewm:include imlib2-loaders package
Date: Tue, 12 Apr 2022 03:41:25 -0400
Message-Id: <20220412074125.53472-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96582

From: KARN JYE LAU <karn.jye.lau@intel.com>

icewm 2.0.0 above have use imlib2 as default
rendering engine.Update icewm  recipe to include
the essential packages for icewm to work properly.

Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
---
 meta-oe/recipes-extended/icewm/icewm_2.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
index dac025de7..47d419fe0 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
@@ -23,7 +23,7 @@ DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf imlib2	libxft libxpm li
     libxinerama libice libsm libx11 libxext libxrender libxcomposite libxdamage \
     libxfixes"
 DEPENDS:append = " qemu-native"
-RDEPENDS:${PN} = "perl fribidi"
+RDEPENDS:${PN} = "perl fribidi imlib2 imlib2-loaders"
 
 do_compile:prepend:class-target() {
 
-- 
2.25.1


