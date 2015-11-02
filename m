Return-Path: <Hongxu.Jia@windriver.com>
X-Greylist: delayed 1582 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Nov 2015 04:00:01 UTC
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2B9A60125
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 04:00:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA23XbZT000551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 1 Nov 2015 19:33:38 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 1 Nov 2015 19:33:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Nov 2015 11:33:32 +0800
Message-ID: <1446435212-14336-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gvfs: add missing libgudev to DEPENDS
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
X-List-Received-Date: Mon, 02 Nov 2015 04:00:02 -0000
Content-Type: text/plain

It requires libgudev, and libgudev requires udev.
While systemd enabled, there is a build failure:
...
$ bitbake systemd -ccleansstate
$ bitbake gvfs -ccleansstate
$ bitbake gvfs
|x86_64-wrs-linux-libtool:   error: cannot find the library
'.../tmp/sysroots/intel-x86-64/usr/lib64/libudev.la' or
unhandled argument '=/usr/lib64/libudev.la'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index 5b2235f..166e5d2 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
 
-DEPENDS = "libsoup-2.4 libgnome-keyring glib-2.0 avahi gconf intltool-native"
+DEPENDS = "libsoup-2.4 libgnome-keyring glib-2.0 avahi gconf intltool-native libgudev"
 # optional: obexftp libimobiledevice
 
 PR = "${INC_PR}.0"
-- 
1.9.1


