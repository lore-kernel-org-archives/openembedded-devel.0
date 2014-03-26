Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9766E8A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:27:46 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id w10so2412061pde.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jU+32RRcQPxZkaZLzpKLo7uHAk0GYOpzbc/2YyiIXwE=;
	b=utaVFmpNONH1PCjGVgg/L8hOKOv9UjxxWML50zqd+9fRVrm8UAPm3MwmhxU3BL+ASb
	ODCk9rwfb+zqJtYxuYtOR6g2Yp+M7KPYq70ZZB6Lc1oAEuRlqc+ikf4qyUCd662fcYI+
	nBnFGKbCgGjc/egsKqM8XRPNSN3nxvd58X22wRLPXnXcJ/qBjpnpasxGKLmKoJ4DxCUu
	mlGeYjGVo+0G9E5ASftGj10mAaEiiq0B4zRlmgucDaFp2eO+fbhE54kPclZIYlQQXYIp
	KHhwl4FGmWc21YLW4ba9YE+zgBjeUmgJB92xPg7fHxxS+enj5LNVc9UEAh9ScYrRvVrf
	6Kjg==
X-Received: by 10.68.196.137 with SMTP id im9mr87382084pbc.105.1395869267979; 
	Wed, 26 Mar 2014 14:27:47 -0700 (PDT)
Received: from pine.bchsia.telus.net ([206.116.3.18])
	by mx.google.com with ESMTPSA id
	hw8sm62029872pbc.62.2014.03.26.14.27.46 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Mar 2014 14:27:47 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Mar 2014 14:27:34 -0700
Message-Id: <1395869254-7092-1-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] exo: Add intltool-native as native dependency
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
X-List-Received-Date: Wed, 26 Mar 2014 21:27:48 -0000

exo-native fails to build due to more strict dependency checking
introduced in autotools.bbclass. intltool-native should be explicitly
defined as a dependency.

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index 09aacc3..3eb03bc 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -3,8 +3,8 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
-DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native"
-PR = "r4"
+DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
+PR = "r5"
 
 inherit xfce pythonnative perlnative
 
-- 
1.7.9.5


