Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B51CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=n/uk5Rd9;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628675; x=1790164675;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qNaNR/VfKhTJhusWofiIATc91ZnyaiHANaPLl48t0fk=;
  b=n/uk5Rd9hXRNDC9gqaoCDsMJt04Lca/YkYIgn8TlCCQMoZpXe7XUPG4s
   AIaM7RbUNaOdLcGII1UgR0zn2KflWGnqDVHQQyF4+ZwaMGFjPeUsBb1rO
   kNhd2eAT+KtmggOY82hqVPmowdYFIgyuewzvNHrdrBVJTCMZuqtZlryQ2
   XwLxKgxju4MMkcZrExGcGMLUrpQXma8KbMOui6164Jr0Ts3jWoJkN/INT
   twB7vcBNC/x0XFjJnnPHH6vqh7BrztnS62nVZQhaHLyeCqp+RPENhfi+c
   ri2famdR2vRfttXEtBLDtoM5CP38eOc3m/x9kBxKFX6CX7zs0v6yrFuae
   g==;
X-CSE-ConnectionGUID: IQzdteZuRcaCopI79lnBLQ==
X-CSE-MsgGUID: YbfHH1AmRDKOJkT+LZKU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821787"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:55 -0700
X-CSE-ConnectionGUID: hg5fpbjCS5qMNqs9osB4nw==
X-CSE-MsgGUID: 3zxaKC2+SeabJe1O8523xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875180"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 09/24] gutenprint: 5.3.5
Date: Tue, 23 Sep 2025 19:57:12 +0800
Message-ID: <5856e22d34c7b9e07e2c0038d540616bf653aa9c.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119698

From: Zoltán Böszörményi <zboszor@gmail.com>

This fixes an installation error:

| make[5]: Entering directory '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
| chmod 700 .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
| chmod: cannot access '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint': No such file or directory

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (96%)

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
similarity index 96%
rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
index f90a123293..82953b798c 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
            file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
            "
-SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
+SRC_URI[sha256sum] = "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
 
 inherit autotools gettext pkgconfig
 

