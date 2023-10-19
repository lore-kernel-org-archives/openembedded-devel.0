Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA7CDB47E
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 01:13:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.17635.1697678014184671788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 18:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CqEljKIx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso4626538b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 18:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697678013; x=1698282813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiXS+34ByKDqsCti63To85GXdPAxkMd8qxVbJ5d+N6Q=;
        b=CqEljKIxF7+PumhR4jdHmnoCGJmy7udFrPZxbwXXva3WgJNF3vLjamwaQkyWcJWRA5
         a0Jtqn14bmRtVcUDhwaLDBs5v9AlfBPVsxXEkxNj+gwtfYubfZOXW4Dyi7Y79F4DbtoU
         He2rskL/UWS5ToEDq4Lz68BMbOyCYVlpyOlBmY7vnocpCBcqisa7SYt7Y1KPp0RyYmNo
         QO1G9LBqBAxz4BfMbMqJXlEkFdEu9At+6YBGjaEecUfxc+ZepwHhuOntItzGZktUqtlY
         x32I0QxGUbqiM4Cc8q9lZFYinKRgnXk03X+/wTXEnbn0pzyLGlMobvmhLuKYXCFteQ2I
         3k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697678013; x=1698282813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiXS+34ByKDqsCti63To85GXdPAxkMd8qxVbJ5d+N6Q=;
        b=c9upljmkPL23GDh5CZAJMH35cJpKP7aznwrivNBwT/v/RV1Jot12nqVZiR8PtK6jB1
         ZqbVHQE1cUX835G38Ym2fbeASEJBgL0/F2/FaY2w/CZPNYcHcpKBOr+vm//sPSM0fo7a
         ax2llzlfMXsy2gne+5OHuxEnfj0YMRvy4r1/xqvM8Qz3juaEjXTwtAlWZZSbS0LMFvzL
         KiR4/NO6DSUPaPngoRIflRgkn5MRiA1ImuvL3a6qZ997TYDHmruzEXY6BguOiKEyDSBc
         PwwME+NIqNrs91E3Lczn38Uaihd24rTrz8enmMsPKhdPBK+XlEWjAOjB9rIKw4MUnnxE
         DlHA==
X-Gm-Message-State: AOJu0YwT/lZwkmSIiGf55DQnQz64fqbr/l81SxOkYSDuJgrr7i0eft2A
	UoFv00Tc9yi6uPK+ET/qqyLDr00NOnuvLA==
X-Google-Smtp-Source: AGHT+IHWoKEkmz1YeQYc02EFH3JPtI4dhdGtuJxpAtrrSfTbHd3qu4g0ck3cEhU0jNNdHONJ+gTnDQ==
X-Received: by 2002:a05:6a20:72ac:b0:15d:fc71:1b9e with SMTP id o44-20020a056a2072ac00b0015dfc711b9emr743512pzk.49.1697678012963;
        Wed, 18 Oct 2023 18:13:32 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:c05e:ad13:fda7:c7ef])
        by smtp.gmail.com with ESMTPSA id k125-20020a632483000000b005742092c211sm2287315pgk.64.2023.10.18.18.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 18:13:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-perl][PATCH 1/2] po4a: remove old recipe
Date: Wed, 18 Oct 2023 18:13:25 -0700
Message-Id: <20231019011326.3535316-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 01:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105586

po4a has been failing AUH upgrades for a long time now.
The latest attempt to get ptests working for it can be found at:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/po4a_0.69%2bptest

If you care about this recipe, please continue the effort above and get ptests functional.

According to the layerindex, the po4a recipe is not depended upon by any other known recipes:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Apo4a

(debsums in meta-oe dynamic-layers will be removed in another commit)

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../packagegroups/packagegroup-meta-perl.bb   |  1 -
 meta-perl/recipes-perl/po4a/po4a_0.49.bb      | 33 -------------------
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/po4a/po4a_0.49.bb

diff --git a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
index 187424b44..2672ab584 100644
--- a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
@@ -79,7 +79,6 @@ RDEPENDS:packagegroup-meta-perl = "\
     libtest-nowarnings-perl \
     libtest-warn-perl \
     libunicode-linebreak-perl \
-    po4a \
 "
 
 RDEPENDS:packagegroup-meta-perl-extended = "\
diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
deleted file mode 100644
index 679ea0fb4..000000000
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "PO for anything"
-DESCRIPTION = "The po4a (PO for anything) project goal is to ease translations \
-(and more interestingly, the maintenance of translations) using gettext tools \
-on areas where they were not expected like documentation."
-HOMEPAGE = "https://po4a.alioth.debian.org"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
-
-SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https;branch=master"
-
-# v0.49
-SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = " \
-    libmodule-build-perl-native \
-    libtext-wrapi18n-perl \
-    libterm-readkey-perl \
-    liblocale-gettext-perl \
-    libunicode-linebreak-perl \
-"
-
-RRECOMMENDS:${PN} = " \
-    libtext-wrapi18n-perl \
-    libterm-readkey-perl \
-    liblocale-gettext-perl \
-    libunicode-linebreak-perl \
-"
-
-inherit cpan_build
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


