Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MJTHd-00063v-5x
	for Openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 16:17:05 +0200
Received: by ewy23 with SMTP id 23so1180400ewy.12
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=u43Ukpoq6q2pEKe54EU2EjXD5urVodOTL4cISPUB4Sk=;
	b=Z41xh+vNi0+T/hJP+DTFYHSiC8iCdjG4ErmB9uTZ9VZ8Kr0WrCRDS4zNKm629qUuwV
	qG/2FSbIAP96aQ0H4I9oG1XOaZ/tZG25YXXEF0u15e0B0/X+6NmDvy7LcTPaSuF9n4Yo
	I0llUhbXrbgXk+EAd6lTsFPiizSqlD8by1YRc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dKVSYByPwoH9+eLy2OtOFMKCiamadQJmbI6cNbfly7YnlHBb1exZxgzVcxLw3RFptW
	+pooruVROIuyBG5cOnYfiZRnhxo73pPqlMA7ttKXc5CUjzqjh5d0UedOleVbAF8Oo32B
	YjrTRPDZdWuNdQunZKW7vSbgF68q4aJcWJ3ik=
Received: by 10.216.53.83 with SMTP id f61mr420414wec.33.1245852351781;
	Wed, 24 Jun 2009 07:05:51 -0700 (PDT)
Received: from localhost.localdomain
	(host56-7-static.30-87-b.business.telecomitalia.it [87.30.7.56])
	by mx.google.com with ESMTPS id p37sm2684785gvf.12.2009.06.24.07.05.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Jun 2009 07:05:51 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jun 2009 16:05:12 +0200
Message-Id: <1245852312-14051-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <ID test>
References: <ID test>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [PATCH] recipes/images/x11-jvm-image.bb replaced typo '$(ADD_JVM)'
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
X-List-Received-Date: Wed, 24 Jun 2009 14:17:05 -0000


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 recipes/images/x11-jvm-image.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/images/x11-jvm-image.bb b/recipes/images/x11-jvm-image.bb
index 8387112..fd0e5f0 100644
--- a/recipes/images/x11-jvm-image.bb
+++ b/recipes/images/x11-jvm-image.bb
@@ -12,7 +12,7 @@ ADD_JVM = "\
     classpath \
     classpath-common \
     classpath-dev \
-    classpath-example \
+    classpath-examples \
     classpath-gconf \
     classpath-gtk \
     classpath-tools \
@@ -29,8 +29,8 @@ IMAGE_INSTALL = "\
     angstrom-gpe-task-base \
     angstrom-gpe-task-settings \
     ${SPLASH} \
-    $(ADD_JVM) \
-    $(ADD_OTHER) \
+    ${ADD_JVM} \
+    ${ADD_OTHER} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
-- 
1.5.6.5



