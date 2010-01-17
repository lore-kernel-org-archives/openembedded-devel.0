Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NWLl8-0005N7-TY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 04:25:06 +0100
Received: by pwi4 with SMTP id 4so1066094pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2010 19:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=51or37yqARFZVcNetd5C7GQjQkaH86LCtkEk2qAZpII=;
	b=FDo72nkswgulQdihWHAIURPsPS+5ksjdwuwHxJ2osZXsfXGv6P1heBb3Esze0CpO50
	NbO0ivNPGK6qUJim7w2+0XJPc8kdGwYJHi3sCiGpggS/mSbb8hQhQ/UdRj+5v4X65eKj
	ZuccQ9IZ3iloKkVasPRRAGJsggfpyeuDRDkt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FlI4pCPLsKI2iLzVMK8SqFDFZVgKZoekTY6EZODrtF6aa5zVZ2gEtLnxQEp0HZvDQg
	EyD7dKbuYhb3c6tft4s2QE/SMrU4yc7+RkpVTzMaQUaX6Gk4t8Ui4R1xao9jQcMrqD4h
	N8XC16VmtAuOSS3GtYTJyRkZw9HQSJry9Vq64=
Received: by 10.142.8.21 with SMTP id 21mr2989548wfh.324.1263698568713;
	Sat, 16 Jan 2010 19:22:48 -0800 (PST)
Received: from localhost ([123.54.101.24])
	by mx.google.com with ESMTPS id 22sm2895402pzk.6.2010.01.16.19.22.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 16 Jan 2010 19:22:47 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 11:22:21 +0800
Message-Id: <1263698541-9726-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Change the prefer binutils of micro.conf from 2.19.51 to 2.18
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
X-List-Received-Date: Sun, 17 Jan 2010 03:25:06 -0000

* the previous default version of binutils (2.19.51) in micro.conf cause the default version of glibc failed to build

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 conf/distro/micro.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index d9fc595..4991620 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -61,7 +61,7 @@ MACHINE_KERNEL_VERSION = "2.6"
 # TOOLCHAIN
 #############################################################################
 LIBC ?= "eglibc"
-PREFERRED_BINUTILS = "2.19.51"
+PREFERRED_BINUTILS = "2.18"
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
 require conf/distro/include/sane-toolchain.inc
 
-- 
1.5.4.3



