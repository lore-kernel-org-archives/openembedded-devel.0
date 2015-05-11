Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8566013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:35:49 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YrtUV-0001T5-A0 from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2015 12:35:51 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 11 May 2015 20:35:49 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 May 2015 22:35:46 +0300
Message-ID: <1431372946-26514-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431372946-26514-1-git-send-email-dmitry_eremin@mentor.com>
References: <1431372946-26514-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] obexftp: mark as compatible with bluez5
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
X-List-Received-Date: Mon, 11 May 2015 19:35:53 -0000
Content-Type: text/plain

As the openobex has been marked as compatible with bluez5, there is no
point in keeping PBLACKLIST setting in obexftp recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
index fcd447c..b6bdfb7 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
@@ -4,9 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS += "openobex"
 
-# Depends on openobex
-PNBLACKLIST[obexftp] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
 SRC_URI = "http://sourceforge.net/projects/openobex/files/obexftp/${PV}/obexftp-${PV}.tar.bz2 \
            file://Remove_some_printf_in_obexftpd.patch "
 
-- 
2.1.4


