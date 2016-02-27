Return-Path: <net147@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id A230F7747C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 02:48:32 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id w128so13862045pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 18:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7iwmQNHowylpDfJzeF4ebvj2AWNonfa7gzIahVN1gN4=;
	b=02eVQ9NJ1RGSKze8vfMfuau9wL9MamiLX/Peya97b/KyxKWyj4/q7lcdibDDeISa7w
	63eKgIR3TJr0VpUd47SIXUPigLgR8KG3ZLqsOOFW0MC3wUau3TdjVNeR6WReM+KjwSG7
	jlaQMvV2Pk/+s+YGDpGwyY1TRmJZS83p8BEvl9OVEuzr1prtvSrniLqa8RfXw4XvjxzI
	1ADBtMAEyFS4HT2XfcUh0VRKBK0TOSvDcCL6vHW7BHZ75dFGhhE9dPFv4dikx1bYck+y
	3TrQSYiye7IdmoLwme3BWliuE3N2JHqzj39kRdtC+oqgLyWnlavcfIpJOMzse+NYnQIZ
	eNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7iwmQNHowylpDfJzeF4ebvj2AWNonfa7gzIahVN1gN4=;
	b=H0aMP3k7lcfvMvFxzgzrzhkr9HPmy+V0gXkqDUhr5FtNbmBFaGupU5B6OoXDXG7cjS
	FePxJhILOBecdiSJhefJMxQTdwRz308nx19xHXvTrHehYHRPlUmbcdCdQVIQRuwTUeqh
	MbkW7FH1MYsVKY4v+ZCyrfWwKJql8qu0QwkaL489whFww/yETGQVx3tURwRZiVIANTC5
	6LeM6cRQu+kqLc+XiBcPIke8JvCiu9IdL85Y2FxXL6RIGAkq+UDtm1zw8M0V92+9ceDV
	BVr+fvQCuMsKyRN7kjAknx5CuAGx/FXkCi4RKzsuec99srEXcRQzlRTP6U/tIO2wlMIb
	82Eg==
X-Gm-Message-State: AD7BkJKu/bxXcFaPp1M49B5CuT1GQhTR4lwoUSQeDC0eRtbmJUZk5pzMCntngfJsI0dZ5Q==
X-Received: by 10.98.18.215 with SMTP id 84mr6696056pfs.131.1456541313137;
	Fri, 26 Feb 2016 18:48:33 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	d65sm22148714pfb.74.2016.02.26.18.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 18:48:31 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2016 13:48:44 +1100
Message-Id: <1456541324-23926-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-oe][PATCH] nodejs: update to 4.3.1
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
X-List-Received-Date: Sat, 27 Feb 2016 02:48:33 -0000

Fixes CVE-2016-2086 and CVE-2016-2216.

LICENSE checksum changed because it was regenerated using the new
tools/license-builder.sh script but the licensing remains the same.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.2.6.bb => nodejs_4.3.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.6.bb => nodejs_4.3.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.6.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.3.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.6.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.3.1.bb
index be863d6..44a4a51 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.6.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.3.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=963ca39eebcb15ac618bc3006504ae3f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=003f16759ef967194d594a5ac6490401"
 
 DEPENDS = "openssl"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "edd0c12a6417a96f04ca735c468e624f"
-SRC_URI[sha256sum] = "dcb935647f9e32fc90db52d393f00c9868ba9d84c5ebe5ddd766e225deb52c40"
+SRC_URI[md5sum] = "8032419325e619d7fb04fd22c29810a2"
+SRC_URI[sha256sum] = "9f2fb884655add686a0414800ec2a58279a973520d42f18362f492715625ffa8"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.1


