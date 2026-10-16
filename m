Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5AECCF2C0
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:48 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16491.1792136805379095577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SrusRPJc;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3609; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j4OPatR0Ns+lme+KsgIoVefDd/bI5sTJAw2R61BYJnE=;
  b=SrusRPJcNPSrAMEy2ne9X5yz5KrVcqx4z7mFhL9yrQX/6hAbJjhRTBhP
   6WXwxLkrloZngyw63m0DiZAy8oXNSvowk61Jftn/hAj4WRQ0pq/P848/D
   ElBLKdQ2YZ6KPssYqbc73T8bdgRktTYTV1kZCPFWo8affv0WGYzdQ+UkK
   niN7tHSfoS+9fLLjo2s75RfigqE07MD2UwhF7zJZIob7SB+CIL6hEQS/0
   +AiNtHeHrjn+spdWCkYDYXHAJw0RMKUVnHxAIVJ6qZD+rWHDGR1Wno2/e
   VhprP9p9DwvEvRzUNyvJG70PHW0lKYK8dkkiU7Zg4b3X0j9oPH7oLJwlB
   g==;
X-CSE-ConnectionGUID: zvX7Mi9zSnK8UvF+m41tsg==
X-CSE-MsgGUID: PorDo0S1T2OvYuYPkadW7w==
X-IPAS-Result: =?us-ascii?q?A0BHAgAh1tFq/4//Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hyBfg8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwFGEBwDAQIvKyMIGYMCAYJ0AxG9IIF5M?=
 =?us-ascii?q?4EBg2kCQ1DbMgELFAGBOIVAiCNdGAGEfCcbG4FyhAh2gQWBXAEBiAMiBIIig?=
 =?us-ascii?q?QyBWh6VKUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJeBwGBDQEqA?=
 =?us-ascii?q?SCBTKQUgiGhDwoog3aMIpU6GjOEBIFXkkCSVAuYfY4Klk+EaYFoPIFHCwdwF?=
 =?us-ascii?q?YMiCUoZD44rDgscg0SBf8xbJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:kwb1rKwskVGYAzxruwl6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUAy
 jMfCDjVP6uKamr8eY1wPI3g9xhQsZ+ExtRgHlZur1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFMoDdI9+7dlOmdtp
 cEGBnMIMkmfnO3jldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwaoqMI4TUH549ckCwn
 mXc02OhOUgmbvuB+Ce0ynGlitCQgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:6GgfxK5QPn3P2idB1QPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:qhWS2G+/ELALHQlTbhGVv1wKKp8AcyzP93Hzc3KmJyVsFOSJUlDFrQ==
X-Talos-MUID: 9a23:Co9AUAnfKNbw8caCWa18dnpaM91E5PyVUXxXtos3pvi8NiV8BGiC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528110623"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 5AEAD180004B2;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 040CCCBF202; Fri, 16 Oct 2026 00:46:44 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 2/7] ntfs-3g-ntfsprogs: fix CVE-2026-46571
Date: Fri, 16 Oct 2026 00:46:35 -0700
Message-Id: <20261016074640.3986037-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016074640.3986037-1-dkelaiya@cisco.com>
References: <20261016074640.3986037-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131073

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
index 8995807d95..c6517581b8 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://CVE-2026-46572_CVE-2026-42617_p1.patch \
            file://CVE-2026-46572_CVE-2026-42617_p2.patch \
            file://CVE-2026-46572_CVE-2026-42617_p3.patch \
+           file://CVE-2026-46571.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.35.6


