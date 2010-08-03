Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OgPOr-00067S-1m
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 23:52:00 +0200
Received: by yxi11 with SMTP id 11so1886457yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 14:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=7G2g0cUEM/mUEfPZn8I6edFDbYFjs11mhvoB+slhuL4=;
	b=RV/FTEbJoG1p+I5CKG7vecDSusIMT00NH6bw+e84gl4nyR1fiIdLOso/GySyb5xP50
	582G3uAEYSajhSpmFSadCoos9PwkdC367YQ5xb1A+uR8m2cSa1HZZsISRr77ER4HpkQn
	+r2pvOLnwEulzSAyWjBpagO+yamf68Wdxxj2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uI5poyKorCLTQ57eEjcjnYBKonYXBaVN3qbi7bLkmEC4t6v4niWzZHztDE4oajPmll
	XGyY4ep8TL6WGd829FYB3tKWH128oLajnL6sCnQaWNBXsg2gwmIC3ISclwjdMdopADqC
	AL1jTd1fBXU1PXfYnMK0GhPTrHV8sdyzxWHeU=
Received: by 10.150.62.5 with SMTP id k5mr9658919yba.421.1280872304737;
	Tue, 03 Aug 2010 14:51:44 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u42sm7074525yba.12.2010.08.03.14.51.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 14:51:43 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 16:47:20 -0500
Message-Id: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Tue, 03 Aug 2010 21:52:01 -0000

* Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
  setting for a recipe.
* This will allow recipes to work for entire families of
  devices without having to maintain/update the compatible
  devices as new devices are added into a family

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 1847491..02c7875 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -389,7 +389,9 @@ python () {
             import re
             this_machine = bb.data.getVar('MACHINE', d, 1)
             if this_machine and not re.match(need_machine, this_machine):
-                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
+                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
+                if this_soc_family and not re.match(need_machine, this_soc_family):
+                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
         need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
         if need_target:
-- 
1.7.0.4



