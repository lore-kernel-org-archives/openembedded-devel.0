Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E35D876BF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:06 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so3844573wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=M7CycUqeMsxfcoVqig/OvPasVOsXPKTR1mVKqLbNTx4=;
	b=A3dDFCEWMg/zv+cK6HggJn0f/1eeuntsyLANSbq6rlgXmTx/4CxuqOLY80any+L0Z9
	8QMH+NHl/A58EriHSF+i0wHxuIAZtkST1FLclHwa1T1Pfsk9XGHZqgFhPXSPlA5iRAY9
	E/N5yoMAzn+CMdFNCBxcdY7OSFQHo/mNWntbOSrqDfb13sWmIgCR8S8MWAgWOC5JZ/+s
	Zabe6uf8SK9FZhMp2jvD4XWXSdfFSrEtVqLJwdPAeKQhcmrKBdjAocyP5PnZH74J5ObN
	zabEhJJpqF8dlMjsHNqvfo8cs3N12YlT5zxFS347qyhoHXH3gtGGse77M68sSdVRwzdb
	3rPQ==
X-Received: by 10.180.97.41 with SMTP id dx9mr1662253wib.34.1440481266562;
	Mon, 24 Aug 2015 22:41:06 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:50 +0200
Message-Id: <1440481251-22440-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] xfce4-whiskermenu-plugin: update to latest git
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
X-List-Received-Date: Tue, 25 Aug 2015 05:41:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream patch [1] fixes not only mentionend corner bug but makes menu working
with touch devices. First I tried to backport but this seemed more effort than
expected. As soon as another release is out a patch will be send to update.

[1] https://bugzilla.xfce.org/show_bug.cgi?id=11908

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...kermenu-plugin_1.5.0.bb => xfce4-whiskermenu-plugin_git.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.0.bb => xfce4-whiskermenu-plugin_git.bb} (54%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.0.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_git.bb
similarity index 54%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.0.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_git.bb
index f7b0616..6af38de 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.0.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_git.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
-SRC_URI[md5sum] = "32fcbf16931038c10b1b7a7ccc392132"
-SRC_URI[sha256sum] = "da82bdbc899a9935b560323aac9037d44f37fb110509b80ec293196722671851"
+SRC_URI = " \
+    git://git.xfce.org/panel-plugins/xfce4-whiskermenu-plugin \
+"
+
+SRCREV = "2d3c03eacd78051d2ef8ee3b6a4e2bff4753680e"
+PV = "1.5.0+gitr${SRCPV}"
+S = "${WORKDIR}/git"
-- 
2.1.0


