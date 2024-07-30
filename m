Return-Path: <mr.scada@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BFCC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 20:41:53 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.27835.1722372111561421625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jul 2024 13:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XO2Ko6Mq;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: mr.scada@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so3713014a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722372110; x=1722976910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCvpMedKau1Q3RrJmsXqigtnRqXV38Axp0RoBRzEk2E=;
        b=XO2Ko6MqaOp2H7KpXZnyXVuUzL6aA4WlqMY8DH2qfaXIjrgZ2Avr0OvaIgryy+2KMu
         atd4pMrk/ErBHHUoLdWIAil51ifU+rhtcgqPrn4WOgtEXSAuRV+8np+gywuknFoeNISs
         hgY5vPgxbMaDI2nXjogvrgu7EXAKQ3gU4lkibIQa8az8eQbRQxSVotSqY3FlF5fJ/2hC
         PUpVXQGNAWwhK1FLP3+39sZRVYJb5QJCu7XPQ3omYRVKILPcS0lUGitLsHDSzjpOCwmV
         8QL1fBxl3wnlhP5+KYK+xNmaq4g0j7qfeqdbnmXxtOVSLoX/Ga68KvKBvAyyloIflwwT
         9NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722372110; x=1722976910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCvpMedKau1Q3RrJmsXqigtnRqXV38Axp0RoBRzEk2E=;
        b=C7q5vRjD2KGGpYN2eUJTiOUBKV+z/Nu0yKwDpQdNennAFu5uo5GkDDFm2uUaVBli5p
         lcOAx1cuHyu8HmlnS7IAY2Pe0Z43lZroFVX+00YOchk3+K4DWn04vAEXzPVC/fZfHl32
         mdMqeh/LTtb/GN1SNdiAaaWkM9ca7hHSe2c1VG0XxpYmFhRNiYCu/uStKEhuzcb1jvQS
         Ja2xtPAY/QUKOtWFc/0pmVtnsL1/OzICz7GAZgScdul//5OQyhpsnaIDuPtkowXRpYtM
         UsdqlIAB9SwrYFv5qy0Mb/4Lu8MzdyinZFhRLAJjvlZeBPQtvF+BOTzPSt6PmgzwD91Y
         B80g==
X-Gm-Message-State: AOJu0Yxso6FYY6Bkm4eYm9hga5cma54WLkyxacYNVrefCRfatvWhHaCj
	UQd3zIemZ6cdtGPpAdZI+BA22T9P3T7gbdngznteKgoJNES2jrB9z4/y/Dbn
X-Google-Smtp-Source: AGHT+IGxHgPw1o1RTuPrH+TafgyD/hQn7vND/i3oHrKdLYtqzGIfiRK8g2eiZbSBCB3edu3/rzpv5w==
X-Received: by 2002:a17:90a:e544:b0:2c9:7849:4e28 with SMTP id 98e67ed59e1d1-2cf7e60bedbmr14647103a91.27.1722372110434;
        Tue, 30 Jul 2024 13:41:50 -0700 (PDT)
Received: from barrgrvm.ad.selinc.com ([136.226.56.169])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2cdb738fe0fsm13100173a91.10.2024.07.30.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 13:41:49 -0700 (PDT)
From: Barry Grussling <mr.scada@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Barry Grussling <mr.scada@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] postgresql: Break perl RDEPENDS
Date: Tue, 30 Jul 2024 13:33:42 -0700
Message-Id: <20240730203342.5123-1-mr.scada@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 20:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111483

Currently, any non-native recipes that inherits cpan-base ends up
with an image RDEPENDS on perl (via
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/cpan-base.bbclass?h=scarthgap#n14)

If you are building an image and desire to have Postgresql installed
but NOT perl, this creates a problem. This changeset attempts
to fix this shortcoming by not inheriting cpan-base directly.

Note this work is a continuation of attempts to change cpan-base:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15563

The Postgresql build system uses perl, so add it as a DEPENDS. This
happened previously via the "inherit cpan-base" directive.

I've validated this recipe successfully packages with and without
the perl PACKAGECONFIG in Scarthgap.

Signed-off-by: Barry Grussling <mr.scada@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index e29a5bef77..7f15cc869b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -19,7 +19,7 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "0BSD"
-DEPENDS = "libnsl2 readline tzcode-native"
+DEPENDS = "libnsl2 readline tzcode-native perl"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
 export LDFLAGS_SL = "${LDFLAGS}"
 export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
 
-inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base multilib_header
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
@@ -122,6 +122,12 @@ python populate_packages:prepend() {
 
 }
 
+# Same as the function in cpan-base.bbclass (but without the perl RDEPENDS)
+def is_target(d):
+    if not bb.data.inherits_class('native', d):
+        return "yes"
+    return "no"
+
 # This will make native perl use target settings (for include dirs etc.)
 export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}"
-- 
2.45.2


