Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BC2C2BC81
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2490.1718161123300457061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LMHDb44e;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161124; x=1749697124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rmN2TLZ/h7MLv99o8Af7lMOtx03D/TeDGwG13tR86N0=;
  b=LMHDb44ejna678+oQb9I0OQ5OFsbkSI+AGpQN3As6Yc3Ews/oaqLsxk7
   GW+tPzKUNQksD7KsDNRmjsfa8LZ1+dHycuOBGxrn8b4q6sBuIzFcY2oxC
   55VMcI2g7sPtxys2LhsQaC+F6PoikSriaLoAw4lNHs/vAU8+SdISaVppD
   jjkr1siT5noiG5dMAjKfUssiIrMfOXFpd6mMKdpYVFZxB5R/77o0OUucE
   8J7QQtEENde6uRTGAw+raAaPI2lwu0zctmy0mljToRngfdxFjMTQE8qG7
   6yGe7imd/mMQ06nnKE4lXsVPMpBGEmZZUM0k3JW1C693wpUPhLPm61pg7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162860613"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162860613"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DEA2C9442
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D8C4D50E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FA73401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D19911A0002;
	Wed, 12 Jun 2024 10:58:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/43] python3-httpcore: upgrade 1.0.3 -> 1.0.5
Date: Wed, 12 Jun 2024 10:57:46 +0800
Message-Id: <1718161096-29710-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--4.718100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrtg1zuDHEymTRjBmBWsa9RAjJ
	lierVE/nAJsEuJ5wWLk4+VXOzR4JX8RtFnzWZcivG8wrEcD1583YUDvAr2Y/18iCh8yBqE+txnU
	XzyseixytgEaUTNG8EA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMlEUcFKGSVXhpRLQyclUfPIfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDjsp/
	j2C5oBXoR69+Ej++iaA0EUv242OwgNomPs40HM3GZ0o0UBnzfKNEXni7wG+/KVNLkdkrOxOapre
	cmxf6E0UlmYF566VfoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110853

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Handle EndOfStream exception for anyio backend.
- Allow trio 0.25.* series in package dependancies.
- Add target request extension.
- Fix support for connection Upgrade and CONNECT when some data in the stream has been read.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httpcore_1.0.3.bb => python3-httpcore_1.0.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpcore_1.0.3.bb => python3-httpcore_1.0.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-httpcore_1.0.3.bb b/meta-python/recipes-devtools/python/python3-httpcore_1.0.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-httpcore_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-httpcore_1.0.5.bb
index 203bfd48a..6b0f8af4d 100644
--- a/meta-python/recipes-devtools/python/python3-httpcore_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-httpcore_1.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1c1f23b073da202e1f4f9e426490210c"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "5c0f9546ad17dac4d0772b0808856eb616eb8b48ce94f49ed819fd6982a8a544"
+SRC_URI[sha256sum] = "34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.34.1


