Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHMP-0007dH-Uw
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:17 +0100
Received: by eekd17 with SMTP id d17so496708eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/D+9CPwIYrJwaSTFg+iXVuMGZrBwn2Lv5PFr1utiamg=;
	b=AEGwAwF7vOSJi9ln8CdqhGUEAd0TAeijwSKqGyBfoJvti/+EBwEnAgssYPg4hVlhcn
	g86e5Axd9qiZwkX5C2iEvgLTVNStp9o05CkxmajhitZxqX5nygg2SoI5/Xw65Y/sRaXE
	xn3eXjy3ewhkt+ZFFmJnLMbVrea4ovRxQ8ouo=
Received: by 10.14.40.79 with SMTP id e55mr1135272eeb.26.1326361604326;
	Thu, 12 Jan 2012 01:46:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm17414129eef.7.2012.01.12.01.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:46:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:16 +0100
Message-Id: <275bcc54a791b68489f89fd485f1678f269d01c0.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
References: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/7] edje: add eina to DEPENDS, it depends on eina since r36623
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
X-List-Received-Date: Thu, 12 Jan 2012 09:54:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 9a62156..743227c 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
-DEPENDS = "lua5.1 eet evas ecore embryo edje-native"
-DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native"
-DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native"
+DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina"
+DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
+DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
 # GPLv2 because of epp in PN-utils
 LICENSE = "MIT BSD GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
-- 
1.7.8.3



