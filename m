Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id B4D9560017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 15:13:27 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so212906988wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 08:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/vxeyfu8AgEKQwyQdJs3+ENX5YqTB3/EPuzefi/USsg=;
	b=PgI2OQoT25yyhScwi+fD2iI0gCuYMnSSmmOBztb3+Au6n5taAmCh/wr2l323EV7kr9
	qlZmSCZDTN9t/W9DjQAsI9AY4Xvse3T6BSomMepcXlyNZArAg/89vTMUNmDeH9lvDMSH
	3Sf1A9Z7+1OwstJiq5lJdv9ealZ0nNJ4AnnySEqPYwNvphykUgM4WUi7aP3JVcLKF8sM
	Ph9Ozk4r/2XkNOZMUkUMdsXBEaYuoPbvTOb603Y1KAHfdZnZpYJ+mUi4W5NuUp9Y1Pca
	J7A3UepxVYBWjWW/zPkZJEYaVk3FdbeO9ZpnXlCPq9R+JqDuAf5GMr6ZbP6YDwFb3kFX
	dn4Q==
X-Received: by 10.180.86.100 with SMTP id o4mr11414718wiz.46.1438787606976;
	Wed, 05 Aug 2015 08:13:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gw7sm8078380wib.15.2015.08.05.08.13.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 08:13:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:13:41 +0200
Message-Id: <1438787621-12632-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-systemd][PATCH] dhcp: fix parsing warning
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
X-List-Received-Date: Wed, 05 Aug 2015 15:13:27 -0000

* fixes:
  WARNING: Variable key FILES_-client (/dhclient /dhclient-script /dhcp/dhclient.conf)
    replaces original key FILES_dhcp-client ( /system/dhclient.service).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
index 6c0fd02..7873e9f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -12,9 +12,9 @@ RCONFLICTS_dhcp-server += "dhcp-server-systemd"
 RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
 RREPLACES_dhcp-relay += "dhcp-relay-systemd"
 RCONFLICTS_dhcp-relay += "dhcp-relay-systemd"
-RPROVIDES_dhcp-client += "dhcp-client-systemd"
-RREPLACES_dhcp-client += "dhcp-client-systemd"
-RCONFLICTS_dhcp-client += "dhcp-client-systemd"
+RPROVIDES_${PN}-client += "dhcp-client-systemd"
+RREPLACES_${PN}-client += "dhcp-client-systemd"
+RCONFLICTS_${PN}-client += "dhcp-client-systemd"
 
 SRC_URI += "file://dhclient.service"
 
-- 
2.5.0


