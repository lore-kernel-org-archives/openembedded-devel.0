Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3e-0006OF-Ec
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:26 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+ek6NnOoevhWN1W2zQXJ/JLKwXRE4Xi2KUR4O7VI0oo=;
	b=lNblF13maEzh+4oRdlE8rhbf2c10KTfopRHhG6wGJXlgpAXn1K1xvGmd6zqoj3LXNB
	3AvSXg3MqbfPRMqifiCXi4JHCXuE2GkzaE6ws04QhZLLtnLXW0EKUM8oX0pRNR+uAGCj
	TdhUmIGuMuR1OMFmkJqftQSXh17s2HaHPc00E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uFZHQCu2cLUGnq0tQ3usGcEz2fk+5gXkUhwEI8K1gR8nDwvsWvPsUnMMxnAmGp/gtm
	JcMK6cPV7Dzo6u+dp69gXm26CrHffJPkah45FBDGO4NYoY4sDl6b0i8Rp5yiaRNRZuPW
	TOBG0tByeGm7ZenjXqeQofj1Cd1PFa6s7LpJI=
Received: by 10.211.166.2 with SMTP id t2mr8055302ebo.81.1242207643927;
	Wed, 13 May 2009 02:40:43 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2200680eyh.30.2009.05.13.02.40.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:43 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:14 +0200
Message-Id: <1242207556-15601-36-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 35/37] netpbm: remove -s on install (sigh)
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
X-List-Received-Date: Wed, 13 May 2009 10:54:10 -0000

From: Mike Westerhof <mwester@dls.net>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/netpbm/netpbm_10.28.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/netpbm/netpbm_10.28.bb b/recipes/netpbm/netpbm_10.28.bb
index ff90310..78bb26b 100644
--- a/recipes/netpbm/netpbm_10.28.bb
+++ b/recipes/netpbm/netpbm_10.28.bb
@@ -25,7 +25,7 @@ RDEPENDS = "perl\
 RDEPENDS += "perl-module-exporter-heavy"
 RDEPENDS += "perl-module-file-spec-unix"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netpbm/netpbm-${PV}.tgz \
 	   file://ppmtojpeg.patch;patch=42 \
@@ -34,7 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/netpbm/netpbm-${PV}.tgz \
 
 PARALLEL_MAKE = ""
 
-EXTRA_OEMAKE = "ENDIANGEN=${S}/buildtools/oeendiangen TARGET_LD=${LD}"
+EXTRA_OEMAKE = "ENDIANGEN=${S}/buildtools/oeendiangen TARGET_LD=${LD} 'STRIPFLAG='"
 
 do_configure() {
 	install -c -m 644 ../Makefile.config .
-- 
1.6.1



