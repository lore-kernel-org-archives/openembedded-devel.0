Received: from [209.85.221.190] (helo=mail-qy0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MlBjM-0001hl-9L
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 03:12:19 +0200
Received: by qyk28 with SMTP id 28so3292361qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2009 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=UwrlLl2JswHdrxCGX0jxihUmW4z47ykkg0C0a7SrIrE=;
	b=eqlSHnQYO8wwRGJmBa/as2KseuZX2RomxY4Pb8oGK8jEn3A9P1q3Y6bEVXEMuLn/uu
	9gY8jEDEe8/YG4FABEObt/8huRTrNS9R9Xgs9afUNxL+2w8TPJhBft9WU3ve/4xMl6zA
	36z7hdElYP/D48XVDB9JvTfqEIfdclXtLLN4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mWSPjz8HmficiVaWTJzYZaNRDPAmNeDQOc00aS+m8tJiPEnEMJ/AcPnggPA3JdFn1D
	49LvINEowc3HzDimMSWbZ0ZwHz2xVJke8Ujy6dCKu3AKzUhc1cuywj9E4b3aVyN7RZMt
	zep/pSEUJr44nWMdkGfBppHx3pOrVm3ZZXm7M=
Received: by 10.224.121.66 with SMTP id g2mr10467879qar.47.1252447078932;
	Tue, 08 Sep 2009 14:57:58 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 5sm27257qwh.10.2009.09.08.14.57.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Sep 2009 14:57:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2009 14:57:42 -0700
Message-Id: <1252447062-12948-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.221.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] tar_1.22.bb: Add recipe for 1.22 release.
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
X-List-Received-Date: Wed, 09 Sep 2009 01:12:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/checksums.ini      |    4 ++++
 recipes/tar/tar_1.22.bb |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tar/tar_1.22.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 053a2ad..e720a28 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23734,6 +23734,10 @@ sha256=44944ee0427c8e0d8dbaa0b8f900073a7456819610cc521c53630c3eb117cf5e
 md5=1a7e17f27abf583b3b0bc059a827e68b
 sha256=be8bf33afb5adc2377e45d94693ffd46b75f267f9b808df0c7006e51211f9deb
 
+[ftp://ftp.gnu.org/gnu/tar/tar-1.22.tar.bz2]
+md5=07fa517027f426bb80f5f5ff91b63585
+sha256=3cefb67f197a3f8f5235999fe749ced0889466a71ddcbc96fddca84e5d53aa4d
+
 [http://downloads.sourceforge.net/subapplet/tasklist-105.tar.gz]
 md5=dc62a061d83cf72d1eca7e8ae2c8e1a6
 sha256=4078c44beebfd298995983b9e2ea189167a1ab081d96a7c485a67b65a974e878
diff --git a/recipes/tar/tar_1.22.bb b/recipes/tar/tar_1.22.bb
new file mode 100644
index 0000000..25163ac
--- /dev/null
+++ b/recipes/tar/tar_1.22.bb
@@ -0,0 +1 @@
+require tar.inc
-- 
1.6.3.3



