Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PoAsp-0001I5-Kh
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 09:31:11 +0100
Received: by bwz10 with SMTP id 10so3735574bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 00:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=wcmybeSY3t7maSEJv4P8FdtqdvAzWj6ObnHK35h0AWo=;
	b=ntgWzS/x5PHAfEDCV16vDpGTS3pIMqXbc0zPQZSuicmoQhklHqKfmTPM9zftRcnf10
	GpoeOQYS5nVe9bBcUTHgt4U/0tjvRMoHM7PVh9H5m9L2ZrWD6OgeX0k5lnlzSZZggZE5
	iDIbLpjJCYZKbkIxgQFCWTRfN3cZLoskC7bq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UVUsFHVUbZmFHhMaE1i/VTmlCxdVdBjuIdfSBlzQMS1YKizaf+0dLwLk0KCLvKb0Qt
	a5LmM6Qb8YBvIvr7HkVZPdlFpOS1hGcKBbQ7wHiNWkgmKyIsHiwD76oHle0ywYgUt1QK
	iDbC3QvpPoexi65N9YMKJj/tVWjn8Gn1dM0Fk=
Received: by 10.204.72.137 with SMTP id m9mr2053773bkj.191.1297499401449;
	Sat, 12 Feb 2011 00:30:01 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id x38sm129708bkj.13.2011.02.12.00.29.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 00:30:00 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kristoffer.ericson@gmail.com
Date: Sat, 12 Feb 2011 09:29:54 +0100
Message-Id: <1297499394-7636-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1297461882-5965-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297461882-5965-1-git-send-email-filip.zyzniewski@gmail.com>
Subject: [PATCH v2] distro/jlime-2010.1.conf: cleaned up RDEPENDS, beefed up FEATURES.
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
X-List-Received-Date: Sat, 12 Feb 2011 08:31:11 -0000

tslib and dialog should be pulled in by appropiate dependencies and
wireless-tools comes from wifi in DISTRO_FEATURES.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 conf/distro/jlime-2010.1.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
index 2bc3d10..a3ec20e 100644
--- a/conf/distro/jlime-2010.1.conf
+++ b/conf/distro/jlime-2010.1.conf
@@ -23,8 +23,7 @@ OVERRIDES .= ":jlime"
 #
 # What we want on the bootstrap image (extra) 
 #
-DISTRO_EXTRA_RDEPENDS = "wireless-tools nano keymaps tslib-calibrate \
-			 console-tools tslib-tests dialog"
+DISTRO_EXTRA_RDEPENDS = "nano keymaps console-tools"
 
 #
 # Our Image files should look abit better.
@@ -67,7 +66,7 @@ TARGET_FPU_armeb = "soft"
 TARGET_FPU_mipsel = "soft"
 TARGET_FPU_mips = "soft"
 
-DISTRO_FEATURES += " eabi "
+DISTRO_FEATURES += "eabi wifi"
 
 LIBC ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc = "${LIBC}"
-- 
1.7.1



