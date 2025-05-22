Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7104AC54F30
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:12:59 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.22589.1747915974998421766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 05:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: renesas.com, ip: 210.160.252.171, mailfrom: chris.paterson2@renesas.com)
X-CSE-ConnectionGUID: cS1Mf3+dRJC4v/LLjLXGAw==
X-CSE-MsgGUID: WRSyz8U1TMCw/frTzP1Auw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 May 2025 21:12:54 +0900
Received: from spl2-146.localdomain (unknown [10.226.92.133])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2EECA4006CA4;
	Thu, 22 May 2025 21:12:52 +0900 (JST)
From: Chris Paterson <chris.paterson2@renesas.com>
To: openembedded-devel@lists.openembedded.org
Cc: paul.barker.ct@bp.renesas.com,
	Chris Paterson <chris.paterson2@renesas.com>
Subject: [meta-oe][walnascar][PATCH] kernel-hardening-checker: Set recipe as machine specific
Date: Thu, 22 May 2025 13:12:41 +0100
Message-ID: <20250522121243.4140107-2-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522121243.4140107-1-chris.paterson2@renesas.com>
References: <20250522121243.4140107-1-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 12:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117587

This fixes an issue where running the test_machine_signatures
yocto-layer-check tst case fails when using a BSP layer that depends on
meta-oe.
e.g.

bitbake-diffsigs -t kernel-hardening-checker do_create_package_spdx -s 6397093de4edf0eb568d56526704b178944f788bf0d0bdc8f6ce1b181ee00baa 8adadf9e2c0461de5c377b9a0590f6c05b03ff8c1b8eb89fff94e5c3235a0c9a
Hash for task dependency linux-cip:do_create_spdx changed from 4db4e1b424d7969ba80c8e03450ec70e88bab266b1e43054381ab1c572cf580a to bfebcc3195aa0106630e2d3cf7fc8335df8768ad059143d54f715b399eea8b69
Hash for task dependency linux-cip:do_collect_spdx_deps changed from ae22171bab2f456b4743fb0ca05de91a16b65fe6bbddd4cb97d2ed04e5d4f651 to e43ed3f2cee8198d91535ce38057d996cdb8e72c10d7509c2542e6676782ebdc
Hash for task dependency linux-cip:do_unpack changed from 6cf2e7fd1e1d67578f6bed761378953f91a8a58df0107698cc259c1989674da1 to 5d98fa31606f06f0e4416f9df82f97fdc6f63799b65486912dc4a3fc7f871f3c
  basehash changed from 556fad4e4426a9390de6ccdcc631aeb35d391ccc9676f6a4810237e2f501cf85 to 72beced62420cc92f276f8a31cd4de3d6f9e3877b14fff9d82ff7d863855b7da
    Variable MACHINE value changed from 'hihope-rzg2h' to 'hihope-rzg2m'

Link: https://lists.openembedded.org/g/openembedded-devel/topic/issue_meta_oe_walnascar/113168928
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 .../kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
index 1daf5d8c7055..f4816e733bfe 100644
--- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
@@ -17,6 +17,8 @@ SRCREV = "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
 
 S = "${UNPACKDIR}/git"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 RDEPENDS:${PN} = "\
     python3-json \
 "
-- 
2.43.0


