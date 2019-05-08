Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC226079F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 00:01:16 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k8so15862208lja.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 17:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0hWouVL5ZM1uN1J/eYG1Rf8hMHUg0ye982Tocg86HTY=;
	b=LVI1ATQk7o7Y2NYnwuy3SpC2+ZdFpkUSFO3hsNWp1ixkmydMqJwccOPuXTkaJ00Cs4
	gsdNp7nRAngybgAacef4t7oUPEZ7jNSnXHlCYtxlC5Ux+utHjfrs5nuzhF4O6ghyjO2N
	332jgM187jWauXfYKM6Vepb0VMqmAVbwRAKlyYpoVI5orAkWHLOrdFpI5/HSM0dFrL2K
	0CjRyVgLnvhqsYs4k7rEfrlddMWBZDlsHRSWNEIzG2qbViib1HHz+bKyHsZdbFW/1Y/4
	zUjQjzjt4enIa1t8mgRN4/P7XIzas9SB2buOIjvRCImKplrSqbBNjDVZGHJ1S3nynP0b
	y8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0hWouVL5ZM1uN1J/eYG1Rf8hMHUg0ye982Tocg86HTY=;
	b=rIrGWklbvnRS99snLvZHq/ezAuDYxRlSAaWNtFY0dFIqJA5hYIeYvxBOa+1SodNadT
	N74bT6WGY7CI/udjtvE22mICkxhv7gcUgmdbQawCR0neaZM+hjamMMOBriOv2nUw7rhx
	hx3sCreOof2L4OvbhkTLib70p6tfbcz/+TvCSj3fxPQJHY0WB++CbnO2F2oGtet4BFr+
	wJ8qVf/tTJVG6tSvQMoBBbykCrDsZLmvcbeNAK6u7OHVHbTxokWEe8qgv0BeVZvkHwmp
	Dnt8KK5yZ4GmzTTPAL+sGEfeLD27V28i4ict0a5CEnJzQirx+UF/k41gMZ2BDSM/bW1b
	0bTA==
X-Gm-Message-State: APjAAAWpv1AOEkuk9uAq0ckOAyBJv9lzdIF3YyZNQjX69ZwggJyi9+Zr
	xsEE0YmGGLKbC3pz7OjTJ2GfzIY8d4c=
X-Google-Smtp-Source: APXvYqw8IgSnoLmSfaBKw2djiJM9CwNXHecdCWjgpF1Zlfs/NplM6Sij5XHZua7q85SEwBYS7prM7Q==
X-Received: by 2002:a2e:63d1:: with SMTP id s78mr14491161lje.166.1557273676384;
	Tue, 07 May 2019 17:01:16 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	c19sm3428107lfi.69.2019.05.07.17.01.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 17:01:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 02:01:13 +0200
Message-Id: <20190508000113.20594-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] networkd-dispatcher: update to 2.0.1
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
X-List-Received-Date: Wed, 08 May 2019 00:01:16 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...etworkd-dispatcher.bb => networkd-dispatcher_2.0.1.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-daemons/networkd-dispatcher/{networkd-dispatcher.bb => networkd-dispatcher_2.0.1.bb} (82%)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
similarity index 82%
rename from meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
rename to meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index 050a93824..affd0aae0 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -15,11 +15,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
 
-SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
-SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
-PV = "1.7+git${SRCPV}"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/networkd-dispatcher-${PV}.tar.bz2"
+SRC_URI[md5sum] = "304d7dcc21331ea295e207f8493cb8d8"
+SRC_URI[sha256sum] = "21f84c3646a043329dc64787e4e58dfce592b2559b0e3069af82c469805660c2"
 
 # Nothing to build, just a python script to install
 do_configure[noexec] = "1"
-- 
2.17.1


