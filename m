Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g7-00072N-Nf
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:09 +0100
Received: by mail-ee0-f52.google.com with SMTP id d17so474464eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=WMFqBHBrJggTESMA5pr3koF0BHcVRphENZLWFGZkVmE=;
	b=JjvktzWvZT6xi7syHAAg8Iie7ONhumzHwlajn/tqtCezfcCxWmddxG7RBSOUznHUDf
	5nV+zw/IqwWMlkTe+wTJB8n/LTyUJ2kRVPvcnBknUdRgypA+7zs9gamRK5XCI1x6CsBZ
	Bg9mIizm1QXCaBgh26oWw4VYa8lPfMRIEkpYcBGhuvlzzhLAoeRQpdTBKqCV84qVsIZE
	U1TtppkdGeYvi6CmzSROZadsxkxT6apoxRB5XTks3wzK3sLQW/ACZCq6kqVjPl0A/JI3
	gzgewyU7ipdt4CnrfHyfECobJfhbQrOwRbjqYK77JNGEZgkJEmAFnXtvhI/7fE4d16g1
	zDOQ==
X-Received: by 10.14.221.5 with SMTP id q5mr7029562eep.33.1355849722030;
	Tue, 18 Dec 2012 08:55:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm4245554eeo.2.2012.12.18.08.55.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:07 +0100
Message-Id: <ee97efeec28cca615eb29b1e8ba73d3ccf29a57e.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/10] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Fix error for do_rootfs:
| Collected errors:
|  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-fr wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/fr/LC_MESSAGES/gvfs.mo
| 	But that file is already provided by package  * gvfs-locale-fr
|  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-locale-fr.
|  * check_data_file_clashes: Package gvfs-locale-en-gb wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/en_GB/LC_MESSAGES/gvfs.mo
| 	But that file is already provided by package  * gvfs-gdu-volume-monitor-locale-en-gb
|  * opkg_install_cmd: Cannot install package gvfs-locale-en-gb.
|  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-de wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/de/LC_MESSAGES/gvfs.mo
| 	But that file is already provided by package  * gvfs-locale-de
|  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-locale-de.

* MJ: added PR bump

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
index fe5af46..1939f09 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -4,7 +4,7 @@ BPN = "gvfs"
 
 DEPENDS = "gvfs gnome-disk-utility"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 # we need gdu files only: reduce files to delete in libexecdir
 EXTRA_OECONF += "--disable-gphoto2"
@@ -20,6 +20,7 @@ do_install_append() {
 	rm -rf ${D}${datadir}/glib-2.0
 	rm -rf ${D}${datadir}/GConf
 	rm -f ${D}${datadir}/dbus-1/services/gvfs-*
+	rm -rf ${D}${datadir}/locale
 	rm -f ${D}${libexecdir}/gvfsd*
 	rm -f ${D}${libexecdir}/gvfs-fuse-daemon
 	rm -f ${D}${libexecdir}/gvfs-gphoto2-volume-monitor
-- 
1.8.0.2



