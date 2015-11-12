Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2C18C77262
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:17:41 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so51386882wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AmbNyVM90DwHWqCD3s2DbghMQMQvTrgQcpgAwOowhto=;
	b=fHftm3EVdvWXhIWD6GoaNKWKbHGNGT0xelnC0q3Et9szD45amwEBxlR1x+QN+nIW2N
	/GWV4UschbH1ZVP8Yb2UuBvgL6CXyXubpIZ/z7gXDAx7U2pEbR9a3s8jwj4Ootrb4cbI
	EN6gEfdZHTReRk0FRw0Op90dG2braBH6QG86dlSMXLjSMxgzl7u0BjZsmlf4U/S2dHE8
	9vi3oAEJcGo+uIhVZxT4CWjUKfEYg6Lz/4+T5XJg7qbSS622saPboGpf4O5ze52fSd2A
	wCMOXBkXa2ExqvNtQ1ArU4rKJEf2yQUBlBl7c3FjYv/JmaB+E9bfep0ZT116EEAApjQ5
	3OEw==
X-Received: by 10.28.6.206 with SMTP id 197mr50345992wmg.102.1447359461672;
	Thu, 12 Nov 2015 12:17:41 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u185sm276863wmu.19.2015.11.12.12.17.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 12:17:40 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 13:17:25 -0700
Message-Id: <1447359445-27258-5-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 5/5] gpsd: also support bluez5
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
X-List-Received-Date: Thu, 12 Nov 2015 20:17:42 -0000

From: Christopher Larson <chris_larson@mentor.com>

gpsd uses libbluetooth, not the dbus interface, so it can work with bluez5 as
well, as the library is compatible.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index dae39c2..6ae2f30 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -34,8 +34,8 @@ SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
-PACKAGECONFIG[bluez4] = "bluez='true',bluez='false',bluez4"
+PACKAGECONFIG ??= "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
 PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
2.2.1


