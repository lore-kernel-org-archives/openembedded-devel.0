Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE4876DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:48 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2878186wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=b6TzYyJ5C8/wj8VXZ02x/NiPnZgrDYf8jusXEKN2QBg=;
	b=nHt9B4iwwmR9dkgx6g152Q+VwwaWD8yInToOYRZd2MjvYgoH+tkL2zhCO3vn6Vquhy
	VgLIq/49lV15CDkWNm97+qMwVAj269GyePuLxXdLBl3ydtHmYeRAh1o9xZKylSjePcTm
	SJFBeImQ5GnW01XixAmdFm/Xw93obPjEszv2qNPr1gbTHlnusuZJhe64Mja7VmeuZ6sU
	eoatJQUoYTNnZHa5AUzzIWXJHWI4t5SIzhg9j/bB/+gY5uSyIe78DBIVgle+yx9WVZLp
	WPBNVeErgKSO5bhNvSVYIUsrnfaoR1mZW0sbU6CTpQWoCQPrSrzRgNZh2BSjOIEfwLcF
	IiaA==
X-Received: by 10.180.10.197 with SMTP id k5mr8633057wib.22.1442450508858;
	Wed, 16 Sep 2015 17:41:48 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:19 +0200
Message-Id: <1442450491-14912-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/19] udisks2: add libgudev to DEPENDS
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| configure: error: Package requirements (gudev-1.0 >= 165) were not met:

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index 1c76d81..031b0e8 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -2,8 +2,7 @@ SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
-DEPENDS = "libatasmart polkit udev dbus-glib glib-2.0 intltool-native gnome-common-native"
-
+DEPENDS = "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 RDEPENDS_${PN} = "acl"
-- 
2.1.0


