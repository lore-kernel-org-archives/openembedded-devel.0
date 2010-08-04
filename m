Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OggsV-0007pL-UT
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:31:40 +0200
Received: by gxk2 with SMTP id 2so2196984gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=YpjqaGlA74hyLCjncTjxu3C0u/xoTIKvZ8lpU5b1y+s=;
	b=dLFcI0jNp5Laff+QzLKbdktRT4pcdjTkWsW6l/2ildtLLZt/USoLv3NxY6H72HtXWM
	1IP38euLi+v+8uuE/Q520bClqKQf3tUt/cKzRqTkuVYSNrI0yIn1ryQgi5R6J4W4oehT
	XydZWOxusBH/e4Fp+RF8whnOEpMwHihl4UESo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LtW26bzyzW2KUVafwXwCojSaXv/uQx+QlI4Kh1VFOtdpHbYb9InmRSue3LcnZ+GxTX
	mNkSEi+lWDCQGFVnwC/zou/8mFM94JE5Glt4Nsnvj6ZuDL828pvJvRTJf4cz8TzQLjYF
	nbWQ8ZNbkF4sW8qkB2eb1d3+4JZ9tF72/YYYc=
Received: by 10.100.122.16 with SMTP id u16mr10242097anc.130.1280939494332;
	Wed, 04 Aug 2010 09:31:34 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id a12sm14021725and.16.2010.08.04.09.31.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 09:31:33 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:26:51 -0500
Message-Id: <1280939211-422-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1280939211-422-1-git-send-email-chase.maupin@ti.com>
References: <1280939211-422-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] 37x-evm: remove USE_VT from am37x-evm and dm37x-evm conf
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
X-List-Received-Date: Wed, 04 Aug 2010 16:31:41 -0000

* Removed the USE_VT = 0 setting from am37x-evm and dm37x-evm
  configuration files.  With matrix-gui-e using chvt 4 it is OK
  for these consoles to be created.
* The console is used for the beagleboard validation software
  as well so it should be available to allow running the
  validation software on these boards.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 conf/machine/am37x-evm.conf |    1 -
 conf/machine/dm37x-evm.conf |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index fb10efd..096d9e0 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -21,7 +21,6 @@ IMAGE_FSTYPES ?= "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-USE_VT = "0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
diff --git a/conf/machine/dm37x-evm.conf b/conf/machine/dm37x-evm.conf
index c9b9ca2..35fef88 100644
--- a/conf/machine/dm37x-evm.conf
+++ b/conf/machine/dm37x-evm.conf
@@ -21,7 +21,6 @@ IMAGE_FSTYPES ?= "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-USE_VT = "0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-- 
1.7.0.4



