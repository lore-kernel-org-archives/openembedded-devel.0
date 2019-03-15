Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C84B6C4E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 17:15:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m16so1655322edd.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=j0ASqzjSpCR4BMRN2Hq+iYdG82UrUf5suZ+VGHDHl/M=;
	b=2QW4uhyXq7tgFWx7hxcV7Vk6h9L78O96aWjBHzqeTZOVTwYceO/hEoSi84gXvW8i3Y
	yXzBmUYP2U2v4USKMxPzq2QDHrLNz3cHY9g0zquJYpiQwgDbiK84mkXEmXtzGOhwex8v
	QoRsH99eN2TnMCP0M9zkwW1cSvKHkNOEZNX7Z+op7sDytRbqZHir6Jb+FGulnPpIIyyL
	ro2KJsiRZJHXJRblAe1M2H5Yu1+KalmDKZjwSsWE/5Hn1tZfS5NwRfAXdj11nmRSHoSi
	ek8y88V1RFBGeEZJxRxI18rFtMpCp3tsiO84xJ/jELxKGme/bwjZOxTSgAA8ixwz0PD5
	Ijaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j0ASqzjSpCR4BMRN2Hq+iYdG82UrUf5suZ+VGHDHl/M=;
	b=GdEyJ+aAL1apfXrUuWpEk3v4DQac1Owg7TwrJ+ZKJDNK4nppWAX0fFv+uR8aLOhJF3
	jmLg0W2qg7i8Y2+2aY0wWcGEHur9LSKfZ0XVjZtkzBoYnz6bw72NKn+5JosCpMnutbuR
	iOEobktFirmxXL/Jqm8A4ymg3wXp4r6iYu3z4Qbfizzj6/QvprAFkRk205vP7absNg4n
	+xIAzayfQnOOKjLoESDh1SkB3oGaKh5Hkm4Nn9G4/EglzW6dCLT7s9a3JoVSVBCEv2cU
	7YQy9GVdsG8RS7UPpfO7rLNyNv3bpPG9tu5+Wbin9fBnYumQb7cw1q154U1Wb1XhYlBB
	cztQ==
X-Gm-Message-State: APjAAAWnttQ59QpxEq73DfLrf/bo0uww+FjwsIVkFyNRebjQ4uBnjyqb
	64L+xZ3tU9dGG6jg4442e02eEDDWKKA=
X-Google-Smtp-Source: APXvYqzBVmzu0ZZMFPb4M518ahQGbRqouBiSm4sPv0zfiMWWGUOANqS/YI2JQgblu/G/tTUk90w1BQ==
X-Received: by 2002:a17:906:3d21:: with SMTP id
	l1mr2907016ejf.83.1552670103531; 
	Fri, 15 Mar 2019 10:15:03 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id i9sm538996ejc.67.2019.03.15.10.15.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 10:15:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:15:00 +0100
Message-Id: <20190315171500.589-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libsodium: update to 1.0.17
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
X-List-Received-Date: Fri, 15 Mar 2019 17:15:03 -0000

License checkusm has been changed due to the copiright year change in
the LICENSE file.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libsodium/{libsodium_1.0.16.bb => libsodium_1.0.17.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.16.bb => libsodium_1.0.17.bb} (57%)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.17.bb
similarity index 57%
rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.17.bb
index 57f38fec2..8d9302f30 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.17.bb
@@ -2,11 +2,11 @@ SUMMARY = "The Sodium crypto library"
 HOMEPAGE = "http://libsodium.org/"
 BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7f5ecba1fa793fc1f3c8f32d6cb5a37b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=47203c753972e855179dfffe15188bee"
 
 SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "37b18839e57e7a62834231395c8e962b"
-SRC_URI[sha256sum] = "eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533"
+SRC_URI[md5sum] = "0f71e2680187a1558b5461e6879342c5"
+SRC_URI[sha256sum] = "0cc3dae33e642cc187b5ceb467e0ad0e1b51dcba577de1190e9ffa17766ac2b1"
 
 inherit autotools
 
-- 
2.17.1


