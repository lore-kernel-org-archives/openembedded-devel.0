Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SXelR-0003Dt-9o
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 22:36:05 +0200
Received: by werg55 with SMTP id g55so131872wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=I6IRtsvJ05m8imA0ApeMH5gTn4kARNW5Gk10ift1uZg=;
	b=bHdDfoCfRWnL+y6BP7OVKsJifEjkWFFiRV04oQzKuSpwScP+yGtpCJ5F+5uJqpnQ/Q
	9ItunbGU/Q+rfSY1TrKEtw+zz0x2K0i6Mmtzw/u9PoXCbPdRHv3qYn25vG4URJ16yk/C
	44sIUFwLm4m/dz8XEgS/xo56m0FTWHz5TqNXFZF+mf9ddoO7kG5WdBDRjzcRUSScY1sF
	BzRjYyGsZ6y7DxwhQzXWyPKGaN4fxn0m+9u9LE2slWB2j7tHWUWZGidOPLhYNjXPeoKa
	qmEjYCAkMXeaJvplJvELk1Gbr2GRShfUVMNKKXVgTS9z04M/e3TnZubUX45Fv5QmKEFs
	iFKQ==
Received: by 10.216.132.150 with SMTP id o22mr351198wei.109.1337891153756;
	Thu, 24 May 2012 13:25:53 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1842.dip.t-dialin.net.
	[79.223.24.66])
	by mx.google.com with ESMTPS id fo7sm49741778wib.9.2012.05.24.13.25.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 13:25:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2012 22:29:53 +0200
Message-Id: <1337891394-4033-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce,V2 1/2] xfce4-xkb-plugin 0.5.4.3 inital add
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
X-List-Received-Date: Thu, 24 May 2012 20:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on angstrom/overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/xfce4-xkb-plugin_0.5.4.3.bb                |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
new file mode 100644
index 0000000..8ec7fd2
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "XKB layout switching panel plug-in for the Xfce desktop environment"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
+SECTION = "x11/application"
+LICENSE = "Alexander_Iliev"
+LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "libxklavier libwnck librsvg"
+
+SRC_URI[md5sum] = "b31144bd50875ec73f0b3101456c97fd"
+SRC_URI[sha256sum] = "ca4801bb2edfe04eeceb71879b3cf79a0674e8311c39117efdb9d3521307396d"
+
+FILES_${PN} += "${datadir}/xfce4/xkb"
-- 
1.7.4.4



