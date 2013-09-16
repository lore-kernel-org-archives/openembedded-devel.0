Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 462256C800
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:35 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so1852128eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=L8rvZaPXBFPKQTiRSmhxY5AVuaKPrB/hCRRE5GjkOPw=;
	b=KVYV1+pN8y0s/jaMQNiHZIr3e32L2Oh8/ph+BGqbiWjtVQK181bxUai9huVlsvmEL9
	gC6lzngKrRVRFGI7BhfsGcLwxk3FRSezkuLCA27BFnp/iYk0P/+DrrBHjiaKT2jmQiB2
	Z/G9rOb71l/LcBbqpC6qUVn0Vr9dJSx2Ja8DoKJpjIK8oMqGkDnlovPUDykaB2f9ZmRe
	+OAipjhStjp1/zTJHBkN/g4tTAg7lZ4fkABbDYITWS4TPrHmnZHVikMXDkZuzXDNm62e
	wTQHClLDGWyKKJdVSIjREGw4Lg9jnJYVJROx+9+46Bp/lxCihVMEoDtN65j8YvhqZsGS
	GCig==
X-Received: by 10.15.99.72 with SMTP id bk48mr42310239eeb.22.1379322276883;
	Mon, 16 Sep 2013 02:04:36 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:14 +0200
Message-Id: <1379322259-3831-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 4/9] libxfce4ui: update to git head
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
X-List-Received-Date: Mon, 16 Sep 2013 09:04:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* in commit f30f9742e64ea5ec3b23d977b904f24799d773d6 the signature for
  xfce_shortcut_conflict_dialog was changed. This change is required for
  xfce4-setings HEAD. In the next patch of this series the development
  of a datetime setter for xfce4-settings will be introduced and this
  is put on top of xfce4-setings HEAD.
* there has been no release since 04.2012

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index b5eb604..594358d 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -2,14 +2,23 @@ DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-PR = "r1"
 DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
 
 inherit xfce
 
-SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[md5sum] = "6df1ce474a3d4885aee31cda9dbc9192"
-SRC_URI[sha256sum] = "a2b9fa288ccb5f16fa13264e507ba3f7b8da0176da259a11239f21538c0ea3e2"
+SRC_URI = " \
+    git://git.xfce.org/xfce/libxfce4ui;protocol=git \
+    file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
+"
+SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
+PV = "4.10.0+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
+
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
 
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
 FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
-- 
1.7.6.5


