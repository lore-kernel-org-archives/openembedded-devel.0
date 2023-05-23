Return-Path: <dzagorui@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30729C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 14:00:40 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.23477.1684850435948149429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=nGAwD8aG;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1266; q=dns/txt; s=iport;
  t=1684850436; x=1686060036;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XYEujKmV0Til0+x6cXFbpTmPHXoG2xd6NjQazq6VGTU=;
  b=nGAwD8aGF4inOoZskZrEoB3zn/toah/z6R/vme4AQNCDYvomj7SGDlid
   fhiwcDESuZbtjHQKeMunZ5dOdB/+QeVoK65OepiGEcnHfeBVZDG1QCkgf
   hcIac9gIXwLuNHBUXmYzWwbZuu7Ykp1+OaGXE6llDuBKju33lWBOpUhgM
   E=;
X-IPAS-Result: =?us-ascii?q?A0AiAQCUxmxkmJtdJa1agliDJFVARrNygSUDVg8BAQENA?=
 =?us-ascii?q?QExEwQBAYpiAiU0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBA?=
 =?us-ascii?q?QEBAQEeGQUOECeFaA2GPQGBU0SCfgGCXAOsEoIsgQGEdJprgWeBQowUhUonG?=
 =?us-ascii?q?4FJRIR+hRGFdQSPKYx1gTBygSM/aYECAgkCEWeBDghmgXNAAg1kCwtsgTuDB?=
 =?us-ascii?q?gICEUIMFV0CahoQARMDBwQCgQ4QMQcENywGCR01LQZdBxkWJAkTFVMHhFgDC?=
 =?us-ascii?q?QMHBUlAAwsYDVARLDUUHwYmIIEJGGMEggRPnQWCfoEOgW96pBOgIYQPi3mVA?=
 =?us-ascii?q?RozhVWjepgJo1mELgIEBgUCFoFjOoFbMxoIGxWDIglJGQ+OOYI1kT4kMTsCB?=
 =?us-ascii?q?wsBAQMJimheAQE?=
IronPort-Data: A9a23:pDU3E68OnRwn+GDmJuZTDrUD8n6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jFJXWiBOv6JYGWmco0nPdi3phsOusWGzt8xGgVq/H9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEjmE4E3F3oHJ9RGQ74nQLlbHILCCYngZqTNMEn970ko+wbVh2OaEvPDga++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFJZH4rHpxdGlOjKmVi8kFWc
 M6YpF2x1juxEx7AkbpJmJ6jGqEBaua60QRjFhO6VoD66iWuqBDe3Y4DNMAWV2NqlQnWwcIgx
 Ygd7I2xVFkma/ikdOQ1C3G0EglkNqFAvbTAO3X67YqYzlbNdD3nxPAG4EMeZNJDvL0oRzAVs
 6VFdVjhbTjb7w6y6L6pQ+ZrnNkiBMLqJ4gY/HpnyFk1CN54GM2fGPSVvre02h8cnsENBfTxW
 PA7cDVNNzbFUUMQZkwYXcdWcOCA3ymjLGIwREiuja0v7m7eyQZ83LTgPJ/Zd8KHQe1Rn12Ev
 STB52n/DxQQOdCTxDbD9Wij7tIjhgvhU44UUba/7PMv3BuYx3cYD1sdUl7TTeSFZlCWY9JlI
 XIwxzQS8vYgpUH2HoDsXgDmryvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgKtjvR77KfaohR3j
 je0c8PV6S9H6+LKFCrMnluAhXbjZnhPdD5qiTosFFNdu7HeTJcPYgUjp+uP/YavhdHzXDr32
 T3P8G41hq4YiogA0KDTEbH7b9CE+MGhou0dv1W/soeZAuVRP9fNi2uAsgOz0Bq4BNzFJmRtR
 VBd8yRk0MgADIuWiAuGS/gXEbei6p6taWOM3QE/R8N9r2j2oxZPmLy8Bhkjei+F1e5ZJ1fUj
 LP74mu9GbcKZiLxNP8rC25PI5VwlsAM6ugJptiNPoYRPfCdhSeM/TplYgaLznvxnU03+ZzTy
 r/FGftA+U0yUPw9pBLvHr91+eZymkgWmziJLbillEvP7FZrTCPPIVvzGAHQPrlRAWLtiFi9z
 uuzwOPTlUgCCLGhPXSGmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOSAnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:n/7mxa65dVczrSukpAPXwN3XdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfBU+I+UyFJ8U4ndQtsJ
 tdTw==
X-Talos-CUID: 9a23:+6cf6GxjTeadr1SD/OOEBgUsGvovTFng0kuPfV3pBDs5EayUVAGfrfY=
X-Talos-MUID: 9a23:7fl2IQSDi07Zyt6xRXTAnDAhLMVH3J6MEU8vyrcDiZfbaTd/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,186,1681171200"; 
   d="scan'208";a="61543973"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 May 2023 14:00:34 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 34NE0OBf009196
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 14:00:33 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id 29B03CC1293; Tue, 23 May 2023 07:00:22 -0700 (PDT)
From: Denys Zagorui <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] bpftool: Fix externalsrc support
Date: Tue, 23 May 2023 07:00:20 -0700
Message-Id: <20230523140020.3089451-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 14:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102739

When the externalsrc class is used the tasks listed in
SRCTREECOVEREDTASKS are deleted to prevent them being executed. If
externalsrc is used for the kernel then this will include
virtual/kernel:do_patch.

We can depend on do_shared_workdir instead as this will survive when
externalsrc is used.

Similar to [openembedded-core] (eab605bab945 "perf: Fix externalsrc support")

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 67a821c07..d4286295c 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/bpftool"
 
 inherit bash-completion kernelsrc kernel-arch
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 EXTRA_OEMAKE = "\
     V=1 \
@@ -22,8 +22,6 @@ EXTRA_OEMAKE = "\
 
 SECURITY_CFLAGS = ""
 
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
-
 COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.35.6


