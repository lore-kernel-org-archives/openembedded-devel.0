Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 22E1F7D5B6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:48:30 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id f23so7946809ljc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rkLrdkZrfwXvm4mQuu9FhQhIyHHTMTi3zBq8a/hD1tM=;
	b=YSgR3DQvk7kx39HiNX4jdsh52n3eCVHbYfR06ov3SERKZUld/8rnqy7QmI6Naxsis7
	F8eDgAH7NTHzxl3pyq5X5frZ7d1BJvyhZemWMTAewxv+PEnBd2n/CR/UnGjdVfOxBWyz
	lbRxyLhOX1iUoYfkciHh64+rOsr/ic+TOmDC+9ju+tq14S0k19i8IU6Jk3C7ozpAlzEY
	ts1cDFmqV1gqN4SqbBru3ZBwaKmMaziDR+bSb6vawT2N4IztQ32Uci2JYdfojjqLvgMg
	8Tg3qM0X+yn9IJf/Tb13roPBFYjWIamWCasA7tQvoEcer43OtWFGxDdwt+7LtwUm18zW
	YnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rkLrdkZrfwXvm4mQuu9FhQhIyHHTMTi3zBq8a/hD1tM=;
	b=O6xEvbNNtypE9Ojv2KNoKa335Q20rqSsOXjApgJmpsTjZJ3gQmCEAKkwGjiseBX83a
	0kP3oDZfsHhHATuGjmcARygiPS7Y6fqew8eZBl/mCILfqhlnTGZC6vAq72n/sc10vVFM
	T8BLSeML8iPFlbVvjQbK53TOhMVkrDNEOv4+I14ia4TroNSpZgl78qqdmvs5Ld1WY9Gh
	nQYNTxdMnZDCL7RKbjaW4sV6zyQDluvHcTtmfIwPfL/Y7JICFxvst9HKw+nfL+5JzJ6H
	Cwm9YEZVel2CT5SLxp/6/VEz0+URz5IRIg9cvQttVreTqEL+JboWuuZgOYfNLAZ/ZShJ
	4wMg==
X-Gm-Message-State: APjAAAUsNRrX9Guc0AhQzbXzKM6XdBdv8IdFqCPeb0XjjmW/pmtOOaPQ
	ToFCyA5CQvyTguCPWEItQ2yV0/IUoso=
X-Google-Smtp-Source: APXvYqye32r6LL+CRb/0wdIOQd/hgo4aanayaBXa14tkGJ1splIbNsbNr/AuHzBeESPgZ566ip14cA==
X-Received: by 2002:a2e:7206:: with SMTP id n6mr10672945ljc.112.1554576511272; 
	Sat, 06 Apr 2019 11:48:31 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id v4sm3192569ljv.4.2019.04.06.11.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 11:48:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 20:48:19 +0200
Message-Id: <20190406184819.19359-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] fping: update to 4.2
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
X-List-Received-Date: Sat, 06 Apr 2019 18:48:31 -0000

md5sum of COPYING was changed since info about project contributors was
added to the file (see @85abf34b0a38ca6).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/fping/{fping_3.5.bb => fping_4.2.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/fping/{fping_3.5.bb => fping_4.2.bb} (80%)

diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_4.2.bb
similarity index 80%
rename from meta-networking/recipes-support/fping/fping_3.5.bb
rename to meta-networking/recipes-support/fping/fping_4.2.bb
index 82e3bf073..594f5b9cf 100644
--- a/meta-networking/recipes-support/fping/fping_3.5.bb
+++ b/meta-networking/recipes-support/fping/fping_4.2.bb
@@ -9,11 +9,11 @@ in a round-robin fashion."
 HOMEPAGE = "http://www.fping.org/"
 SECTION = "net"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=09d77789fe32be35acde9637a5ee39b1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[md5sum] = "2e17cb655aa4eb59b5a4a38a89e746ed"
-SRC_URI[sha256sum] = "09b8960e235341bae6000085d38106357eae656a79e0119bd27e816c9003656a"
+SRC_URI[md5sum] = "218e71764177a8ce25564a7810f8e729"
+SRC_URI[sha256sum] = "7d339674b6a95aae1d8ad487ff5056fd95b474c3650938268f6a905c3771b64a"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.17.1


