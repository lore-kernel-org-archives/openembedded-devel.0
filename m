Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13579CD6E4A
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:39:18 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20590.1763029529165652350
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 02:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U+b+T647;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=895; q=dns/txt;
  s=iport01; t=1763029529; x=1764239129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2ABT9XcYVDfzYWMyaDANVqgeKIQ1lAFgsuK71VO0WJ8=;
  b=U+b+T647uHsPJrc0uXDHuQqfraUlG/cXOOT7XSlJoEFSWV5vFXe5kcD1
   Q/9rqUSVSCapJ4Z7HzeVoIlKo4hUDZY7LkST2102Ux58tZ9BgcXJ0MKsZ
   SXi95c5y/9tWZK3IQSc4wGzsX4bc4/syQBgpyD+wbSajtx6mMdmj77ewt
   rTwkMZbfvlFRDKbm4e+7uSZzUXfe30UkEpTPdL7s8jtyuDA8EP+Pfwq4O
   QO7hd2h4E1uUy5gY6U31x7LQ9xrQOZ2lhBPTsvuyrDUqz0ADwClLDspgD
   kKLmnJvCE9qcNfl/JTM8Co5BS4hEN5JXirbTIC2s3XZRcUl/4AQfXWrx6
   Q==;
X-CSE-ConnectionGUID: mlrirVn0S+2GjJ6rQEpjag==
X-CSE-MsgGUID: GoWbW+BJTgG8WbvR+ATdTw==
X-IPAS-Result: =?us-ascii?q?A0C7BQC3sBVp/5H/Ja1ahSB7XUNJoi+UNQ8BAQEPMSAEA?=
 =?us-ascii?q?QGFB4xcAiY4EwECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?lyGXTYBGAEtMFELRIMCAYI6AzYDsTOCLIEBgygB2hUNgluBSoU7gnmFHWgIA?=
 =?us-ascii?q?YR4JxsbgXKEfYEFgRqCDGWFdwSCIoEOgXqELYIkA0qQREiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWMDNQwLKhVuMh2BJEEYcYRdImgPBoESg1EGg3OFIw+KTwMLGA1IESw3F?=
 =?us-ascii?q?BsGPm4HlBaCfIEOliGDGY8Si3eUJnEKKIN0jB6PPYV8GjOEBKZnmQaCWI85k?=
 =?us-ascii?q?keEaYF/JYFZcBWDIglJGQ+OOMddJTICOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:8WxKBaxtuSSA0FbCOnh6t+c2xyrEfRIJ4+MujC+fZmUNrF6WrkVUy
 2MaW2vVOa3YYWGkKdkiOovg8kMHucOEndBjQFdtrVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 IKaT/H3Ygf/hmctazlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEQyJ4wCxOAvOiIU2
 v46dio0QwiBju3jldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tO6kgX/weidVgFmUvqEwpWPUyWSd1ZCxaoGOKofTFZk9ckCwi
 WX59Vu6KDMmO/PP9jCbyDGFuuPzgnauMG4VPPjinhJwu3WJz25VCx0bUHO0pPC4jgi1XNc3A
 0sM9ywjqKI/+ECmQpzxUgO1pFaAvwUAQJxXC+A85QSHx6bY7grfAXILJhZHadorqNM7bSAq2
 1+OmN/oCDJuqrjTQnWYnop4thuoMiQTaGtHbigeQE5ds5/ooZo4iVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1K5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:gSIX16hm+YELbc2deQmMZ7gB9HBQXtEji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41gPW
 MKSdkYNDU2ZmIK6frH3A==
X-Talos-CUID: 9a23:5zJtXmAsbhZXpar6Eyxj7k8OJMZ9ST6H43XyfVWBJH5rQbLAHA==
X-Talos-MUID: 9a23:llmBVAiimoZlyV/mSY3RbcMpG8BX6ZvtImIxnrpWhMOaD29ZBzuhk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.19,301,1754956800"; 
   d="scan'208";a="423383184"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Nov 2025 10:25:28 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 42F4818000449;
	Thu, 13 Nov 2025 10:25:28 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id DF13ACC1288; Thu, 13 Nov 2025 02:25:27 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>, Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH] redis: Update status for CVE-2022-3734
Date: Thu, 13 Nov 2025 02:25:00 -0800
Message-ID: <20251113102459.3739007-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121649

From: Ninette Adhikari <ninette@thehoodiefirm.com>

CVE only applies for Windows.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 36bb521a136d0ac1061b06e3326abc316a40481a)
Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index a1739b4f30..a601e060f1 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -70,3 +70,5 @@ INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
+
+CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
-- 
2.44.1


