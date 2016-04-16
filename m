Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 962F460118
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 17:00:04 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id c20so66602414pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=idbNTXpKxk903o8koMDECSzlSG1Ql3+AaHpJrm3aykI=;
	b=se3XapJTVQ6qzIokYhj9RS5YVTj+UlEhnnO2ihJ+KjrrzhK87i5mN4yAy+gsKM4QXa
	7zo56/NSsJDJcmwrdoUiIe92PFdLZJCgvMzSpxpgJXz8MpE6LHhnL3eHFzVfFc5Dem+F
	E5McLgas3C504s5Wg1IOD1/Uk410xFpq31Z2N4Uq+btWtqNB8er31gHcCtjY338g5Pa0
	w0cc8KAGSt844S0UsELNbjsxgbBO2jmkCigU7TMTwrIOlgyW2wCQPl8GMY3F+vvdAHpr
	BFHdkxEKW6jReLptaakkXoV7F1X1u95NVv7bsPINGnLXWm9bxGEl5Is+6wEDNpAnktWa
	FowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=idbNTXpKxk903o8koMDECSzlSG1Ql3+AaHpJrm3aykI=;
	b=Whnx4cGn2//0VosuCj72NZ9gQqgh5AC4BdwBy16eQjUqGRdnYDMZZSAK7okLvPxwgn
	rEFdgD15qaB9mDwy7R8gs37jA4HNTpAYn6ZSfbDkKlFskdjRxWqzvkX/M1j3MgXzssZ1
	OGfa9YVw8e3bZfibeXB+wQLoxXbZBfilM+FDqvqWuoHMQewOnjd6k97vJqVGDWx2qzsA
	ukBiO+Pv9JqRGCel1ydH8F3i+LJ/58sTuaKN4rhGEl2l7SaLvlm5NG1BxsGCXcHaTDWE
	CpGP0EIACws9TBWV/yFM70j12ahL1Lw3+dsNbDbcIse0O0Y6tYnbI0EVAv24OqIXZUUu
	+PrQ==
X-Gm-Message-State: AOPr4FVz4fdDebbfz+8miRpVgEMpg0gnsyhWy5Glv8/P00gPeJXXEZ6MmyC8ZqceL5QIew==
X-Received: by 10.98.16.198 with SMTP id 67mr38060159pfq.21.1460826005467;
	Sat, 16 Apr 2016 10:00:05 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	bu17sm72860039pac.25.2016.04.16.10.00.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Apr 2016 10:00:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2016 10:00:01 -0700
Message-Id: <1460826001-6268-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] udisk2: fix build issue with missing depends
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
X-List-Received-Date: Sat, 16 Apr 2016 17:00:06 -0000

 checking for sys/acl.h... no
| configure: error: *** ACL headers not found.
| NOTE: The following config.log files may provide further information.

add acl to DEPENDS

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index d273948..72db886 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
-DEPENDS = "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
+DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 RDEPENDS_${PN} = "acl"
-- 
1.9.1


