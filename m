Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8257F4B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id h3so4890251pls.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pGclZGti1Ts9n8JKkcwkLMGk6cnOV11bMEmpoTfYgG4=;
	b=LXP0G2YJaDJTlyIQeFp6qhNut1TS6PRFEeGsfmj3BV/H69UukJss1422Ph7XDPvErA
	WaRifq1796iXTF9BEq2A/cdgE31JENqQsqFVRg3wBJHVLr4jFAY4PJCu61oW3nswICey
	m/5in6kBFN/D75RuAjYHHIe8SI/eQPp/bLOx6eTWeuV6Cd/aBi+SNB7cuqjzciuyKiNc
	g3vZVbSpRUqhz4Q1v5mRIPylscjt1mmdbSMecdaBDHOu15PokS2kXcF895h2Hh+aQKMX
	bwi+/HiHHKgHnmJ1yTMY0SitkmEE/BHf4XsDF4RaaV71uXdZI/Bir99CcMHY3CgcaUgh
	C3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pGclZGti1Ts9n8JKkcwkLMGk6cnOV11bMEmpoTfYgG4=;
	b=WuTOVBQCx6dVklVWrOr8vXDbTpzfj6CVJbfK2MYdl7lMpQMsN21wDpEe6B5uEu4dgH
	xDdXhKhFzwxG3Hbqdwl+k6edKk+tzyLYfyUoHt5VasvquQRPVKt8BB14GO2yoW06Nl8Q
	v/9Uok+VeX5V6uVKkYtwztq0rojb9DSqINNQvW+NVsQr4mwF3NDvhUAYr7XCiQSwQZuW
	/vCw0YOL3RCObHIFrgfpRt8kGP3jXB/o7n0PviQJKCbNdJUlcY3lIOVbkiPrEgH5r3ej
	QwCjOP6nUdGNHr27W2nKbuBUCuuNdcxmnz45nIWl9u9BHibQxsjD/kOsrqjy606VWUI0
	uGoA==
X-Gm-Message-State: APjAAAWvpj+OunTstIcwntasx/CPLZZhJCHKB3LwDZND1FpYnIOu0BM4
	xtgo++HwSpYBLX4w3fuUDzGAT/qE
X-Google-Smtp-Source: APXvYqxX+rUmQzrGsE5eLuOrGqGnksLNtVPteSxTOXjt5iTJcVidc4aa8F0VHyQIyJN2aDQMLnPZig==
X-Received: by 2002:a17:902:b905:: with SMTP id
	bf5mr21135319plb.342.1567287115201; 
	Sat, 31 Aug 2019 14:31:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:29 -0700
Message-Id: <fd067dad3ac158ad8d12fd033dc0160faaced0a3.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 08/23] fuse-exfat: moved to github
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:54 -0000

From: Luca Ceresoli <luca@lucaceresoli.net>

fuse-exfat has been moved long ago to github. Update URLs.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 18fc9cd..a70653f 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "fuse-exfat is a read and write driver implementing the \
 extended file allocation table as a filesystem in userspace. A mounthelper \
 is provided under the name mount.exfat-fuse. \
 "
-HOMEPAGE = "http://code.google.com/p/exfat/"
+HOMEPAGE = "https://github.com/relan/exfat"
 SECTION = "universe/otherosfs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
-"
+SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
+
 DEPENDS = "fuse virtual/libc"
 RRECOMMENDS_${PN} = "util-linux-mount"
 
-- 
2.7.4


