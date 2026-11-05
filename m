Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29066.1793863678404501158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GhNpFZ4X;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6235; q=dns/txt;
  s=iport01; t=1793863678; x=1795073278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xUoXkrkgj1VoWvqz/sMr4hn5TYOASWpRDUujVtqGCcw=;
  b=GhNpFZ4XklHboDmnN6U3Gq9qK9HNTfUM/m3FkN65EX7gqwgVwr45b8QW
   Ahr/wtS7S3SjJAPgTmooaFgqXy4O+NUYy5vhQGtZGNd2jAUkWApN6LqTD
   1NBjECMm2r0pNs1fxTQ6heB0kCktePNnrsz80jwjmqNyU3IxXOw4MDPVD
   jhz6KRgKML4zu53DOVbNi/Buz7ilUUuSmJyMsJpCvZs+v50NCclS6XsTV
   r5gM/GvuMyaaxBesqka3W47RzbuYl0jsOwwkZaEKcNYAYZnVengznAYMd
   IQHmyfhA5QZBPln6ki9QBIM+C8/3V0u3qFY4PxXSzzkBpRB+dE2A9lkzZ
   w==;
X-CSE-ConnectionGUID: Fsru6iNNTFmMXx4NGt/0BQ==
X-CSE-MsgGUID: ODJAO65JTDyniUDe4qaP/A==
X-IPAS-Result: =?us-ascii?q?A0BFAgBlLuxq/5D/Ja1aHgEBCxIMggULgld1YENJA5Vcb?=
 =?us-ascii?q?AOeIYF+DwEBAQ9EDQQBAYUFAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZATAgEDMgFGECAxKysZgwIBgnQDEbxkgiyBAeAxA?=
 =?us-ascii?q?QsUAYE4hUCII3aEfScbG4FygRWDaYEFgVwCiAQiBIIigQyBeIx6iEVIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhC?=
 =?us-ascii?q?AINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hki+DEQEVeAEqASCBOlKTL?=
 =?us-ascii?q?pJIgTWfXAoog3iMJJU6GjOFW6UWmQiOCpV0XYRpgWg8gVlwFYMiCUoZD44vC?=
 =?us-ascii?q?gscg0TOViYyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:LehsF6/ZGBs33U29wg0HDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GZJWGjVbPaKZTejc94gPom+9h4G7MPTzYRmQQRvrXtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kYJpcFpOdRJ11g8
 NkoOGwrQQzE38iPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYaOK4XbGJsP9qqej
 kXq3U3eXEw4CPCOzzu43n/wn+b32gquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:lmWcQaiPoE74uQDPM+r7zTFsHXBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AumaSk2oKsXX6O7kyo6EeK6vmUe4+aGCDzVH2H2G?=
 =?us-ascii?q?9LFZ5FJu6VRjI0poxxg=3D=3D?=
X-Talos-MUID: 9a23:rk08LQn0Ymm/S8Xz3eRTdnpFGOVBxPrzKnwhgJMHhuWJaTV5A3C02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543919562"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:27:57 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 7FFB6180003DC;
	Thu,  5 Nov 2026 07:27:57 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 2B17DCBF201; Wed,  4 Nov 2026 23:27:57 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 2/2] ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed
Date: Wed,  4 Nov 2026 23:27:54 -0800
Message-Id: <20261105072754.878938-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105072754.878938-1-dkelaiya@cisco.com>
References: <20261105072754.878938-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131877
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

The three index validation patches already included for CVE-2026-46572
and CVE-2026-42617 also provide the complete CVE-2026-56136 fix [1-3].
Their combined source changes match Tuxera's 2022.10.3 backport linked
from the advisory [4]. Add the missing CVE tag to each patch so
cve-check recognises the existing fix.

[1] https://github.com/tuxera/ntfs-3g/commit/2ead8a3ccf940c0219ffba587fab54e21462b3a5
[2] https://github.com/tuxera/ntfs-3g/commit/dfd1a7c6eb23a22238ec193451fa59c989b4381f
[3] https://github.com/tuxera/ntfs-3g/commit/edf2b892356684ca8f2fc5898943c7a9b90ffb80
[4] https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-r66g-c39x-cw95

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ...> CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch} | 2 +-
 ...> CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch} | 2 +-
 ...> CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch} | 2 +-
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb        | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p1.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch} (97%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p2.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch} (98%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p3.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch} (96%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch
similarity index 97%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch
index 47121ea9a5..27fc063df2 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch
@@ -13,7 +13,7 @@ inconsistency.
 Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
 issue.
 
-CVE: CVE-2026-46572 CVE-2026-42617
+CVE: CVE-2026-46572 CVE-2026-42617 CVE-2026-56136
 Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/2ead8a3ccf940c0219ffba587fab54e21462b3a5]
 
 (cherry picked from commit 2ead8a3ccf940c0219ffba587fab54e21462b3a5)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch
similarity index 98%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch
index d2d40124fe..ae78336386 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch
@@ -10,7 +10,7 @@ ntfs_attr_inconsistent() for INDEX_ROOT and from
 ntfs_index_block_inconsistent() for INDX blocks so callers can rely on
 the IE stream being well-formed.
 
-CVE: CVE-2026-46572 CVE-2026-42617
+CVE: CVE-2026-46572 CVE-2026-42617 CVE-2026-56136
 Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/dfd1a7c6eb23a22238ec193451fa59c989b4381f]
 
 (cherry picked from commit dfd1a7c6eb23a22238ec193451fa59c989b4381f)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch
similarity index 96%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch
index 54bce4f95e..3ff1a46ce8 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch
@@ -9,7 +9,7 @@ applies at libntfs-3g/dir.c.
 
 Thanks to Alexandro Calo' from Nozomi Networks Labs for the report.
 
-CVE: CVE-2026-46572 CVE-2026-42617
+CVE: CVE-2026-46572 CVE-2026-42617 CVE-2026-56136
 Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/edf2b892356684ca8f2fc5898943c7a9b90ffb80]
 
 (cherry picked from commit edf2b892356684ca8f2fc5898943c7a9b90ffb80)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 938a661d2c..f076db4dbd 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
-           file://CVE-2026-46572_CVE-2026-42617_p1.patch \
-           file://CVE-2026-46572_CVE-2026-42617_p2.patch \
-           file://CVE-2026-46572_CVE-2026-42617_p3.patch \
+           file://CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch \
+           file://CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch \
+           file://CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch \
            file://CVE-2026-46571.patch \
            file://CVE-2026-46570.patch \
            file://CVE-2026-46569.patch \
-- 
2.44.4
