Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA2j-00065G-QS
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:24:33 +0100
Received: by bwz10 with SMTP id 10so1577445bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dr46VL6djv/sLfmAEybPzq/Fepv2ja//YoK/soVfLmI=;
	b=RHyZxeGqghdpj4lw4hdtohQuvQ0y6SF+7ko0btZhsUywIIbEArqedPUis1qskFJuRu
	M9L9T3bnAt9vCGcNJspb2p439ymXciexNj+x4ExDvylaHuMLs44ORdV0pnGKzLQemI2X
	Ie9Xc0W4UMqsbMv2F2p9I66sfCM+i43jw9A3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pnBkFkVPvgqaAfJrRJCea+aza4WuA35Eia5QnKnNzW7+n6TvXmYjc47YBkKA2hiQ5Z
	5fZ/HHUrUaARptKW2k0bDCBb9RN8/6ozuw0369hzVbNZQBfyM8hZtPh1TVvCiJDd5lDw
	Gp0+HzjkBbYEwReQxkd1hsa2PPt6XD+r19O3o=
Received: by 10.204.62.73 with SMTP id w9mr744844bkh.11.1296065617071;
	Wed, 26 Jan 2011 10:13:37 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id x38sm7654009bkj.1.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002W4-Pf; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:27 +0100
Message-Id: <1296065612-9637-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 4/9] micro: get preferred binutils from sane-toolchain
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
X-List-Received-Date: Wed, 26 Jan 2011 18:24:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/micro.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 5902105..963afa8 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -61,7 +61,6 @@ MACHINE_KERNEL_VERSION = "2.6"
 # TOOLCHAIN
 #############################################################################
 LIBC ?= "eglibc"
-PREFERRED_BINUTILS                  ?= "2.20.1"
 PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
-- 
1.7.2.3



