Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7PBz-0001td-Ul
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 11:38:28 +0200
Received: by ywg8 with SMTP id 8so518043ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=niYscsDabKA5iX+mqPUkAsrWiQat6SDK9ZIkxvYyKpI=;
	b=W+Fd18EWiDDAjTr5nMXMfLh9x0bhOR1TyLM6TpDdGe5qZbAMiLNJCbivJiL4Luu//R
	pXiqBKXziky5FgtblBamYKbHcZWuHkA0cTvo47/OZockPx/hDNcI72cH44XgG8pTbaeW
	P0tpAfolKc4Bf6G+5Q6wKuccRABlYffGldDKU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qu6oRteHd3r7z+G/FRP4LQoO6LKmuWjxMwp6Rwy1VUXt9+JkyH4SR/5TDB5qA68l6H
	16MnCqU0wCF+cfB/ReEd4NsxtFxxDk/HVP6TKAuW3ocKz+WGkYyMALWwPWmvx5IXgJkx
	5GZ2FHFAmu7TLZwAp08X/KDVr7gYHgbHkWRUY=
Received: by 10.101.2.1 with SMTP id e1mr593873ani.18.1302082579827;
	Wed, 06 Apr 2011 02:36:19 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w6sm462366anf.32.2011.04.06.02.36.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 02:36:19 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 15:06:07 +0530
Message-Id: <1302082567-26357-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302082567-26357-1-git-send-email-heroor@gmail.com>
References: <1302082567-26357-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/2] u-boot: Add PSP version for ti816x devices.
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
X-List-Received-Date: Wed, 06 Apr 2011 09:38:28 -0000

From: Siddharth Heroor <heroor@ti.com>

* Add TI PSP u-boot version for dm816x/c6a816x/am389x devices.
* Based on PSP release 4.00.00.10.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/u-boot/u-boot_2010.06-psp04.00.00.10.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot_2010.06-psp04.00.00.10.bb

diff --git a/recipes/u-boot/u-boot_2010.06-psp04.00.00.10.bb b/recipes/u-boot/u-boot_2010.06-psp04.00.00.10.bb
new file mode 100644
index 0000000..2c4d120
--- /dev/null
+++ b/recipes/u-boot/u-boot_2010.06-psp04.00.00.10.bb
@@ -0,0 +1,13 @@
+require u-boot-omap3.inc
+
+COMPATIBLE_MACHINE = "ti816x"
+
+BRANCH = "master"
+
+# Use literal tags in SRCREV, when available, instead of commit IDs
+SRCREV = "v2010.06_TI816XPSP_04.00.00.10"
+
+UVER = "2010.06"
+PSPREL = "04.00.00.10"
+
+PR = "r1"
-- 
1.7.0.4



