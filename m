Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.2442.1625965718553893914
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DdUFsh/2;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id f5so14203017pgv.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkiIdcLgcD5YSohdgfNwmcX0ILermn/w0DqldOM8sII=;
        b=DdUFsh/2wouHyDHf+Bt1R/iYSUfY5AqtDH+eZXUztcUitqWJNJFB0exx0wil2VnXGp
         xSHLIidpD0G20dEflx/hRP2RUuvB/DZAnR582rPjh6NgCSe49AdCc/W+uCmFJOwhPZWb
         yFfZq7SHQmSvuxkpakmSVijceUyUcnuWbfKw/NVp7nPrTWSymju0ind8TmNASaEe3d4l
         6zGabU2QJ2bHcN8nCHkjVRhiGmWUuHpWg+1hPmrfnKRmBXCJjncZteTzREM2C2nEuksC
         ewPoDcXLJd4u/OAfdw810eivYl1hrPv0DYB1y5LlaZOU4AXaeCS6FhCbnG0dkeGRzwzT
         8RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkiIdcLgcD5YSohdgfNwmcX0ILermn/w0DqldOM8sII=;
        b=ikv/6w4ZOGHV95EuFqZDdH3CK3toTB3ZvFJv4lmp9JTTkv780/AowkMgpYQDrCkQkb
         hVdynHONZA9sz1/AmVaoFx5+WKjqAnX7Q49D8BioSlu5L3So95iGvd8Ycxh3VzGzxUNM
         HGMsw5tlPEzFvy7b/TKbpd6xfUCAhUUd3jLX6nE5/iL3QqFywFfqtbYrWIdoToa9s9I5
         ne/EYPvl/pZkEfTvyGOyxEaxPJyXoSqIzHTgCMsrL73sDbPeAkWUHDQB/BbqSRskyGRc
         B20s6783oFrIdZCYFVLeZo87/jOsY0FNSoNm2TuqVoDD4+viJL6AK9xkuUYdI0B9Ubc0
         v9Xg==
X-Gm-Message-State: AOAM531sZ4vOvgMlM8deUGhWxKKJ69aiRW3ay+L6VynXnLs34P/A3EvT
	h71b6BsBq6WG74QtKhN5B019NIqjwnufYg==
X-Google-Smtp-Source: ABdhPJyy/gSox9fwOdkvzH7y5rj5lQx2N0ybiqjtbSTRrNugj4EPQC2jlMPLQH/X+9TTxSNj+6+Ylg==
X-Received: by 2002:a63:a545:: with SMTP id r5mr10539717pgu.204.1625965717891;
        Sat, 10 Jul 2021 18:08:37 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:37 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 5/8] libmoo-perl: upgrade 2.004000 -> 2.005004
Date: Sun, 11 Jul 2021 01:08:01 +0000
Message-Id: <1f51ed80b7272d6e60b8506e9aebd7803d761c42.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2.005004 - 2021-03-29
  - fix file set in %INC in create_class_with_roles (RT#134845)

2.005003 - 2021-03-21
  - silence 'once' warnings from Moo::_Utils

2.005_002 - 2021-01-22
  - fix C3 test skipping properly when MRO::Compat not available on perl < 5.10

2.005_001 - 2021-01-20
  - fix perl version check in global destruction code

2.005_000 - 2021-01-20
  - remove MooseX::Types from developer prereqs
  - recommend Sub::Util rather than Sub::Name, since Sub::Util is in core
  - fix line numbers when using oo module (perl -Moo)
  - adjust some author tests to rely less on external modules
  - lower Exporter prereq to any version
  - bump Role::Tiny prereq to 2.003004
  - refactor and simplify role application code, as allowed by new Role::Tiny
    version
  - switch to using normal strict+warnings rather than strictures for authors
  - remove strictures from recommends, as Moo does not use it anywhere
  - remove Task::Weaken prereq, as it served no purpose
  - remove MRO::Compat prereq, using it only when user code does
  - remove use of Devel::GlobalDestruction in code, only using
    Devel::GlobalDestruction::XS when it is available. Devel::GlobalDestruction
    is still a dependency on perl < 5.14 to facilitate the installation of the
    ::XS module.
  - Moo now has no mandatory perl version specific dependencies. The version
    specific modules are now optional or not used. This means code using Moo can
    be fatpacked on a new perl version without special cases, and it will work
    on older perl versions.

2.004004 - 2020-11-25
  - fix error location test when using core Carp on perl 5.8.9 - 5.10.1

2.004003 - 2020-11-21
  - fix extraneous MANIFEST entry

2.004002 - 2020-11-20
  - no changes
  - releasing as stable

2.004_001 - 2020-07-30
  - remove Module::Runtime prerequisite
  - internal code cleanups
  - added test for conflicts in extensions wrapping 'has' and similar subs

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../{libmoo-perl_2.004000.bb => libmoo-perl_2.005004.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.004000.bb => libmoo-perl_2.005004.bb} (91%)

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.004000.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
similarity index 91%
rename from meta-perl/recipes-perl/libmoo/libmoo-perl_2.004000.bb
rename to meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
index dbad74d229..ecc4d87c85 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.004000.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
@@ -10,8 +10,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=0e7ee44f5ce5e9b84619cd198caad1d6"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
-SRC_URI[md5sum] = "e542104553d616b15631b5c66ccee904"
-SRC_URI[sha256sum] = "323240d000394cf38ec42e865b05cb8928f625c82c9391cd2cdc72b33c51b834"
+SRC_URI[sha256sum] = "e3030b80bd554a66f6b3c27fd53b1b5909d12af05c4c11ece9a58f8d1e478928"
 
 S = "${WORKDIR}/Moo-${PV}"
 
-- 
2.30.2

