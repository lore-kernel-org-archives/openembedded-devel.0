Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 55C3B7E01C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 10:06:20 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 33so5886127pgv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0Ps574peU43tNAR17Bb0BK6/VFL1d8q6zmQ1FSpzzDM=;
	b=QOmWp14M8lmb9BHfCuiQ4/9DRdKtrxdOGPBQQSuArK1O/OvZAxpki6rNzR4R0hzzyw
	yODSkSWjMPvcR9J90TECGmqZMZn/XPfuIWDisy5IUP3gPWYtE4FOV2OveRiPryOwXOkO
	vBH3jqrImy0llECT1tfUSSesZb6W0uL3cb6kWO5Ed2hSKrmiG2mzuVO+gKmv50SHtyyw
	icA2RnLE1zmPpYjrVgAzDhFr7//VwiQG3WSF2yNvnwKb9ggI6y/3FIuY10F7CpUpRmVi
	BWtdV6gj+NMGgxJXvrwOvz2e+0p2Mw+ydOMz+OiZLdPdxc+C1hAyzidkYTkDEyAW4c+h
	h0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0Ps574peU43tNAR17Bb0BK6/VFL1d8q6zmQ1FSpzzDM=;
	b=gQvoAfG45LxWIoC2hRig1WMtSIa9d0Q7V+83wtJi20Xz1jwTz4wZIef0IhQOdAzsGP
	gaD8D+x3IHgH1txDqW8lxMss7UY6TIQOjwX7oXHi8E7AAmZSAFjKE+pXUGcLrXSRnRch
	Q1ExseaI/Pxd/7OptOZv+ZVAc/kliQ4Ka3oIhRx4dHzsfZTYOIhKoLpauxSQ5C6u0XUa
	+MLc0DyrAp//q9BYtOwYBxqdjhEXpfetUcSqd/b9LqlbPxjwN7KNSRG1SYqYBbu7qRG7
	DDDZOhHZchKekPVgvczawaUlGaWY0Bg0MAmHYKnJtqmL9Kcs5PDBOKti8pGymFwuSXsh
	f/Zg==
X-Gm-Message-State: APjAAAXVqON7zjrJbefAbjwjx6HtDRrKOsnwJu0r7i5sVKFD2oFoikB9
	gXt/c+TkY9sDS79qpJrucWu8+3kLsxM=
X-Google-Smtp-Source: APXvYqyGrpufAw+jemWu8zuyRXGDuOBMrROAegh5C4d/3hCoAsh95/aCk37WOAPnwW95JufBmxBjRg==
X-Received: by 2002:a63:27c7:: with SMTP id
	n190mr65207912pgn.250.1558951581391; 
	Mon, 27 May 2019 03:06:21 -0700 (PDT)
Received: from navik-desk.iind.intel.com ([134.134.139.82])
	by smtp.gmail.com with ESMTPSA id
	n9sm10921833pfq.53.2019.05.27.03.06.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 03:06:20 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 15:36:10 +0530
Message-Id: <20190527100610.8944-1-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Mon, 27 May 2019 10:06:21 -0000
Content-Transfer-Encoding: 8bit

Add generic recipe for safe C library.
This library implements the secure C11 Annex K functions on top of most libc
implementations, which are missing from them.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb

diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
new file mode 100644
index 000000000..ad3c4ba74
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec_3.4.bb
@@ -0,0 +1,15 @@
+SUMMARY  = "Safe C Library"
+
+LICENSE  = "safec"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
+SECTION = "lib"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
+SRC_URI = "git://github.com/rurban/safeclib.git"
+
+COMPATIBLE_HOST = '(x86_64|i.86|arm|aarch64).*-linux'
+
+RDEPENDS_${PN} = "perl"
-- 
2.20.1


