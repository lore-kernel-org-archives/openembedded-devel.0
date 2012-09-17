Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZJ-0005IT-KU
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:37 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2156742bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=h52yhV6tRm6eKeIf47ExrikXstt/aMJygTmjfPvfM+w=;
	b=Pol0QSYZZ8i8BIwKAM9BILeomE4+Qij+wDSXXyfqctgPVfRo7RhPvfUgtyYA5wCkH0
	yOxJPyUxHnedO3U1oHVzI9MUIvLgEAv2MaJ/x6eMicwnkbzMDC420HL18WSbOMt6ZACE
	nA/pgqfyovy8leFwVTj8wYR5wjzaLq+F+YKfMDMZvyUHd2r1LN8vxB+EB2HSq2I2YeJr
	d2VLh02dXaH0JJQUgdgBqejL3DRCuAnD91UgBMoHv0FnnMO6XtoMKxNuB8EFhQmb7y4D
	i/hwQsgBItbFjLNbYR50qoFweYABGWeSWO6C+UuiFcwCY1tPb+ukJ3ZgyksSvNL+gEKC
	K/eQ==
Received: by 10.204.133.193 with SMTP id g1mr3958056bkt.2.1347869281400;
	Mon, 17 Sep 2012 01:08:01 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.07.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:08:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:45 +0200
Message-Id: <1347869747-14271-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 5/7] networkmanager: unbreak build with latest kernel headers
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
X-List-Received-Date: Mon, 17 Sep 2012 08:20:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| nm-ppp-manager.c: In function 'monitor_cb':
| nm-ppp-manager.c:307:23: error: storage size of 'req' isn't known
| make[5]: *** [libppp_manager_la-nm-ppp-manager.lo] Error 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...se-struct-ifpppstatsreq-that-was-removed-.patch |   48 ++++++++++++++++++++
 .../networkmanager/networkmanager_0.9.2.0.bb       |    3 +-
 2 files changed, 50 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
new file mode 100644
index 0000000..e2f43f3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
@@ -0,0 +1,48 @@
+From 6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Wed, 28 Mar 2012 16:42:24 +0200
+Subject: [PATCH 7/9] ppp: don't use struct ifpppstatsreq that was removed
+ from linux/ip_ppp.h
+
+in recent kernels.
+
+We can use ifreq and ppp_stats structures separately. They needn't have to
+to be packed in a structure.
+---
+Upstream-Status: Backport [1]
+[1] http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f
+ src/ppp-manager/nm-ppp-manager.c |   12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
+index 59698c3..243d2e1 100644
+--- a/src/ppp-manager/nm-ppp-manager.c
++++ b/src/ppp-manager/nm-ppp-manager.c
+@@ -304,18 +304,20 @@ monitor_cb (gpointer user_data)
+ {
+ 	NMPPPManager *manager = NM_PPP_MANAGER (user_data);
+ 	NMPPPManagerPrivate *priv = NM_PPP_MANAGER_GET_PRIVATE (manager);
+-	struct ifpppstatsreq req;
++	struct ifreq req;
++	struct ppp_stats stats;
+ 
+ 	memset (&req, 0, sizeof (req));
+-	req.stats_ptr = (caddr_t) &req.stats;
++	memset (&stats, 0, sizeof (stats));
++	req.ifr_data = (caddr_t) &stats;
+ 
+-	strncpy (req.ifr__name, priv->ip_iface, sizeof (req.ifr__name));
++	strncpy (req.ifr_name, priv->ip_iface, sizeof (req.ifr_name));
+ 	if (ioctl (priv->monitor_fd, SIOCGPPPSTATS, &req) < 0) {
+ 		nm_log_warn (LOGD_PPP, "could not read ppp stats: %s", strerror (errno));
+ 	} else {
+ 		g_signal_emit (manager, signals[STATS], 0, 
+-		               req.stats.p.ppp_ibytes,
+-		               req.stats.p.ppp_obytes);
++		               stats.p.ppp_ibytes,
++		               stats.p.ppp_obytes);
+ 	}
+ 
+ 	return TRUE;
+-- 
+1.7.9.4
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index e774cb9..074e665 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,13 +4,14 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS = "libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
 inherit gnome gettext
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.bz2 \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
+    file://0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch \
     file://gtk-doc.make \
 "
 SRC_URI[md5sum] = "bc0b00b8a187762d93c50a9706b4c5c3"
-- 
1.7.4.4



