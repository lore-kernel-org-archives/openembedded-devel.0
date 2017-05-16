Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 190C972F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:15:03 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id d127so115948488wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1jgUYQviYHav2/E7cufATc6now2LptHhCHeKJYCC8sM=;
	b=kyInAgxlu26E+SQN/9ME+UJ5Y+Pg4gWpsJj62D9WCyRcLAiiQODMDgUDSoJKh3pa5F
	UZNjJadPHXrRPk+302vFiUhipsXg6pPEpNBjg5mbG8nGi5zZrVNhUSOwoHTjBHLZawTf
	pq3JQgLulPZsccRNqwNv+ImKjY8BCWzMs462CuGSkNN86qC5W9EmUSjVAAAsbV+v0EMy
	sFwWiap4MVTQ0WTndj82PQUGq7diw2mLtfZQDiaWW3nvv8pIVLziJXpJ0DGK81kyaIWW
	rJ4QupRCByt6zOZFWhAMV5MYEDYE2Fn7u6Bn5moPUuQtviQUoBxKsuFrtnPIzgFu9r9n
	CeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1jgUYQviYHav2/E7cufATc6now2LptHhCHeKJYCC8sM=;
	b=AWxd8wGfWE68nF/T/P0PnnQXVC/CObmmHAGq/scXG0oT46rpWy6rki/lwwwzL3TRai
	rQdMtw5ocvp3eFq+gcjZfrGqjL553Jetf0gTKATXe/K5CEWdZbRRxAtJGlnDxBHWy6f8
	o1CKlcErZJgQMyIBHYOu1DVNSl6kabJ87wtRT5VyZ1ezmI1Ehp1yR6eJpjRTPeE8Upde
	sAKMfj4uKqEZYTnjFddmR+i8xLPcDqhbHBikAeqRKFBFJgnY+Ds//OyV1V7l4f9GkVAk
	/JdH/qzzKvGNha9OOFiW4sqFgH5AvV/mZC6Fdi5QaIMabHDLZWtE/Ar+ZEj9sZrK9Noz
	/AJg==
X-Gm-Message-State: AODbwcBAb/euXIpH1G5tkekqauloUQQd4pBoBiCMyvJcHpAQWkNP5y1W
	Z1GcXvA8J098EA==
X-Received: by 10.28.92.84 with SMTP id q81mr6527853wmb.11.1494933304017;
	Tue, 16 May 2017 04:15:04 -0700 (PDT)
Received: from localhost.localdomain ([37.177.79.194])
	by smtp.gmail.com with ESMTPSA id u13sm1353764wmu.3.2017.05.16.04.15.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 04:15:03 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 13:14:59 +0200
Message-Id: <1494933300-31618-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Tue, 16 May 2017 11:15:04 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index e06ff7f..7cfdd4c 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,10 +3,11 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
+SRC_URI = "git://github.com/jpirko/libndp;branch=master;tag=v${PV} \
            file://0001-include-sys-select.h-for-fd_-definitions.patch \
            "
-SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
-SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+
+S = "${WORKDIR}/git"
+
 
 inherit autotools
-- 
2.7.4


