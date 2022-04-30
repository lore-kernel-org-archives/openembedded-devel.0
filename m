Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14575C43217
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:11 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.26122.1651346348959495560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FxE8FUZ4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id r9so9682179pjo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ep8ldPoZAfOkDOVOKsDe98vCqWBMfJZB08kEHyt8x00=;
        b=FxE8FUZ4kGA4/dAijs7RPS1THHAc0gbOKDe0nabSHSFl0LvmlXdRdbOtCZi1ZMki9Z
         lwjiGc89NuyadEV35VpyG6Q4ex+D21h7c3+dVCHUJ/ShgI4CHXabmxX994m3Pzqewxhx
         k6wVkYMIIjR3HarEkOm9nBXY36gqqStTIWWDr1O1xHiJlsRUETk6AB9hbVWD6H/0wY2+
         2PufLy/KFDbtmbqht1uEUhyUg/O2nkCSCN5QGI4bM2Zy8Ga/bhSvBfBetfhb9nB6Lxux
         5CMegWnAqDipeXP+AELFys+gnYRHBGXpqrPA8ntP5eK3LXu6Wyg9zHl7JcSHEtBlPU9c
         coQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ep8ldPoZAfOkDOVOKsDe98vCqWBMfJZB08kEHyt8x00=;
        b=EqI7JwRsPpmei6HrhNv3dhw01BgJTuIjEiAclmgRxukdIwgPa0g3UDB38l7qOzOFCU
         SCoseTslxtijmw8GTJgigk2cevm0YMp+PK8w2qO1H03zrQm/iJKDisdcAN2kwc2y9+0q
         udHyUbFtEP32Xz8N0+BXkDbn9V2cr0+9VfgIOdKSF3+dOvb+n1+/FDH1CBaUXF+N6744
         yUlMS5unO1GMqB+9ykKdYTha6ioQTdEl7NUe2gbjG266ySvZH34BtXsEeoOPqUPPNtlG
         EJLKBgJNadhpXXTOhXTHPwOX8wMnvONtLjGk6pUafTCv+zEsmpdYdk1zradV3mVryLYf
         8Tvg==
X-Gm-Message-State: AOAM530x9PC9yL7hcRS+QYgbdYMQaQvTIQYxsW89lmqnplTDKexaWlIy
	bK24edkeG5NU+NKBNYNfRZRBwyUjt9Pafw==
X-Google-Smtp-Source: 
 ABdhPJzihcqb3M6TudrhjmWpPsUeTqK5F7mZKocBa9h1VaUhk4SZQYzbSuAMZUrY5IGLZL7NZD7N7A==
X-Received: by 2002:a17:90a:db08:b0:1c9:7cf3:6363 with SMTP id
 g8-20020a17090adb0800b001c97cf36363mr5417001pjv.35.1651346348151;
        Sat, 30 Apr 2022 12:19:08 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 27/39] libtest-harness-perl: upgrade 3.42 -> 3.44
Date: Sat, 30 Apr 2022 12:18:07 -0700
Message-Id: 
 <44cce2e1b932d0628f9370876357db129b730dd6.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96894

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
 - Fix skipping SEGV test
 - Fix failing SEGV test on Windows
 - Remove ASCII-isms to better work on EBCDIC
 - Move timer initialization
 - Fix YAMLish behaviour with empty values
 - fix eintr error handling in TAP::Parser::Multiplexer
 - Parse out signal name & core dump.
 - Let the aggregator finish gracefully after bailout
 - Make prove respect HARNESS_VERBOSE if no verbosity flags are passed

License-Update: the following removed from README
==================================================
  To use Module::Build (preferred) do:

    perl NotBuild.PL
    ./Build
    ./Build test
    ./Build install

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ddb6ca36b82dba3daccc2a8913e1a4764e30a549)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...est-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} (95%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
similarity index 95%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
index b8547cb1fe..58ca70b9e1 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
@@ -23,11 +23,10 @@ SECTION = "libs"
 HOMEPAGE = "http://testanything.org"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
+LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[md5sum] = "c794906473f88d6b74194e2d56f16bd6"
-SRC_URI[sha256sum] = "0fd90d4efea82d6e262e6933759e85d27cbcfa4091b14bf4042ae20bab528e53"
+SRC_URI[sha256sum] = "7eb591ea6b499ece6745ff3e80e60cee669f0037f9ccbc4e4511425f593e5297"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


