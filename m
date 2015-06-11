Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9F6273E36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9HEUw010666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:14 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:14 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:52 +0800
Message-ID: <7cd9d73b8b9d9fd8e3cd7108cdf408a7603f8188.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 5/9] system-setup-keyboard: fix PN -> BPN for multilib
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:13 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../system-setup-keyboard_0.8.8.bb                 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
index d2199c2..8e913c4 100644
--- a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
+++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
@@ -26,4 +26,4 @@ do_install() {
     touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
 }
 
-FILES_${PN} += "${systemd_unitdir}/system/${PN}.service"
+FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
-- 
1.7.9.5


