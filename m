Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbJ9J-000158-FH
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 23:52:05 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4200620eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 14:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2J3et3DZXDiN+Pgx2sG3cE0ub4E244eDTFwc4ZC8Dgs=;
	b=AqB0Ulth9UJIRRcw4AoYNFsxsb15WK9t1wXUR03K7BR4QugwexgM4zgAgokmIlMCpj
	8WOI4QV5TLdHut+xItiPF8lnUYCRECKqITAshws/fro7FXDqANkw7qdOOFshdvPzSVwk
	/ymHlcogUKBjEtKS+EAzw4PGjveQmEiFwdRygfIoYVxnXRbXsMBqN+F4jhY7NzTSK4DE
	MkRQGtgKPaY/j4H+DLbQxE3HASClYyGSFXzNotYwkbzFlGt1iwBjS/XVpXA0WSAcpo0Q
	tR7f/9S4bm/REiSnEcP2NWH7FMK4oJ99FEbPuaZLvVnbu9DV11PS/F+PIlSwgJrGd2yK
	7C0A==
Received: by 10.14.0.3 with SMTP id 3mr33620834eea.16.1353537480061;
	Wed, 21 Nov 2012 14:38:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 2sm3004855eef.17.2012.11.21.14.37.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 14:37:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2012 23:37:54 +0100
Message-Id: <1353537474-17882-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] dhcp: rename bbappend to match new version from oe-core and move to oe-core prefix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 22:52:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcpd.service     | 0
 .../{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcrelay.service  | 0
 .../recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend}                     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcrelay.service (100%)
 rename meta-systemd/{meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend => oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
-- 
1.8.0



