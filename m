Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EBEC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7728.1709714645633307130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OSQSWdIW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714646; x=1741250646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q4t/+ZU/H85Sw20CTyG9wmPgGDaSZ6qOZS/Uj6GCU3Q=;
  b=OSQSWdIWIEHkaykediT6av2d2t7RKQOwIrLHvkEOvZORSuiipQ95tRYb
   ibqLUe/cTt1BDzjjiwdTMi8wkMrsIL6ziM5dLcYxtigs/Nik/dUua6Syb
   9tDXo8ZJqtvoI0NU1cEbEt3nS6U82WhdX4vnnG5bDJXpmBc0cWoCt+6vt
   ubXxbUVyOOc67qlU6LMtjFsAuOwcgL6NDN3+M4ma+tsq7HJ+QIzFPs/qA
   igYaCDZMQ/h5zZV6BPsMPyp8aOf4b3vuzhVmhf/SYN6e8IN1HFOGHY3OG
   vbAlU1/jkMPKkfjc5v4F2y9a+b1qOSHIxVNPB32CfrMfdrNZfvcSPfEk9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151387259"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151387259"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5159AC6911
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 901D4F5D3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2042B41182
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C33381A006A;
	Wed,  6 Mar 2024 16:43:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 07/26] fetchmail: upgrade 6.4.37 -> 6.4.38
Date: Wed,  6 Mar 2024 16:43:09 +0800
Message-Id: <1709714608-19296-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--2.624200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrxZpjHSMI6w43UrsA6U4tpB4T
	INJI11UzUtTgmoNQjI3jpat90ryNNB5YNyGJc3vfgvmNrsT46HJUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiL1vtt3X2p0WeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNYV0eYt0m6yqJGtaSz0B0x0ODLo2Z7cjq0isRhW7vkCopm4Eu2HJnageCDv4FCjNNnwEp
	xKXRqH5XHatSpREXgOo5TKPdcMS5vK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109147

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-updates translations, and tightens OpenSSL/wolfSSL version requirements in order
 to track their security fixes and deprecations.

OpenSSL 3.0.9, 3.1.4, 3.2.0 and wolfSSL 5.6.2 (or newer on the respective compatible branches) remain supported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.37.bb => fetchmail_6.4.38.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.37.bb => fetchmail_6.4.38.bb} (92%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.37.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
similarity index 92%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.37.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
index 4560ef84c..587a47949 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.37.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "4a182e5d893e9abe6ac37ae71e542651fce6d606234fc735c2aaae18657e69ea"
+SRC_URI[sha256sum] = "a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905be609d9"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 
-- 
2.34.1


