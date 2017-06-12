Return-Path: <tom.rini@gmail.com>
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC0C7825D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 13:52:39 +0000 (UTC)
Received: by mail-yb0-f175.google.com with SMTP id 202so26970227ybd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 06:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bvl+lPuLWj/KlTBdbjl4vuOmD/YPWRMZvb7z39Y+7Ds=;
	b=gRtplkYEDvbrFvurIqIVRDcDhsiedXLsX1H3wiFy2rXDwYcZaFOwN7wISFPm/aAbsO
	GEvlys3+j0riUvXhSVIoogB0fuv0Kn9ZKq5aBnLyh+c4wFWO+zM3jf/wLoJAkrU3DnNe
	5IdWjHIefl39aEEgFS8KlLwdtjT3sdePFaYcymxVDhMa+aEWJEpZC5MUIMFetNJys3N3
	beClQlRfkQeU2teQiOi55Mswj4joCP4AiRwL2VsJURLJKXd3F93Mp+dZtJEKnSpfbosJ
	Pp7oAqORwUDm9L+AHuZHLGbjsp5O51viBrx+9wVS/zKtw8Dq20dkirvs0V2AHdheVGkj
	nWVg==
X-Gm-Message-State: AKS2vOwqfpcww3c3kKS1zUJJj0Cf3xZ2rJZzDBQqYgeSzXxfFXH/EyxV
	jlT93X8GEyT5XDH7
X-Received: by 10.37.87.132 with SMTP id l126mr8521230ybb.125.1497275560880;
	Mon, 12 Jun 2017 06:52:40 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id l1sm938924ywh.75.2017.06.12.06.52.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jun 2017 06:52:40 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jun 2017 09:53:00 -0400
Message-Id: <1497275580-22068-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1497193576-3774-2-git-send-email-trini@konsulko.com>
References: <1497193576-3774-2-git-send-email-trini@konsulko.com>
Subject: [meta-oe][PATCHv2 2/2] debsums: New recipe
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
X-List-Received-Date: Mon, 12 Jun 2017 13:52:40 -0000

A tool for verification of installed package files against MD5 checksums
debsums can verify the integrity of installed package files against MD5
checksums installed by the package, or generated from a .deb archive.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Run oe-stylize.py over, check results and update.  Reword the -cron
  SUMMARY and DESCRIPTION.
---
 meta-oe/recipes-support/debsums/debsums_2.2.2.bb | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/debsums/debsums_2.2.2.bb

diff --git a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
new file mode 100644
index 000000000000..41ebf87b2d98
--- /dev/null
+++ b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Miscellaneous utilities specific to Debian"
+SUMMARY_${PN}-cron = "Cron scripts to control automatic debsum checking"
+DESCRIPTION = "A tool for verification of installed package files against \
+MD5 checksums debsums can verify the integrity of installed package files \
+against MD5 checksums installed by the package, or generated from a .deb \
+archive."
+DESCRIPTION_${PN}-cron = "Cron scripts to control automatic system integrity \
+checking via debsums."
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=770d751553e6559e9eaefd2e11ccf7e9"
+
+SRC_URI = "http://snapshot.debian.org/archive/debian/20170530T212108Z/pool/main/d/debsums/debsums_2.2.2.tar.xz"
+SRC_URI[md5sum] = "82b0710855a7e5212d4358163a269e79"
+SRC_URI[sha256sum] = "aa61896f93a6bbfe0161c21dcd67529ae8e1ec8c3ccf244523c52c4ad8253d97"
+
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
+
+do_install() {
+        install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron.weekly
+        install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${bindir}
+        install -d ${D}${mandir}/man1 ${D}${mandir}/man8
+        install -m 0755 debsums ${D}${bindir}/
+        install -m 0755 rdebsums ${D}${bindir}/
+        install -m 0755 debsums_init ${D}${sbindir}
+        install -m 0644 man/debsums.1 ${D}${mandir}/man1/
+        install -m 0644 man/rdebsums.1 ${D}${mandir}/man1/
+        install -m 0644 man/debsums_init.8 ${D}${mandir}/man8/
+        install -m 0644 debian/cron.daily \
+                ${D}/${sysconfdir}/cron.daily/debsums
+        install -m 0644 debian/cron.weekly \
+                ${D}/${sysconfdir}/cron.weekly/debsums
+        install -m 0644 debian/cron.monthly \
+                ${D}/${sysconfdir}/cron.monthly/debsums
+        # Must exist, defaults to empty.
+        touch ${D}/${sysconfdir}/debsums-ignore
+}
+
+PACKAGES =+ "${PN}-cron"
+
+RDEPENDS_${PN} = "dpkg dpkg-perl libfile-fnmatch-perl perl \
+                  perl-module-constant perl-module-digest-md5 \
+                  perl-module-errno perl-module-fcntl \
+                  perl-module-file-basename perl-module-file-copy \
+                  perl-module-file-find perl-module-file-glob \
+                  perl-module-file-path perl-module-file-spec \
+                  perl-module-file-temp perl-module-getopt-long \
+                  perl-module-posix"
+
+FILES_${PN}-cron = "${sysconfdir}/cron.*"
-- 
1.9.1


