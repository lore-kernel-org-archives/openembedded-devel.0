Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31948C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.35403.1745311786548124159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ctiSYCEQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311786; x=1776847786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Q8X1pdk6CcYgSRX/B4zCvINxiO9Hy7UQVbIIwwmRB4g=;
  b=ctiSYCEQXh4F9zott//kqDZ1UhzC4xgOh3kVzGVqIbVr9oSfR2vZaXm6
   HWjakh4XfAtXTyDM7wTiA7RpCqSvcU9+yYaKrg4eHC2sQcr5JMjQeH2ix
   LZb38fRkEA+SJ+nKitJMpg458s3GhzMEGuCNrHT/nf2LLgaPCdCmMQGyj
   PElC+5b0uFYpO+YX9xnmejW5+v6SdOF5aXiA30RIKl78hpkf7VGTO01ke
   LyTReB4+NAH/6fOWwz9KOmoOLbSfG1/fyEtRIxhD+E2DEs3yQaD73FyBR
   UAVkSDiG7vCPXnmClWrBmBq/XVA6Vj83E22aOe8unuCAesa3H1wBjsqZn
   Q==;
X-CSE-ConnectionGUID: D6Mq5xZURC+Z3q2hoJGB8Q==
X-CSE-MsgGUID: Sl4l+SfsR46iwEzttmFs5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="185268200"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="185268200"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F3860D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A6293D3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A1E51A0078;
	Tue, 22 Apr 2025 16:49:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/30] libmime-types-perl: upgrade 2.27 -> 2.28
Date: Tue, 22 Apr 2025 16:48:55 +0800
Message-Id: <1745311761-1912-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117046

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
- some 'deprecated' texts made it to types.db.

Improvements:
- text/ecmascript RFC9239
- default charsets according to RFC6657
- update reference to specs RFC6838 and RFC9694
- iana updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmime-types-perl_2.27.bb => libmime-types-perl_2.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.27.bb => libmime-types-perl_2.28.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.27.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.27.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
index 2f73d67aea..d8203f4353 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.27.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "276cd4488bf1d4f477d67a05d4d0c10512b18ef25f9e06d21b34ce69e64f8bdc"
+SRC_URI[sha256sum] = "7099cb5133401acc92d8fb0fd398cac682140be0680e7dfcb4aaf40315a2dfca"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.43.0


