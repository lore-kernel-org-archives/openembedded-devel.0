Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLt2Q-0003ew-Pd
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 08:48:11 +0100
Received: by fxm17 with SMTP id 17so497979fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 23:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tk+dVW4+HwfbUda5/yuqIFsrKMmTBSEHo2p6o2V/Vx0=;
	b=QMe6NMaPpoXESli+NbuUQ0glaAgLl2OpWJQE22zxvfdtx50z5Yn3bYJgTW1GUrpbJq
	93lGpR7aDNpB/1EGnnTUjArt3s+436CJ7TJLBhw0PGzR4QlnTiI3MLq7OmYFUGGdM+0B
	LABEwP1hxpa6H5TGOMouMDOQcrcR41okgZAxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Tfw/JvleZ3kCU5KoBOLh4xVFnkqTT+d+B0fgyrQJ+yAUTh7ba6ZOsKj6VvycxN0gsg
	t+5WIPkbMcRZMpkjTBsqnZ9CB4QhZibf0+c9aiJrGIhyfnVWTftPbm0RSZZDejNVhlKK
	1eHwEEqn4INp/r0kIqGj497GBuv/0EbnTZH7w=
Received: by 10.223.120.193 with SMTP id e1mr1687469far.106.1290757613735;
	Thu, 25 Nov 2010 23:46:53 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k21sm388554faa.1.2010.11.25.23.46.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 23:46:52 -0800 (PST)
Date: Fri, 26 Nov 2010 08:46:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101126074637.GS3274@jama>
References: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Fri, 26 Nov 2010 07:48:11 -0000
X-Groupsio-MsgNum: 26602
Content-Type: multipart/mixed; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 25, 2010 at 06:24:36PM +0100, Andrea Adami wrote:
> Hello,
> 
> build from scratch of console image for c7x0/armv5te leads to:

With new kernel I had this some time ago.. I'm using this patch since
then, but never send it here as I didn't look why this was needed
before..

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0004-kernel-kill-bluez-dtl1-workaround.patch"

From df57c608af9e0a98ff1a1b3dc8259d80f86f09b9 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Aug 2010 21:37:29 +0200
Subject: [PATCH 04/18] kernel: kill bluez-dtl1-workaround

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/kernel.bbclass     |    5 -----
 recipes/tasks/task-base.bb |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 7039d27..5874d75 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -266,11 +266,6 @@ ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
 
-# Userspace workarounds for kernel modules issues
-# This is shame, fix the kernel instead!
-DEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
-RDEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
-
 # renamed modules
 RPROVIDES_kernel-module-aes-generic = "kernel-module-aes"
 
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index ecc5278..7fc7cee 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -266,7 +266,6 @@ RRECOMMENDS_task-base-bluetooth = "\
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
     "
 # bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
 # kernel.bbclass. It should be there as long as kernel-module-dtl1-cs is, but not longer.
-- 
1.7.3.2


--RnlQjJ0d97Da+TV1--
