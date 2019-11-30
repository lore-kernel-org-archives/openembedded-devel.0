Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id C13427F8C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:11:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id h13so14257393plr.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Z0SyzHXvYQJ8ZLCHyyKcoKcq5AHCPwPSQXdq5qoKtjU=;
	b=tsKFT8xaTUtSws5pfAGNy6BuMIdpKdqDgYj5i7LzUi6oeNhp0nqvJ6egzfiJiPiEST
	+AvDguiutDsFBYu14c21fXEX5lNKcH/vY+u2P4P0Q7dxegWA1TyOcv6kE4ng6INlKisQ
	+XMpA8wC/Ku90zFkg5fvSC4lw+xyiou4XbMgDQxRS1AGA0r8FPcWOMVxcNuJcV2PqyrZ
	22qKR0P6pWIVYZjqSoVLaHo+xTxLve8VVJflpw8+v3idNW32SM+jFiBG0qZFYyrwCKbh
	dK/qXeklCxIufY48v56ZVOl0pN54u+OBcvdw7SYIG3D1+y8rGoVE0GACwwCyciDeqJT+
	Ak9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Z0SyzHXvYQJ8ZLCHyyKcoKcq5AHCPwPSQXdq5qoKtjU=;
	b=d/TpETzujNM/MvRIkHNnbiz27sM6wy9eO8DccVI3ggYrQi4Dhn4c1+jTvSYJ9ieedw
	3u91PIeSHxZvO47vtH723oRk+0MbRj6h3CN+EqVTWfjaNYVkOoF73mDKw/X8BGoCosDS
	NTKNEkIP5zOQMC80QrQ/FZs3kIbncf/UpCUk2IEqHNgdriukGyB7KUlakDYsAxAoDYCf
	XZOzxE4tNlDMnEcRooIx32LYYIwEu6aKA4I63L6gisT/KnPkXgR34ljAP45AFPwtV/ok
	eZeRVHliBGTVWh8pPGiMOD3EJ6WVTTDc5tf1zt6wJTGrTiBQcWVWApYOvcrjPOQ7uLgr
	xNPw==
X-Gm-Message-State: APjAAAWBd+8bvVLo6yZjTVJTXi5Uvh+fqQKSraxXH4H/0uHHyJnS4V1a
	0eS/a42Mk3RP3c+7byCMsjylsjJX
X-Google-Smtp-Source: APXvYqzbnbVmNqCxXFNqsSrQhC5tnlekgc/KT6Hdz9T6UF6sE0YoX5pt13wi9pXEJLA45JGB9PSbaw==
X-Received: by 2002:a17:902:b702:: with SMTP id
	d2mr19984117pls.104.1575137462598; 
	Sat, 30 Nov 2019 10:11:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.11.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:11:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:45 -0800
Message-Id: <c53a33030b3ff9172867cb23ff40e2a9694882fe.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 15/15] nvme-cli: defer host ID generation to post installation
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
X-List-Received-Date: Sat, 30 Nov 2019 18:11:01 -0000

From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
index 6133b3a..92c902b 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
-DEPENDS = "util-linux util-linux-native"
+DEPENDS = "util-linux"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
@@ -21,6 +21,7 @@ do_install() {
 
 pkg_postinst_ontarget_${PN}() {
     ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
+    ${bindir}/uuidgen > ${sysconfdir}/nvme/hostid
 }
 
 PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion"
@@ -28,3 +29,5 @@ PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion"
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN}-dracut = "${libdir}/dracut/dracut.conf.d"
 FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
+
+RDEPENDS_${PN} = "util-linux-uuidgen"
-- 
2.7.4


