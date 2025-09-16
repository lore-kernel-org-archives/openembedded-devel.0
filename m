Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4B8CAC5AF
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15423.1758015724862104256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i3cQFVR/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015726; x=1789551726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTpi7Xh+2VimcKtX6OHpO1nWV0qnGv9F54D1JmX0iTU=;
  b=i3cQFVR/RRHEmDwf3HrAR6JdHdToSsmsY1TthFs6b5FLVsNItYDTt5ov
   U4b9yWrfiQbCh8af4ENQntWtPpCZQo8RFI9IyQVcAxjMblbfwDGnVqm6a
   Fs9VzkTr0bisLa7wtKPSlZNASN+ATIBYNTrNeipjNujDtocfkuz8ZTLoG
   vyLFcehmJFK6ldDgStRrbuGPkwLH4vp7ie9BmHP/iW1laosCZrFZMF+ms
   gO5VFMXOvMMZNVmdu32A5a/oL4nlk798RmPjQtbt7kepDltyVCAQRcGGn
   Y/Zcr76qFHxR5oHf1h3YrvF2AhLfWdpDDRB7QWyKu/KWL6/jZYbuqPyq3
   g==;
X-CSE-ConnectionGUID: i9aRJVxORLeLFCHz6g+q6A==
X-CSE-MsgGUID: kKds4EPZTR6oqxImD52Tbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200384941"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200384941"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A3A908203E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 607758D9B8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id C5A7018013E3;
	Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FB811A0087;
	Tue, 16 Sep 2025 17:42:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/42] nss: upgrade 3.115.1 -> 3.116
Date: Tue, 16 Sep 2025 17:41:26 +0800
Message-ID: <20250916094152.1479-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119436

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.115.1.bb => nss_3.116.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.115.1.bb => nss_3.116.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.115.1.bb b/meta-oe/recipes-support/nss/nss_3.116.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.115.1.bb
rename to meta-oe/recipes-support/nss/nss_3.116.bb
index 07cdb66f1b..cc115c4329 100644
--- a/meta-oe/recipes-support/nss/nss_3.115.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.116.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf"
+SRC_URI[sha256sum] = "3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


