Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587FBC61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:19:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13448.1788113975261827888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oBGU0PZ7;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3964e480f76so3355301a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788113974; x=1788718774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNyevnd8aMTX4gAL8u5jVf006orTX++X52ET00U5TJs=;
        b=oBGU0PZ7Od8Ih8ebw8jlrJugM1DrFqGzsuRAS3M0s5iIVQ6Nhnz6WWbUGznscMpT0g
         I8tNk/LdFlVqiq71gf2oujNFG+2GtsjTE472meTUWo93jdqm08A2XJh5vPThEZakMEcq
         B9Vaiq14vhR2gRwjP9e7sFbN5q917p7g3dNbwLJP4OPKzAhGjFbjdkYwitVRLfMXOvJ/
         zmt1u+SXwS5IBejdXPkUfSyzyyXYR98TA7JrtUsid91hv1ZrOXh16fIxsDyY4mD3WMZf
         A46ENE1l9aOJYFIso3iA5qnNs/FT7rx7lAezQM12QwccKBTMr96zH9T189xpl99tBTYn
         x/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788113974; x=1788718774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNyevnd8aMTX4gAL8u5jVf006orTX++X52ET00U5TJs=;
        b=b3BUzZg2MSojt1U5iui+2y1jQdD1+2Ysq5t2xGAayROZr9QB0FCATBmCxcm5FrMYhP
         u6QaGovdyVdDixlm3mE7qHy9KpPrcUG/STMHwk0S8xw4ortj8aHA+Uji5k/pZO3sl/A+
         zsf+mDoonpsWXQ8lWhYhe1PrEhzkUoY+amidNE70wBC64vMmqnHcyvG1jKZHBOcoEmuk
         PkcfbxwcV6C5DvLtf60xXlrVSgVTw3VP1rGL5a6w8ce0qc7T10R+J2ra2Qq+nXFFuNhh
         HcMYIAMWD9233ebfkwfAj3HS5ZfaQMtZFObIyIva8U/UzkAInQJ7KiPfkDiSJyR/V4tG
         H+Sg==
X-Gm-Message-State: AFuF++kjLMt6voUWOMavNC/NXJdqAiwnTUjpcUX/UOFYhyWtX86opDdp
	FsgGtt4wghZsO6yPDT8hQQuBj9TYAOOdi301i7pMqZX0ZgmRjUblCR7yE0wrfg==
X-Gm-Gg: AYBFou2lDRV2MLgmxtc5aWbUjvOw0lgtsJO+gvrFCEEWhHnEkYE3h1rroF4Pay3lnI2
	sLmSoWTmUsCiHyvjyd9Bf+UHJaJ4rlzLI8t2QBkvGQXYxruyahBgcxWtvXfY75K88UPPyBmD+Ii
	FtWeaDeOTP7c36FR+R/45TW9VS3k3phAVeJZCio+fsCxvPun/NkvlM3NDJx9YFiVBAP11rBrUh6
	vH/R68IqMimb7C58WoZoQmypgdepMOtxprfuigQ2FgZNWa3ZJM9X7G9osIR6bLYFYDFSecaC5vW
	WAxekzwc7tmPxT1vxc+1xqTgIHrcje2091rAxPOJ/8Ot1dRV9G7Q0KVq+c+uUegfSnYX0vSuDSh
	zMzTmT0vfwlCpDOEf/W8J/8YKfAq5X811FDrK2MGLC6psLO0l4G1pABKolj9Nk346/hvAmS5KsU
	skV5iPZIW5I5wJ0aOgFkDaAdha4ltSfzei9iJ1RWXpBKGEHjBpn7FnFp3fhRuu13am53mQShqDQ
	HW9d+i291/fV1N0erEEOupxVyLBSe6gT/53t48zu3YR82Yr2orvXmf5q+dPi50lA9102B1JIIvv
	GhW2AIAqV6LnagBYek0EN7CstoZ4Q4/ovsMjAAHYgaQLiTKlmPbTNQ9rlnlePGWY5jcrLCNZ4+h
	fSy4fSFlOPRG/eXvefJuGwiX4iP4+oZuu0zhfGVumW0zpVA==
X-Received: by 2002:a17:90a:fc4e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-396d0f8fdbemr36521017a91.11.1788113974523;
        Sun, 30 Aug 2026 11:19:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm23068739c88.6.2026.08.30.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:19:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] doxygen: strip build paths from the generated sources
Date: Sun, 30 Aug 2026 11:19:31 -0700
Message-ID: <20260830181931.1617283-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 18:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129596

configgen.py writes the absolute path of config.xml into the header of
every file it generates, so generated_src/configvalues.h, which is
shipped in the doxygen-src package, carries the recipe build directory:

  WARNING: doxygen-1.18.0-r0 do_package_qa: QA Issue: File
  /usr/src/debug/doxygen/1.18.0/generated_src/configvalues.h in package
  doxygen-src contains reference to TMPDIR [buildpaths]

On builders whose HOME is a parent of the build tree the same file e.g.
yocto autobuilder, also trips the build-host HOME variant of the check.

flex leaks the path of the lex file the same way: it emits a #line
directive for the %top{} block even when called with --noline, and
post_lex.py rewrites it to the absolute path of the original .l file.
Those .cpp files are not shipped today, but the leak is the same one.

Strip ${B}/ and ${S}/ from everything under generated_src/ during
do_install, before do_package picks the sources up, so the references
become relative.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
index 0ee18042e3..a9c82be929 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
@@ -23,6 +23,8 @@ EXTRA_OECMAKE += "\
 "

 do_install:append() {
+    find ${B}/generated_src -type f -exec sed -i -e 's;${B}/;;g' -e 's;${S}/;;g' {} +
+
     sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;#ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
     sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
     sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/mscgen_language.hpp

