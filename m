Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1A74460173
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 13:17:07 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so3154937eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 06:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1AoHejynEWzlKL6XSeGotbVbG+vxdsm3LtfM68nUkio=;
	b=UFw7fVIeCiuTwmyBxDzvGkYHJE6VrEb8ATygNqBvpx6qgB4gO+coPCzLfV2MBHyx6u
	zwaEMgM1+0d+5dDYOpyfae4BAfWqAL2izA/ez2VQJbzJYxFgf77iUDb8OOEYAbb7aUkA
	Wnp8rp+vrf6cb6AP6FBIvcXkf5eHMPG/fsdfZRSJFA4UAyiG/G7Q16mV4IAL3Rxol4ik
	0W2YQXIBzuHzds+Q0/eO/5pAeVyUgbv1tL42ix6ZyQhitmIJTDIqwJx92PoTvAcmWPrN
	5FtgtZa2cjdOTCbHRadWn/1crmu92XPVx/2Xkn+OmStLVLbW4eoaxOnRRXRil6sIj6EF
	XMjQ==
X-Gm-Message-State: ALoCoQmuYeTS0/dp9Zjk8E69Z8wqzQBfbd0jj1WyCwgJqhE//gawglXJd7gdLkU55ywSOnIjiNhZ
X-Received: by 10.14.115.195 with SMTP id e43mr15166790eeh.76.1399036628078;
	Fri, 02 May 2014 06:17:08 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id z48sm4560623eel.27.2014.05.02.06.17.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 02 May 2014 06:17:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 May 2014 15:14:23 +0200
Message-Id: <1399036463-13336-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH] gnome-control-center: let mime.bbclass handle /usr/share/mime
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
X-List-Received-Date: Fri, 02 May 2014 13:17:12 -0000

Delete generated files.

This fixes:

 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/version
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/mime.cache
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/treemagic
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/icons
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/generic-icons
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/types
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/aliases
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/subclasses
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/XMLnamespaces
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/magic
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/globs2
        But that file is already provided by package  * shared-mime-info
 * check_data_file_clashes: Package gnome-control-center wants to install file /build/v2014.06/build/tmp-angstrom_v2014_06-eglibc/work/beagleboard-angstrom-linux-gnueabi/development-gnome-image/1.0-r0/rootfs/usr/share/mime/globs
        But that file is already provided by package  * shared-mime-info

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gnome-control-center/gnome-control-center_2.32.1.bb            | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index ee25c1e..aa24dc6 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -17,12 +17,17 @@ do_configure_prepend() {
     sed -i s:help::g Makefile.am
 }
 
+do_install_append() {
+    for generatedfile in XMLnamespaces aliases generic-icons globs globs2 icons magic mime.cache subclasses treemagic types version ; do
+        rm ${D}${datadir}/mime/$generatedfile
+    done
+}
+
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
1.9.0


