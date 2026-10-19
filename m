Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221D3CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:58 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28003.1792386477074421207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H7K+g6Sp;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6431; q=dns/txt;
  s=iport01; t=1792386477; x=1793596077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VzjiczNmOzkBd+PnNgMsFrd4eS3+4jfBMRdzHg2jq7M=;
  b=H7K+g6SpRn3M6cnZeCr2zUEh0LlGvfMdGNjFa3qBqwmVdnIkiYGgG65R
   l571ZYG8lanPYUs1VwtSCHihswQ4j4fvrbpOnxZIk/XxqsiTA+1DDgi1I
   welQmE+e/N2ICKaLxYgOwY26VSB1IIbC3coo6lBLuqui0UAhJlWT/LSxh
   CquPuy16fhag8b1hB2WL9YGjELrGtjLBkEV7kU9R4rMqv2xETrhmwLev8
   WGvK99n6N//pcmFZyzL/pwnYiNNGQ4ywCi52/jlmqbVuNsbDSJarvWHQ1
   M0qH1SPOCu9u+W9R2UDRKeH9Xs21zmH4c9ykd0bKaaxRZh+xBe+A0jY5t
   g==;
X-CSE-ConnectionGUID: TTBOzgBTT1i7CdeoJtjtqg==
X-CSE-MsgGUID: cqBvGUTdQkGqzV47m110SA==
X-IPAS-Result: =?us-ascii?q?A0BGAgAppdVq/4v/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hyBfg8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMyAUYQHAMBAi8rIwgZgwIBgnQDEb1ggiyBA?=
 =?us-ascii?q?YNpAkNQ2zIBCxQBgTiFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQGIAyIEgiJ6E?=
 =?us-ascii?q?oFaHmWUWkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHTRgNSBEsNxUZBD5uB5IqHoJeBwGBAwoBB?=
 =?us-ascii?q?ySBBRRTQB6TF5JBoQ8KKIN2jCKVOhozhVudTodGC5h9izeCU5U0gRyEaYFoP?=
 =?us-ascii?q?IFHCwdwFYMiCUoZD44rDguDYIF/zEknMgIJMgEBBwIHDgMLgWiRHmABAQ?=
IronPort-Data: A9a23:LjHbwKjyNLxPFcOFFd0bXRekX161MBEKZh0ujC45NGQN5FlHY01je
 htvCmiAa/bbNjD3ethya9y09BhU6pGBmII2HQY5/ng0QyJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUkxsxQE25ky
 cBBKW8mYh2Epf603Ku0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4bbHZ0EwB3Gz
 o7A12/gKA81CeCT8Dmq62CS2rDKxHqjY6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:FuccD66C5753Y7Bg4QPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:AzyClWyX8oVKkn0szoBlBgUoJuoCYHL38EuJIhCTBWtuaqGXVUafrfY=
X-Talos-MUID: 9a23:CqxatQWlKAuoYYbq/DT1ri9NCftk2qeBEVIzzcoD4pDcDgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="529009636"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:56 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 05A2118000348;
	Mon, 19 Oct 2026 05:07:56 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5CDB3CBEF98; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 7/7] ntfs-3g-ntfsprogs: fix CVE-2026-40706
Date: Sun, 18 Oct 2026 22:07:41 -0700
Message-Id: <20261019050741.1688261-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019050741.1688261-1-dkelaiya@cisco.com>
References: <20261019050741.1688261-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131113

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
index 3ba45438bd..a29be8ab90 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -19,6 +19,8 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
            file://CVE-2026-42618_p2.patch \
            file://CVE-2026-42616_p1.patch \
            file://CVE-2026-42616_p2.patch \
+           file://CVE-2026-40706_p1.patch \
+           file://CVE-2026-40706_p2.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


