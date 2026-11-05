Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29256.1793863698147539549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dTqJjuWw;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22397; q=dns/txt;
  s=iport01; t=1793863698; x=1795073298;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L68tGprau69zRp4m3maLQN1JWXvT3RYLjQfYKPGRHVE=;
  b=dTqJjuWwt8yK9XyjJXTXG3V0hQjHRYW/ZRORMVT7x5xJQjvkIxRR2M0z
   zFBDcEXukRHOXJ64zMpAkic5W2WLhAEeOieP+SunmUKxb54NfoFMEkFY5
   y2wK5X97+vmMH29nwU/xeWuNRJ2O7360DO+sdOpAHGH//mXYfmOWvAetL
   JVL9WMe71SwWqWw9V1M2aymYgNre44TBCDnNAoUh2xApB6GaeS4Pe3UCM
   LKjrvp8BrNbKbFEwQ45c6tB377Fn1bSGG5Iga+GVKC8rS0247jwkQHgTv
   DuPImzheHzCS0m0FR+We5k1CBsGOXsRfGmsFjAlx1FxEREiYzyby/mmmw
   g==;
X-CSE-ConnectionGUID: GEm15Z8mRSiSabNt7aXdhQ==
X-CSE-MsgGUID: iMJUv/RbRr6hfRVh7XVvDw==
X-IPAS-Result: =?us-ascii?q?A0DMAgBUL+xq/4r/Ja1aHgEBCxIMggULgld1YBopSQOEV?=
 =?us-ascii?q?JF0gRadDoF+DwEBAQ9EDQQBAYUFjh8CJjUIDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEdCQQLAUYsAwECAwImAi0jGAmDAgGCO?=
 =?us-ascii?q?gM3AxG8ZXp/M4EBhH7YTBiCTwELFAGBCi6FQIMfAYUDXRgBhH0nGxuBcoEVg?=
 =?us-ascii?q?nN2gQWBXAKBJxGEBIJIIgSCIoEMgVoejHoCgVKGcUiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIz4XL1gbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJ?=
 =?us-ascii?q?C8FHCZAGwoYGA1IESw3FRkEPQFuB5Ivgh5sBwEwDFEBByMBBRtbChMBByMKM?=
 =?us-ascii?q?AcoHDKSTRwBBzKSBYE1n1wKKIN4jCSDXZFdGjOEBIFXkkKSVAuYfYQYiXKVN?=
 =?us-ascii?q?TRohGmBagE5gVlwFYMiCUoZD44rAwsLHINEzlUmMgIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?AABASYHgU8BAQ?=
IronPort-Data: A9a23:cHr+K63rkj9bMNxwY/bD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2RRn
 DdOWmiPbKyLYjDzc49yaI+/8RtTu5/Qz95gHlE53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGI2wzZNAqquNNOmB1/
 PY+NG8EXhyDvrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW2aICFJofQH625mG6Zg
 0D74SPDCCsAatyR8wSFrUKSmMPQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:K1cFJKmwZU+ao55u61JDPAAa6enpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726RtN9xYgBEpTnuAsi9qB/nmKKdgrNhX4tKIjOHhILAFugLhuHfKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A7V7OXmm1vr+g4aFlq+fI28H5/kPXOVLwyS6NER+?=
 =?us-ascii?q?9M11oc7Sfb0PP8ZNok/M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AfOL8xAwVRovGUfLJ150ArwW6R2CaqKWLKn0T1q8?=
 =?us-ascii?q?MgdPaNSJKBTfCvAqpbpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530284322"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:27:57 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 7D41D180001F2;
	Thu,  5 Nov 2026 07:27:57 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 27E45CC1611; Wed,  4 Nov 2026 23:27:57 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 1/2] ntfs-3g-ntfsprogs: fix CVE-2026-56135
Date: Wed,  4 Nov 2026 23:27:53 -0800
Message-Id: <20261105072754.878938-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131878
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Apply the upstream ACL inheritance sizing fix and its validation and
sizing follow-ups [1-3], then limit repeated creator-owner and
creator-group substitutions with [4]. The advisory is referenced in [5].

The sizing helper stops at the declared ACL size, while descriptor
validation and inheritance may process additional ACEs. The follow-up
guard bounds substitutions independently of that sizing walk.

[1] https://github.com/tuxera/ntfs-3g/commit/289ebcf3dfbed422181cbfa524d75e32d9c59bd3
[2] https://github.com/tuxera/ntfs-3g/commit/21f37bb5efa874b4e1212f499ca643d69f024021
[3] https://github.com/tuxera/ntfs-3g/commit/b0b9c32c7ff0fb0eac1eb9272da2ed10ae51a3b9
[4] https://github.com/tuxera/ntfs-3g/commit/98b153894bb3cc75cd13179a108eef9feda35422
[5] https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-c9qg-fh4v-mq8r

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-56135_p1.patch             | 141 ++++++++++++
 .../files/CVE-2026-56135_p2.patch             |  37 ++++
 .../files/CVE-2026-56135_p3.patch             | 204 ++++++++++++++++++
 .../files/CVE-2026-56135_p4.patch             |  95 ++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |   4 +
 5 files changed, 481 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p3.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p4.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p1.patch
new file mode 100644
index 0000000000..8efd49915a
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p1.patch
@@ -0,0 +1,141 @@
+From 289ebcf3dfbed422181cbfa524d75e32d9c59bd3 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Mon, 8 Jun 2026 21:37:03 +0300
+Subject: [PATCH] ACLs: Fix inherited ACL buffer sizing.
+
+build_inherited_id() allocates the security descriptor buffer before
+calling ntfs_inherit_acl() for the parent DACL and SACL.  The old size
+estimate only reserved fixed slack for a few creator-owner/group SID
+expansions.
+
+A crafted parent ACL can contain more ACCESS_DENIED CREATOR_OWNER ACEs
+with CONTAINER_INHERIT_ACE than that estimate covers.  During
+inheritance, each such ACE may be emitted once with CREATOR_OWNER
+replaced by the new owner SID and once again verbatim for further
+inheritance, allowing ntfs_inherit_acl() to write past the allocated
+descriptor buffer.
+
+Count the qualifying parent ACEs before allocation and add the required
+per-ACE slack for both DACL and SACL inheritance.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-56135
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/289ebcf3dfbed422181cbfa524d75e32d9c59bd3]
+
+(cherry picked from commit 289ebcf3dfbed422181cbfa524d75e32d9c59bd3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/ntfs-3g/acls.h |  1 +
+ libntfs-3g/acls.c      | 47 ++++++++++++++++++++++++++++++++++++++++++
+ libntfs-3g/security.c  | 26 +++++++++++++++++++++++
+ 3 files changed, 74 insertions(+)
+
+diff --git a/include/ntfs-3g/acls.h b/include/ntfs-3g/acls.h
+index 932791e9..53e80876 100644
+--- a/include/ntfs-3g/acls.h
++++ b/include/ntfs-3g/acls.h
+@@ -168,6 +168,7 @@ char *ntfs_build_descr_posix(struct MAPPING* const mapping[],
+ 
+ #endif /* POSIXACLS */
+ 
++int ntfs_count_creator_owner_inherit(const ACL *acl);
+ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 			const SID *usid, const SID *gsid,
+ 			BOOL fordir, le16 inherited);
+diff --git a/libntfs-3g/acls.c b/libntfs-3g/acls.c
+index 2d24d65e..150a6a7e 100644
+--- a/libntfs-3g/acls.c
++++ b/libntfs-3g/acls.c
+@@ -681,6 +681,53 @@ BOOL ntfs_valid_descr(const char *securattr, unsigned int attrsz)
+ 	return (ok);
+ }
+ 
++/**
++ * ntfs_count_creator_owner_inherit: count creator-owner inheritable ACEs
++ * @acl: ACL to scan
++ *
++ * Walks @acl bounded by acl->size, counting DENY ACEs whose SID matches the
++ * creator-owner placeholder and which carry the CONTAINER_INHERIT_ACE flag.
++ * A zero, too-small, or oversized ace->size terminates the walk so a malformed
++ * ACL cannot drive an out-of-bounds read.
++ *
++ * Return: the count, or 0 if @acl is NULL or its header does not fit.
++ */
++
++int ntfs_count_creator_owner_inherit(const ACL *acl)
++{
++	const ACCESS_ALLOWED_ACE *ace;
++	unsigned int off;
++	unsigned int acl_size;
++	unsigned int acesz;
++	int oldcnt;
++	int nace;
++	int count;
++
++	count = 0;
++	if (!acl)
++		return (0);
++	acl_size = le16_to_cpu(acl->size);
++	if (acl_size < sizeof(ACL))
++		return (0);
++	oldcnt = le16_to_cpu(acl->ace_count);
++	off = sizeof(ACL);
++	for (nace = 0; nace < oldcnt; nace++) {
++		if (off + 8 > acl_size)
++			break;
++		ace = (const ACCESS_ALLOWED_ACE*)((const char*)acl + off);
++		acesz = le16_to_cpu(ace->size);
++		if (acesz < 8 || acesz > acl_size - off)
++			break;
++		if (ace->type == ACCESS_DENIED_ACE_TYPE
++				&& (ace->flags & CONTAINER_INHERIT_ACE)
++				&& acesz >= 8 + sizeof(ownersidbytes)
++				&& ntfs_same_sid(&ace->sid, ownersid))
++			count++;
++		off += acesz;
++	}
++	return count;
++}
++
+ /*
+  *		Copy the inheritable parts of an ACL
+  *
+diff --git a/libntfs-3g/security.c b/libntfs-3g/security.c
+index acee0a5e..f26f549a 100644
+--- a/libntfs-3g/security.c
++++ b/libntfs-3g/security.c
+@@ -3944,6 +3944,32 @@ static le32 build_inherited_id(struct SECURITY_CONTEXT *scx,
+ 	usidsz = ntfs_sid_size(usid);
+ 	gsidsz = ntfs_sid_size(gsid);
+ 	newattrsz = parentattrsz + 3*usidsz + 3*gsidsz;
++	/*
++	 * The +3*usidsz + 3*gsidsz slack above only covers three creator-owner
++	 * SID expansions during ntfs_inherit_acl().
++	 * Add exact slack for the actual number of expanding ACEs in both the
++	 * parent DACL and SACL.  Each such ACE may grow the output by at most
++	 * (usidsz - 12) bytes for the SID substitution plus 20 bytes of
++	 * original ACE..kept for grandkids.
++	 */
++	if (pphead->dacl) {
++		offpacl = le32_to_cpu(pphead->dacl);
++		if ((unsigned int)offpacl + sizeof(ACL) <=
++				(unsigned int)parentattrsz) {
++			ppacl = (const ACL*)&parentattr[offpacl];
++			newattrsz += ntfs_count_creator_owner_inherit(ppacl)
++					* (usidsz - 12 + 20);
++		}
++	}
++	if (pphead->sacl) {
++		offpacl = le32_to_cpu(pphead->sacl);
++		if ((unsigned int)offpacl + sizeof(ACL) <=
++				(unsigned int)parentattrsz) {
++			ppacl = (const ACL*)&parentattr[offpacl];
++			newattrsz += ntfs_count_creator_owner_inherit(ppacl)
++					* (usidsz - 12 + 20);
++		}
++	}
+ 	if (fordir)
+ 		newattrsz *= 2;
+ 	newattr = (char*)ntfs_malloc(newattrsz);
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p2.patch
new file mode 100644
index 0000000000..7e19c55723
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p2.patch
@@ -0,0 +1,37 @@
+From 21f37bb5efa874b4e1212f499ca643d69f024021 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Wed, 10 Jun 2026 09:12:22 +0300
+Subject: [PATCH] ACLs: reject ACEs smaller than the ACE header in valid_acl
+
+valid_acl() walks the on-disk security descriptor and, for each ACE,
+switches on pace->type before any check that pace->size is at least
+sizeof(ACE_HEADER).  Every per-type case then performs SID reads and
+size arithmetic that assume an ACE_HEADER is fully present.
+
+Reject any ACE whose size is below sizeof(ACE_HEADER) up front so the
+per-type logic always operates on a fully-present header.
+
+CVE: CVE-2026-56135
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/21f37bb5efa874b4e1212f499ca643d69f024021]
+
+(cherry picked from commit 21f37bb5efa874b4e1212f499ca643d69f024021)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/acls.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/acls.c b/libntfs-3g/acls.c
+index 150a6a7e..5f45dad9 100644
+--- a/libntfs-3g/acls.c
++++ b/libntfs-3g/acls.c
+@@ -560,7 +560,9 @@ static BOOL valid_acl(const ACL *pacl, unsigned int end)
+ 			pace = (const ACCESS_ALLOWED_ACE*)
+ 				&((const char*)pacl)[offace];
+ 			acesz = le16_to_cpu(pace->size);
+-			switch (pace->type) {
++			if (acesz < sizeof(ACE_HEADER))
++				ok = FALSE;
++			else switch (pace->type) {
+ 			case ACCESS_ALLOWED_ACE_TYPE :
+ 			case ACCESS_DENIED_ACE_TYPE :
+ 				wantsz = ntfs_sid_size(&pace->sid) + 8;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p3.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p3.patch
new file mode 100644
index 0000000000..dc46a15222
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p3.patch
@@ -0,0 +1,204 @@
+From b0b9c32c7ff0fb0eac1eb9272da2ed10ae51a3b9 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Wed, 10 Jun 2026 09:24:04 +0300
+Subject: [PATCH] ACLs: size inherited ACLs generically
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The previous commit targets the overflow bug report directly: count DENY
+ACEs with CONTAINER_INHERIT_ACE that reference CREATOR_OWNER and reserve
+per match slack. But it doesn't cover all cases.
+
+An ACE has an 8-byte fixed part plus a variable-length SID.
+ntfs_inherit_acl() replaces creator placeholders (the 12-byte
+CREATOR_OWNER and CREATOR_GROUP SIDs) with the real owner or group SID,
+often larger, so substituted ACEs grow.  That substitution runs in more
+shapes than the previous counter recognises: for both ACCESS_ALLOWED and
+ACCESS_DENIED ACEs, for both CREATOR_OWNER and CREATOR_GROUP, and
+regardless of any inheritance flag whenever the parent descriptor's
+auto-inherited bit is clear.  And when the resolved owner SID happens to
+equal the static creator-group SID (S-1-3-1), a single ACE is
+substituted twice in the same pass — once as owner, once as group —
+doubling its growth.  Each of those uncovered shapes can under-allocate
+at the same write site as the originally reported issue.
+
+Replace the counter with ntfs_inherit_acl_extra_size(), which covers all
+four ALLOW/DENY x OWNER/GROUP combinations, reserves slack for the
+double-substitution case, validates each ACE's SID structurally before
+matching, and returns bytes directly so build_inherited_id() no longer
+encodes the per-ACE growth formula.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs.
+
+CVE: CVE-2026-56135
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/b0b9c32c7ff0fb0eac1eb9272da2ed10ae51a3b9]
+
+(cherry picked from commit b0b9c32c7ff0fb0eac1eb9272da2ed10ae51a3b9)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/ntfs-3g/acls.h |  3 +-
+ libntfs-3g/acls.c      | 66 ++++++++++++++++++++++++++++++++----------
+ libntfs-3g/security.c  | 18 +++++-------
+ 3 files changed, 60 insertions(+), 27 deletions(-)
+
+diff --git a/include/ntfs-3g/acls.h b/include/ntfs-3g/acls.h
+index 53e80876..4f36389c 100644
+--- a/include/ntfs-3g/acls.h
++++ b/include/ntfs-3g/acls.h
+@@ -168,7 +168,8 @@ char *ntfs_build_descr_posix(struct MAPPING* const mapping[],
+ 
+ #endif /* POSIXACLS */
+ 
+-int ntfs_count_creator_owner_inherit(const ACL *acl);
++int ntfs_inherit_acl_extra_size(const ACL *acl, const SID *usid,
++			const SID *gsid);
+ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 			const SID *usid, const SID *gsid,
+ 			BOOL fordir, le16 inherited);
+diff --git a/libntfs-3g/acls.c b/libntfs-3g/acls.c
+index 5f45dad9..21e9682f 100644
+--- a/libntfs-3g/acls.c
++++ b/libntfs-3g/acls.c
+@@ -684,34 +684,49 @@ BOOL ntfs_valid_descr(const char *securattr, unsigned int attrsz)
+ }
+ 
+ /**
+- * ntfs_count_creator_owner_inherit: count creator-owner inheritable ACEs
++ * ntfs_inherit_acl_extra_size: compute creator SID inheritance slack
+  * @acl: ACL to scan
++ * @usid: owner SID to substitute for CREATOR_OWNER
++ * @gsid: group SID to substitute for CREATOR_GROUP
+  *
+- * Walks @acl bounded by acl->size, counting DENY ACEs whose SID matches the
+- * creator-owner placeholder and which carry the CONTAINER_INHERIT_ACE flag.
+- * A zero, too-small, or oversized ace->size terminates the walk so a malformed
+- * ACL cannot drive an out-of-bounds read.
++ * Walks @acl bounded by acl->size, adding slack for ALLOW and DENY ACEs
++ * whose SID matches either creator placeholder.  ntfs_inherit_acl() can
++ * replace those placeholders by @usid or @gsid and, for directories, can
++ * also keep a verbatim copy for child inheritance.  Count the worst-case
++ * extra bytes so the inherited descriptor allocation cannot be overrun.
+  *
+- * Return: the count, or 0 if @acl is NULL or its header does not fit.
++ * Return: extra bytes needed, or 0 if @acl is NULL or structurally rejected.
+  */
+ 
+-int ntfs_count_creator_owner_inherit(const ACL *acl)
++int ntfs_inherit_acl_extra_size(const ACL *acl,
++			const SID *usid, const SID *gsid)
+ {
+ 	const ACCESS_ALLOWED_ACE *ace;
+ 	unsigned int off;
+ 	unsigned int acl_size;
+ 	unsigned int acesz;
++	unsigned int sidsz;
++	int usidsz;
++	int gsidsz;
++	int ownersidsz;
++	int groupsidsz;
+ 	int oldcnt;
+ 	int nace;
+-	int count;
++	int extra;
++	BOOL usid_is_group_sid;
+ 
+-	count = 0;
+-	if (!acl)
++	extra = 0;
++	if (!acl || !usid || !gsid)
+ 		return (0);
+ 	acl_size = le16_to_cpu(acl->size);
+ 	if (acl_size < sizeof(ACL))
+ 		return (0);
+ 	oldcnt = le16_to_cpu(acl->ace_count);
++	usidsz = ntfs_sid_size(usid);
++	gsidsz = ntfs_sid_size(gsid);
++	ownersidsz = sizeof(ownersidbytes);
++	groupsidsz = sizeof(groupsidbytes);
++	usid_is_group_sid = ntfs_same_sid(usid, groupsid);
+ 	off = sizeof(ACL);
+ 	for (nace = 0; nace < oldcnt; nace++) {
+ 		if (off + 8 > acl_size)
+@@ -720,14 +735,33 @@ int ntfs_count_creator_owner_inherit(const ACL *acl)
+ 		acesz = le16_to_cpu(ace->size);
+ 		if (acesz < 8 || acesz > acl_size - off)
+ 			break;
+-		if (ace->type == ACCESS_DENIED_ACE_TYPE
+-				&& (ace->flags & CONTAINER_INHERIT_ACE)
+-				&& acesz >= 8 + sizeof(ownersidbytes)
+-				&& ntfs_same_sid(&ace->sid, ownersid))
+-			count++;
++		switch (ace->type) {
++		case ACCESS_ALLOWED_ACE_TYPE :
++		case ACCESS_DENIED_ACE_TYPE :
++			if ((acesz >= 8 + sizeof(ownersidbytes))
++					&& ntfs_valid_sid(&ace->sid)) {
++				sidsz = ntfs_sid_size(&ace->sid);
++				if (sidsz <= acesz - 8) {
++					if (ntfs_same_sid(&ace->sid, ownersid))
++					{
++						extra += usidsz	- ownersidsz +
++								20;
++						if (usid_is_group_sid)
++							extra += gsidsz	-
++								groupsidsz + 20;
++					}
++					if (ntfs_same_sid(&ace->sid, groupsid))
++						extra += gsidsz	- groupsidsz +
++								20;
++				}
++			}
++			break;
++		default :
++			break;
++		}
+ 		off += acesz;
+ 	}
+-	return count;
++	return extra;
+ }
+ 
+ /*
+diff --git a/libntfs-3g/security.c b/libntfs-3g/security.c
+index f26f549a..d0e030e1 100644
+--- a/libntfs-3g/security.c
++++ b/libntfs-3g/security.c
+@@ -3945,20 +3945,18 @@ static le32 build_inherited_id(struct SECURITY_CONTEXT *scx,
+ 	gsidsz = ntfs_sid_size(gsid);
+ 	newattrsz = parentattrsz + 3*usidsz + 3*gsidsz;
+ 	/*
+-	 * The +3*usidsz + 3*gsidsz slack above only covers three creator-owner
+-	 * SID expansions during ntfs_inherit_acl().
+-	 * Add exact slack for the actual number of expanding ACEs in both the
+-	 * parent DACL and SACL.  Each such ACE may grow the output by at most
+-	 * (usidsz - 12) bytes for the SID substitution plus 20 bytes of
+-	 * original ACE..kept for grandkids.
++	 * The +3*usidsz + 3*gsidsz slack above only covers a few creator SID
++	 * expansions during ntfs_inherit_acl().  Add worst-case slack for every
++	 * ALLOW/DENY creator-owner and creator-group ACE in both the parent
++	 * DACL and SACL.
+ 	 */
+ 	if (pphead->dacl) {
+ 		offpacl = le32_to_cpu(pphead->dacl);
+ 		if ((unsigned int)offpacl + sizeof(ACL) <=
+ 				(unsigned int)parentattrsz) {
+ 			ppacl = (const ACL*)&parentattr[offpacl];
+-			newattrsz += ntfs_count_creator_owner_inherit(ppacl)
+-					* (usidsz - 12 + 20);
++			newattrsz += ntfs_inherit_acl_extra_size(ppacl,
++					usid, gsid);
+ 		}
+ 	}
+ 	if (pphead->sacl) {
+@@ -3966,8 +3964,8 @@ static le32 build_inherited_id(struct SECURITY_CONTEXT *scx,
+ 		if ((unsigned int)offpacl + sizeof(ACL) <=
+ 				(unsigned int)parentattrsz) {
+ 			ppacl = (const ACL*)&parentattr[offpacl];
+-			newattrsz += ntfs_count_creator_owner_inherit(ppacl)
+-					* (usidsz - 12 + 20);
++			newattrsz += ntfs_inherit_acl_extra_size(ppacl,
++					usid, gsid);
+ 		}
+ 	}
+ 	if (fordir)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p4.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p4.patch
new file mode 100644
index 0000000000..6caaef5599
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-56135_p4.patch
@@ -0,0 +1,95 @@
+From 98b153894bb3cc75cd13179a108eef9feda35422 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jean-Pierre=20Andr=C3=A9?= <jean-pierre.92131@orange.fr>
+Date: Sun, 5 Jul 2026 08:44:32 +0200
+Subject: [PATCH] Guard against multiple creator-owner and creator-group ACEs
+
+Generic creator-owner and creator-group ACEs are intended as place
+holders for grants and denials for files and directories to be created
+by the current user, and upon creation these tokens must be replaced
+by the user or group SID. This is to make sure there is a single grant
+and a single denial in the SACL and a single one in the DACL to prevent
+from a buffer overflowing triggered by a crafted ntfs image. No
+replacement is done in further such ACEs whose size is kept unchanged.
+
+CVE: CVE-2026-56135
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/98b153894bb3cc75cd13179a108eef9feda35422]
+
+(cherry picked from commit 98b153894bb3cc75cd13179a108eef9feda35422)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/acls.c     | 19 +++++++++++++++++--
+ libntfs-3g/security.c |  3 +++
+ 2 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/libntfs-3g/acls.c b/libntfs-3g/acls.c
+index 21e9682f..03109c55 100644
+--- a/libntfs-3g/acls.c
++++ b/libntfs-3g/acls.c
+@@ -785,6 +785,8 @@ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 	int usidsz;
+ 	int gsidsz;
+ 	BOOL acceptable;
++	BOOL cancreator;
++	int withcrowner, withcrgroup;
+ 	const ACCESS_ALLOWED_ACE *poldace;
+ 	ACCESS_ALLOWED_ACE *pnewace;
+ 	ACCESS_ALLOWED_ACE *pauthace;
+@@ -805,6 +807,7 @@ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 	selection = (fordir ? CONTAINER_INHERIT_ACE : OBJECT_INHERIT_ACE);
+ 	newcnt = 0;
+ 	oldcnt = le16_to_cpu(oldacl->ace_count);
++	withcrowner = withcrgroup = 0;
+ 	for (nace = 0; nace < oldcnt; nace++) {
+ 		poldace = (const ACCESS_ALLOWED_ACE*)((const char*)oldacl + src);
+ 		acesz = le16_to_cpu(poldace->size);
+@@ -926,6 +929,10 @@ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 			/*
+ 			 * Inheritance for access, specific to
+ 			 * creator-owner (and creator-group)
++			 * Only one ACCESS_ALLOWED_ACE_TYPE and
++			 * one ACCESS_DENIED_ACE_TYPE are allowed
++			 * and this must be checked to defend
++			 * against possible buffer overflows.
+ 			 */
+ 		if ((fordir || !inherited
+ 			|| (poldace->flags
+@@ -939,7 +946,12 @@ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 				 * creator-group by owner and group
+ 				 * (but keep for further inheritance)
+ 				 */
+-			if (ntfs_same_sid(&pnewace->sid, ownersid)) {
++			cancreator = (pnewace->type == ACCESS_ALLOWED_ACE_TYPE)
++				|| (pnewace->type == ACCESS_DENIED_ACE_TYPE);
++			if (ntfs_same_sid(&pnewace->sid, ownersid)
++				&& cancreator
++				&& !(withcrowner & (1 << pnewace->type))) {
++				withcrowner |= 1 << pnewace->type;
+ 				memcpy(&pnewace->sid, usid, usidsz);
+ 				pnewace->size = cpu_to_le16(usidsz + 8);
+ 					/* remove inheritance flags */
+@@ -957,7 +969,10 @@ int ntfs_inherit_acl(const ACL *oldacl, ACL *newacl,
+ 					newcnt++;
+ 				}
+ 			}
+-			if (ntfs_same_sid(&pnewace->sid, groupsid)) {
++			if (ntfs_same_sid(&pnewace->sid, groupsid)
++				&& cancreator
++				&& !(withcrgroup & (1 << pnewace->type))) {
++				withcrgroup |= 1 << pnewace->type;
+ 				memcpy(&pnewace->sid, gsid, gsidsz);
+ 				pnewace->size = cpu_to_le16(gsidsz + 8);
+ 					/* remove inheritance flags */
+diff --git a/libntfs-3g/security.c b/libntfs-3g/security.c
+index d0e030e1..67d3d53a 100644
+--- a/libntfs-3g/security.c
++++ b/libntfs-3g/security.c
+@@ -3938,6 +3938,9 @@ static le32 build_inherited_id(struct SECURITY_CONTEXT *scx,
+ 		 * except for differences in SIDs which appear in
+ 		 * owner, group and possible grants and denials in
+ 		 * generic creator-owner and creator-group ACEs.
++		 * Each of these ACEs can occur at most once in
++		 * the DACL and in the SACL, so for a file there
++		 * may be at most 3 usid and 3 gsid replacements.
+ 		 * For directories, an ACE may be duplicated for
+ 		 * access and inheritance, so we double the count.
+ 		 */
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index d5bc18d2b4..938a661d2c 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -19,6 +19,10 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://CVE-2026-42616.patch \
            file://CVE-2026-40706_p1.patch \
            file://CVE-2026-40706_p2.patch \
+           file://CVE-2026-56135_p1.patch \
+           file://CVE-2026-56135_p2.patch \
+           file://CVE-2026-56135_p3.patch \
+           file://CVE-2026-56135_p4.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.44.4
