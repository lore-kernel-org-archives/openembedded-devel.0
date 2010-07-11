Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXrvq-0006xR-7z
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 10:30:39 +0200
Received: by ewy7 with SMTP id 7so687079ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=I/f3WouQAS2XvA6gURldPl6D2/YcznbgSlniRnPzegU=;
	b=Ck1AGGrRvqw+vdUDptW2QrQhCJ9CnLiL/1kcNHNTEZ7ckc49blLLp63nV3+UiJ7umP
	TxISA/mp8BMKa2fk581m0FrKc/+k8oJgaIIQ//A+NByspssC1FG4wYjiyGDqk2GHH6TX
	Ld+TMuh3luHsyv+TzUUT8AkfT4UbvgeDeuPSM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ni3zu5APsvxphMzwP4RBPw8JWW1uIa6RYlG7eLZJeh12uk/sQtftJP5plrax+YZ0Md
	t7xIDr5rMxFkOmCllbUGhOfWhBClcFAATzeM3FtWwj8nmxAzp3ntBqbfxLJ9JXBgmOWU
	I5hQVmIJSiwuESHdsJrYJBtBCf6426iAb2QU8=
Received: by 10.213.35.18 with SMTP id n18mr2332085ebd.7.1278836745247;
	Sun, 11 Jul 2010 01:25:45 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id x54sm25189324eeh.5.2010.07.11.01.25.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 11 Jul 2010 01:25:44 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jul 2010 09:48:50 +0200
Message-Id: <1278834530-16235-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTin-XFFlkOFj5TAdpyx9pnvKofaPFzjI09Uv6E9M@mail.gmail.com>
References: <AANLkTin-XFFlkOFj5TAdpyx9pnvKofaPFzjI09Uv6E9M@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] base.bbclass: introduce COMPATIBLE_TARGET_SYS and COMPATIBLE_TARGET_ARCH
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
X-List-Received-Date: Sun, 11 Jul 2010 08:30:39 -0000

This patch introduces COMPATIBLE_TARGET_SYS and COMPATIBLE_TARGET_ARCH
They are similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
is used to specify that a certain recipe is for a certain machine
COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
is for a certain target system (e.g. mips-oe-linux),
COMPATIBLE_TARGET_ARCH can be used that a certain recipe is for a certain
architecture (e.g. mips)

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

This patch supersedes [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SY

as restrictions may apply for both native and cross recipes, the patch is in base.bbclass, not cross.bbclass.

Khem, if you agree, can you confirm your ack.
And can I see one more ack for this?

Thanks, Frans.

 classes/base.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index b30310d..4bc7650 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -391,6 +391,20 @@ python () {
             if this_machine and not re.match(need_machine, this_machine):
                 raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
+        need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
+        if need_target:
+            import re
+            this_target = bb.data.getVar('TARGET_SYS', d, 1)
+            if this_target and not re.match(need_target, this_target):
+                raise bb.parse.SkipPackage("incompatible with target system %s" % this_target)
+
+        need_arch = bb.data.getVar('COMPATIBLE_TARGET_ARCH', d, 1)
+        if need_arch:
+            import re
+            this_arch = bb.data.getVar('TARGET_ARCH', d, 1)
+            if this_arch and not re.match(need_arch, this_arch):
+                raise bb.parse.SkipPackage("incompatible with architecture %s" % this_arch)
+
     pn = bb.data.getVar('PN', d, 1)
 
     # OBSOLETE in bitbake 1.7.4
-- 
1.6.4.2



