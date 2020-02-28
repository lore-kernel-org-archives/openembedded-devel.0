Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B01161933
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:37:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r17so2969085wrj.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 05:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nEYMwT1w565KrhxDcpFHJj7Z34dkn76CNKDKO8OdiKQ=;
	b=N7hwt961vLxKFVOW4efSBE11h/CnPlapA2qK7aRVhC5+n2VabV+nc1ySMVJ+J+daOg
	bwhM/XdGp1sMV2h5vEvudIf+Niz0PTHmO2SkR66MT0s2ssGv958W5/CasxddCJdB41lk
	JZxbamXoYNfao44+siezQs72l/4dS4nYCLFdGOnbnFlxOBxpjDt5g/fIvsvxX2bliSXR
	2mrs7UTLdwF8DQCC26tjgQc8eLGQG+Q4TAA/TwZs7FuaCyKj/c8/gpq1U/T74eUF1B3d
	vHvBrpC+0TDi2zvkXZveJCInKdxuAzmR5MfMHxbVYdg+8QzX8AMjDhlB2ptFz3Uln0G/
	Nb7w==
X-Gm-Message-State: APjAAAUp70BvseceERK19PYaO58KzIUZ7hmHCqweOyTjt17qxp61Lw0G
	sIRF4ofezlEwbH8QGvg0XByT5kk5
X-Google-Smtp-Source: APXvYqw2Rh29WNdQ+iIj4Pz6ZsmABNa3JvFB4slBY0AVJQUa3HZiYtuLCg1rzbgg8ZcZ3vIKTkkVwg==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr4808342wrv.3.1582897022705;
	Fri, 28 Feb 2020 05:37:02 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t187sm2357903wmt.25.2020.02.28.05.37.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 05:37:01 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 13:37:01 +0000
Message-Id: <20200228133701.39554-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] meta-networking: use COMMON_LICENSE_DIR for license file location
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
X-List-Received-Date: Fri, 28 Feb 2020 13:37:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

COMMON_LICENSE_DIR is the official location for license files

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-connectivity/samba/samba_4.10.13.bb | 4 ++--
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb        | 2 +-
 meta-networking/recipes-support/arptables/arptables_git.bb  | 2 +-
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb            | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
index 71d8fa2f8..4d57255f1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
@@ -3,8 +3,8 @@ SECTION = "console/network"
 
 LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
+                    file://${COMMON_LICENSE_DIR}/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
 
 SAMBA_MIRROR = "http://samba.org/samba/ftp"
 MIRRORS += "\
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
index 8fdaf848f..21b02687f 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A 802.1ab implementation (LLDP) to help you locate neighbors of all your equipments"
 SECTION = "net/misc"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d"
 
 DEPENDS = "libbsd libevent"
 
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index cec1d1f77..e88631e08 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 SRCREV = "f4ab8f63f11a72f14687a6646d04ae1bae3fa45f"
 PV = "0.0.4+git${SRCPV}"
 
diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index f42223b1f..ba6e23e86 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -4,7 +4,7 @@ security or integrity checking, no throttling, no features, except \
 one: you don't have to type the coordinates of your peer."
 HOMEPAGE = "http://www.fefe.de/ncp"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
 SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
-- 
2.23.0.rc1


