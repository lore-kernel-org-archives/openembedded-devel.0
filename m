Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A59CCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:47 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16492.1792136805832795344
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kY9KikXR;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6495; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NzoyyByUokDBuvCMAy/dr1Fx7CWUE0NVP2m8ly9vzg0=;
  b=kY9KikXRaBOg8fLquT3sU7s38Jld/74Bs6HV9eCz200XU7ZnWHykwG1O
   x63yoMKzAiZvGYWZEQD6xvx8rvjgxDAgMbCK7q3ZVpPeFCQchxgpJNQe7
   UcWXeUTjF/Sqs6ODPF95N9958Y+z6DIq7mM95XsCLb/rw9rLRIzAGL8j5
   TXdEo62UMcpiQm/zmO2rVE6qK80YtOV+tbhzvX9xq7lzW+t0CbGyb7DXO
   nstWdHybL41EO7YcoX/9BPpWM6M+oh8mMb8O7LoSI8EW6Hr/sGKA7wJiz
   LgIvmB5ruHrdLtdvMzVOhEggx88Eg0183jCLIr3LeB2Uv2wwynM6uhJhT
   Q==;
X-CSE-ConnectionGUID: 2pOMlwJ6TlePXOxyakcGZw==
X-CSE-MsgGUID: iwZ/yuavSzS3Dm+2jsWKPQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgAY1NFq/5L/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hyBfg8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMyAUYQHAMBAi8rIwgZgwIBgnQDEb0hgiyBA?=
 =?us-ascii?q?YNpAkNQ2zIBCxQBgTiFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQGIAyIEgiKBD?=
 =?us-ascii?q?IFaHmWUREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJeBwGBAwoBB?=
 =?us-ascii?q?yMBgQUUU0AekxeSQKEPCiiDdowilToaM4VbnU6HRguYfY4KlTOBHIRpgWg8g?=
 =?us-ascii?q?UcLB3AVgyIJShkPjisOCxyDRIF/zFsnMgIJMgEBBwIHDgMLgWiRHmABAQ?=
IronPort-Data: A9a23:exSNVaqRpcmLKRshQZRLzRpx5Q9eBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmHPKuNYGCnf9xyaIux/UtXvpHUyoBnS1E+r303Q3kXpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rxvJkRK6
 t5GFDQAViCkl/O/w7mUePY506zPLOGzVG8ekmtrwTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVvrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXH58NwxvC9
 zOuE2LRAw4oc82CwCS+4En3quqMxyHgZ6EqLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMI1gv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaY0D58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:x9pniaCWXuKEgEDlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:HL194W/M6HiEuJwcktmVvxQMPeUhbV+D8HPdG3+fGXdgS7a6e0DFrQ==
X-Talos-MUID: 9a23:WgeOhAY+OsC2GOBTtiDewyB/PdlT8Z/1JEVOy5cdhOq8DHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522055299"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id BE17718000587;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 1B61DCBEF98; Fri, 16 Oct 2026 00:46:44 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 7/7] ntfs-3g-ntfsprogs: fix CVE-2026-40706
Date: Fri, 16 Oct 2026 00:46:40 -0700
Message-Id: <20261016074640.3986037-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016074640.3986037-1-dkelaiya@cisco.com>
References: <20261016074640.3986037-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131078

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream allocation fix shown in [1]. The NVD
record describing the vulnerability is referenced in [3].

The fix in [1] allocates space for the worst-case number of POSIX ACL
entries in ntfs_build_permissions_posix(). The follow-up in [2] is
included to handle allocation failure: check the malloc result, set
errno to ENOMEM, and return NULL before using the descriptor.

[1] https://github.com/tuxera/ntfs-3g/commit/e48e1ef2a1fcff13a590c2224ec21c5bd5d3e92e
[2] https://github.com/tuxera/ntfs-3g/commit/c5413e242309f88ce5a83c0c2538184b19eea1bc
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40706

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-40706_p1.patch             | 60 +++++++++++++++++++
 .../files/CVE-2026-40706_p2.patch             | 34 +++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p2.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p1.patch
new file mode 100644
index 0000000000..22ece5aca3
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p1.patch
@@ -0,0 +1,60 @@
+From 696eb743bd94ddbb86e84e544e152845b92a8a7f Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Tue, 24 Feb 2026 10:04:31 +0200
+Subject: [PATCH] acls.c: Fix heap buffer overflow in
+ 'ntfs_build_permissions_posix'.
+
+The root cause was that the memory allocated for the ACE entries was
+insufficient for the worst case scenario when group entries were added
+for mask entries that didn't have a corresponding group entry already.
+Fixed by allocating space for the worst case number of ACE entries.
+
+This was reported by Andrea Bocchetti with a thorough report which made
+it very easy to fix.
+
+CVE: CVE-2026-40706
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/e48e1ef2a1fcff13a590c2224ec21c5bd5d3e92e]
+
+(cherry picked from commit e48e1ef2a1fcff13a590c2224ec21c5bd5d3e92e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/acls.c | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/libntfs-3g/acls.c b/libntfs-3g/acls.c
+index 9f16fecd..4cf534bf 100644
+--- a/libntfs-3g/acls.c
++++ b/libntfs-3g/acls.c
+@@ -3716,12 +3716,27 @@ struct POSIX_SECURITY *ntfs_build_permissions_posix(
+ 		/*
+ 		 * Build a raw posix security descriptor
+ 		 * by just translating permissions and ids
+-		 * Add 2 to the count of ACE to be able to insert
+-		 * a group ACE later in access and default ACLs
+-		 * and add 2 more to be able to insert ACEs for owner
+-		 * and 2 more for other
++		 *
++		 * The worst case number of ACE entries consists of:
++		 * - 'acecount' ACE entries from the main loop (see below)
++		 *   iterating over the 'securattr' array.
++		 * - 1 ACE entry which may be added when creating world
++		 *   permissions if none exist.
++		 * - 1 ACE entry which may be added when setting basic owner
++		 *   permissions if none exist (both lists).
++		 * - 1 ACE entry which may be added when duplicating world
++		 *   permissions as group_obj permissions if none exist.
++		 * - 'acecount + 2' ACE entries which may be added when
++		 *   duplicating world permissions as group permissions if they
++		 *   were converted to masks and the masks are not followed by a
++		 *   group entry.
++		 * - 1 ACE entry which may be added when inserting a default
++		 *   mask if none is present and there are designated users or
++		 *   groups.
++		 *
++		 * This amounts to 2*acecnt + 6 ACE entries in the worst case.
+ 		 */
+-	alloccnt = acecnt + 6;
++	alloccnt = 2*acecnt + 6;
+ 	pxdesc = (struct POSIX_SECURITY*)malloc(
+ 				sizeof(struct POSIX_SECURITY)
+ 				+ alloccnt*sizeof(struct POSIX_ACE));
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p2.patch
new file mode 100644
index 0000000000..f19f9370bf
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p2.patch
@@ -0,0 +1,34 @@
+From a0842353864ad42abc30119af2fa5b9f5751d66b Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Tue, 24 Feb 2026 16:35:21 +0200
+Subject: [PATCH] acls.c: Add 'malloc' return value check when allocating POSIX
+ ACL.
+
+CVE: CVE-2026-40706
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/c5413e242309f88ce5a83c0c2538184b19eea1bc]
+
+(cherry picked from commit c5413e242309f88ce5a83c0c2538184b19eea1bc)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/acls.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libntfs-3g/acls.c b/libntfs-3g/acls.c
+index 4cf534bf..2d24d65e 100644
+--- a/libntfs-3g/acls.c
++++ b/libntfs-3g/acls.c
+@@ -3740,6 +3740,14 @@ struct POSIX_SECURITY *ntfs_build_permissions_posix(
+ 	pxdesc = (struct POSIX_SECURITY*)malloc(
+ 				sizeof(struct POSIX_SECURITY)
+ 				+ alloccnt*sizeof(struct POSIX_ACE));
++	if (!pxdesc) {
++		ntfs_log_perror("Unable to allocate %zu bytes for "
++				"POSIX_SECURITY structure",
++				(size_t)(sizeof(struct POSIX_SECURITY) +
++					alloccnt*sizeof(struct POSIX_ACE)));
++		errno = ENOMEM;
++		return NULL;
++	}
+ 	k = 0;
+ 	l = alloccnt;
+ 	for (i=0; i<2; i++) {
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 5ecda1f66f..d5bc18d2b4 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://CVE-2026-42618_p1.patch \
            file://CVE-2026-42618_p2.patch \
            file://CVE-2026-42616.patch \
+           file://CVE-2026-40706_p1.patch \
+           file://CVE-2026-40706_p2.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.35.6


