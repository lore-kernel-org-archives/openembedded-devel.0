Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA39763A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:37:12 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so130105720wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=b3C3ppKZRUE/uGkBc28CvBkTjOyccyeOM1t7ujAlrgM=;
	b=afz1dwuGELgVUwPD0h+KYcKfECm6fC9WhmvOGSDOtFFfIqUNBXH6/xWNAvjNuyFKPa
	gMWJgJ/zdJEJWmdv51KpcAOdRAsPcjhMBr6GbUTsBVgaw/n/70b2HU5PSwSuxPOIw9/2
	e/xAkfmdNNWKAcRrTEm/VGfbPHXKfKmWoAJ1wwvIW99B0/OmG3VzABlvw2tKlnbeqvXb
	qmh5qN+haIWvMY3IcoaH56N6O/8RtmpSI2m6WFuYPUhYzS1/qprw1RRx07eQc19E/+z5
	F/KBp9Edakl9LQpRBl/QQ09samtPqnWS8zJFbto+avOR5j4E9LP7FgE/Iq9f9W8JooYo
	lVmg==
X-Received: by 10.180.205.142 with SMTP id lg14mr25277691wic.95.1438025832758; 
	Mon, 27 Jul 2015 12:37:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k12sm23016995wjw.4.2015.07.27.12.37.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 12:37:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 21:36:54 +0200
Message-Id: <1438025815-31315-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
References: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] xfce4-hotcorner-plugin: initial add 0.0.2
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
X-List-Received-Date: Mon, 27 Jul 2015 19:37:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../hotcorner/xfce4-hotcorner-plugin_0.0.2.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
new file mode 100644
index 0000000..f86c92e
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Plugin providing hotcorners"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README.md;beginline=48;endline=53;md5=2c694b8e0f73274b13465b509e4f5427"
+
+inherit xfce-panel-plugin cmake
+
+DEPENDS += "libwnck3"
+
+SRC_URI = "https://github.com/brianhsu/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "ac31b45cda1867cb6bd69bb285638263"
+SRC_URI[sha256sum] = "942684c92f96a158e1417e597947f822769ac56aa1993a8c9f166ee633ef2b8d"
-- 
2.1.0


