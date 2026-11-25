Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37953.1795594117784581429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=P/YpiMhY;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11737491eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594117; x=1796198917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mwr2eWaCmmc+l17XF3V5l28tW8oZ+FUcjc+nAwY020c=;
        b=P/YpiMhYpJuBUgSM/k0Bs2c0NProhTXUhQ3pXNJJVyvBcmpClPmxRqpB6H5nzRqUAH
         jTDM8i1FNu8ngD3SzyEWmRt/UyQFVP2/tIctqThHoO9flwwNEk6Ya6UqhMQSncLDn1ki
         +XSO+7q8MNo/3SdJQbQeEejL3nL2wT4Loy08/RK9sHQrnccCuDv0yOj+xwy3gne1RZ8k
         Y+IQdICGmm+LOAl9Dy8hXnHjxV30bKmEM9CN/KBzCrlmf/RyDMIwlRrQUpRQNMsisllk
         ZiTIK04a7w+Oo85c8aKlL3/wcT+6quXQVtRiksUwiNotZ0c5Y+bmgUjaAiF8AVM08dPP
         kLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594117; x=1796198917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mwr2eWaCmmc+l17XF3V5l28tW8oZ+FUcjc+nAwY020c=;
        b=GUPUH3nGj4h6OGTxikv23SKfah02eUMJhufcFHxrXuzWwbZDX/zNEBkAusYxItPHgV
         9omWNmp8yZw2GswYnul+0K55NAB3HpzATnWZF+ZWGoyNovW1+UnHBQXq1vRHcjTeHGSs
         f0qOaHG6sUhKkVERrvL6TcYRmF+06qWC611czJqvdKMj7o/dDxgoEXvHICj8F6AWNHwY
         /gOduWPaOIga2RBLmrGo55WdEUSDuVXCpsFQ50VU1urxRG/5GypxTzJZsTKH6ehOGmYJ
         wHRK4sCOPvbIP15gzixDrpyNJB/215dHFvPXPxT3kZRuBjKfhe1cWg4G/3HTIQqfdHpI
         WNjg==
X-Gm-Message-State: APuU4Z8/p//KThvF6+F2NYQ5Z352VyinOCt/cOCnipXaU8PnRmVM7KYW
	7fevU3yui3VNj0kpQo1KBR8/VlK3C8o/7fjlQWpA01hwWtwCt1LhuSMf0GPMqj/Z
X-Gm-Gg: AZFdTZcRaBuDmOEe+oMv42PYxSpeuvT4s/oYwqFhcZSsWR5IGvkklwau8Jio5rPQecf
	w+YsBaKVd0h3F4PnS4IpcMaUbh4SqzaKm/0JP4RGCeIfc96DdF0QpGK7lY9eEWhHXo5sf1nKrTX
	tvC+VGmRqPU+EWH/7eecOo5NfZdMuf8a2Ilb7swCjpvKbtf3pEd0mlpflkvlhn/+tSJq8zrl5UB
	LGWVnjrCJdLSnKyVTvv63bPu3e4j349Mfg3MLVOAWdPuaiOE24j2p8scgn5YtC7YewV9H66v60s
	xi4iKDA4RJt//UfbL1gdhpi0eBsK7P4ahPjm1uCpHjzs8PtaO5HhySSfo+Zs8Gb5H13KrbXGrwn
	jF9mDUg6V4l6iblJ2j8nCtZb6iKxJnVkJj1T5LE6wLPNj6zWFizlmNembOw72mIETGf8kc+MW8w
	yzfBLSNRAQdgQ0pjAQKqJBQ61bo3wqf6t77H80nxgSYQj0IqQUm213t7Sq3p+Z1Mo2iYF0qrjHC
	PT93erLGCD5MachYsO/JsoCuO+qGzk3LHLaVRKKR6emK9PiqwpkyJcEy0Vx9oDsLy1d+uURSeun
	jI09y3rIM3VOARiwMAYwNzAihfihUBIY5OQdXv0ZL4xkz+qocb3/LnYnhQ/ROFPPBBDOydXp6IG
	u7fbBfq/tIkQx/cF+rUmLhv24oDv6ADKyuqpi1BuyH76baOPuQp8QUvaBbtvDl/Gamuc6vRtrQj
	mNWPt52ZSbHV+FxCSavCBPwkx4Hq+Fcu8c+7O/t2QdwzQMXKv6K57eXIVq4QXwkx5SwMp1MRS35
	rYLTiwazcWnHKDD6dgb2JW3KFqubUIiKQHNQ+WpWfMGXUWPGOe4Zz6UtnI6Ec5L74kCZ/B+Ingu
	I1CG
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-38570f27b33mr17848699eec.29.1795594117042;
        Wed, 25 Nov 2026 00:08:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 44/55] psutils: upgrade 2.10 -> 3.3.17
Date: Wed, 25 Nov 2026 00:07:00 -0800
Message-ID: <20261125080732.2419614-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133047
Content-Type: text/plain; charset="utf-8"

PSUtils 3 is a rewrite in Python that adds PDF support to the same
commands (psbook, psnup, pstops, psselect, psresize, epsffit,
extractres, includeres, psjoin). Later 3.x releases improve paper size
detection from PostScript files, accept psnup page specs without
--specs again, and fix psresize --height.

The recipe is rewritten from autotools/perl to a setuptools PEP 517
build. It now needs python3-puremagic, python3-pypdf and
python3-argparse-manpage (for the man pages generated in setup.py)
from meta-python, so it moves to meta-oe's meta-python dynamic layer.
setup.py and the commands run 'paper', so libpaper-native stays a build
dependency and libpaper becomes a runtime one. perl is no longer
needed at runtime.

setup.py runs 'paper', which needs a default paper size and cannot find
the paperspecs file of a relocated libpaper-native, so set PAPERSIZE and
XDG_CONFIG_HOME for the build.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/psutils/psutils_3.3.17.bb | 37 +++++++++++++++++++
 .../recipes-support/psutils/psutils_2.10.bb   | 27 --------------
 2 files changed, 37 insertions(+), 27 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-support/psutils/psutils_3.3.17.bb
 delete mode 100644 meta-oe/recipes-support/psutils/psutils_2.10.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/psutils/psutils_3.3.17.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/psutils/psutils_3.3.17.bb
new file mode 100644
index 0000000000..93b7d2d729
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/psutils/psutils_3.3.17.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Utilities for manipulating PDF and PostScript documents"
+DESCRIPTION = "PSUtils is a collection of utilities for manipulating PDF \
+and PostScript documents: page selection and rearrangement, arrangement \
+into signatures for booklet printing, and page merging for n-up printing."
+HOMEPAGE = "https://github.com/rrthomas/psutils"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=87212b5f1ae096371049a12f80034f32"
+
+SRC_URI = "https://github.com/rrthomas/psutils/releases/download/v${PV}/psutils-${PV}.tar.gz"
+SRC_URI[sha256sum] = "3ff76cc9f9fb535ec553d1591de56d6dbaa0d9f4df86778f6a49731ebd764cdf"
+
+UPSTREAM_CHECK_URI = "https://github.com/rrthomas/psutils/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
+inherit python_setuptools_build_meta
+
+# setup.py generates the man pages from the argparse parsers and runs 'paper'
+DEPENDS += " \
+    libpaper-native \
+    python3-argparse-manpage-native \
+    python3-puremagic-native \
+    python3-pypdf-native \
+"
+
+# setup.py runs 'paper', which needs a default size and finds no paperspecs in a relocated sysroot
+export PAPERSIZE = "a4"
+export XDG_CONFIG_HOME = "${STAGING_ETCDIR_NATIVE}"
+
+RDEPENDS:${PN} += " \
+    libpaper \
+    python3-core \
+    python3-io \
+    python3-puremagic \
+    python3-pypdf \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/psutils/psutils_2.10.bb b/meta-oe/recipes-support/psutils/psutils_2.10.bb
deleted file mode 100644
index bfb5cbe75b..0000000000
--- a/meta-oe/recipes-support/psutils/psutils_2.10.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=87212b5f1ae096371049a12f80034f32"
-
-SRC_URI = "https://github.com/rrthomas/psutils/releases/download/v${PV}/psutils-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6f8339fd5322df5c782bfb355d9f89e513353220fca0700a5a28775404d7e98b"
-
-UPSTREAM_CHECK_URI = "https://github.com/rrthomas/psutils/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-
-inherit perlnative autotools
-
-export PERL = "/usr/bin/env perl"
-
-DEPENDS += "libpaper-native"
-
-do_install:append() {
-    sed -i -e 's|${STAGING_BINDIR_NATIVE}/perl-native/|/usr/bin/env |g' ${D}${bindir}/pstops
-    for f in psbook psresize psnup psselect; do
-        grep -v '${B}' ${D}${bindir}/$f > ${D}${bindir}/$f.temp
-        install -m 0755 ${D}${bindir}/$f.temp ${D}${bindir}/$f
-        rm -f ${D}${bindir}/$f.temp
-    done
-}
-
-BBCLASSEXTEND += "native"
-# /usr/bin/pstops contained in package psutils requires perl
-RDEPENDS:${PN} += "perl"
