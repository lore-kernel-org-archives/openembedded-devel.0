Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi7O-0002oS-K6
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:21 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RJMmMjEiJx7nGBzpIKMT9rERl28j7P4rTEf3ou/B4lo=;
	b=RdiHOx0/kXVGegclMIrx4+CbBlgcr30Gj5zoNuGM8uiKTiQn8iRpv1biNW7y2X8zia
	BX42rm83mAdB2pP/gvAet7TUsia9nfjpeMUulcFcOL88DlfQeU5oBO1+sGR18aSXU+kC
	6s9Qgmg6r+EYwGQ60lJJWEib8mjYWncjhz/39tmnJdCFcX27AUfo4CXkFnyxgZy77qFX
	Lq/LxrDL4+QWjmVirsP4VygaaqZfmDwexWRUfEb6uBj5W+xcHBUOKrfyv+6Y+azBMh1Z
	pq2V/Xi264Oqnbav3iP8lKradoEAjXca4oY5hHPTppy1NPpR26DscgEKIQ02q3wuycdy
	8sgg==
Received: by 10.14.0.133 with SMTP id 5mr17136520eeb.29.1354586759030;
	Mon, 03 Dec 2012 18:05:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm34811440eed.10.2012.12.03.18.05.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:19 +0100
Message-Id: <b78424da568ea65d7913ead8f9358e567f955d36.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 46/58] systemd: add PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 04 Dec 2012 02:34:02 -0000

* some packages can RDEPEND on e.g. libudev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index bfd1b30..51d3371 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -105,6 +105,7 @@ python populate_packages_prepend (){
     systemdlibdir = d.getVar("base_libdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
 
-- 
1.8.0



