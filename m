Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OLLjb-0003XI-3y
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 21:42:33 +0200
Received: by bwz14 with SMTP id 14so867640bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/wYnktJOKR1tCHAQiX13LdlwA7qAQaTOn+DYjE1nuBY=;
	b=QnV2e4NQe1lpgUkmh4ZbiOPWx1UkG88XpVjtoqTzgoiDnalA2i5yB9InnoqfdyqFR8
	y8zinAlDAQo0Vj0AV8NOoAuXl9uhdqdR5N4QmoL7CeQpYAJpLY3lXq40J431FtLx7MIX
	qyWrJTSb28939qC5T2WfIhUXD7vGennBpmTSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tMXcqwN/07ozIsfFEUtdPsmze764cMM82u+jcjS4a0go0Faq7t9kwykkMp3jOUm74z
	joVcZdJWbkuWEe1FPAfAs2tiXdJq3gMS+bcLMfoqCcHNoEU4tSQ6otqmfg6z+SZyVRyJ
	DefZzn0/wCf9P1C7zjgcxiQ4TyDk+p5LTQqM0=
Received: by 10.204.160.76 with SMTP id m12mr1353095bkx.65.1275853072958;
	Sun, 06 Jun 2010 12:37:52 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-234-158.dynamic.xdsl-line.inode.at [85.127.234.158])
	by mx.google.com with ESMTPS id z17sm16089308bkx.0.2010.06.06.12.37.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 12:37:52 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jun 2010 21:38:30 +0200
Message-Id: <1275853110-22560-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] zziplib: Convert zu new staging
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
X-List-Received-Date: Sun, 06 Jun 2010 19:42:36 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 recipes/zziplib/zziplib_0.13.49.bb |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/recipes/zziplib/zziplib_0.13.49.bb b/recipes/zziplib/zziplib_0.13.49.bb
index 2effd91..3aecb74 100644
--- a/recipes/zziplib/zziplib_0.13.49.bb
+++ b/recipes/zziplib/zziplib_0.13.49.bb
@@ -1,17 +1,11 @@
 require zziplib.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
   file://zip_c.patch \
   file://zziplib-autoconf.patch \
   "
 
-#EXTRA_OECONF = "--srcdir=${S} --enable-builddir=${S}/build"
-
-do_stage() {
-  autotools_stage_all
-}
-
 SRC_URI[md5sum] = "5f7b88ebb2bcd7e8044328482d079661"
 SRC_URI[sha256sum] = "f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af"
-- 
1.6.4.4



