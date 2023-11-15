Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18072C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:37:08 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.8222.1700033825844105563
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnzKQPTa;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5bd33abbb90so4327662a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700033825; x=1700638625; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83z/mog91KQUOiISznoZ+Z+yCE4MCSLVm7lqZPjnJtA=;
        b=jnzKQPTaiE3NbDkbOOQl9X2bPf/C6O53TGEh0uT5+bqf4Fn28fw0KFuZI075VbnZ/4
         jAF9/P9dFVaayyFRhqlDClY2/rhhlBYbqRVilvR+WvH8Xv5GbMwsV/J3fNnQtiZOVe2M
         vP8qHBYCqgJeHLW3/4BECQ1TG4XVuGip0SucRQo3k9lJUuwxGHr9iL96+RcRhJVdpg8l
         DbRY/T/GC0cZNPDUtqvp+CQsp2U/dkS1fww6AtYHk0/emrAjmlM1IvKERWnofAMZ1IeG
         DR1ni9t2+L6ISJ8tTGZrbFFHL5IgolNdmcUqnHeJUyNKKwSAeT3DajUMIyQBQLxyKtTI
         gHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033825; x=1700638625;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83z/mog91KQUOiISznoZ+Z+yCE4MCSLVm7lqZPjnJtA=;
        b=tzwDYhwYkch791NPHTLC8hOwkTEUAF/s1PwUoc7zqnGLDKRnYC0tzn04nWdR/1UV1o
         7Ef5f+fRxgpdt5RqydRscfUKfe8Crw4eaGU0ne8LoXrTykBXgRXxtipuhe6ybeTfgEBo
         HcNqq8j2lGxv5JmgX1UTtCMca+nIqvNld+idYtbYIRT5em8FtwOZWPrSoo73UAw5KlpT
         iGzKQkMGxSRme9l8wCHh1ngeyaXphDwg+6T1YUdd4XEQmWnsqQQnO1L3UXUbx9tw4Hko
         NCXfG2rCic5U9HbRDUYrLhFIhKSGMxMbHJNfPjBpD96zRLmTcmniGb28lMeV04NJ6q4F
         gKGg==
X-Gm-Message-State: AOJu0YzfEm/YISU9/9yecToe7noB8I9kIgdZ3/3wLYzzwLFbyHP+1Na1
	kR5tit3t1gbUzxUBKThUSgN2ExJ6ae7gsg==
X-Google-Smtp-Source: AGHT+IHFG6PuvnO5LxeZjz0dETznZz9a8XZs/ihINzIUx+0FbwwmQNt7FMf6gLCCHipmVqSHArYlUA==
X-Received: by 2002:a17:90a:404f:b0:283:1da8:3636 with SMTP id k15-20020a17090a404f00b002831da83636mr10729194pjg.23.1700033824936;
        Tue, 14 Nov 2023 23:37:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id l23-20020a17090a599700b00274922d4b38sm6312074pji.27.2023.11.14.23.37.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:37:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 23:36:54 -0800
Subject: [PATCH 3/3] libxml++-5.0: Make use of gnomebase bbclass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-remove-vte9-v1-3-720f287a1da3@gmail.com>
References: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
In-Reply-To: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106748

Simplify the recipe a bit and makes ptests pass.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
index c0f0b2e130..ada0199476 100644
--- a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
@@ -6,15 +6,14 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/libxml++/${SHRT_VER}/libxml++-${PV}.tar.xz \
-"
-SRC_URI[sha256sum] = "15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098"
+DEPENDS = "libxml2 glibmm"
+
+GNOMEBN = "libxml++"
+inherit gnomebase ptest
 
 S = "${WORKDIR}/libxml++-${PV}"
-DEPENDS = "libxml2 glibmm"
 
-inherit meson pkgconfig ptest
+SRC_URI[archive.sha256sum] = "15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098"
 
 FILES:${PN}-doc += "${datadir}/devhelp"
-FILES:${PN}-dev += "${libdir}/libxml++-${SHRT_VER}/include/libxml++config.h"
+FILES:${PN}-dev += "${libdir}/libxml++-${@gnome_verdir("${PV}")}/include/libxml++config.h"

-- 
2.42.1


