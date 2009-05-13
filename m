Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3H-0006OF-1y
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:03 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NY4/75WkBWhVI9gdeUPUkTjUZUfnI/eTq4qcs5HpCjk=;
	b=r5dI1XnAXp59OMyJPffXoY2Fr+J3O6eblbj2AuguSsEvqTe5njBUxdSNbNHi1jeU+U
	ail/lJa7GfroT40bPqeBGHrht50fIKpON/cm3DBwJ7dLUxipvMymoYLj6r2tDOzSDQgK
	rdy6+dZcFNR/UYM2Vh75CrB9rnSpKTXTauk1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=I6n6oxZLBCKMKgPLmWbTxx7DOjjt2tF5e57H+ty5yshIfTx1tvIWxgZ+QNApawTkfS
	uQgIdj8euEWTubfh9xnbRu0tpiDfGC0ZaYzXoOd6abFIn5peUpT+XmAjBn0SFLniz6tv
	tflzK3APvQDiE0+XJkxBQ2YCWJwlxtGscxR6Q=
Received: by 10.210.87.14 with SMTP id k14mr896212ebb.89.1242207620539;
	Wed, 13 May 2009 02:40:20 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm2183835eye.56.2009.05.13.02.40.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:20 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:02 +0200
Message-Id: <1242207556-15601-24-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 23/37] libart-lgpl: fix install issue, switch to INC_PR scheme
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
X-List-Received-Date: Wed, 13 May 2009 09:47:03 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gnome/libart-lgpl.inc       |    4 +++-
 recipes/gnome/libart-lgpl_2.3.16.bb |    3 ++-
 recipes/gnome/libart-lgpl_2.3.19.bb |    3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/gnome/libart-lgpl.inc b/recipes/gnome/libart-lgpl.inc
index 710656b..8ff3b21 100644
--- a/recipes/gnome/libart-lgpl.inc
+++ b/recipes/gnome/libart-lgpl.inc
@@ -4,6 +4,8 @@ LICENSE = "LGPL"
 
 ART_CONFIG = "${HOST_ARCH}/art_config.h"
 
+INC_PR = "r3"
+
 # can't use gnome.oeclass due to _ in filename
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
        file://${ART_CONFIG} \
@@ -29,7 +31,7 @@ EXTRA_OECONF = "--disable-gtk-doc"
 # enforced.
 export MKDIR_P = "mkdir -p"
 export mkdir_p = "mkdir -p"
-export INSTALL = "${STAGING_BINDIR_NATIVE}/install-sh"
+export INSTALL = "${STAGING_BINDIR_NATIVE}/install"
 
 do_stage() {
 	autotools_stage_includes
diff --git a/recipes/gnome/libart-lgpl_2.3.16.bb b/recipes/gnome/libart-lgpl_2.3.16.bb
index 3605a38..99f8f8b 100644
--- a/recipes/gnome/libart-lgpl_2.3.16.bb
+++ b/recipes/gnome/libart-lgpl_2.3.16.bb
@@ -1,3 +1,4 @@
 require libart-lgpl.inc
 
-PR = "r2"
+PR = "${INC_PR}.1"
+
diff --git a/recipes/gnome/libart-lgpl_2.3.19.bb b/recipes/gnome/libart-lgpl_2.3.19.bb
index 3605a38..99f8f8b 100644
--- a/recipes/gnome/libart-lgpl_2.3.19.bb
+++ b/recipes/gnome/libart-lgpl_2.3.19.bb
@@ -1,3 +1,4 @@
 require libart-lgpl.inc
 
-PR = "r2"
+PR = "${INC_PR}.1"
+
-- 
1.6.1



