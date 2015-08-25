Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90D5276B49
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:03 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so3854562wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=px8rvULNBF8ku2n5RmH5XDT+cLouWMJ6vMxvCb3GOu4=;
	b=k3GU65qe+ZqY8W+3nqsWSQek9d64atZmn/fw5esZ6403sBDV9aRwv5X2DRyOWwhLFH
	VuBD1trUJm2mzy+XQgc3SsFr4jvr+W6Hc6JzReQQ4Ds+QtSjtrK08f/OtL8vGfs6FWId
	Zv3ODTkFzXS2D90JtmTMFCxq4B9pCe3uTIrwWftFIw0FP5mMRxiG5HpZUi883zVmoxFW
	EtqqWgfRV06zIYStsMQMVIruKFu/2H1Fg/76bC3UzWicZF5CDpOjcgm+AjPpDthGHG71
	4XaWylTEhmp0Ue7VBRcdF8D/UF7D9zyjIo7k2M1wqTjQT9dQ52rtEvRuBoUFv/aYBFPR
	slfg==
X-Received: by 10.180.106.3 with SMTP id gq3mr1650276wib.50.1440481263478;
	Mon, 24 Aug 2015 22:41:03 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:47 +0200
Message-Id: <1440481251-22440-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] xfce-dusk-gtk3: initial add 1.3
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
X-List-Received-Date: Tue, 25 Aug 2015 05:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb

diff --git a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
new file mode 100644
index 0000000..b05c748
--- /dev/null
+++ b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Modified version of the xfce-dusk theme to support also gtk 3.x too"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+inherit allarch
+
+SRC_URI = "http://xfce-look.org/CONTENT/content-files/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI[md5sum] = "b3ad37ad8173b14ec090e60a80e65d8f"
+SRC_URI[sha256sum] = "bfa8a88607d1a1da5bd0b9e4e075767c54400a3c5a0fae88b619ed71532f30b4"
+
+do_configure() {
+}
+
+do_install() {
+    install -d ${D}${datadir}/themes
+    cp -r Xfce-dusk-gtk3 ${D}${datadir}/themes/Xfce-dusk-gtk3
+}
+
+FILES_${PN} = "${datadir}/themes"
-- 
2.1.0


