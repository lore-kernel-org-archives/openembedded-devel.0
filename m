Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DEACCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.4763.1761099766456487404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mfqXY3n6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099766; x=1792635766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTZac4Op+lHiEhMDJHJTZh3F3llckU8E2bIHfJffMig=;
  b=mfqXY3n6dj97NXmI2b87Kgb+A6gaEb0MLFBwZAUOAT5O5PqXsrXz/sN/
   f8yQHUi3vcWx3mLIc3EjY8iIUQ+A0c0h33W+GkbmponLh4RFs/VVYu4J4
   oS/JBg30I4sKBkDx2Bxl72LtCKGQJGSeG4OEhu3xegRt4xFjUjx4f6AWq
   cZL4UydBIU7am1ytRKx3qJ8Sh8XVvz8+1zJ/p7RZULNswHAMjIQPSYgKu
   xyLKyYaXAov5O4lf9atgrFemSg+OEMgZAYm4nYGMqkvHrMvQcLlM8zSIh
   7O8binUrIr5UZ8XcrOZFtf8B87r/6sB7yN28YH1ISntY82Hsvk4I9Hn8R
   Q==;
X-CSE-ConnectionGUID: cVRSgVRQTyyNfwBdlVWCXw==
X-CSE-MsgGUID: 9xujFMi+QWK3BstKjujlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216654644"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216654644"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B702E1C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:44 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6E58BC006FE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BAC2482C0DB;
	Wed, 22 Oct 2025 02:22:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 06/29] libhtml-tree-perl: upgrade 5.06 -> 5.07
Date: Wed, 22 Oct 2025 10:22:02 +0800
Message-ID: <20251022022227.226-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120853

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Workaround more @INC issues with Module::Build and sudo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libhtml-tree-perl_5.06.bb => libhtml-tree-perl_5.07.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-tree-perl_5.06.bb => libhtml-tree-perl_5.07.bb} (94%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.06.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
similarity index 94%
rename from meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.06.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
index bcc248d896..e6c28578ae 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.06.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=88;endline=105;md5=260d31d3137065894
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KE/KENTNL/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[sha256sum] = "9c36eb19cbdf9a5906c858948ca51c35bd7561f52cc18c43281acbe57327536e"
+SRC_URI[sha256sum] = "f0374db84731c204b86c1d5b90975fef0d30a86bd9def919343e554e31a9dbbf"
 
 S = "${UNPACKDIR}/HTML-Tree-${PV}"
 
-- 
2.43.0


