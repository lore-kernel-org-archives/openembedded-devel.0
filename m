Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D813AC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:37:56 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3580.1787218674286431861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ltx0Y/A/;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=894; q=dns/txt;
  s=iport01; t=1787218674; x=1788428274;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TFP/7BNmL2sEY5Tfe34gkKGndv1qVDoCYwAp8BO0tF8=;
  b=ltx0Y/A/1Xx8q+4eGLqDhiAoNNyHjzOQXzIFAUg9wBcJNPQSlzt8cVPy
   Pme9n59HkbtA6DOB/004GpH+y5i7PTgr8dNYCUl71DJjtZtaw478GhbAL
   exo9yL2jGdDpgIFIoYrn+WdAguJwNLWtCZgGGkOZG6+K47S5tHTOWJ+c1
   oRY5vk0UKiXaBqpYOAN/ZZww4yMJtM4QyI4fowScAU/tHzFFOQlU5Ll4w
   jDiF3hCqIRK+XXDc4R++Ori+sE4wZoQTg6A3Zr6aoy5e7/CgvJ4yP/3pH
   /kjA/0tTGFFUbTkPmYvK70GXQjOiXCwi/t+3SJ0KauKhWAS1cUEsIXtFz
   w==;
X-CSE-ConnectionGUID: v+n82rQmS8Klp0i5fLXUTg==
X-CSE-MsgGUID: HlqBO/0JQRGmMW9DozOtLA==
X-IPAS-Result: =?us-ascii?q?A0DDAgCKyoZq/4sQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBY1tAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdNgFGMFxEgwIBgnQDwl6CLIEBhH3bMAELFAEFgTOFP4gihXInG?=
 =?us-ascii?q?xuBcoR+gmECgTR5hXgEgiKBDIF4kVJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOC?=
 =?us-ascii?q?RcLGA1IESw3FBkEPm4HjlEggkuBDiyBbaY1oQ8KKIN2jCGVOhozhVulES6YW?=
 =?us-ascii?q?os3mGw3hGmBaQE6gVlwFYMiCUoZD5IjzDknMj8HAgcPApNxAQE?=
IronPort-Data: A9a23:hPXiEK4FAent1x73DS3IDgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mdKWWDVOKmJMWPwedx+PImzoENXvZKEx9VkQAtt/301Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOe9/RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eI84eqrxtOGR1p
 d8cMGgMMx6nt9+Kz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOEwn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYICEJILSH5UE9qqej
 kLC5k7eRUk4DeawzB+6o16rlMjTuQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uv8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Ex6hd6HP241H2pQQpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3Atrjbc2sYzUTUMg/OvsIbwz306Is7MXuNlm3pJnT?=
 =?us-ascii?q?oKmJxELzIR3ugxZ9rxp8=3D?=
X-Talos-MUID: 9a23:k7JESAlTvNZBnPjjRJvKdnpCMN5CxOP2Knk3vpAjhJioMj5XJxO02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="829660289"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:37:53 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 674CD180001B8;
	Thu, 20 Aug 2026 09:37:53 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 0C7E3CC12A6; Thu, 20 Aug 2026 02:37:53 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][PATCH] go-logrus: correct CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 02:37:53 -0700
Message-Id: <20260820093753.43396-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129387

From: Devansh Patel <devanshp@cisco.com>

The default "go-logrus" product does not match the packaged Logrus identity in NVD, so its CVE records are not associated with the recipe.

Use "turbopuffer:logrus", the exact NVD identity for the github.com/sirupsen/logrus source.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 recipes-devtools/go/go-logrus_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index 7b9e31a5..4f8a255e 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://${PKG_NAME};branch=master;protocol=https"
 SRCREV = "a29884b9be3dc22c18338c0fe5a51d23e69731e4"
 PV = "1.9.4+git"
 
+CVE_PRODUCT = "turbopuffer:logrus"
+
 inherit meta-virt-depreciated-warning
 
 do_install() {
-- 
2.35.6

