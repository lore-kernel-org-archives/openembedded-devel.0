Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BBECCF2E4
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:58 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28000.1792386476642148574
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jS0iVUhQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3542; q=dns/txt;
  s=iport01; t=1792386476; x=1793596076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wnPE8iJxSqew2NrZ+VR174rV7WDbJjlK8clgzqpchg=;
  b=jS0iVUhQYm9XUr1BFwKpM2P78DfRBzVU8Ts4cciRux5mBi4eXh9O/+Jv
   OZK6bipLFIjTN2MIUF5DojG9Onu3zRbR0CWKyh5eadzo4pssYzYFKis3I
   eWFHjYHN+ZGdKg9LTQgmdVnafDMA9hirT6XBM1PMOb17apbv4EG65qQ8q
   bOXWIVOkns55D/p+FBGySbYfDbsHcZj1MZtGLDLQIjt37TrK9mUaBsx/m
   VhU59tartJimG6/DcpBL/4BkUkRUtg1K6r7l4HMWpQz41smlAFEg5pk+r
   CZ4DJbgP4TEvRCvWJturaayG3fkjMYN8OCnCp6AfffPCszcq1F9eKqAm5
   A==;
X-CSE-ConnectionGUID: K7nwTh82RaGdAuSXG9uKuQ==
X-CSE-MsgGUID: CB18X2+QTn2cyKffsVsGrg==
X-IPAS-Result: =?us-ascii?q?A0BHAgCipNVq/5L/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb1ggXkzgQGDaQJDU?=
 =?us-ascii?q?NsyAQsUAYE4hUCII10YAYR8JxsbgXKECHaBBYFcAQGIAyIEgiJ6EoFaHpU/S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJX?=
 =?us-ascii?q?oErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJK?=
 =?us-ascii?q?EEXDHMMHQVyCAINCQdNGA1IESw3FRkEPm4Hkioegl4HAYENASsggUykFYIho?=
 =?us-ascii?q?Q8KKIN2jCKVOhozhASBV5JAklQLmH2LN4JTllCEaYFoPIFHCwdwFYMiCUoZD?=
 =?us-ascii?q?44rDguDYIF/zEknMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:UO26F6018Qw+HSr9cPbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzYBy
 2pOCG6DOviDa2Wke4hxPYrnoUMA75KHzII2HAY93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLx4wIrEYqrxNCE5C3
 OEjGB9cczOevrfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW2boCFI4HTFK25mG6zj
 DuWzz66Oy0cbteO6jSL6Uy3qfXAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:pMWwGayXRiUFfofcQgQuKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:gODpcGzvhXVYr7n3SnGoBgU3RcY6Tn2Nlk3ZDEORFF1ZZ+yIakKprfY=
X-Talos-MUID: 9a23:afiRFwnGjkxsj0pZg/pXdnpJHp440/7tMXwLy54XmMeKLhJrFC2S2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="536281519"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 99BA71800048E;
	Mon, 19 Oct 2026 05:07:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3F604CBF202; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 2/7] ntfs-3g-ntfsprogs: fix CVE-2026-46571
Date: Sun, 18 Oct 2026 22:07:36 -0700
Message-Id: <20261019050741.1688261-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019050741.1688261-1-dkelaiya@cisco.com>
References: <20261019050741.1688261-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131109

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1]. The NVD record
describing the vulnerability is referenced in [2].

[1] https://github.com/tuxera/ntfs-3g/commit/b912272b30c552b0457e40a0a68b1fac2587aaea
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-46571

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-46571.patch                | 50 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46571.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46571.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46571.patch
new file mode 100644
index 0000000000..b2739f026e
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46571.patch
@@ -0,0 +1,50 @@
+From fc32321c8c795e9f73cbdd8f36fcd9e0a3a9814b Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Mon, 8 Jun 2026 14:16:39 +0300
+Subject: [PATCH] reparse.c: Bounds-check locase index in ntfs_fix_file_name.
+
+The case-insensitive branch indexed vol->locase with a raw 16-bit code
+point and no check against vol->upcase_len.  A truncated $UpCase made
+the table shorter than 65536 entries, so a file name character >=
+upcase_len read past it and leaked 2 heap bytes via the symlink target
+returned to userspace.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-46571
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/b912272b30c552b0457e40a0a68b1fac2587aaea]
+
+(cherry picked from commit b912272b30c552b0457e40a0a68b1fac2587aaea)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/reparse.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/libntfs-3g/reparse.c b/libntfs-3g/reparse.c
+index 76dbe2f1..54858caa 100644
+--- a/libntfs-3g/reparse.c
++++ b/libntfs-3g/reparse.c
+@@ -196,11 +196,19 @@ static u64 ntfs_fix_file_name(ntfs_inode *dir_ni, ntfschar *uname,
+ 				lemref = entry->indexed_file;
+ 				mref = le64_to_cpu(lemref);
+ 				if (NVolCaseSensitive(vol) || !vol->locase) {
+-					for (i=0; i<found->file_name_length; i++)
++					for (i=0; i<found->file_name_length;
++							i++)
+ 						uname[i] = found->file_name[i];
+ 				} else {
+-					for (i=0; i<found->file_name_length; i++)
+-						uname[i] = vol->locase[le16_to_cpu(found->file_name[i])];
++					for (i=0; i<found->file_name_length;
++							i++) {
++						u16 u = le16_to_cpu(found->
++								file_name[i]);
++						uname[i] = (u < vol->upcase_len)
++								? vol->locase[u]
++								: found->
++								  file_name[i];
++					}
+ 				}
+ 			}
+ 		}
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 4ed47ff53a..1e1b5bc54a 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
            file://CVE-2026-46572_CVE-2026-42617_p1.patch \
            file://CVE-2026-46572_CVE-2026-42617_p2.patch \
            file://CVE-2026-46572_CVE-2026-42617_p3.patch \
+           file://CVE-2026-46571.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


