Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2A475223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 01:27:13 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id n84-v6so52812462oib.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JI2J2OIQ7UP2jocnfqtpw7sZMcGojsPN2wPlFUSfs8I=;
	b=nhOnqKsgTl/AFhGig7u7jTlCj4W58f9b4eSLRpNbhH3IxHG4dbdHsiedamdmOGopdM
	nuJT7aNAyGjKI3Q77iM08HZgSCr9x4i/mg8J0Y354VVBHwsbfh/WeYSCj74Br+ycXOZQ
	ovxI+MS9rtd1F1EpqnWziZ3ZioewH5v79gnIsq1yk+DK/gu7Vcmp0c4HV6y5wFjgfn7Y
	w02EihcfHstzeYMBLKP/kzdaY1uR9U7UuZkybJ5aXF9AF+0Stv03GdvvbCPxz9h6IE9J
	o2xk/QdSGotf5riOEQ692DUZ2auLAMYmVy8ah6fOTLysaJg9JmVCBuEPNnEygaAGmtff
	qQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JI2J2OIQ7UP2jocnfqtpw7sZMcGojsPN2wPlFUSfs8I=;
	b=fFQTFIKQ7iOqPMZcWvyXVuCS6sqwkF42ct4ZkhNa2EAXeNiLx/NDsiPpF9FpyWQFHT
	ROeUikJbfVWaUqcEoq1Pe4eKbTpL+XEA5PY8Mn/VgauwR7scIVUuDqq0SUqVUAUgvLzj
	ow4vAxzP/ZmoqCS88s+bhu36e6Si3U1VIJ+b7GIYi9HbcT2smkf3GBbQsgU7Hkd1kM8Z
	qGxmZ2gIVvux+KM+a02ugZx++ZxMJTOMOcegXkkqulDpWHkiz1OVwCuVmh1RGsoaXhfn
	wO4MWBpPuqrV7PIGWMfuw8v8qRyBsaKSsiU+zS7uTX0ebX9EQ6X/8a0V1y8lwPLceeI6
	9Mmw==
X-Gm-Message-State: AOUpUlHg42WbT5tHl8uYTJ+94/z6X3a04/s2eRqYTWN69qTXDsYcE7dY
	o13AxU/yo3xeBYZCZKq/Fz0=
X-Google-Smtp-Source: AAOMgpfDaENmhcukU20BCr4nvINjZWx4bmHE2tqHGuIFf/Sg1UI5miIs8MYSB3r/bc/e4uAWIYcMkQ==
X-Received: by 2002:aca:a56:: with SMTP id 83-v6mr228577oik.57.1531358834419; 
	Wed, 11 Jul 2018 18:27:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:3df0:c2f2:5900:71b6])
	by smtp.gmail.com with ESMTPSA id
	y27-v6sm87401oix.4.2018.07.11.18.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jul 2018 18:27:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2018 18:27:09 -0700
Message-Id: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/4] nmap: update to 7.70
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
X-List-Received-Date: Thu, 12 Jul 2018 01:27:13 -0000

Update LIC_FILES_CHKSUM for yr change

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/nmap/{nmap_7.60.bb => nmap_7.70.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-security/nmap/{nmap_7.60.bb => nmap_7.70.bb} (87%)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.60.bb b/meta-oe/recipes-security/nmap/nmap_7.70.bb
similarity index 87%
rename from meta-oe/recipes-security/nmap/nmap_7.60.bb
rename to meta-oe/recipes-security/nmap/nmap_7.70.bb
index 74b4388..e47d09f 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.60.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.70.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utili
 SECTION = "security"
 LICENSE = "GPL-2.0"
 
-LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=700c690f4ca6b1754f3f1db8645e42d9"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=1489288f46af415fadc4e8b6345ab9f4"
 
 SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://nmap-redefine-the-python-library-dir.patch \
            file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
 "
 
-SRC_URI[md5sum] = "4e454266559ddf2c4e2109866c62560c"
-SRC_URI[sha256sum] = "a8796ecc4fa6c38aad6139d9515dc8113023a82e9d787e5a5fb5fa1b05516f21"
+SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
+SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
 
 inherit autotools-brokensep pkgconfig python3native
 
-- 
2.7.4


