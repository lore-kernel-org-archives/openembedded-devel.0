Return-Path: <dzagorui@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D168FC7EE2A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 12:22:39 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.20644.1684844550487939992
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 05:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=LaWZO/9a;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1045; q=dns/txt; s=iport;
  t=1684844550; x=1686054150;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bz6VCd14m/Q2Cr3FiT03GFtyebvHmuIOfAk7bHqvnfc=;
  b=LaWZO/9aEpQeuCI05GBhYjDcxStME8ssxQN+/kKbCEyvRiPUAd0ZgsOF
   bPVQMfhvL1auOLw2LZus/P3k2RijQfkhcR1N21JxE4n9FoNqHsunMB1Mw
   zWCKvmVkWwsf5ikn59RE8rTuu6PexJvt6iD8P1caMeJ5NZo/1PfsY5OYQ
   0=;
X-IPAS-Result: =?us-ascii?q?A0AiAQDarmxkmJJdJa1agliDJFVARrNygSUDVg8BAQENA?=
 =?us-ascii?q?QExEwQBAYphAiU0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBA?=
 =?us-ascii?q?QEBAQEeGQUOECeFaA2GPQGBU0SCfgGCXAOsBIIsgQGEdJprgWeBQowUhUonG?=
 =?us-ascii?q?4FJRIR+hAuBBoV1BI8pjHOBMHKBIz9pgQICCQIRZ4EOCGaBc0ACDWQLC2yBO?=
 =?us-ascii?q?4MGAgIRQgwVXQJqGhABEwMHBAKBDhAxBwQ3LAYJHTUtBl0HGRYkCRMVUweET?=
 =?us-ascii?q?QMJAwcFSUADCxgNUBEsNRQfBiYggQkYYwSCBE+cf4J+gQ6Bb3qkE6AhhA+Le?=
 =?us-ascii?q?ZUBGjOFVaN6mAmjWYQuAgQGBQIWgWM6gVszGggbFYMiCUkZD445gjWRPiQxO?=
 =?us-ascii?q?wIHCwEBAwmIbIF8XgEB?=
IronPort-Data: A9a23:GdREeqKO20mahwWrFE+RrpUlxSXFcZb7ZxGr2PjKsXjdYENS0zwHn
 2MYUGuHMqqPamf2fY9zbIjl9RgH7Z7XnIVrSgUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E39800k7wYbVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQRjkZoFFsUHdXxKjhqZuNwr0
 Phf6Ke/HFJB0q3kwIzxUjFCGC14eKZB4rKCeCD5us2IxEqAeHzpqxlsJBhpZstDpaAmWicXq
 aJwxDMlNnhvg8q60ru0TfNxh+woLdLgO8UUvXQIITTxU696Hs6TGv6iCdlw5GpuvOFEXsnia
 dMpeyVRRjKRT0JSAwJCYH45tL742iagG9FCk3qSvacx7m3ZwQB93bSoPNfLd9iiQcROgl3eo
 XrL+Wn8CBwWONGTjz2f/RqRavTnhyj3XscZE6e1s6cyxlaS3WcUThYRUDNXvMVVlGbvGO5hC
 XMP5hEzqIci00DxVvTvAia39SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVsctKnQIF+3CPRbWFyv
 mJlj+8FFhQ07+LIESP1GqO86GLtaXJMfAfucAddFVNdi+QPtr3fmf4mczqOOLS+gtuwEjbqz
 nXT9G41hq4YiogA0KDTEbH7b9CE+8Ghou0dv1W/soeZAuVRP9LNi2uAsgOz0Bq4BNzFJmRtR
 VBd8yRk0MgADIuWiAuGS/gXEbei6p6taWOM3QE/R8N9r2j2oxZPmLy8Bhkjei+F1e5ZJ1fUj
 LP74mu9GbcKZiLxNP8rC25PI5VwlsAM6ugJptiNPoYRPfCdhSeM/TplYgaLznvxnU03+ZzTy
 r/FGftA+U0yUPw9pBLvHr91+eZymkgWmziJLbillEvP7FZrTCPPIVvzGAHQPrlRAWLtiFi9z
 uuzwOPTlUgCCLGhPXSGmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQQnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:41dqPaB6foPeaG/lHem555DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEGmnhrGSpwEJ3EbFh4tg6Z
 s=
X-Talos-CUID: =?us-ascii?q?9a23=3AwKexVmvh82ik81I8gWxvWyxw6It0MUHj7kjLP3S?=
 =?us-ascii?q?lDEl5b7HPUXKCpZhrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AdV5c7g0vUVn34XFvpoSsVh7AFzUj2/nwMmEH0qo?=
 =?us-ascii?q?6tdC0JzNOERHMoGuqe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,186,1681171200"; 
   d="scan'208";a="61476813"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 May 2023 12:22:29 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 34NCMTc4017141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:22:29 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id E7D2FCC1293; Tue, 23 May 2023 05:22:28 -0700 (PDT)
From: Denys Zagorui <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: Fix externalsrc support
Date: Tue, 23 May 2023 05:22:27 -0700
Message-Id: <20230523122227.1851703-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102735

When the externalsrc class is used the tasks listed in
SRCTREECOVEREDTASKS are deleted to prevent them being executed. If
externalsrc is used for the kernel then this will include
virtual/kernel:do_patch.

We can depend on do_shared_workdir instead as this will survive when
externalsrc is used.

Similar to [openembedded-core] (eab605bab945 "perf: Fix externalsrc support")

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 67a821c07..bbfab47aa 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/bpftool"
 
 inherit bash-completion kernelsrc kernel-arch
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 EXTRA_OEMAKE = "\
     V=1 \
-- 
2.35.6


