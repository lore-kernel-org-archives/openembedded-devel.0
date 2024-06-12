Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CE7C41513
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2495.1718161135947040611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ngBIUbvN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161136; x=1749697136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O7mDsrCxfz68k4/IqTOk2KPl+wTG08QCOxIWB0Rc1E8=;
  b=ngBIUbvNR2nQc+B/FbTd9lqZTUGy7Wrozk+CB1spXXSpdWghwTskhH+7
   /wCkOr2E5jZvSUFVyGNkRTzQ0/JsqYzQ4Bsi06hsZT9/z4nT3A13tdZ3s
   CzFxCQQrUuaUFgGwaqDqijs5QYjOvQAb6zkEokLBqpjslTJqSG2fSTWBz
   fDFWuYqRZdwPT+NIyTQW+5ac+3ZT3UbSCepV0GxRhBRozXrSxiIlM47PP
   1D5JN2GXHx2ltbbfaDERmXR5EkHu/9IU5LSvhx5iBSLMREMq2E8rnIYSN
   zn+K1TeOCQHwXvQdXvFIG4hYggRXshmThq3nWSH/i2p1XjnVTFvM3e2nf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141806756"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141806756"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CEC62E8521
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DC66D50EB
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3CD520071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 330401A000C;
	Wed, 12 Jun 2024 10:58:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/43] qpdf: upgrade 11.8.0 -> 11.9.0
Date: Wed, 12 Jun 2024 10:58:10 +0800
Message-Id: <1718161096-29710-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--3.541700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwAYdq1VTXo03G
	PnUAzJ9Gb0e/hSBQP7DQQFefgqreCxo/F4wweNBue2nM+4d21MIpA2ExuipmWqzJm0wggd7naUX
	s6FguVy2iJGJGoluOFgXURz+hQhGV0DLYtdMjuDcReM8i8p3vgBCE2NlBjIjctE8mz+ry/JSiKN
	6R8ic9M+fbYRxKtAGdEiVVgKqFXk4fE8yM4pjsDwtuKBGekqUpnH7sbImOEBR4jebfxXeeaVGH/
	o+S6BoXeWcgwrRzLVGfnMI4iUDIO/+iHWQpX8sMTXA1UPwd8RXOBV3aQVUY5PQV+kLX3SxKt0J2
	Yq4EHp7sfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add ENABLE_COVERAGE cmake option to assist with generating
  coverage reports.
* From M. Holger: add QPDFObjectHandle::writeJSON to directly
  write a JSON representation to a pipeline.
* set the actual value based on the allowable non-/Off value in the normal
  appearance dictionary.
* Add fuzz testing for JSON.
* Add JSON::getDictItem (from m-holger)
* Allow --overlay and --underlay to be repeated.
* Add new command-line arguments --file and --range which can be
  used within --pages in place of positional arguments.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_11.8.0.bb => qpdf_11.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.8.0.bb => qpdf_11.9.0.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.8.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.9.0.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.8.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.9.0.bb
index a13c9a023..4778be42b 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.8.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.9.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "452e1f5c20ec6adf62cd296cb9dddacbc06e6ffa"
+SRCREV = "3b97c9bd266b7c32ea36d3536e22dab77412886d"
 
 inherit cmake pkgconfig gettext
 
-- 
2.34.1


