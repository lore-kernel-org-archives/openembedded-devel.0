Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHv-0007ir-93
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:02 +0200
Received: by gxk22 with SMTP id 22so12722gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=mIDstd7s38tab1mBuxLMX3PiYRgfuRjhZztWGeiOAC0=;
	b=tpbhE3exRNAIu23kR78CwjWIJMwL3dzaq3zvCy3ScjVjuCo69HIGw/4S+5Rm3mWCLN
	WRd52oo/76HsPdWz+tBH5kMKg5aGn7sZdnMnCLMXsIuoe88uCmri3TAzsqkbjek7ftS2
	2FvoClBmsKPNfvUZlJP+G/7WQ4fGjN8jW94vE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hAhZRuhG3h5TEOKYzpeXAFJJosJDewMTJ6hmtbz8KaDfDHLowhIS/IJIUIpiPtoJEL
	dkrf/+XR4GIrSHAgOERFFYbSChV+BL9YWlhrfxRsVRqnWzCD0uRbUp6iwSdpPYtltfbV
	r6Yp0pxkYG+TpHmTzIaWjNFBSaBPXhE6/JWfU=
Received: by 10.151.41.12 with SMTP id t12mr3738694ybj.262.1287668036970;
	Thu, 21 Oct 2010 06:33:56 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:56 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:23 -0500
Message-Id: <1287668010-11310-16-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 15/22] psplash: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:09 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/psplash/psplash.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index efd6a0c..fe446ed 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
 HOMEPAGE = "http://projects.o-hand.com/psplash"
 SECTION = "base"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 RDEPENDS_${PN} = "initscripts"
 PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash"
-- 
1.7.0.4



