Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D0C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16491.1747731318041994850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Chgh/+Sl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731318; x=1779267318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fX00D6Rc45SEC8ofwvAr5Cl+6bT5CKtRbgE13Rusu8w=;
  b=Chgh/+SlAGSMwwZIfTO9DbZOUbcHi8w7QnK+cy18dFdGx/QOvs9V/46W
   7mh7oZMcHiZzlN1CcWNQg+68c+HGOqRARHIZdFhgxtxSbed4sSHWVzYuF
   roOfjZkOrWHg+8Wf0+05nWFPsQtNRu4ukM3pGM5FmDTvEUl5YcNiEmlJr
   WC3WQH1DT/p91MntbHTr1TktRaJ5+vsFy1hBB0lsnkfNalYHqKY41z4jR
   4tEGriqHjFtzvnYdVub+Gfz7AG5HLnCR1NdnuMEbjYVZFO6BV9Tfx+0CY
   MFPutVR4HOtnHYCeKKnBhVUAgirXFdsGrxHRYl9tVnSoDlaNmoR1lRKid
   A==;
X-CSE-ConnectionGUID: 5aBPknS/TTOG8kngPXBmpw==
X-CSE-MsgGUID: StIfhezkSpCn/wFK+ha5cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="188447044"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="188447044"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A5C48E8FE0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67B82D7293
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F0E9B1A0078;
	Tue, 20 May 2025 16:55:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/27] liburi-perl: upgrade 5.31 -> 5.32
Date: Tue, 20 May 2025 16:54:43 +0800
Message-Id: <1747731299-20448-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117493

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add authority() to URI::otpauth
- Implement URI::smb for Samba/CIFS
- Silence warnings issued in t/otpauth.t

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburi/{liburi-perl_5.31.bb => liburi-perl_5.32.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/liburi/{liburi-perl_5.31.bb => liburi-perl_5.32.bb} (94%)

diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
similarity index 94%
rename from meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb
rename to meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
index e23942b81e..604b046f0d 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.31.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564"
+SRC_URI[sha256sum] = "9632067d34e14e0dae2da94631c4f25a387fcc48d06fa29330e8b3c04c4e913d"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.43.0


