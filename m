Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PTlLc-0007o4-9N
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 02:12:32 +0100
Received: by fxm11 with SMTP id 11so1207325fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 17:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DXQhUr1sO+0HiQQkmvO5isHHUrh8NUoz7zjtXY3ulTM=;
	b=envy1xkmpX9kRsRw+QQfo7Ksp0YHROgy9Wo9gxgmnqSC0oq4f3OdOIEZFL83gPwWxh
	nRbGZvintJYobE1Bzd+VCQ/K0zJY8KfLTi+99X/oznXI6TYI38FWaeuwcDcJ06quc9GJ
	edd5TDneIXe3LX+KIWaXSordNU77IPcPzVX+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pnf9bU0DnamWHedbefg5gbibCN6bS3kH1cFM9fGR1eA/+WdX1ICF41Uasn3kIy4L+t
	bKU5INVzarLRmYpLbsBr+M2jGblYrKFdeSD+xagCCC0zi8Mp4prOxGKWjOfp1DEkx/hY
	dB1vDwvbjdqtGyhbO3JW1be5BJtbXqApheRdc=
Received: by 10.223.73.206 with SMTP id r14mr409910faj.126.1292545004343;
	Thu, 16 Dec 2010 16:16:44 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y14sm235524fak.18.2010.12.16.16.16.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 16:16:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Dec 2010 01:16:51 +0100
Message-Id: <1292545011-30611-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.3
Subject: [PATCH] sane-toolchain: use hard assignment instead of weak for libtool version and LIBTOOL_HAS_SYSROOT
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
X-List-Received-Date: Sat, 18 Dec 2010 01:12:32 -0000

* bitbake.conf already has weak LIBTOOL_HAS_SYSROOT ?= "no" so setting to "yes" here was ignored
---
 conf/distro/include/sane-toolchain.inc |    8 ++++++--
 conf/distro/shr.conf                   |    3 ---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index c0a4021..e29893a 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -10,8 +10,12 @@ PREFERRED_BINUTILS_VERSION           ?= "2.20.1"
 PREFERRED_UCLIBC_VERSION             ?= "git"
 PREFERRED_EGLIBC_VERSION             ?= "2.12"
 PREFERRED_GLIBC_VERSION              ?= "2.10.1"
-PREFERRED_LIBTOOL_VERSION            ?= "2.4"
-LIBTOOL_HAS_SYSROOT                  ?= "yes"
+# we need hard assignment here, because bitbake.conf has 
+# weak "no" first so weak "yes" here won't override it
+# also use hard assignment for version to make sure it's 
+# new enough for SYSROOT support
+PREFERRED_LIBTOOL_VERSION            = "2.4"
+LIBTOOL_HAS_SYSROOT                  = "yes"
 
 # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc              ?= "${PREFERRED_GLIBC_VERSION}"
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 6295ff3..0258231 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -159,9 +159,6 @@ MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 # TOOLCHAIN
 #############################################################################
 LIBC ?= "eglibc"
-# it's needed here without weak assignment, because bitbake.conf has 
-# weak "no" first and weak "yes" in sane-toolchain is then ignored
-LIBTOOL_HAS_SYSROOT = "yes"
 require conf/distro/include/sane-toolchain.inc
 require conf/distro/include/arm-thumb.inc
 
-- 
1.7.3.3



