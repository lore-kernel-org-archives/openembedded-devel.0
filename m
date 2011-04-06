Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7N0T-0001az-E4
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:18:25 +0200
Received: by fxm19 with SMTP id 19so887800fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bCYr6spEER6MMIu6AgiUHCGJIajEUIlSrm6DLty8Mro=;
	b=kyIHA5Ya+6+KMpnjOis5DVpC5RN5Aow0LWi482aFLfyDiN1cDdzM18j0VsstUSJFiC
	NTIrCkb9vPzZdZ+KDWJVscISo1+DSVKAniB/QRkkrYmI6LivYdLtWL9rp4QL5iylvcDy
	PY41tEJOwOHn0wWTWr28fevtvupn5NzZstpyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=a6VDeuw4iZfCIpNDhs77C7hFxeqwCx3t9pPIQsXC2VApnrrC2K9UbyHicvMKgmLHtX
	ilEpem3NlWGUlOupH9TjyNaFenGeskXG/Zv9oLjPtw6BNOlU6pwstkyA1W2eHWKT60rc
	NeGwXIKLzxCe9cNkERzdHiRUwJaq7/rS+X/60=
Received: by 10.223.32.142 with SMTP id c14mr654873fad.59.1302074178195;
	Wed, 06 Apr 2011 00:16:18 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l2sm80436fam.29.2011.04.06.00.16.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:16:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:16:16 +0200
Message-Id: <839bea647a13a34427352888621fa16af905ef0b.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 5/8] eeze: update to 1.0.1
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
X-List-Received-Date: Wed, 06 Apr 2011 07:18:25 -0000

From: Philippe De Swert <philippedeswert@gmail.com>

Version 1.0.1 contains bugfixes for udev watch/find functions to make sure devices are shown correctly.

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eeze_1.0.0.bb |   10 ----------
 meta-efl/recipes-efl/efl/eeze_1.0.1.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.0.1.bb

diff --git a/meta-efl/recipes-efl/efl/eeze_1.0.0.bb b/meta-efl/recipes-efl/efl/eeze_1.0.0.bb
deleted file mode 100644
index 12d70d9..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require eeze.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "31f9b2a8fce56a73c99c1c5d2a449fb6"
-SRC_URI[sha256sum] = "27da2b12f60b3c23cd52d16d601b5ab61734b9038beb3ab40129ac770f048d84"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.0.1.bb b/meta-efl/recipes-efl/efl/eeze_1.0.1.bb
new file mode 100644
index 0000000..cc1d721
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.0.1.bb
@@ -0,0 +1,10 @@
+require eeze.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e36b5e8ed444c8d13d27fd82d5f71659"
+SRC_URI[sha256sum] = "736470383c33837edd88f417200c5612ca9cc5f400bc48d61fd966fec3fe09d7"
-- 
1.7.4.1



