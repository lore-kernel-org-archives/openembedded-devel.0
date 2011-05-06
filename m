Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIC4A-0006vw-AZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 05:50:58 +0200
Received: by pxi6 with SMTP id 6so1976865pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2011 20:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=1IUEit9ZkanIhezidFEEzmBhsY2wu9t+Ara75bl1GgA=;
	b=WQo+b8JixBc52rbw7/DJO7KpykE9otsXhMvm4dwMoprvLIJggREcdXXD+BJscxr9an
	bj/KiVu7bjz5e6TlQy0v9IlKoqHL0yqNvqTIc0dMqkUqq4Gdb7LB7jznx+orqkAFOuTz
	rP4a28ElY8ArXYJvHHDmf280L5tHXzUZ17DNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=fC6l7dxds8Ce45vMNf4+27qR4ga4FiM+yHO7Qp+PWd9/qBpYdrCMjCDRCZgbUjvEMd
	x9SNEC39FRgOfuXmR6YAil+Zgv7lv/DHIMG5ve+6d+ercSEFRzZWswQudO3XbJOAiBLY
	Wmxjqao8l6mWKKkXyowInq8N75tUkj9equHgw=
Received: by 10.68.19.134 with SMTP id f6mr394096pbe.31.1304653696718;
	Thu, 05 May 2011 20:48:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q5sm1857647pbp.65.2011.05.05.20.48.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 20:48:15 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 May 2011 20:47:57 -0700
Message-Id: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 03:50:58 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-efl/conf/layer.conf   |    4 ++--
 meta-gnome/conf/layer.conf |    4 ++--
 meta-gpe/conf/layer.conf   |    4 ++--
 meta-oe/conf/layer.conf    |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index 85dbacd..f019337 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -1,8 +1,8 @@
 # We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "efl-layer"
 BBFILE_PATTERN_efl-layer := "^${LAYERDIR}/"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index c878ecf..6e8ff28 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -1,8 +1,8 @@
 # We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "gnome-layer"
 BBFILE_PATTERN_gnome-layer := "^${LAYERDIR}/"
diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
index d250555..006b6af 100644
--- a/meta-gpe/conf/layer.conf
+++ b/meta-gpe/conf/layer.conf
@@ -1,8 +1,8 @@
 # We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "gpe-layer"
 BBFILE_PATTERN_gpe-layer := "^${LAYERDIR}/"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 9fa60c1..36137e9 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -1,8 +1,8 @@
 # We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openembedded-layer"
 BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
-- 
1.7.4.1



