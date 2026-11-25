Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37923.1795594063201279753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Jb2XnAVV;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11736114eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594062; x=1796198862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L8FQnNEwZSZAJEJaqRS/XQRVZaXBa8EI3oy4RKP8TQY=;
        b=Jb2XnAVVWI0Jk7cs9RWGLvjSEPK5oPPs2XT+svb+HLlhf/FdtIjfkhUE/mB0FTOEI6
         KvkSWpOJKygvPP61TxqA64LlfF72Z3Cdihydj/FJny0ULGgU5WU1FKOJV2CMiGXfuPZ5
         L0MZkPYfU2a1JKcc9Vus73fd0J5xy+peg/Kz/rKMj3TfTKyvZyl/SLo01174+x6zA6mo
         7hdGQCemljfPUGkhWp5PPTM0iGqnS0Oub2CsJxLtnBjSPKKsHZoS5knXB7sSLeTd/eat
         33c9I57sCLyVOFuy3xYoWiaxS3cjaNwqRKDgzxdGzG6kZBr6OD9Z7kuNxeam1D/inqt+
         Lo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594062; x=1796198862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L8FQnNEwZSZAJEJaqRS/XQRVZaXBa8EI3oy4RKP8TQY=;
        b=YAqzNAiwbpl4DJlHkgzmOfIoKBdtpMdOO71Sa1ASzYFoBNwM2pcYNup+Bv9vvBcNEM
         P4tnqpwkXMbcYJwdcygvfkubbUzugYOHshM4CZbMcI5lEo1C8ZNXnVoQdKsr1RRErjRh
         UBPTfdh940PnVrt0NewvB6foq7HO13YdOBQTz2bD67JjWHXGKXqJwrDuIG/D7Eygji66
         Bcyq2Xmm3vMDFFtqEie465Og/t0EPGak4hBkPXoUr9P2ji4lR+cV37kDdkuvOxJ0i/Ih
         8kqooRt2dKRIS9HryqbhIuxujfe7hsDDA3fSHzTD26hic+zTVBv8xB2nme57MiwBqW3I
         Dp/A==
X-Gm-Message-State: APuU4Z8E8e1xJD49lRTnvtI/3EGXuaqMUfaNxZbKkqDv5WOGak9XPc5b
	6a+yuoWN/OcDz1AAzky2ODIQ40z98OGJh/4cKwqPWMsexwb3ZqMVHKEU3Ihuve1C
X-Gm-Gg: AZFdTZe6mmDPrOhcsA4lI4PaR4yWCz+TiwG3Pp0sXOArIldoVsfiF9XLQzBlO6mPSd6
	9Tdmo2rppAk3D2j2XMgpNLiO5KBKDejGIMlTjRjFlMVNldqIa7zoa44NyiM2cJeuRiTCHTeWMg+
	sSP94fUrWs5dieKWNL5hnOBVkVUID5ufCn2kLPRU9EJT4WvZgpfrOe8GsMiVx55ZEUNW224/W9C
	07/Un2zjF2862u4e+yhpnHhB9eYISFA4/XupA+41XxAtIGjiOZ3RXVPePPYBh1itwooAIVEN81s
	WBtI3W+bpMYoj/e0pKwFDiMTAkZ0CDfIhwYS4s2mYAbR8R1oEmp71MXgj+gqLQVHUmX9zryPOJZ
	ZRpqKXiSPndWGPe4Db+EHujEIuI4AtSN+qrkWndKJcSaJrsU8+lHOgwY3S6OcR+0jC8zz2SU9Ex
	T4GpZk7Zr8495Ps5IkpPRk6Ms9cVfeN/OompISKCFH7jOXAO+LbOM3QAntQwn3Ym8UgAds3jRNk
	OhzUe6VFqs8/cyycD5pdLijNBR3xNnm6ufaheHqZiFSAH+fD2iYX+vbK0jtnzcf2yI6IIcmwngT
	+BB+4g72z3e5rLINtNv3NDqlWXcO5WNwgrBAaQtBzUjte0t4+DcgJMxQ2ryk2CLlhmcjK6SAvUR
	7fKP48P4tH8LygBnBmiT5lRmf8KnMY5T8Qvd3D1VHf8kwD2yw0btGCpdoiOmjXPIna4v8lqdbwk
	GrgrCEpS3bXJEI+SHnD6mZCVMsn5NC6yIMLoxtCDenPkvWCokECvqUHOebAoRIDdiGK12naFgZg
	qkOvczzmiB25BbLYegKfhfwNkgdCb6r3QmD9vZ6KIcSFxyKn5onkThLCWq/gL6EtXHdM4cOV54h
	jy7h
X-Received: by 2002:a05:7301:4284:b0:382:1aea:c21d with SMTP id 5a478bee46e88-3857191bcf7mr18315034eec.41.1795594062379;
        Wed, 25 Nov 2026 00:07:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 3/5] geoipupdate: upgrade 3.1.1 -> 8.0.0
Date: Wed, 25 Nov 2026 00:06:14 -0800
Message-ID: <20261125080732.2419614-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133001
Content-Type: text/plain; charset="utf-8"

Upstream rewrote geoipupdate in Go in 4.x (CHANGELOG.md):
- Only GeoIP2/GeoLite2 .mmdb databases are downloaded, using a MaxMind
  account; GeoIP.conf takes AccountID, LicenseKey and EditionIDs
  instead of UserId and ProductIds.
- 7.0.0 switched to new download endpoints (downloads redirect to an
  R2 storage host) and requires GEOIPUPDATE_VERBOSE to be 0 or 1.
- 8.0.0 stops updating on the first error, fixes the Docker config file
  and no longer retries proxy CONNECT 4xx errors.

Replace the autotools recipe with a go-mod one built from the v8.0.0
tag; zlib and curl are no longer needed. The config file and database
paths are set at link time to ${sysconfdir}/GeoIP.conf and
${datadir}/GeoIP. Rewrite the shipped GeoIP.conf in the new format and
fix the cron entry (it lacked the user field of /etc/cron.d and called
/usr/local/bin/geoipupdate). Move the files from the versioned
geoipupdate-3.1.1 directory to geoipupdate/. Drop the docker and
release helper scripts from the installed Go sources, they would make
${PN}-dev depend on bash and perl.

geoipupdate-go-mods.inc and geoipupdate-licenses.inc were produced with
the do_update_modules algorithm of go-mod-update-modules.bbclass
(go list -deps of cmd/geoipupdate); flock and pflag are marked
BSD-3-Clause by hand, as the license finder does not recognise them.

geoipupdate 8 no longer updates the legacy GeoIP .dat files that the
geoip and geoip-perl recipes use; those keep their bundled databases.
Only packagegroup-meta-networking pulls in geoipupdate.

License-Update: the C version was GPL-2.0-only (checksummed via
ChangeLog.md); the Go version is Apache-2.0 OR MIT (LICENSE-APACHE,
LICENSE-MIT), and the Go module dependencies add BSD-3-Clause and MIT.

Replace the GitHub tags page check with UPSTREAM_CHECK_GITTAGREGEX
matching release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../geoip/geoipupdate-3.1.1/GeoIP.conf        | 11 ------
 .../geoip/geoipupdate-go-mods.inc             | 13 +++++++
 .../geoip/geoipupdate-licenses.inc            | 15 +++++++
 .../geoip/geoipupdate/GeoIP.conf              | 12 ++++++
 .../geoipupdate.cron                          |  2 +-
 .../geoip/geoipupdate_3.1.1.bb                | 35 -----------------
 .../geoip/geoipupdate_8.0.0.bb                | 39 +++++++++++++++++++
 7 files changed, 80 insertions(+), 47 deletions(-)
 delete mode 100644 meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-go-mods.inc
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-licenses.inc
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate/GeoIP.conf
 rename meta-networking/recipes-support/geoip/{geoipupdate-3.1.1 => geoipupdate}/geoipupdate.cron (59%)
 delete mode 100644 meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate_8.0.0.bb

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
deleted file mode 100644
index 134cfed1f5..0000000000
--- a/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-# The following UserId and LicenseKey are required placeholders:
-UserId 999999
-LicenseKey 000000000000
-
-# Include one or more of the following ProductIds:
-# * GeoLite2-City - GeoLite 2 City
-# * GeoLite2-Country - GeoLite2 Country
-# * 506 - GeoLite Legacy Country
-# * 517 - GeoLite Legacy ASN
-# * 533 - GeoLite Legacy City
-ProductIds GeoLite2-City GeoLite2-Country 506 517 533
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-go-mods.inc b/meta-networking/recipes-support/geoip/geoipupdate-go-mods.inc
new file mode 100644
index 0000000000..dfe603f211
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate-go-mods.inc
@@ -0,0 +1,13 @@
+
+# This file has been generated by go-mod-update-modules.bbclass
+#
+# Do not modify it by hand, as the contents will be replaced when
+# running the update-modules task.
+
+SRC_URI += "\
+    gomod://github.com/cenkalti/backoff/v5;version=v5.0.3;sha256sum=58e4d9014277bc1c5c7ab64539137923964cc3920303a4f771d02a532939bedb \
+    gomod://github.com/gofrs/flock;version=v0.13.0;sha256sum=171560e83110e199cc9f4f8959d442c563c8ab6b26c100dd67b7a2fe265339ce \
+    gomod://github.com/spf13/pflag;version=v1.0.10;sha256sum=a246b8c9d3daa87d6c634cdfee1bdf7fa53d5817eeef4fa0c6da43edd12de4ca \
+    gomod://golang.org/x/sync;version=v0.22.0;sha256sum=4bc67d258ce7867cfc1a43765c43d98b4c49b90c46dd0b86f896a5a4909fade0 \
+    gomod://golang.org/x/sys;version=v0.46.0;sha256sum=36dc83b6bc5884d260cdbd9d09e597b1eed64d15dfdc374ca6e31aef99d533d7 \
+"
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-licenses.inc b/meta-networking/recipes-support/geoip/geoipupdate-licenses.inc
new file mode 100644
index 0000000000..289be21033
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate-licenses.inc
@@ -0,0 +1,15 @@
+
+# This file has been generated by go-mod-update-modules.bbclass
+#
+# Do not modify it by hand, as the contents will be replaced when
+# running the update-modules task.
+
+LICENSE += "AND BSD-3-Clause AND MIT"
+
+LIC_FILES_CHKSUM += "\
+    file://pkg/mod/github.com/cenkalti/backoff/v5@v5.0.3/LICENSE;md5=1571d94433e3f3aa05267efd4dbea68b;spdx=MIT \
+    file://pkg/mod/github.com/gofrs/flock@v0.13.0/LICENSE;md5=f852ccc601f58d934aff3a71b042ba08;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/spf13/pflag@v1.0.10/LICENSE;md5=1e8b7dc8b906737639131047a590f21d;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.22.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.46.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+"
diff --git a/meta-networking/recipes-support/geoip/geoipupdate/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate/GeoIP.conf
new file mode 100644
index 0000000000..e302ad6700
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate/GeoIP.conf
@@ -0,0 +1,12 @@
+# GeoIP.conf for geoipupdate 4.x and later. It only downloads GeoIP2 and
+# GeoLite2 (.mmdb) databases, the legacy GeoIP (.dat) ones are not available.
+# See https://dev.maxmind.com/geoip/updating-databases for the format.
+
+# The following AccountID and LicenseKey are required placeholders:
+AccountID 999999
+LicenseKey 000000000000
+
+# Enter the edition IDs of the databases you would like to update.
+EditionIDs GeoLite2-Country GeoLite2-City
+
+DatabaseDirectory /usr/share/GeoIP
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate/geoipupdate.cron
similarity index 59%
rename from meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate/geoipupdate.cron
index 40597a856e..1bf6e58e2f 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron
+++ b/meta-networking/recipes-support/geoip/geoipupdate/geoipupdate.cron
@@ -1,5 +1,5 @@
 # top of crontab
 MAILTO=your@email.com
 
-32 11 * * 4 /usr/local/bin/geoipupdate
+32 11 * * 4 root /usr/bin/geoipupdate
 # end of crontab
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
deleted file mode 100644
index 57441765c2..0000000000
--- a/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Crontab entry to provide weekly updates of the GeoIP free databases."
-DESCRIPTION = "update databases for GeoIP"
-
-HOMEPAGE = "http://dev.maxmind.com/geoip/"
-SECTION = "net"
-
-DEPENDS = "zlib curl"
-
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v3.1.1/geoipupdate-3.1.1.tar.gz \
-           file://GeoIP.conf \
-           file://geoipupdate.cron \
-          "
-SRC_URI[sha256sum] = "3de22e3fe3282024288a00807bbea9a1ffa2d1e8fe9c611f4b14a5b4d8ebe08a"
-
-UPSTREAM_CHECK_URI = "https://github.com/maxmind/geoipupdate/tags"
-UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-
-LICENSE = "GPL-2.0-only"
-
-LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=30029632df335cb696f68ecc2a428987 \
-"
-FILES:${PN} = "/usr/share/GeoIP \
-              /etc/GeoIP.conf \
-             /etc/cron.d/geoipupdate.cron \
-             /usr/bin/geoipupdate \
-"
-inherit autotools
-
-do_install:append() {
-    install -d ${D}/${sysconfdir}
-    install -d ${D}/${sysconfdir}/cron.d
-    install ${UNPACKDIR}/GeoIP.conf ${D}/${sysconfdir}/
-    install ${UNPACKDIR}/geoipupdate.cron ${D}/${sysconfdir}/cron.d/
-}
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_8.0.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_8.0.0.bb
new file mode 100644
index 0000000000..01d99119ef
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoipupdate_8.0.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Crontab entry to provide weekly updates of the GeoIP free databases."
+DESCRIPTION = "update databases for GeoIP"
+
+HOMEPAGE = "http://dev.maxmind.com/geoip/"
+SECTION = "net"
+
+LICENSE = "(Apache-2.0 OR MIT)"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE-APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
+                    file://src/${GO_IMPORT}/LICENSE-MIT;md5=995598bc9de2b4c987c2cb87fc24f341"
+require ${BPN}-licenses.inc
+
+SRC_URI = "git://github.com/maxmind/geoipupdate.git;protocol=https;branch=main;tag=v${PV};destsuffix=${GO_SRCURI_DESTSUFFIX} \
+           file://GeoIP.conf \
+           file://geoipupdate.cron \
+           "
+SRCREV = "07618e0e7cacbe7aaebbc26cafb54c2a9f2f3bc3"
+require ${BPN}-go-mods.inc
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+GO_IMPORT = "github.com/maxmind/geoipupdate/v8"
+GO_INSTALL = "${GO_IMPORT}/cmd/geoipupdate"
+GO_LINKSHARED = ""
+GO_EXTRA_LDFLAGS = "-X main.version=${PV} \
+                    -X main.defaultConfigFile=${sysconfdir}/GeoIP.conf \
+                    -X main.defaultDatabaseDirectory=${datadir}/GeoIP"
+
+inherit go-mod go-mod-update-modules
+
+do_install:append() {
+    install -d ${D}${sysconfdir}/cron.d
+    install -m 0644 ${UNPACKDIR}/GeoIP.conf ${D}${sysconfdir}/
+    install -m 0644 ${UNPACKDIR}/geoipupdate.cron ${D}${sysconfdir}/cron.d/
+    install -d ${D}${datadir}/GeoIP
+    # release and docker helper scripts would pull bash and perl into ${PN}-dev
+    rm -rf ${D}${libdir}/go/src/${GO_IMPORT}/dev-bin ${D}${libdir}/go/src/${GO_IMPORT}/docker
+}
+
+FILES:${PN} += "${datadir}/GeoIP"
