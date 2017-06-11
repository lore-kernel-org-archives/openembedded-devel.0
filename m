Return-Path: <tom.rini@gmail.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC947803F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 15:05:59 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id 202so22856836ybd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 08:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=clK0On/Uk/1ZYSSpU6uk8aTIjHsy1GNseObLF23E3sw=;
	b=rgQG4rL2oMAxsTtbZhPhJzRxmhBH08dtCjfsHn4auZacoJhFwi542de3HgPJ93J40K
	Mq/Dld5lyA9WekRyAhYrmf69iLi65nQHbdZNouJZ/NGPyFu0WXHAXVLTZTSj6UBvl+YT
	2lMTbNH3axZX5FhElBjUD6LJyYkoKRMzT+uB2DuZTKIyzEfagehONJdkdMJKVUVdAVPC
	WeipVY3SQ3baRv8gx8u4mjL4hKvhdauO4qycMEUAhZs98zzXA2JUbBOKsHOCK1mm3fq8
	xwtBVfAjLdhXOssbvQGg0mHnP/kM3nEYziLQ/CJklBhoMdk/xcbmsqMV/C0sopjKZj3H
	upQQ==
X-Gm-Message-State: AODbwcChTglSbsxebHnZvnqVbZ/itSm6dYyGQQtS+vDYc05jsMB2pPYQ
	zIFhKbJje91GBgg1
X-Received: by 10.37.174.65 with SMTP id g1mr21929554ybe.137.1497193561092;
	Sun, 11 Jun 2017 08:06:01 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	b187sm2818097ywd.2.2017.06.11.08.06.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 08:06:00 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 11:06:16 -0400
Message-Id: <1497193576-3774-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1497193576-3774-1-git-send-email-trini@konsulko.com>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
Subject: [meta-oe][PATCH 2/2] debsums: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 15:06:00 -0000

A tool for verification of installed package files against MD5 checksums
debsums can verify the integrity of installed package files against MD5
checksums installed by the package, or generated from a .deb archive.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta-oe/recipes-support/debsums/debsums_2.2.2.bb | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/debsums/debsums_2.2.2.bb

diff --git a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
new file mode 100644
index 000000000000..9713ae22784e
--- /dev/null
+++ b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Miscellaneous utilities specific to Debian"
+DESCRIPTION = "A tool for verification of installed package files against \
+MD5 checksums debsums can verify the integrity of installed package files \
+against MD5 checksums installed by the package, or generated from a .deb \
+archive."
+
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=770d751553e6559e9eaefd2e11ccf7e9"
+
+SUMMARY_${PN}-cron = "Cron scripts to control automatic prelinking"
+DESCRIPTION_${PN}-cron = "Cron scripts to control automatic checking."
+FILES_${PN}-cron = "${sysconfdir}/cron.*"
+
+PACKAGES =+ "${PN}-cron"
+
+SRC_URI = "http://snapshot.debian.org/archive/debian/20170530T212108Z/pool/main/d/debsums/debsums_2.2.2.tar.xz"
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
+
+SRC_URI[md5sum] = "82b0710855a7e5212d4358163a269e79"
+SRC_URI[sha256sum] = "aa61896f93a6bbfe0161c21dcd67529ae8e1ec8c3ccf244523c52c4ad8253d97"
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
+do_install() {
+	install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron.weekly
+	install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${bindir}
+	install -d ${D}${mandir}/man1 ${D}${mandir}/man8
+	install -m 0755 debsums ${D}${bindir}/
+	install -m 0755 rdebsums ${D}${bindir}/
+	install -m 0755 debsums_init ${D}${sbindir}
+	install -m 0644 man/debsums.1 ${D}${mandir}/man1/
+	install -m 0644 man/rdebsums.1 ${D}${mandir}/man1/
+	install -m 0644 man/debsums_init.8 ${D}${mandir}/man8/
+	install -m 0644 debian/cron.daily \
+		${D}/${sysconfdir}/cron.daily/debsums
+	install -m 0644 debian/cron.weekly \
+		${D}/${sysconfdir}/cron.weekly/debsums
+	install -m 0644 debian/cron.monthly \
+		${D}/${sysconfdir}/cron.monthly/debsums
+
+	# Must exist, defaults to empty.
+	touch ${D}/${sysconfdir}/debsums-ignore
+}
-- 
1.9.1


