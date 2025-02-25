Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74225C28B21
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2304.1740525903703602786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=akPOyCi9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525904; x=1772061904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yGPAH/6CgPZVNo8fvfdFFycxBmWykh80Dcxvy+gAsIE=;
  b=akPOyCi9YvwnlYu2zxKS/ID59S1oIQosIzYdFHcNPFzDi42Q1PJpThaJ
   WhXMEKlo2T1A2YZIbu4rY98hKXj8GqDr7OWzbvrIwHZFq4pt+A3j3KhGJ
   n+2I7eyIX3Kq3Rt5LuPeaMe4ZFZSD8dHb8/1KZuDTxW+ruQYUCoa+shaS
   jO0vHw8qZgScTTssl0cFcj8gnfdK1Ef6a8MvzlQZGev3zUg8sEmtktwrs
   5oUvhwB+iaBzhPK2yVuzagZY6ydZPegoy+4uU8utJaoY4/+U8m/fMldjt
   uAfKPPRrKWS2PcnClqq6ApZaZBHJseqgNSgNWStepj+CoA3qtGKO8PJ4h
   w==;
X-CSE-ConnectionGUID: EDAhOCzVTJOZm/9jDGtwNw==
X-CSE-MsgGUID: J21DGYdDSGm0fQyHyaEciw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191193470"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191193470"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BEE88D6EAA
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 85E99C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B6C31A0073;
	Wed, 26 Feb 2025 07:24:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/51] python3-pyephem: upgrade 4.1.6 -> 4.2
Date: Wed, 26 Feb 2025 07:24:26 +0800
Message-Id: <1740525881-21103-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115638

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The Moon's visual magnitude formula has been upgraded, so its ".mag"
  should more closely match other modern estimates of its brightness.

- Fix: the routines to find risings and settings would on rare occasion
  run forever (usually for sunrises or sunsets at very high latitude).
  They now limit their running time and refuse to run forever.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyephem_4.1.6.bb => python3-pyephem_4.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.1.6.bb => python3-pyephem_4.2.bb} (77%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.6.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
similarity index 77%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.6.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
index c3b151508c..428876e4af 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.6.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] = "0ed2e4ea76f9db3eede2204adab8af3f1708201c7c04ee8511e710a54ca6425f"
+SRC_URI[sha256sum] = "3c4fd64f453e8f40cf862420a70da95a71b6487ace75e8e0cf85d73707db6065"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.43.0


