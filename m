Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsET8-0000sB-6X
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:26 +0100
Received: by yxn22 with SMTP id 22so1122005yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=oatPCwGeozc1kO8oqTdMfsasQSIqbeAmXF4CjaYdPUo=;
	b=N8m4Y2xbrHmsW/5FhU4XV1k87L43jKKjIYDxiV4flJ9hhtXSjc81W3DKFijJ7Ew/kn
	yYdg7KANhEySuWTYT0Zh4nVr3Durv8uYdSNsIo7m+lAmuusmw6IXxfnIBJGUks0IC2xc
	tLDULPvkX7VNog5J3CDrH+3lXVFeXQHLlnrYI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XS+OUl1TYsu224gNNb4Ig2BbcYmBVNgMrcx2+sapFQ749oAhAL3PUFwKcbByUUuv6E
	Ra3KYdUawwj3qTRHL0Ch3ghjshxH1OymCikJuqkLhTEvhBFYfVbyscCckwYeVDazTYV6
	0Ua8m1uilqzeWfQQYjGStyUCMNOaRmDjYf2wU=
Received: by 10.90.104.18 with SMTP id b18mr16461agc.81.1298466484816;
	Wed, 23 Feb 2011 05:08:04 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:03 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:18 +0000
Message-Id: <1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/14] ntfsprogs: add 2.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Feb 2011 13:09:26 -0000

This recipe has been imported from O.S. Systems tree and hence starts
at revision r2.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../ntfsprogs/ntfsprogs/skip-erange-errors.patch   |   30 ++++++++++++++++++++
 recipes/ntfsprogs/ntfsprogs_2.0.0.bb               |   15 ++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ntfsprogs/ntfsprogs/skip-erange-errors.patch
 create mode 100644 recipes/ntfsprogs/ntfsprogs_2.0.0.bb

diff --git a/recipes/ntfsprogs/ntfsprogs/skip-erange-errors.patch b/recipes/ntfsprogs/ntfsprogs/skip-erange-errors.patch
new file mode 100644
index 0000000..7292d77
--- /dev/null
+++ b/recipes/ntfsprogs/ntfsprogs/skip-erange-errors.patch
@@ -0,0 +1,30 @@
+diff --git a/libntfs/attrib.c b/libntfs/attrib.c
+index a1fe954..c628d9d 100644
+--- a/libntfs/attrib.c
++++ b/libntfs/attrib.c
+@@ -550,8 +550,10 @@ int ntfs_attr_map_runlist_range(ntfs_attr *na, VCN from_vcn, VCN to_vcn)
+ 		(long long)from_vcn, (long long)to_vcn);
+ 
+ 	/* Map extent with @from_vcn. */
+-	if (ntfs_attr_map_runlist(na, from_vcn))
+-		goto err_out;
++	if (ntfs_attr_map_runlist(na, from_vcn)) {
++		if (errno != ERANGE)
++			goto err_out;
++	}
+ 
+ 	for (rl = na->rl; rl->vcn <= to_vcn;) {
+ 		/* Skip not interesting to us runs. */
+@@ -4924,8 +4926,10 @@ static int ntfs_non_resident_attr_expand(ntfs_attr *na, const s64 newsize,
+ 		/* Map required part of runlist. */
+ 		if (ntfs_attr_map_runlist(na, na->allocated_size >>
+ 					vol->cluster_size_bits)) {
+-			ntfs_log_error("Failed to map runlist.\n");
+-			return -1;
++			if (errno != ERANGE) {
++				ntfs_log_error("Failed to map runlist.\n");
++				return -1;
++			}
+ 		}
+ 
+ 		/*
diff --git a/recipes/ntfsprogs/ntfsprogs_2.0.0.bb b/recipes/ntfsprogs/ntfsprogs_2.0.0.bb
new file mode 100644
index 0000000..b41985d
--- /dev/null
+++ b/recipes/ntfsprogs/ntfsprogs_2.0.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "NTFS utilies"
+HOMEPAGE = "http://www.linux-ntfs.org/"
+DEPENDS = "fuse"
+LICENSE = "GPLv2"
+PR = "r2"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/linux-ntfs/ntfsprogs-2.0.0.tar.bz2 \
+           file://skip-erange-errors.patch"
+
+SRC_URI[md5sum] = "2b39dece8897bc748f4ab4c40ec7699e"
+SRC_URI[sha256sum] = "ad36e19706c7303b10aa0a9bf2c2dd0309b91cd0171f1c9eb361d94a85017432"
+
+inherit autotools 
+
+EXTRA_OECONF += "--disable-gnome-vfs"
-- 
1.7.2.3



