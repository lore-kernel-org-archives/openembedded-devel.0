Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZQJv-0008W7-VC
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:25:56 +0200
Received: by fxm12 with SMTP id 12so507312fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=41ponkymwIrz5ZNrU758O/ZQ8E6ILdDMkA10VT+TLj4=;
	b=fvg3NKuiLWy1EGmNIimAYA/6EtyadMJP7T+ZUHgPOtg9782U38jPnUOqx6BqtoO46g
	mzZrvBSWp1h8XIOhbC31OaOD/SufYYx2/HtnXMQdLeexfoK5dujThn5DGNNpNQWTb6S6
	kg87ozvzImygX4MD3lEw29z6oUK23WkpHjkZo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EpZWlSmqnRIo06na7fM2kCKp+OWOvpiliOzFSVlWmB786/vxxBmiO5oXIveqDvf+as
	yeaR5s3w9MJKOCESBufUOAzzljuw8voXPnr+BBC7L3fPh9vDc5JUOIGp57WBIyl9+jnr
	sHcSXW2pw6G4RG8LOOLu6v4SmY67UwAU7ig7E=
Received: by 10.86.86.2 with SMTP id j2mr55125fgb.0.1279207551566;
	Thu, 15 Jul 2010 08:25:51 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id h4sm361416faj.15.2010.07.15.08.25.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 08:25:51 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZQJj-0001P2-Cq; Thu, 15 Jul 2010 17:25:43 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 17:25:41 +0200
Message-Id: <1279207542-5277-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279207542-5277-1-git-send-email-rep.dot.nop@gmail.com>
References: <1279207542-5277-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] micro: get PREFERRED_BINUTILS from sane-toolchain
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
X-List-Received-Date: Thu, 15 Jul 2010 15:25:56 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/micro.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 9885425..3334692 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -61,7 +61,6 @@ MACHINE_KERNEL_VERSION = "2.6"
 # TOOLCHAIN
 #############################################################################
 LIBC ?= "eglibc"
-PREFERRED_BINUTILS = "2.19.51"
 PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
-- 
1.7.1



