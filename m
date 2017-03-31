Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E408777E51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:28 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so18478991pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u2PAWm9/M+mp0OYRq8yaMGiGI70eRmIiNkTh71/ov84=;
	b=LODahxnQAyq6LUMy8wbf614SFpFrf2TCBYgNyYIO5RHXTizkljBhu41GvRO5uzpe9a
	sPKq7IwzcEu+wMBup15/iTkc/llVAyRYAzYW04eIih53V9ktFL+jHwV6CatZ38ZHsbJM
	JGODQ19ceTNdM+57ZIuUp1ueRgRoNdcLFaIDNTUfceWarQF8TeriOhAIsW2pampp8StJ
	k0syyLoib6jcxmu8AMZSd2NK5ttcOa4879TO4743FgIOR52r090+9tHdb+AEU2RNAQI3
	C+EcMcpNW0v2lJEUtCSyIGGT6oHsUC75HU4pzSQTQ059sZ3Xr4JP45wjjDwJHIL4df9J
	Y3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u2PAWm9/M+mp0OYRq8yaMGiGI70eRmIiNkTh71/ov84=;
	b=CcFXNl4x64xuTBwjRMUgCPhh+PGI89frBjyS42lTLxJPUGRvc9YTvVdIupqepXOnMr
	LrYeqI8EYDAp/gFF8AnGOLLM+ZTPViRKDujPn2+xMIlFKyOBMyX0N7JsnX0fv0WQDvRU
	vezqKlj0Cxu1A2a2a5QSlDhJNuokQjl5V2RXJCUqcSCmjc143yg29Wj/j1WT3Zdys0bs
	S7eiNO0pL/vGYH9UT6xI5c6WcnF24g5qdJauyxQ27i5LhD7+56mX8oLjYofHAziIakLf
	aOt0zeqPkVa6QUPMVCB+qwkFkchhM8zrFYFri0DoDXIr6i9M/yn2ta0rS4+2BYENUu7G
	5VvA==
X-Gm-Message-State: AFeK/H1bFk358vG8sk+d3dLWpSfAby6HyH9xTOKxAcOGZgRST3uXfQE7YPV9lIsjPR9pBQ==
X-Received: by 10.98.47.4 with SMTP id v4mr3218559pfv.86.1490978610178;
	Fri, 31 Mar 2017 09:43:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:28 -0700
Message-Id: <20170331164247.5052-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 24/43] minicoredumper: Update to 2.0.0
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:29 -0000

Clarify licensing and switch to github for fetching

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...inicoredumper_1.0.2.bb => minicoredumper_2.0.0.bb} | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_1.0.2.bb => minicoredumper_2.0.0.bb} (64%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
similarity index 64%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index babe54448..f3071e39a 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -1,17 +1,24 @@
 SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
-LICENSE = " LGPLv2.1 & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=45445387350de96a0e70410470ee5cab"
-DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux"
+LICENSE = " LGPLv2.1 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=709087c2ed0acda54a4d91497a889e42 \
+                    file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
+                    file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
+                   "
+DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-SRC_URI = "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
+SRCREV = "248019446ccf6079926efb54f8b6dd7be769bbae"
+
+PR .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/Linutronix/minicoredumper-debian;branch=unstable \
            file://minicoredumper.service \
            file://minicoredumper.init \
 "
-SRC_URI[md5sum] = "5ba9d116b52a8e2fb93456260644e753"
-SRC_URI[sha256sum] = "1b0eeb3d70dbd2ad6f2f673e4e3446e5dd784e132730e21d8f9dc0977e47dd9a"
+
+S = "${WORKDIR}/git"
 
 SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
 SYSTEMD_AUTO_ENABLE = "enable"
-- 
2.12.1


