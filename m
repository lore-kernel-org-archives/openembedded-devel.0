Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47887.1795411114912933702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QpKwuDXX;
 spf=pass (domain: mvista.com, ip: 74.125.82.178, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869b68caecso3573132eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795411114; x=1796015914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ltNlhqo4D7xFzUaBPIuHGzaOO4dXxh5E7S++U27OHI=;
        b=QpKwuDXXEmRqFpAyTXbrDqzkxxDN0A/QnQCmX5Un4Pqz1HOjUM//4JSvPuy+c9PzV/
         OlIkPIRFHEsz0NVAg9r4jF5FAsQ7HvvpDFKzrxcCJqfzlt3kW9UjGZbGrnRYo5qBlDtr
         /kua7bMmcAENVTgPvWa3XHpAl8gtBd8J33tj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411114; x=1796015914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ltNlhqo4D7xFzUaBPIuHGzaOO4dXxh5E7S++U27OHI=;
        b=WmeWlzCB/CWxKeBdN/rn0vh3Dok1V+SbUhNMOT/AJrBeX79FSygUgfjNwQhRw/H3QH
         /RB20D94VnT2j8uAjWrpehZ0WKadHBQxNdHVQLOhfJn0jyaq5aPuDF+mibEP4xcSiYC3
         ldHWnEEtLiX4txzfoo/JfxeMqiob+se72oqLAcGcRRVZ20h5DQKC6vF1jZyeP4CH+Nkz
         ofwUlpWkdTMur++M4/rskJX+A1tzxqoicXouug5L2Xu2zLTvqCFnaC7OnvpbTqY8q51/
         jDCMDoDRtSKCHOVJ4F0wM6fV0xfz0MBoXcLRQCnE8vkrjpeGkOxBqoi/lFbeXVuLjMr9
         4z2g==
X-Gm-Message-State: APuU4Z/v64Yv2k96BHgckrkW+B6ZtTdg1Bi2HHyanuDXHnpCYq83y5dV
	gtcsDwk/ceqwUkc1qnGUsTeyLAYk7TQJVdii2o9sUrQd0zkRiy6E9CvPGAWgECqb8JWIEWhNvzd
	yzmuZ5kc=
X-Gm-Gg: AZFdTZedTyJG1eKPIXxC3L5t1bg6JdiHkxNquklE26Jqwl6cQy+xzy0aDa+SAXmCqXt
	bXxu+qzqknrC0pM+zzxBj8d2Oj4Jt5XwU56HfWvgWR/GZfVoriE4aKyHnYiAn5PXYsL2rXcnPNR
	qXZclylQKJUctBZqrwUHCs2Sq/j1Qj+pdn4akyrkPrxv4moWT+d44MEVAQVFKiUREMQA8mNUDGX
	I9n78ncGFMR/eigqdB9VRTrb7pWX0hAzD0MIZ8PhE8OyzwSrUTyMmRHaVWjucm0cDKk2UFT//x2
	QGGC9ZWlCrnsM0+mFJ6Hjcm+U9FxaEICN0XCPd5brS11GS1a5dt/lKqt91/36cV4qVBAjWkX2SF
	Eg5+awUFnobzQK6rpCkNScCFc/1Ns6cw+nfB6L5y0LI7zD/Zi1Y6afnEEO+dfGkyDEG2w25XGA2
	gOiS4gpv+Cqa21t5xt+yGR763Pt5xrBWLRNr2uZmZUqpbrZqtmqKybyskKHvyi/IOoQ5pWMODB0
	xhSccd45xxkD2GGroBOFfxwRRT0JtZXNfDX+FmvZHwj5aOuNwzN83tMUWsoEFOh0Np+zAU/N9kL
	JZ0HNjr7FL9efoxG63iEKxJ1m97RloHoZj2nqkjw
X-Received: by 2002:a05:693c:8102:b0:386:b621:d8e1 with SMTP id 5a478bee46e88-386b621db3fmr783904eec.24.1795411113958;
        Sun, 22 Nov 2026 21:18:33 -0800 (PST)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([43.249.234.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm54709673eec.3.2026.11.22.21.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:18:33 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] libdbi-perl: fix for CVE-2026-88815
Date: Mon, 23 Nov 2026 10:48:20 +0530
Message-ID: <20261123051821.43934-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132786
Content-Type: text/plain; charset="utf-8"

Pick the patch from [1], also referenced in the Debian report [2].

[1] https://github.com/perl5-dbi/dbi/commit/e5ad87e5602da995d28b4d65df222368b58d6702
[2] https://security-tracker.debian.org/tracker/CVE-2026-88815

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../perl/libdbi-perl/CVE-2026-88815.patch     | 68 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815.patch
new file mode 100644
index 0000000000..b1e5c7bfbe
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815.patch
@@ -0,0 +1,68 @@
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Thu, 10 Sep 2026 10:38:30 +0200
+Subject: Fix DBI::sql_type_cast on IV/NV (reported by Raj)
+
+Origin: https://github.com/perl5-dbi/dbi/commit/e5ad87e5602da995d28b4d65df222368b58d6702
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-88815
+
+Backport Changes:
+
+The changes to ChangeLog, dbixs_rev.h, and lib/DBI/Changes.pm have been
+omitted because they are not applicable to our current version.
+Therefore, these files are not included in this patch.
+
+CVE: CVE-2026-88815
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/e5ad87e5602da995d28b4d65df222368b58d6702]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ DBI.xs              |  4 +++-
+ t/90sql_type_cast.t | 17 +++++++++++++++++
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 4b4f66c..53889f0 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -1977,8 +1977,10 @@ sql_type_cast_svpv(pTHX_ SV *sv, int sql_type, U32 flags, void *v)
+     /* else no error and sv is untouched */
+     case SQL_NUMERIC:
+         /* based on the code in perl's toke.c */
++        STRLEN len;
++        char *p = SvPV(sv, len); /* force stringify, handle magic */
+         uv = 0;
+-        grok_flags = grok_number(SvPVX(sv), SvCUR(sv), &uv);
++        grok_flags = grok_number(p, len, &uv);
+         cast_ok = 1;
+         if (grok_flags == IS_NUMBER_IN_UV) { /* +ve int */
+             if (uv <= IV_MAX)   /* prefer IV over UV */
+diff --git a/t/90sql_type_cast.t b/t/90sql_type_cast.t
+index f5510e8..347df8b 100644
+--- a/t/90sql_type_cast.t
++++ b/t/90sql_type_cast.t
+@@ -44,6 +44,23 @@ my @tests = (
+      0, NO_CAST_NO_STRICT, q{["aa"]}],
+     ['non numeric cast to numeric (strict)', 'aa', SQL_NUMERIC,
+      DBIstcf_STRICT, NO_CAST_STRICT, q{["aa"]}],
++
++    # CVE-2026-88815
++    ['invalid sql type',
++     99,           123456789,   0,               INVALID_TYPE,      q{[99]}],
++    ['small int cast to int',
++     99,           SQL_INTEGER, 0,               CAST_OK,           q{[99]}],
++    ['2 byte max signed int cast to int',
++     32767,        SQL_INTEGER, 0,               CAST_OK,           q{[32767]}],
++    ['2 byte max unsigned int cast to int',
++     65535,        SQL_INTEGER, 0,               CAST_OK,           q{[65535]}],
++    ['4 byte max signed int cast to int',
++     2147483647,   SQL_INTEGER, 0,               CAST_OK,           q{[2147483647]}],
++    ['4 byte max unsigned int cast to int',
++     4294967295,   SQL_INTEGER, 0,               CAST_OK,           q{[4294967295]}],
++    ['small int cast to int (discard)',
++     99,           SQL_INTEGER, DBIstcf_DISCARD_STRING,
++                                                 CAST_OK,           q{[99]}],
+    );
+ 
+ if (!$pp) {
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 7e3d1a0161..5328d6b8bd 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2026-14380_p4.patch \
            file://CVE-2026-14739.patch \
            file://CVE-2026-14740.patch \
+           file://CVE-2026-88815.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
-- 
2.50.1

