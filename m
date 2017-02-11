Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 003C6772BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 17:35:47 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id 14so20056152pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=TiizyZKb5HTvvBHHIz++yBwGC9+J4tQlE0PI/8wGQ0s=;
	b=MF5H8M4URsRN3+O1Y69upx/2GGwcr50e3SHTnaLJzWYPigOAE8GG3M0c72xKM0cBY9
	gDFTC/5ItPwfoU/SWhDmwc7Xj6dQ3mopNJMSyQIkmwdVA/daTnxUpDpL2e/YhMQO9h8l
	g6z/dqbGRuHAiyQqGA/DzOtrLKivkRKIOA6QLbezuZoinPc4gdgwALzhfVquUMukl1gI
	duG9NZSaETGibJDmCA9+jQ7nds28v0qmQMKALk1T/LitpawOf7gPJNKTJPA541Ataz2+
	AxNPyYJ/R9Qo2vnhCfFeb7V2kIRMzVszpIAu1l2YBAK0p5+i9lj1u03P3aFOGy1ubuas
	4vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TiizyZKb5HTvvBHHIz++yBwGC9+J4tQlE0PI/8wGQ0s=;
	b=LB6/4fdv13sTw603+WGNX5DjsUTS6l2jMSscaGpifHNS18RFszkatF+wAZFnWdtNmF
	V15GEjVVZHKohaRlUtPjCHQo5vkikMmkZeUWeT4h6GeNGMBN6+w0dTY1JVePeqRKc46y
	atxyBT/I+fGcB/UFwc4G5xl4KBoqPxUXrO1cxn6RDh1AzDJZNsktukJzeFxDX27X9/D1
	ZSXvkbVzg0Mtu5p7tYJri4u8cG0Sng8E0IPAW3yOJFfDAO2pOkGOY2kT8ZjeUD17AMWM
	59PRKKl2e3phGoftKWuBTHVELwlpIAM8+2HABbUga/juhiR2aVSuz3HfQcWIMc2zAfmG
	o3sg==
X-Gm-Message-State: AMke39kXe5dklGLh/Z/aCWzvOMph7iHsogHWd8DR18xWS6lVo6GrgU52Vm1VRvrYyCfZpQ==
X-Received: by 10.99.172.85 with SMTP id z21mr17692319pgn.187.1486834547934;
	Sat, 11 Feb 2017 09:35:47 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id
	l25sm12127584pfb.24.2017.02.11.09.35.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 09:35:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 12:35:46 -0500
Message-Id: <20170211173546.10381-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-filesystems][PATCH] exfat-utils: update SRC_URI
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
X-List-Received-Date: Sat, 11 Feb 2017 17:35:48 -0000

ERROR: exfat-utils-1.2.3-r0 do_checkuri: Fetcher failure for URL: 'ftp://ftp.debian.org/debian/pool/main/e/exfat-utils/exfat-utils_1.2.3.orig.tar.gz'. URL ftp://ftp.debian.org/debian/pool/main/e/exfat-utils/exfat-utils_1.2.3.orig.tar.gz doesn't work
ERROR: exfat-utils-1.2.3-r0 do_checkuri: Function failed: do_checkuri

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
index 3019db7..440f336 100644
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
+++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
@@ -11,8 +11,9 @@ HOMEPAGE = "http://code.google.com/p/exfat/"
 SECTION = "universe/otherosfs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRC_URI = "${DEBIAN_MIRROR}/main/e/exfat-utils/exfat-utils_${PV}.orig.tar.gz \
-"
+
+SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
+
 DEPENDS = "virtual/libc"
 
 inherit pkgconfig autotools
-- 
2.9.3


