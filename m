Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o8-0007Yp-1c
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ee0-f53.google.com with SMTP id c13so1591948eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=WnNQrUQv+COF7nTObXLRX9/KxIWURssKw/QizS9jwQY=;
	b=Vkqou53dJxXuRSc00QWWywUBkHG+HXNIPIsuPQR0T8h13fzm/57EAdZhKY1zuT5xJw
	KvbU3MneZy73UM2oRBHtXqoPqQxGJTwQ4sKmaj/lFR6vvppyJNnPRKpNZ9RdLJPxd1rV
	m9mzdXBCeTb30DbOZaZep5qz3MkPFDt4IcNgdfc+up8mvcGMTKaKIp+/49Ykge2kxAtU
	4ZX9y3U2gXl3nB8ruMMuMJIX55txSjNLDaFsnsGnanDyIG+yTXRsZd+KVPg783wttFmR
	3wCeWqftZBg6kISxCj4/7BdQAVlAL4JZeIqL6jGyKL9x+I6TTwc+cSXr0QyKpnoCv883
	t5Dg==
X-Received: by 10.14.223.137 with SMTP id v9mr10141374eep.4.1365859830211;
	Sat, 13 Apr 2013 06:30:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm16527526eel.0.2013.04.13.06.30.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:47 +0200
Message-Id: <1365859790-20947-30-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 30/33] packagegroup-basic: Drop bbappend from meta-systemd
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

* avahi-systemd is now indluded in deamon
* systemd-compat-units are RRECOMMENDED from systemd itself

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb            | 2 +-
 .../meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend  | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 493ef5e..402579c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Basic task to get a device online"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r10"
+PR = "r13"
 
 inherit packagegroup
 
diff --git a/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend b/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
deleted file mode 100644
index c1b5851..0000000
--- a/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PRINC := "${@int(PRINC) + 2}"
-
-RDEPENDS_${PN} += "\
-	systemd-compat-units \
-	avahi-systemd \
-"
-- 
1.8.1.5



