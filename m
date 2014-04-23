Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 37DB365D68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 21:33:31 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so1193078pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DNZWm8oTkMTKGIYFFQVosyIpRFFpH4IeUZC00b/lW8Y=;
	b=Woo+FjKglBY3O0e8dhYT34yXTEQML3zYaaqMWct49eH+evDxUjFtodYgEsIDFd4PNP
	E/DOxP0FvJoK9/7wDTL2jfEAHpmAom+tBQWS9HP8+PT94pS46ZP3G7HTVUSOna6fPcQh
	7BhaT484errrGfhX2gPXy78ur28pVbrBvIArzcRvzbgFZ4kI/3UwdGaOpPJGJeQWXgl6
	Qy7240MPY7Yz2fRqVsDJF1BhbvBXQ7UAlYuqLbM5Oy7z5XMcR2ZBuvEi6fjViEpts7Sm
	rtHY+xfy27pHHodzauKXnYsF/SrI5Rn8Gmht9kgPpy8zVZTj9uzBLQIlAq7nH9ppxMYI
	JJ+A==
X-Received: by 10.68.106.130 with SMTP id gu2mr58895655pbb.59.1398288812699;
	Wed, 23 Apr 2014 14:33:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	bs17sm10082031pac.28.2014.04.23.14.33.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Apr 2014 14:33:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 14:35:40 -0700
Message-Id: <1398288940-28414-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-gnome][PATCH] gnome-control-center: Unbreak gnome images
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Apr 2014 21:33:37 -0000

images that now include both shared-mime-info and gnome-control-center We get

Collected errors:
 * check_data_file_clashes: Package gnome-control-center wants to
 * install file
 * /home/kraj/work/angstrom-repo/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/systemd-gnome-image/1.0-r0/rootfs/usr/share/mime/generic-icons
        But that file is already provided by package  * shared-mime-info

This brings it back to wheree it was additionally removes the packaging
warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index ee25c1e..05e59cd 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -16,13 +16,15 @@ LDFLAGS += "-lgthread-2.0 -lxml2"
 do_configure_prepend() {
     sed -i s:help::g Makefile.am
 }
+do_install_append() {
+    rm -rf ${D}${datadir}/mime
+}
 
 FILES_${PN} += "${datadir}/icon* \
                 ${datadir}/xsession* \
                 ${libdir}/window-manager-settings/*.so \
                 ${datadir}/gnome \
                 ${datadir}/desktop-directories \
-                ${datadir}/mime \
 "
 FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
 FILES_${PN}-dev += "${libdir}/window-manager-settings/*.la"
-- 
1.9.2


