Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC337C87C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 19:32:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45X2cX4pFJz4X
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 21:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561318332;
	bh=q3MYRN5ipEtIXzXaeURto5NMEX0L0azEXUSeRCvIvzY=;
	h=From:To:Subject:Date:From;
	b=hFEIPCDwDgzLLnvccfRSRY5zjFnyQjQM8nTm31EK7So59Fsj2afCWSb3hcr/Rb5Vy
	l2lADuclq/27dMtxOoA7XMZbgN2YJNC48yNkXdGGCeLCWdqPRf8XRKjYJijRXMEYOs
	XTqM622aDs3GrYN5y8aWXGteycmLHXVWgs+W/ch0bTr9YUbIYws4Hd+c056dw45LzO
	nZYg2jqvq+gZ1OSp0yIaIipKtjRLK886qwYj7H34k0jLOM+vuFfOJAjmy6ifo+u/1t
	RalrvSVQ4RAbqesLrZyrbIA2E7UfUO+fKTJqDEHevQECz4Q+V3f3TeU+aQZPMenLwI
	hYc9nIaT4ZJrzjQLpLYDIuWyhFaqwAtXfnXCyRSeH4AqSGnC2VSQFdVmxG0PEmP24u
	uBs0AIPOZW5gQDcsRdBe93iCfzt9oXF1/gLcWvbKkS43F9Wh4qnPC9k0iE+N8MxReE
	9Yu6fNXWnvsSluw47SILWoCxjaeVb0EFrMvx/qVh/ZBbC0om7stZAG1Cb6KrmLkwR5
	9XxgiRF7RgYIwYd7p0z+y4KESyV/3obET8/ePXoDjB+DQndrcdnSNUap8Q+9nhXezE
	mXgT8HsjJ62T8qzrKAP2WVFvcP+CpSVoECu+/kokQyse3wMi0jIcRIqKfLzcj3L5QU
	QboC6uw0mq0PBm7gT/BnR1/0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2019 22:32:11 +0300
Message-Id: <20190623193211.16625-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] modemmanager: Remove the obsolete dependency on dbus-glib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jun 2019 19:32:12 -0000

Upstream stopped using it in 2012.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-connectivity/modemmanager/modemmanager_1.10.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
index 8254a85fc..1ad19e8f7 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
-DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native libxslt-native"
+DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
-- 
2.17.1


