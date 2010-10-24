Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9v60-00005e-AE
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 09:34:39 +0200
Received: by fxm3 with SMTP id 3so2022030fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ViQnGFBcRppHOID42a7tzCwpM+aQn6H4BgyvibJWL64=;
	b=p4yLIIGfIxZ5piA6lzEgJC1kteBPmHohV5ntJwEMf+qNTGLrtbnzKhWRUNwOZav963
	i8it1ZSQ229IcTNADou1RyhOfguXGEDFzgJfjptPcgLxDkNbb2wZRGU421pqPU57IFth
	G3Kd1o18eODkYn1PmE5B9KNAxQwpsDRCJQdnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=t4eJ/gtTj4g3o/HRKjNCJ3uP1EZGaYwytdLSBYnom2umt4Q/+A++4jwzyrLyikxR4u
	4ifzITKGF3e02ej+63AaEjjDJoWUqutD2/lZKhjSm22oPk23Q5EJDmuHWv5Mnic+1nYH
	fXZ6epfoPAEo/bagdq1NIOog4f3QhJ1m9cjsc=
Received: by 10.103.217.14 with SMTP id u14mr1718815muq.108.1287905623483;
	Sun, 24 Oct 2010 00:33:43 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j8sm2265591fah.6.2010.10.24.00.33.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 Oct 2010 00:33:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Oct 2010 09:33:49 +0200
Message-Id: <1287905629-20148-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] psplash: don't put initscripts to RDEPENDS
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
X-List-Received-Date: Sun, 24 Oct 2010 07:34:43 -0000

* different distros or images are using different initscripts
* sane image usually has some initscripts installed
---
 recipes/psplash/psplash.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index efd6a0c..baddd62 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -2,14 +2,13 @@ DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
 HOMEPAGE = "http://projects.o-hand.com/psplash"
 SECTION = "base"
 LICENSE = "GPL"
-RDEPENDS_${PN} = "initscripts"
 PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash"
 RCONFLICTS_${PN} = "exquisite"
 
 SRCREV = "422"
 PV = "0.0+svnr${SRCPV}"
-PR = "r33"
+PR = "r34"
 
 # You can create your own pslash-poky-img.h by doing
 # ./make-image-header.sh <file>.png POKY
-- 
1.7.3.1



