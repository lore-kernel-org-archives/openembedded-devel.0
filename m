Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQI2-0000YS-0w
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:34 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so5750799eaa.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=XCsge7pfjBFktr9oBeNHz0X5QUWxw2rlUFM+DcRkjjo=;
	b=wAz/6XfdMNs2CLf6xD9YkMEobw7dUFl8Yq5PtRgfhhsagi55iELgACrDv6sTquO7mZ
	fp8gF4UULljBFs+pTLp0ja6QJO18zlRNi0vrCXAHREiwuUPdFEu/LXegueQqwIK7QDyh
	9nWpWmvMFaouvf2WGyBXQKjEWXA5l/ICo99nut4QGUqJoK86uC1QetAs2h6kOi7xe1UC
	i7pFlmRYWji8Gss5ox27Q73W8EVLZoreSSEBWw+w9yo8AHOGeXe0Aq3L+IFsmqmgJUx+
	Axv110jsiU5n5deN3NPXxd1L/P8MqpE7l3RAm+aZMSe5jRLzQ8NYJjoJKCe37S1ut0sC
	ykYA==
X-Received: by 10.14.221.5 with SMTP id q5mr125810728eep.33.1357139791742;
	Wed, 02 Jan 2013 07:16:31 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:08 +0100
Message-Id: <1357139774-4364-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 04/10] xfce4-terminal: update to 0.6.1
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* renamed upstream Terminal -> xfce4-terminal [1]
* dependencies changed [1]

[1] http://mail.xfce.org/pipermail/xfce/2012-December/031872.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce-terminal/xfce-terminal_0.4.8.bb           |   20 --------------------
 .../xfce4-terminal/xfce4-terminal_0.6.1.bb         |   12 ++++++++++++
 2 files changed, 12 insertions(+), 20 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb

diff --git a/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb b/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
deleted file mode 100644
index 697c5c6..0000000
--- a/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 exo gtk+ vte dbus-glib"
-
-PR = "r0"
-
-inherit xfce
-
-# SRC_URI must follow inherited one
-SRC_URI = "http://archive.xfce.org/src/apps/terminal//${@'${PV}'[0:3]}/Terminal-${PV}.tar.bz2 \
-"
-
-S = "${WORKDIR}/Terminal-${PV}"
-
-FILES_${PN} += "${datadir}/Terminal \
-                ${datadir}/gnome-control-center/default-apps/Terminal-default-apps.xml"
-
-SRC_URI[md5sum] = "8dff62234da14e1a5e542fb56560ebe2"
-SRC_URI[sha256sum] = "fe5db0b7127ce87efa1e10f44d8915be88005b6ce4f0bfea6b64533e25cc788d"
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb
new file mode 100644
index 0000000..a8cff39
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "glib-2.0 gtk+ vte libxfce4ui"
+
+inherit xfce-app
+
+FILES_${PN} += "${datadir}/xfce4 \
+                ${datadir}/gnome-control-center"
+
+SRC_URI[md5sum] = "98613ce500fef2ed62cdbe788084acca"
+SRC_URI[sha256sum] = "61346427e55af79e86511572bfabb2e025cb13720879226ea1b98a92f0bcd4c8"
-- 
1.7.4.4



