Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC38C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 18:02:11 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2084.1785520922634981008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 11:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OKGn2NP/;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1276894a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 11:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520922; x=1786125722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYoRlSejPeilmpEikaqDdzz8nPWunohJbcP9NqAYWYk=;
        b=OKGn2NP/KAKETrtHoDHRXNqEDWO8TCaAWlP6XVcA7JEba1V328CFlDMZDctEo5r8aP
         yN6U2RkvFZhc2euM/0A1PEIznG5hdI9kx2XztN2zzgSHF7ub5/TN4ntcT68gZ+wRA3PY
         j93wXwDsl6GZW9lWGMATUowvpRepxdhmKXKM9Hx+2jw5HrMo6FJPx8rtPdQMgOil+xTa
         wdMdPcqTU83fUGvZsjuTucqJDmme9tb+AlBH7cH8th3JUKwZL2Tqrcqddzr5zIQgbjUq
         f6iJqCJZ8wz3JowdujVYiUfiXGccKQY9+oHh5xpCnGoicHK8TdZ9x2tdnZBN9HgKBFO5
         C5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520922; x=1786125722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYoRlSejPeilmpEikaqDdzz8nPWunohJbcP9NqAYWYk=;
        b=BiyZs8DcTE7gdWtwC8u0nTPzksyUfRO3bBk7fJVSaQQSX8ES0t+fbxdIsZgvbJXl+h
         FEtVevB5V41fe76rW6Gix0hFMvmdQNTS1uITa8f8zo9ClYKvihZ29sighxDLKTIeLEN6
         71l22Wtltt/NE+0k+wEuLuKQsFAzCOh5KsNem/g+02wxeM4X4s9NJ16Z8Kbgcktu53kP
         HgoGTnqgtqvDouIRAHEj8zTdfTu12jNcTeufYIIZacMmOUT0V+/N5VGtkjTzCvRQT6AM
         c7lLf2g9lQZ0qb/Mpi6e7vFRPCsra/Sv4ndfB89Wtt3tR3oqrGVZzHRn3ZIyDHuiLg+C
         Pxkw==
X-Gm-Message-State: AOJu0Yw5m+kMx3m5gLTTQLNtfNJI3swpfAGKwVKU/R3vIhWBPo7wLH0k
	cm5XpmRIVYyWudrgOMqmTnqJnkSWDkt9LS5+3tz6xBxC6aIjzaHEc1fhPbV5fA==
X-Gm-Gg: AR+sD13yyIxnryNfrWof4PFMvODwa3TCwMqwCcuYraxKtZOozwhf0ZksUzQuP5FOin3
	Lyzw63lWKJriVKMU5Xfy2v0ARcg7F16RMDgjwf8WKYvTLMHLMjvYgjIHnkKOIZBJ79FztlSUcYo
	aXyRtmnsTubdutDeu06j8BrZa3pcXc6KDxrHuApED6gccoeb00KfSCkSEyhjDBTVbtf4VcE+lGx
	rJiLtGXd6RDnXPqCUKKyLWliuDhyHf52f+rDJFwtaNXIXZFQixNg6CUREomMRZkirPcqJiy2haw
	qVxMkFk8k13lBDakPARAzuVYDabC+gJtbvmw/CSKq+EV9xFRnTTigTVYC0E4uTP3PWVuQgq6x0j
	8J2FQ3WpsV16/UUdM/j0Tz4sNGa3lhJYZnlfmowEBSGWa3WlhFtNPEEIAPOds2NxgcA//Cr23Sy
	/i7ttWTARoDzt1yWpCJA+1OEcAYyAxUuW4RkxwOn1smcOycJGBPUIjdvYGEUe9RYvs2p6ByRblo
	3WmMQ4e38qBCKCTswdEgMk4ImuwJfpX6WLTdV8lJjxv51PyqlJgMEWt1NgcggjWcSJbWbaqTFft
	TiT9NLYBIRskkwAzKIEJeOUYEsNpmQNuE6i/2v/rBMdxYS2r/S134VOj8zO1avyVyVDqJZpMIgs
	8Xw==
X-Received: by 2002:a17:90b:2741:b0:38e:b400:a854 with SMTP id 98e67ed59e1d1-38fbc542730mr724968a91.37.1785520921608;
        Fri, 31 Jul 2026 11:02:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm8047821eec.21.2026.07.31.11.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:02:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 2/2] libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR scrubbing
Date: Fri, 31 Jul 2026 11:01:57 -0700
Message-ID: <20260731180157.1304292-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180157.1304292-1-khem.raj@oss.qualcomm.com>
References: <20260731180157.1304292-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 18:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128587

oe-core 3c2bb7bce1 ("cpan_build: disable .packlist and html doc") moved
--create_packlist=0 into cpan_build.bbclass and disabled html doc
generation there as well. Neither .packlist nor the html docs are
generated anymore, so the do_install:append() hooks that sed'ed TMPDIR out
of them now run find(1) over paths that no longer exist and hand sed an
empty argument list:

  find: '.../image/usr/share/doc/perl/html/site/lib/HTML/': No such file or directory
  sed: no input files
  WARNING: exit code 4 from a shell command.

Remove the now dead hooks.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb   | 7 -------
 .../libmodule/libmodule-build-tiny-perl_0.053.bb           | 7 -------
 2 files changed, 14 deletions(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
index 5b2db6747e..7d224dcad9 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
@@ -25,13 +25,6 @@ export PERL_USE_UNSAFE_INC = "1"
 DEPENDS += "libmodule-build-perl-native \
 "

-do_install:append() {
-  sed -i \
-    -e 's|${TMPDIR}||g' \
-    `find ${D}/usr/share/doc/perl/html/site/lib/HTML/ -type f` \
-    `find ${D}/usr/lib/perl5 -type f -name .packlist`
-}
-
 RPROVIDES:${PN} = " libhtml-element-perl \
     libhtml-tree-assubs-perl \
     libhtml-tree-perl \
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
index 4597c9bbe8..9fc32f3c95 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
@@ -21,13 +21,6 @@ S = "${UNPACKDIR}/Module-Build-Tiny-${PV}"

 inherit cpan_build ptest-perl

-do_install:append() {
-  sed -i \
-    -e 's|${TMPDIR}||g' \
-    `find ${D}/usr/lib/perl5 -type f -name .packlist`
-}
-
-
 RDEPENDS:${PN} += " \
     libextutils-config-perl \
     libextutils-helpers-perl \

