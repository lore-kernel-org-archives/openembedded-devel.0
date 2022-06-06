Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D90C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:23:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.31338.1654518196993252492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tCI07fru;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518195; i=@fujitsu.com;
	bh=PgHrlBmyx6VxO6e5nX10XIVLHy3gzBE2vCfyxVu9Av4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tCI07frua5qzJKrKD7VYe4qvRU1+9ssjONvS6CtQSrJbOumO1Q7hJCE8HetTFEHpw
	 oBxGQ27PrvwZ/LL7RGKwNE4hH4dmKKf2a5+4bEl02GGuOwWDznHiwTUMzgURKNhYNV
	 ujEk8AXM85UI8/gTpTkihIqFco1eDz/9l+ruA/7MXDwRKtc5BkXvRzT8eLdZfubRgo
	 yAAwuM0vK4ooBf/KYVCRIfQCkelKXwRk9z3vBETRbjba7agKThkjAvbWI3tbqGshHU
	 5v93ezwQQh+U+QTMmpqmEQaQVsWXR6rUV9qpo+ecls+VBOyJb5hZceOnF+IfYf6HKi
	 0XTTZXJTmit7A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8MxSXfTx7l
  JBr2/VS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyH6w4xFbRwVixe+pulgXEVRxcjF4eQwBNG
  ibU7prFBOBeYJG7OPcwE4exmlJg1cQ1jFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC3hK9Tx6D1bAAxa9v/c4GYvMKOEqcvr4PzJYQUJCY8vA9WC+ngJPEvvUfmUBsIaCaUx
  OWM0LUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZszYBjVTTeLquU3MExgFZyFpn4WkfQE
  j0ypGm6SizPSMktzEzBxdQwMDXUNDU11LM11DYyO9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwFBOKU5o2cF4e98vvUOMkhxMSqK89tfmJgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4K37AJQTLEpNT61Iy8wBxhVMWoKDR0mE1/odUJq3uCAxtzgzHSJ1itGY4+qVK3uZOW
  Z+bTvALMSSl5+XKiXOe+s9UKkASGlGaR7cIFi8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwag
  kzLsY5B6ezLwSuH2vgE5hAjrF58EckFNKEhFSUg1M02VUklLdFZyZsy6m2P4KcVFTmsEtP0fw
  4DGDfqZtO2Y3uRous0zveVkVF9RXrcyW8P7Z5P+3tEUtb3zNLFy0cqGE3OG7rU3qDR3ZgjXq8
  jtnnjrxIDObUcx1H/ebR8+Nkwtyp0hWFU38zuF8ufNreqZwFafdfMeM6d5ayhMYpj7J4foiVL
  v5iCK/guyFeWsy950OfzLp5PSfnHa8H34vdr0h81b29YuNNnekEvfHLWOyeXNiTo6F4IIDFes
  WdEjenGqlW7svoc4uIOffUVOtZX2yivpTX6rcTVS+8tP20fWS65/UbnPKhEX939B/U3LLmZC9
  ZeYd9X/u5C5YH9jBrc23PebslIMnZkvpPrqhxFKckWioxVxUnAgAXAWGhHIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1654518194!319698!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12045 invoked from network); 6 Jun 2022 12:23:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:23:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BF593100458
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 923861009BA
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:23:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] sshfs-fuse: upgrade 3.7.2 -> 3.7.3
Date: Mon, 6 Jun 2022 20:22:42 +0800
Message-ID: <1654518164-9091-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
References: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97425

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} (93%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
similarity index 93%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index b839c26e9..f91e682d2 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https"
-SRCREV = "9700b353700589dcc462205c638bcb40219a49c2"
+SRCREV = "c91eb9a9a992f1a36c49a8e6f1146e45b5e1c8e7"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig ptest
-- 
2.25.1


