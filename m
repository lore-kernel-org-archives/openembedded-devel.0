Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOSP-0001pI-Mh
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:15:56 +0100
Received: by mail-bw0-f217.google.com with SMTP id 9so3028821bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ONZqrn6mQPB5MmNnBNWk4VGtNvuukoYtSzswk1x9Ki0=;
	b=rJcVgQgg5oSV4gelGS0qcvZVSITC1J7tSbQAH9JH+Qh2RZKvod9oRjyTqO/i73m1Bn
	0owZZ8zRwtvNN0xk+0w/IZ5/zhBzDenZFWIc4iMZl/1yldN73UnmU+u6ceexzkqMl2gF
	lotTmduV1PUIbRyiAb/BaoZGEc5GURm7qjbQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VGjXE+cxlywbjBZwTGg0k+nGOWhIeHsW2fV16paiKtp919wdJzJrmw7S0scUwtMxMf
	Y6S/58gN5Fk6923VjH/vloaux3w+hLu/HGXhZtfVXJSMxHz46B1VWJD31u30Dd/ajAMo
	e+cjhXwtW4CKYhFjQtxb31NCSln4YGq8mIyJA=
Received: by 10.204.49.68 with SMTP id u4mr6226924bkf.42.1260134056904;
	Sun, 06 Dec 2009 13:14:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1747353fxm.13.2009.12.06.13.14.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:47 +0100
Message-Id: <1260134030-3658-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <1260134030-3658-3-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-3-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/6] minimal.conf: remove preferred providers as the same are defined in compatibility-providers.conf
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
X-List-Received-Date: Sun, 06 Dec 2009 21:15:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/minimal.conf |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 33eceab..1e9eec2 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -84,20 +84,6 @@ LIBC ?= "eglibc"
 require conf/distro/include/sane-toolchain.inc
 
 #############################################################################
-# PREFERRED PROVIDERS
-#############################################################################
-PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
-PREFERRED_PROVIDER_avahi = "avahi"
-PREFERRED_PROVIDER_gconf = "gconf-dbus"
-PREFERRED_PROVIDER_gtk+ = "gtk+"
-PREFERRED_PROVIDER_libgpewidget = "libgpewidget"
-PREFERRED_PROVIDER_virtual/db = "db3"
-PREFERRED_PROVIDER_virtual/db-native = "db3-native"
-PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
-PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
-
-#############################################################################
 # PREFERRED VERSIONS
 #############################################################################
 require conf/distro/include/sane-srcdates.inc
-- 
1.6.5.4



