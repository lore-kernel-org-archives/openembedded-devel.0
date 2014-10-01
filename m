Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7C67365F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:23 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so469626wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=kqP5S6pGwayDERXwuWY40Xu/7SNtdNn++hzr+IdAjDM=;
	b=hcj3MXFqQqrbSWRkoH0kay+c1ZayVTQpe7nACMHkqeyX57NcmttcQY3HwPwtbyBD38
	OQfWc8ebzoYcVP5DG6sVQzfqTKoDRhgR/IhEV5dT3F4x0jHddnOpuU96dwki0hI3XFYp
	4samO9GQGuZrACsmwGV/Rhq04Ti1JgdIoLpTENcBdPLl4QPAj2XKhilusFm6fMA9M3ye
	EnlxuQoUmIomkXwfUmVw8eDEAzDa5mA+RGXr0usGoHXdUlVUITgn/JOY87yv1VOQchze
	Ndq390jjt4xM66gyiPEEeBCMVf0XB1ms5NXPWuhazNMyPnDRo/H31/SLDy2K3D0kiu4x
	6jxg==
X-Received: by 10.180.19.230 with SMTP id i6mr12252984wie.48.1412151564328;
	Wed, 01 Oct 2014 01:19:24 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:01 +0200
Message-Id: <1412151555-19865-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 01/15] faenza-icon-theme: initial add 1.3
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../faenza-icon-theme/faenza-icon-theme_1.3.bb     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
new file mode 100644
index 0000000..dbaae64
--- /dev/null
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "An icon theme for Gnome"
+SECTION = "x11/wm"
+LICENSE = "GPLv3"
+HOMEPAGE = "http://code.google.com/p/faenza-icon-theme/"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit allarch gtk-icon-cache
+
+S = "${WORKDIR}"
+
+SRC_URI = "http://faenza-icon-theme.googlecode.com/files/${PN}_${PV}.zip"
+SRC_URI[md5sum] = "e9bd6106d13017ce06d24b586259ae9c"
+SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
+
+do_install() {
+    install -d ${D}${datadir}/icons
+    for theme in `find -name 'Faenza*.tar.gz'`; do
+        tar -xf ${theme} -C ${D}${datadir}/icons
+    done
+    tar -xf emesene-faenza-theme.tar.gz -C ${D}${datadir}
+    mv -f ${D}${datadir}/emesene/themes ${D}${datadir}/themes
+    rm -rf ${D}${datadir}/emesene
+}
+
+FILES_${PN} += "${datadir}/icons ${datadir}/themes"
-- 
1.8.3.1


