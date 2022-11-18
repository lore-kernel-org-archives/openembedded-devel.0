Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7F4C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 20:13:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.4060.1668802419927785455
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 12:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y1dfo0iS;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id y203so5897805pfb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu4Z4vXhI2yyN5zTiq8JKfXUDe7yTFYfbaFO6i8bNL4=;
        b=Y1dfo0iSN35oO1BJjSlbhJFVfGaSeODMSjqe9KRep7cBhjNeaKB9p72aZo3Xk8XY47
         wHAN4QzJyaOmP3iaPFAz8PyJ9aaaCEeg5VThuIZTt0wgeG9E8eOODVUyIR2fWo9CiVrA
         tTBXEBdt7V2FNd0dwGJlQJiB3zWY0Ll+V8PCkRuz0XA5hjObl9zbHfhyccbyzYz1IP5B
         5f6IuP3r9OsZSu4Qax16pVecDadwx5JO+ntGEJSTADuhY2L5GER00jMPKu7kxzSPHUbz
         UnNhM155mNoMpnxnsaidUIHoi/Rhk+pzuVP8tLfG/pqqozgW9KZzu7ZkFhioUoJIvkDf
         cJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu4Z4vXhI2yyN5zTiq8JKfXUDe7yTFYfbaFO6i8bNL4=;
        b=F06GY0gl81nQMEwFToNn2b2QutvlRmeeeSYEYm+mpDTW1u30YaxZLJnJmAAsylapCG
         aHrCvmFdo2mzJBGyQGUaqgyLt3mBuxGrnfJknV8OmTTOWTHF3LwvwoLifbBZYcG2vpOs
         Jr1Dx4bzCB7wcZS7BMJFUN6XCftvU5OvThZYdbOPLwH95LlmbyKSMe06iMwXTjH2/1/d
         fSkwBSMV5khCGrH3xzS+POLfmV7xNBmUu7sjKIctAAonOaamX+0HS3nOcMoWwumxJ55F
         nJCAcn8ArnmSTUKoQg3WNrnIuFTVBxx+NXf3YKYZfv6ww3OA7Mhxc0fZemO6lTxgHLQS
         ZvdA==
X-Gm-Message-State: ANoB5pkAkSRwAKK4AEN2gEY9xSTEcCpE3mtjgSFUekIyY1lYcYVHmeVn
	U0H5aUmuz0QpX3hwGYW7Q0Sds43YfauN+g==
X-Google-Smtp-Source: AA0mqf5GNiZbGgN1zbQsiGUCkSVxZbFm+jAXAaBO2J+b35RqNRqWfxxT9e5k6jOEYmEIIxYOl4Z5xg==
X-Received: by 2002:a63:4c24:0:b0:476:7742:de17 with SMTP id z36-20020a634c24000000b004767742de17mr7913339pga.345.1668802418868;
        Fri, 18 Nov 2022 12:13:38 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:b88b:808f:8d53:97bd])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b001869efb722csm4132722plg.215.2022.11.18.12.13.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 12:13:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/3] libio-socket-ssl-perl: upgrade 2.075 -> 2.076
Date: Fri, 18 Nov 2022 12:13:23 -0800
Message-Id: <a57e45c4e824b58f5e4365d77c96d9ab191093bf.1668802119.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668802119.git.tim.orling@konsulko.com>
References: <cover.1668802119.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 20:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99619

* RDEPENDS on libmozilla-ca-perl
* Inherit ptest-perl; drop run-ptest
* Add RDEPENDS for ptest

2.076 2022/11/12
- added curl like tracing based on contribution from jddurand
  https://github.com/noxxi/p5-io-socket-ssl/pull/117
- fixed race condition in t/sni_verify.t based on analysis from jddurand
  https://github.com/noxxi/p5-io-socket-ssl/issues/97

https://metacpan.org/release/SULLR/IO-Socket-SSL-2.076

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-perl/recipes-perl/libio/files/run-ptest  | 16 ------------
 ....075.bb => libio-socket-ssl-perl_2.076.bb} | 26 +++++++++++++------
 2 files changed, 18 insertions(+), 24 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libio/files/run-ptest
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.075.bb => libio-socket-ssl-perl_2.076.bb} (70%)

diff --git a/meta-perl/recipes-perl/libio/files/run-ptest b/meta-perl/recipes-perl/libio/files/run-ptest
deleted file mode 100644
index c9f9ca94d0..0000000000
--- a/meta-perl/recipes-perl/libio/files/run-ptest
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-for case in `find t -type f -name '*.t'`; do
-    perl $case >$case.output 2>&1
-    ret=$?
-    cat $case.output
-    if [ $ret -ne 0 ]; then
-        echo "FAIL: ${case%.t}"
-    elif grep -i 'SKIP' $case.output; then
-        echo "SKIP: ${case%.t}"
-    else
-        echo "PASS: ${case%.t}"
-    fi
-
-    rm -f $case.output
-done
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.075.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.076.bb
similarity index 70%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.075.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.076.bb
index 0a88d93056..171a675882 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.075.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.076.bb
@@ -13,20 +13,19 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
 
 RDEPENDS:${PN} += "\
+    libmozilla-ca-perl \
     libnet-ssleay-perl \
     perl-module-autoloader \
-    perl-module-scalar-util \
     perl-module-io-socket \
+    perl-module-scalar-util \
 "
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
-           file://run-ptest \
-          "
-SRC_URI[sha256sum] = "c30ee2220b1e181a968ebbc81861d0cadf334b001377a44105ae5a8637ddae8c"
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
+SRC_URI[sha256sum] = "bdd148d9feaef1220251676d7053698fcf446c9850d706fe2e1c90ff232ed874"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-inherit cpan ptest
+inherit cpan ptest-perl
 
 do_install:append () {
     mkdir -p ${D}${docdir}/${PN}/
@@ -38,8 +37,19 @@ do_install:append () {
     cp -pRP ${S}/example ${D}${docdir}/${PN}/
 }
 
-do_install_ptest () {
-    cp -r ${B}/t ${D}${PTEST_PATH}
+RDEPENDS:${PN}-ptest += "\
+    libnet-libidn-perl \
+    liburi-perl \
+    perl-module-file-glob \
+    perl-module-findbin \
+    perl-module-io-socket-inet \
+    perl-module-io-socket-ip \
+    perl-module-perlio \
+    perl-module-perlio-scalar \
+    perl-module-test-more \
+"
+
+do_install_ptest:append () {
     cp -r ${B}/certs ${D}${PTEST_PATH}
 }
 
-- 
2.30.2


