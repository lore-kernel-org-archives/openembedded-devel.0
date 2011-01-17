Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PetEk-0003iw-Hx
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 18:51:26 +0100
Received: by gyh20 with SMTP id 20so2049879gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5wxR5GAi+5ydyBm/y9A97XvKYkr+CYxMjk0B9bVxmwA=;
	b=K4FfkW6Ka8Nm1K1IMqCLAMHw1rAfTqYn9fbm2B86ZVZTmEXtC9kxprHZf9zVucKPzq
	GYKuBNEpcDbXFt5eucCILTzSuRWcREx+qgiIXHEBu9OYsB3m00FICVPHetn2TzHMp5rj
	Ux3cQfBjn08nM/6YJfkAx62MizD9VUI0EG4vc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ecj2HGMaKDjepyCVWDjZNHUaMJCgfOUpSuzT5jp0MMRmNTdk5n4PKOrbajMka1fiVI
	SmMopjkG39MJYIL5TAKu01gpK9LjcQ8sMlcYILpwwQbfZxUhYvv0HXk40u8JC9mGlqXL
	klE3Hpa0YQq/5ZO7RR35q+0JpiNriIXOxenIs=
Received: by 10.91.35.34 with SMTP id n34mr4869650agj.203.1295286647905;
	Mon, 17 Jan 2011 09:50:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i10sm5754693anh.12.2011.01.17.09.50.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 09:50:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 09:50:39 -0800
Message-Id: <1295286639-4901-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] sane-toolchain.inc: Prefer binutils 2.21
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
X-List-Received-Date: Mon, 17 Jan 2011 17:51:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 642f289..dd06650 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -6,7 +6,7 @@
 
 # Base line versions, good for most things
 PREFERRED_GCC_VERSION                ?= "4.5"
-PREFERRED_BINUTILS_VERSION           ?= "2.20.1"
+PREFERRED_BINUTILS_VERSION           ?= "2.21"
 PREFERRED_UCLIBC_VERSION             ?= "git"
 PREFERRED_EGLIBC_VERSION             ?= "2.12"
 PREFERRED_GLIBC_VERSION              ?= "2.10.1"
-- 
1.7.2.3



