Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvZ-0006wF-1B
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:11 +0200
Received: by pxi11 with SMTP id 11so1118076pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=GbIph8Uwvb4N+fz+IhufUwyOHmEUhF0mIV4/lRL1s5g=;
	b=Xc6yNCZ6nmca+NeAIeP2e9l59dr+Q+gzc7Cy6hhQFQwUlwra8HpCf9hB8zYaTZVT3B
	eXZ5Zg30c0LGmsnsNHEFp27r5AoSMPxXDK6aASTVcSHaYjVdli5hqTN+1IeamzDoWKrv
	MBfkCMY619Y+hp19E1/rrMPLoHoU28RAY+fOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o99PxmaZNPS87pK1hJO2JIl9mqsVUHHMY635sX30yNz0SEf2UScrG6cnLus8FaprUf
	glwVs0e91OmwEqK7srRVqZiN0yBdD8+NJc5yfyL5Uv2xMjf0aW1pBQNDrxKe7wafM18G
	1WNIHb73mJiZpxpgPnYQoOnvDvKGiZ69WHEBA=
Received: by 10.114.134.9 with SMTP id h9mr5940868wad.5.1285456379948;
	Sat, 25 Sep 2010 16:12:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:32 -0700
Message-Id: <1285456353-27457-12-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/12] run-qemu.sh: Add new target mips64 and mips64el
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/qemu/run-qemu.sh |   26 +++++++++++++++++++++++++-
 1 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/contrib/qemu/run-qemu.sh b/contrib/qemu/run-qemu.sh
index 068fd3e..574bf72 100755
--- a/contrib/qemu/run-qemu.sh
+++ b/contrib/qemu/run-qemu.sh
@@ -145,13 +145,37 @@ case $arch in
 	kernel="bzImage"
 	image="minimalist-image"
 	;;
+    mips64)
+	address="192.168.1.107"
+	macaddr="00:16:3e:00:00:07"
+	gdbport="1238"
+	machine="malta"
+	mem="256"
+	consoleopt="console=ttyS0"
+	rootdisk="hda"
+	qemuopts="-nographic"
+	kernel="vmlinux"
+	image="minimalist-image"
+	;;
+    mips64el)
+	address="192.168.1.108"
+	macaddr="00:16:3e:00:00:08"
+	gdbport="1239"
+	machine="malta"
+	mem="256"
+	consoleopt="console=ttyS0"
+	rootdisk="hda"
+	qemuopts="-nographic"
+	kernel="vmlinux"
+	image="minimalist-image"
+	;;
     *)
 	echo "Specify one architectures out of $supported_archs to emulate."
 	exit 1
 	;;
     esac
 
-nfsserver="192.168.1.1"		# address of NFS server
+nfsserver="192.168.1.64"	# address of NFS server
 gateway="192.168.1.254"		# default gateway
 netmask="255.255.255.0"		# subnet mask
 hostname="qemu$arch"		# hostname for guest server
-- 
1.7.0.4



