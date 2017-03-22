Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAD8602D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r137so24340723pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g2akkNSZrUvonduQt7qsCRCxdAb8HLQ9l1eXYkuW9ew=;
	b=jPQTKfCG5AeAS9KlTby0SKiNk3QJy3H3u0yo0+c3Z8t2qFM1cVJMy4VBj6lv8lCmXW
	iy4nHmZcMosZig3KVulw/HprjttnHDj7XPYqh2qFF9nh5svlfY4hBFzz1odgJoW46s8V
	U2mcPTsHKwusE9XVcDadvsakJaH58FfTgOVCQxDgeYmKInrz/i4WfYs+JVxXiHsCt3Mg
	xfi8cY8tY5NrfaFoo9565UKxt1aMMr7B2y8AhcCRMIKSIYPg+Mq0bPZAlH5hiZEToFfN
	w9WDAFt2Ue8zFNBnW+zqNWG+Jb7+Topm339n9hzxul/o9T+EnzbSUQoIoIDPy8R7ze8w
	CYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g2akkNSZrUvonduQt7qsCRCxdAb8HLQ9l1eXYkuW9ew=;
	b=ZYkJfHuMpcfW6DE+kvS1aaQZT73E/LzFwqrZCFYCv7cXNRqmDU/dHImwsi12sFcOVA
	gV64ZsORUSN5jDEzTwWBrp3qH/IlBbxo0soEpdU+6GhPhW2CB/gdBli5/QkrdD8zqFUU
	38rbPKZjosO1BO4gMFotmrqYTIxhMXvB4ej7suTsbpYFKo35VjGQnH0EkNsQw86JJdy5
	FQqvtLlkCLcYdfvq6wVvq01LOKLuAlb/SdNVEthBBlxaW4ZhKA7G2cNwqPGYP75+mJiQ
	hDgjMMEN/1QkXKoxzPEmE5Q/qF9vkkouJQUUzp8vb6pB2n27YT5BrsEQ8r97vTcyewgK
	yIhA==
X-Gm-Message-State: AFeK/H0h9t3wxqJadwsovmlq9VO/bS/oEcgSEAWQqNx+QQwGyY+SGKNFPLwhapuuk4ta6A==
X-Received: by 10.99.123.72 with SMTP id k8mr19926740pgn.139.1490208342718;
	Wed, 22 Mar 2017 11:45:42 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:24 -0700
Message-Id: <20170322184533.6501-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [meta-gnome][PATCH 01/10] abiword: Mark gconv dependencies only for glibc
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:46 -0000

glibc-gconv-* packages are specific to glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 48b3c10be..34fc97d4a 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -19,8 +19,10 @@ DEPENDS  = " \
     libxslt \
     ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'redland rasqal', '', d)} \
 "
-RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
-               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
+RDEPENDS_${PN}_append_libc-glibc = " \
+    glibc-gconv-ibm850 glibc-gconv-cp1252 \
+    glibc-gconv-iso8859-15 glibc-gconv-iso8859-1 \
+"
 RCONFLICTS_${PN} = "${PN}-embedded"
 
 SRC_URI = " \
-- 
2.12.0


