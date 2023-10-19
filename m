Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9951BCDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 01:14:06 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.17319.1697678041361742291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 18:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bpjmRxRJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3b2e72fe47fso905227b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 18:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697678040; x=1698282840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u44o7O6PFkclikdk4JrpFoYXzZfr4hbTtvyN3uB4M0=;
        b=bpjmRxRJvIFha46jl1L1PopAIUnjNcBIhUsuKzX1F6ykXKPrwJj6X6uLTzrc6IFtqJ
         ob9SWxED64JTbH8c3ABbqe3RiUATB8m1AwWXd81EiqvfAyTB/77ZLY4TzG/gC7ftRVtN
         nZ9nJhVtg/nEZoFgBHhXqQqV4CA8x9GB0MReKyqnLsF9pqj9BN9It3hQ9kdJHY/QzEHD
         uQM1HQVL3JP2qXKcntz/jDSXv1pZ2TIX5HwK7BZU2yCvN3WWlYuvzHLxJEhUhhtAZ/Nw
         IVOaorBsd2HrS1C8+axyuiE3Eku9kyVilrFJHmTd34IukUbU+xYUNa9MEqfY0TJs+tY5
         Qa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697678040; x=1698282840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u44o7O6PFkclikdk4JrpFoYXzZfr4hbTtvyN3uB4M0=;
        b=bopw0vDWdqgJXUXbjw44b7Ja6lnLnquZIDV4t9VIpV1aJnQJiFmuhj5326xip+ApYl
         mY8o/i34Azu/aU2SfOkqh2uqlCGW0U6BGm27xGkp0a+iui3b1EjHsSH0skbIIBKkgxiR
         9eAX4rUOoRP6i6XR4BegNUXzzwoS9UrTwDT8XZ+4sbz22JpaKquXxhaFk+8rjYQYBtjp
         YqjeYQ67YRiYtBKl5UTgJl6XM3spywh53yA5Xx7g5pgMSdMRWhl3+BaiGyg9eUZxZHKK
         DO7PspF1SzItvQF/fEDHnDuUwF1K7FunZ81PnyGAvF3n0R/NyScyEtAPDw9j/uqbvT/2
         XURQ==
X-Gm-Message-State: AOJu0YwciReTa1i/iCqbDRnfqorwZweZjpuY6l3hyZuQ3qW9/7rbOx72
	B0jksAnCJbewLUE5jSzLgAj9mj3mFRVSRg==
X-Google-Smtp-Source: AGHT+IFukHchCOSlRIjVEvloDRFpCUp7mupMaJPU5Mz0KYAls1Y7HvfHmlkoGCH8iblkzHujLY0HTw==
X-Received: by 2002:a05:6808:16a9:b0:3b2:ec6d:e17e with SMTP id bb41-20020a05680816a900b003b2ec6de17emr1017233oib.9.1697678040325;
        Wed, 18 Oct 2023 18:14:00 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:c05e:ad13:fda7:c7ef])
        by smtp.gmail.com with ESMTPSA id k125-20020a632483000000b005742092c211sm2287315pgk.64.2023.10.18.18.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 18:13:59 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-oe][PATCH 2/2] debsums: remove old recipe
Date: Wed, 18 Oct 2023 18:13:27 -0700
Message-Id: <20231019011326.3535316-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019011326.3535316-1-ticotimo@gmail.com>
References: <20231019011326.3535316-1-ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 01:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105587

The debsums recipe has not been substantially touched since 2020
when it was moved to dynamic-layers.

In meta-openembedded ecosystem, it is the only known recipe that
depends on po4a, which is being removed in a separate commit.

According to the layerindex, no known recipes depend on debsums:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Adebsums

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../packagegroup-meta-oe.bbappend             |  2 +-
 .../recipes-support/debsums/debsums_2.2.2.bb  | 56 -------------------
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 8cb8d22a2..5c48fd5c0 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1 +1 @@
-RDEPENDS:packagegroup-meta-oe-support += "debsums rasdaemon"
+RDEPENDS:packagegroup-meta-oe-support += "rasdaemon"
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb
deleted file mode 100644
index 252db1994..000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "Miscellaneous utilities specific to Debian"
-SUMMARY:${PN}-cron = "Cron scripts to control automatic debsum checking"
-DESCRIPTION = "A tool for verification of installed package files against \
-MD5 checksums debsums can verify the integrity of installed package files \
-against MD5 checksums installed by the package, or generated from a .deb \
-archive."
-DESCRIPTION:${PN}-cron = "Cron scripts to control automatic system integrity \
-checking via debsums."
-SECTION = "base"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=770d751553e6559e9eaefd2e11ccf7e9"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20170530T212108Z/pool/main/d/debsums/debsums_2.2.2.tar.xz"
-SRC_URI[md5sum] = "82b0710855a7e5212d4358163a269e79"
-SRC_URI[sha256sum] = "aa61896f93a6bbfe0161c21dcd67529ae8e1ec8c3ccf244523c52c4ad8253d97"
-
-# the package is taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
-
-inherit perlnative gettext
-
-DEPENDS += "po4a-native"
-
-do_install() {
-        install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron.weekly
-        install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${bindir}
-        install -d ${D}${mandir}/man1 ${D}${mandir}/man8
-        install -m 0755 debsums ${D}${bindir}/
-        install -m 0755 rdebsums ${D}${bindir}/
-        install -m 0755 debsums_init ${D}${sbindir}
-        install -m 0644 man/debsums.1 ${D}${mandir}/man1/
-        install -m 0644 man/rdebsums.1 ${D}${mandir}/man1/
-        install -m 0644 man/debsums_init.8 ${D}${mandir}/man8/
-        install -m 0644 debian/cron.daily \
-                ${D}/${sysconfdir}/cron.daily/debsums
-        install -m 0644 debian/cron.weekly \
-                ${D}/${sysconfdir}/cron.weekly/debsums
-        install -m 0644 debian/cron.monthly \
-                ${D}/${sysconfdir}/cron.monthly/debsums
-        # Must exist, defaults to empty.
-        touch ${D}/${sysconfdir}/debsums-ignore
-}
-
-PACKAGES =+ "${PN}-cron"
-
-RDEPENDS:${PN} = "dpkg dpkg-perl libfile-fnmatch-perl perl \
-                  perl-module-constant perl-module-digest-md5 \
-                  perl-module-errno perl-module-fcntl \
-                  perl-module-file-basename perl-module-file-copy \
-                  perl-module-file-find perl-module-file-glob \
-                  perl-module-file-path perl-module-file-spec \
-                  perl-module-file-temp perl-module-getopt-long \
-                  perl-module-posix"
-
-FILES:${PN}-cron = "${sysconfdir}/cron.*"
-- 
2.34.1


