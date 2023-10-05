Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD7FE936F8
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 02:35:21 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.7002.1696473312865847478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 19:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SBZpUP+W;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e106eb414cso296632fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 19:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696473312; x=1697078112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtrweoWY023rvm7Ocm3HqcRdXduxa0M5GG5DQzqaDmk=;
        b=SBZpUP+WfN0Y7WH5zG7Ri6w62fKjvP1bxlcWRNrBiOz/gbDMcyHLP3jexMe3CxLQLB
         rHgULOJg8t8byP4GQEh7egkLj+uLXVHtmvRjLPaGM0H180ZjCzRGkJOLGhNMADRAnUK4
         VCsPftujyh8eZxBo26UpmfMf1m3kfHDLSIWELo2P5HBSIDsFJbIZcgolI8gR0HUOSZy9
         V6yvizzgzig4kKj7Ujnfr395t+WGI9GMo6Isygxfr6I3Uej16T5IWKMbNdDbUJN4lrp7
         XvsHOR4ytllt9xivFXeRYDLWyBsP3yTUfReeXmlLRWiVv4gc1OGjZUkljuDzBDTuuAtd
         TVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696473312; x=1697078112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtrweoWY023rvm7Ocm3HqcRdXduxa0M5GG5DQzqaDmk=;
        b=NqnRjOFwUrw6OLmSgZhqjcyR/UAGXAtGK2Q52uY5SF0rADZ0rtFnAVVM3WxQqGGQ3o
         B3ulYuESUms6rK1Beq5ym2yAQcMcQyJOMVc4TW+zbo/88X282AsvaaxfRIaURXGPlH4D
         jDfd5PzVFGsZV7JkqzNVilKSfx17QB+RSzYm0+EO27sR8CTXJ9JdGi5zdHaTAWH+Ozji
         MVsoDe59Azam3qzEnYxDnNQTGEj7nxfM2sN9TLrRTZu+niLMEgArjoyuwu6s7lrVFieU
         otaT8nxHUomkd1HtOJmLeAV/neMBu3n2X4YlpE6u3GpAhu/e4ICKualQtlZGiAJU/oR8
         OtsA==
X-Gm-Message-State: AOJu0YwuYpP73LWMoCenqOhDb1zEmJ6hZM7Sp0qutAZWWzg1bzIPlbQK
	aKWZkLFyRHhRCpqTXRugajT4pj/VkFrCEA==
X-Google-Smtp-Source: AGHT+IGl0khczB0VNUZ2RfdS0aGeNBqtaWrVmoQIMFHErWKbHkT+diaQw3KG1y/7+sAUGFs1AcGWjg==
X-Received: by 2002:a05:6870:d0c5:b0:1e1:372:1f7a with SMTP id k5-20020a056870d0c500b001e103721f7amr4838958oaa.8.1696473311938;
        Wed, 04 Oct 2023 19:35:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id i8-20020aa787c8000000b0068fe76cdc62sm235680pfo.93.2023.10.04.19.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:35:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-openembedded][PATCH 4/4] images: Rename ptest images to rhyme with oe-core ptest images
Date: Wed,  4 Oct 2023 19:35:05 -0700
Message-ID: <20231005023505.1072671-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005023505.1072671-1-raj.khem@gmail.com>
References: <20231005023505.1072671-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 02:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105352

Easy to understand for new-comers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{meta-oe-ptest-all-image.bb => meta-oe-image-ptest-all.bb} | 4 ++--
 ...eta-oe-ptest-fast-image.bb => meta-oe-image-ptest-fast.bb} | 2 +-
 .../images/{meta-oe-ptest-image.bb => meta-oe-image-ptest.bb} | 0
 ...a-perl-ptest-all-image.bb => meta-perl-image-ptest-all.bb} | 4 ++--
 ...perl-ptest-fast-image.bb => meta-perl-image-ptest-fast.bb} | 2 +-
 .../{meta-perl-ptest-image.bb => meta-perl-image-ptest.bb}    | 0
 ...thon-ptest-all-image.bb => meta-python-image-ptest-all.bb} | 4 ++--
 ...on-ptest-fast-image.bb => meta-python-image-ptest-fast.bb} | 2 +-
 ...{meta-python-ptest-image.bb => meta-python-image-ptest.bb} | 0
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-core/images/{meta-oe-ptest-all-image.bb => meta-oe-image-ptest-all.bb} (84%)
 rename meta-oe/recipes-core/images/{meta-oe-ptest-fast-image.bb => meta-oe-image-ptest-fast.bb} (77%)
 rename meta-oe/recipes-core/images/{meta-oe-ptest-image.bb => meta-oe-image-ptest.bb} (100%)
 rename meta-perl/recipes-core/images/{meta-perl-ptest-all-image.bb => meta-perl-image-ptest-all.bb} (84%)
 rename meta-perl/recipes-core/images/{meta-perl-ptest-fast-image.bb => meta-perl-image-ptest-fast.bb} (77%)
 rename meta-perl/recipes-core/images/{meta-perl-ptest-image.bb => meta-perl-image-ptest.bb} (100%)
 rename meta-python/recipes-core/images/{meta-python-ptest-all-image.bb => meta-python-image-ptest-all.bb} (85%)
 rename meta-python/recipes-core/images/{meta-python-ptest-fast-image.bb => meta-python-image-ptest-fast.bb} (77%)
 rename meta-python/recipes-core/images/{meta-python-ptest-image.bb => meta-python-image-ptest.bb} (100%)

diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
similarity index 84%
rename from meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
rename to meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
index 0ea03dd2e3..e8e1750b0e 100644
--- a/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
@@ -12,9 +12,9 @@ require conf/include/ptest-packagelists-meta-oe.inc
 PTESTS_META_OE = "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE}"
 
 do_testimage[noexec] = "1"
-do_testimage[depends] = "${@' '.join(['meta-oe-ptest-image-'+x+':do_testimage' for x in d.getVar('PTESTS_META_OE').split()])}"
+do_testimage[depends] = "${@' '.join(['meta-oe-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_OE').split()])}"
 
-do_build[depends] = "${@' '.join(['meta-oe-ptest-image-'+x+':do_build' for x in d.getVar('PTESTS_META_OE').split()])}"
+do_build[depends] = "${@' '.join(['meta-oe-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS_META_OE').split()])}"
 
 # normally image.bbclass would do this
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest-fast.bb
similarity index 77%
rename from meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
rename to meta-oe/recipes-core/images/meta-oe-image-ptest-fast.bb
index f56e841ff1..46b48d65d6 100644
--- a/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest-fast.bb
@@ -1,4 +1,4 @@
-require meta-oe-ptest-all-image.bb
+require meta-oe-image-ptest-all.bb
 
 DESCRIPTION = "Recipe to trigger execution of all fast meta-oe ptest images."
 
diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
similarity index 100%
rename from meta-oe/recipes-core/images/meta-oe-ptest-image.bb
rename to meta-oe/recipes-core/images/meta-oe-image-ptest.bb
diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb b/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
similarity index 84%
rename from meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb
rename to meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
index 236043c22a..e2cafa98a5 100644
--- a/meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb
+++ b/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
@@ -12,9 +12,9 @@ require conf/include/ptest-packagelists-meta-perl.inc
 PTESTS_META_PERL = "${PTESTS_FAST_META_PERL} ${PTESTS_SLOW_META_PERL}"
 
 do_testimage[noexec] = "1"
-do_testimage[depends] = "${@' '.join(['meta-perl-ptest-image-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PERL').split()])}"
+do_testimage[depends] = "${@' '.join(['meta-perl-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PERL').split()])}"
 
-do_build[depends] = "${@' '.join(['meta-perl-ptest-image-'+x+':do_build' for x in d.getVar('PTESTS_META_PERL').split()])}"
+do_build[depends] = "${@' '.join(['meta-perl-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS_META_PERL').split()])}"
 
 # normally image.bbclass would do this
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb b/meta-perl/recipes-core/images/meta-perl-image-ptest-fast.bb
similarity index 77%
rename from meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb
rename to meta-perl/recipes-core/images/meta-perl-image-ptest-fast.bb
index 5d8afa08e7..1ac78f30b7 100644
--- a/meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb
+++ b/meta-perl/recipes-core/images/meta-perl-image-ptest-fast.bb
@@ -1,4 +1,4 @@
-require meta-perl-ptest-all-image.bb
+require meta-perl-image-ptest-all.bb
 
 DESCRIPTION = "Recipe to trigger execution of all fast meta-perl ptest images."
 
diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-image.bb b/meta-perl/recipes-core/images/meta-perl-image-ptest.bb
similarity index 100%
rename from meta-perl/recipes-core/images/meta-perl-ptest-image.bb
rename to meta-perl/recipes-core/images/meta-perl-image-ptest.bb
diff --git a/meta-python/recipes-core/images/meta-python-ptest-all-image.bb b/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
similarity index 85%
rename from meta-python/recipes-core/images/meta-python-ptest-all-image.bb
rename to meta-python/recipes-core/images/meta-python-image-ptest-all.bb
index fd4dc42487..56c392f036 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-all-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
@@ -12,9 +12,9 @@ require conf/include/ptest-packagelists-meta-python.inc
 PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON} ${PTESTS_SLOW_META_PYTHON}"
 
 do_testimage[noexec] = "1"
-do_testimage[depends] = "${@' '.join(['meta-python-ptest-image-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
+do_testimage[depends] = "${@' '.join(['meta-python-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
 
-do_build[depends] = "${@' '.join(['meta-python-ptest-image-'+x+':do_build' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
+do_build[depends] = "${@' '.join(['meta-python-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS_META_PYTHON').split()])}"
 
 # normally image.bbclass would do this
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-python/recipes-core/images/meta-python-ptest-fast-image.bb b/meta-python/recipes-core/images/meta-python-image-ptest-fast.bb
similarity index 77%
rename from meta-python/recipes-core/images/meta-python-ptest-fast-image.bb
rename to meta-python/recipes-core/images/meta-python-image-ptest-fast.bb
index 4f93a15959..bb6e8213fe 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-fast-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest-fast.bb
@@ -1,4 +1,4 @@
-require meta-python-ptest-all-image.bb
+require meta-python-image-ptest-all.bb
 
 DESCRIPTION = "Recipe to trigger execution of all fast meta-python ptest images."
 
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-image-ptest.bb
similarity index 100%
rename from meta-python/recipes-core/images/meta-python-ptest-image.bb
rename to meta-python/recipes-core/images/meta-python-image-ptest.bb
-- 
2.42.0


