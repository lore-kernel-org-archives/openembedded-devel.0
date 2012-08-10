Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpiR-0001GZ-Tj
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:27 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZjC7C7+fhYVvWy/wsZD26K4GMr8NwKj5wXwRKjc/gII=;
	b=Tu0gf2QV49JHXrrLeHQeEl8TitmPUEePblCc1yoMvFkUjQf+B+8tMblwQW+ZqDYtCt
	mfjXRpwfhSgfsb/8QUHPBUKi6Y1cXbO3mpdUrpoh7ZTDsgAmH5fqcSnEF4E2Ne9oxlDV
	3xuwFEZiM7dW4xRyvE8KCG6e9xJYqcJp6z1Ai15Tyk+sxXTGh3uvrXy1I+Sau5AIb08G
	YgjVArRTi+eKZr3bVvg7r6imDgF7y+ULFDNfbrZ2Ui+IfBCeGpk+w7ra7Om/8VTSYbjG
	q5E4GwoY9AS9LtFumMGVNR2HDN7OuMs3euLuQw+2ahobz3MkoGBHYrMQexWz2qfHVrFq
	yhFQ==
Received: by 10.180.7.200 with SMTP id l8mr6205379wia.9.1344606340521;
	Fri, 10 Aug 2012 06:45:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm7846060wib.2.2012.08.10.06.45.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:10 +0200
Message-Id: <1aeaa84a1dbb1476f35117172de4c5ac46d48595.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 15/46] e-wm: add eio to DEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:28 -0000

* it's needed since r74373

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index c2bb1e7..b97cb50 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
-DEPENDS = "eet evas eina ecore edje efreet edbus eeze"
+DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
-- 
1.7.8.6



