Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEFCC38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 22:01:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.2875.1667167310355232555
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 15:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AqXtPkBA;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id l6so8932808pjj.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qD9XzWfyyyOLayM54ZBj8wz9Cz0JV1XV9rzfJNLxuA=;
        b=AqXtPkBAUVUkby1EAZB4a68Qdk+mL+Iy8VS8hqGC+3WSgr0ZqRDxYPA9SjsRdLFM4J
         f+Y9+XkGvv39/rmDBOIBqjTIQTC195xQm5oQFJJGb2fhllU2spgfaWEZZV63BSg54wtf
         SpHmCXHovZ2vOpkqDp4qc5zxQsE/tvAkIOTT+Baa6htVqxVmwakMPwHIW9yuD2dHcfp0
         yB2lfWLjy9Zz/yQPiTOnxzfbPtvAp1NRoAjBlxTvNxcFtjMf/D4RNSnN1pDhlv3Lmt0l
         IVwbn+njvxmPpNarKDuF7Jmrf6vSbkq72BKJbAf7bv4DLmjmYiFE8NFrdG6GlB698WYy
         goKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qD9XzWfyyyOLayM54ZBj8wz9Cz0JV1XV9rzfJNLxuA=;
        b=uMK4yZu8wVaEHZXVtU53i2xjAHSuIG8hoHBW9Lxt6nxIHND5x4uN12m+NZuqzTtIJv
         3lMyJq1v+nufna/E+5zo2Nk4djLsJzANcrTFTNfEpZywJvfcvOhZ9cVbzSNL4p+jnXoM
         3EsSzHXCXFfNtbmOWQA/Gw/CGeDkph9AKFyMWtRsIMY66B8M5FzRo9dUZFwSo6IGk/UB
         28jQzVgBRvhsaaD7tqm34rBSlqa7QEdWC20ug/1c9gg+POSG2BnSqGln0fHuwS3/1n87
         +RpfYTm1ypmAxAB4CQHEygVqBfWDWL4TF4noir6QRBLzQNK9Vb7I7L/Pl1k0az/Uje5N
         uEdA==
X-Gm-Message-State: ACrzQf0lXWGzpVySE1Ml+oOiyvLHRbDD79UxiY7SmbuUFdXYKGDfKUJg
	KfNRuxjSOs93EoiMBK/QPPQNY8Kdtj4IRw==
X-Google-Smtp-Source: AMsMyM5Cn3v20kYPld9nBsZW83U6OohMO5x1zTcTrgzjl9vrzgpxjLVH9mIOor/CE1rVzRap9pK/IA==
X-Received: by 2002:a17:902:c941:b0:187:734:2626 with SMTP id i1-20020a170902c94100b0018707342626mr9342927pla.73.1667167308497;
        Sun, 30 Oct 2022 15:01:48 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:47f7:4a18:39bc:2baa])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001769e6d4fafsm3090292plb.57.2022.10.30.15.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 15:01:47 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH] libmime-types-perl: upgrade 2.17 -> 2.22
Date: Sun, 30 Oct 2022 15:01:40 -0700
Message-Id: <20221030220140.3252919-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 22:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99353

Fix RDEPENDS, in particular perl-module-perlio-encoding and
perl-module-encode-encoding were needed to be able to open the database in
/usr/lib/perl5/5.36.0/vendor_perl/MIME/types.db... even though no
warnings or errors were reported.

bin/collect-types was dropped in 2.18

Upstream release notes:

version 2.22: Wed 27 Oct 16:54:38 CEST 2021

        Changes:
        - webm keeps on producting unexpected results [issue #11, Даша
	  Федорова]
        - iana updates

version 2.21: Fri 28 May 12:01:00 CEST 2021

        Changes:
        - application/octet-stream is better for .dat [issue #11, Даша
	  Федорова]
        - add video/webm which Google forgot to register [issue #12,
	  Brent Laabs]
        - add image/webp which Google registered too late [issue #12,
	  Brent Laabs]

version 2.20: Thu 22 Apr 12:48:35 CEST 2021

        Fixes:
        - problems with PAUSE cause the previous release to show-up in
          the wrong location.  Let's hope this release solves it.

        Changes:
        - heif/heic/heifs/heics/hif fix [issue #9, Даша Федорова]
        - no 'and' and 'or' extensions [issue #9, Даша Федорова]
        - application/octet-stream is better for .bin [issue #10, Даша
	  Федорова]

version 2.19: Fri 16 Apr 11:47:10 CEST 2021

        Improvements:
        - update with the newest data from IANA and Apache httpd

        Changes:
        - mp4 preference is video/mp4 [issue #5, Даша Федорова]
        - yt preference is video/vnd.youtube.yt [issue #6, Даша
	  Федорова]
        - 3gp and 3gpp preference is video/3gpp [issue #7, Даша
	  Федорова]

version 2.18: Wed  9 Dec 10:29:46 CET 2020

        Improvements:
        - update with newest data

        Changes:
        - Mojo 6.0 changed types() into mapping() [Dmitry Latin]
        - Mojo 7.94 adds experimental file_type()
        - Mojo 7.94 adds experimental content_type()

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...erl_2.17.bb => libmime-types-perl_2.22.bb} | 22 +++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.17.bb => libmime-types-perl_2.22.bb} (74%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.22.bb
similarity index 74%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.22.bb
index d1f6f8c59..5f5c4958d 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.22.bb
@@ -14,8 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "6f1441addab947137bac92c379a47ba3"
-SRC_URI[sha256sum] = "e04ed7d42f1ff3150a303805f2689c28f80b92c511784d4641cb7f040d3e8ff6"
+SRC_URI[sha256sum] = "c2545eb30b094e942860ff8444f0f6cb54641caa8f7d386aaa2d925da4b02400"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
@@ -23,19 +22,24 @@ inherit cpan ptest
 
 RDEPENDS:${PN} = "\
     perl-module-base \
+    perl-module-carp \
+    perl-module-constant \
+    perl-module-cwd \
+    perl-module-encode-encoding \
     perl-module-file-basename \
     perl-module-file-spec \
+    perl-module-list-util \
     perl-module-overload \
+    perl-module-perlio \
+    perl-module-perlio-encoding \
 "
 
-RDEPENDS:${PN}-ptest = "perl-module-lib perl-module-test-more"
-#RSUGGESTS:${PN}-ptest = "libmojo-base-perl"
+RDEPENDS:${PN}-ptest = "\
+    perl-module-lib \
+    perl-module-test-more \
+"
 
-do_install () {
-    cpan_do_install
-    install -d ${D}${bindir}
-    install -m 755 ${S}/bin/collect-types ${D}${bindir}/collect-types
-}
+#RSUGGESTS:${PN}-ptest = "libmojo-base-perl"
 
 do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
-- 
2.34.1


