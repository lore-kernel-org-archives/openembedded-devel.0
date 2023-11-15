Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DDCC54FB9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 19:06:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.21987.1700075204358108142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 11:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRh4Abrk;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-280260db156so733682a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700075203; x=1700680003; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83z/mog91KQUOiISznoZ+Z+yCE4MCSLVm7lqZPjnJtA=;
        b=nRh4Abrk4rKaqsvpH+isFcmp/Lz8FKsYOnBi9A0yOOphssHsj/jTQw0GL7kpO5B8lW
         R6LylMn683jROJTwwbwFU3g3jse0Cu2fW7QYmaeKTmC4dhNCCUVZaOmK6VDGVzlxFoMP
         pADcL6D1ud0a7hStrEkjZvenahZEgm/ucYeutA5MeBf1vBuQFJPaFCxyLhSoHRJpA6qO
         6q1u7m4yMPKplyOVhsMMWVp+gRgV1NeGU/LJDYyBqSQFCMEXr8ldCdiIwo5iIIddlxY/
         V+/sUqzVnAnbvPeI+AU0aTzZhZN3LKA/K+f5K3YXZ6PtZeG4leXlJ4q75aIDmug44v6u
         rnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700075203; x=1700680003;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83z/mog91KQUOiISznoZ+Z+yCE4MCSLVm7lqZPjnJtA=;
        b=inYAomRiODGw2UxKwCKCDqR9jc0Z4lTmYdq5Fe2YIF39A2LVq5/uRKnpQvC67sbO27
         NYiJwURcxUDom2hLhIwa+ZTT0wDiKqDD8RzemlBIqvr1MxyifA6gAjHdo5SQOIgdIVvS
         zL+X9w4hjV8iXw66f6aovuRmaHZP6y6reAjU4qyHoRqbqimqOUxJNENTAGCVP5pWn59z
         +Dtm8G5gFgX3GsPcY5JBFemkyLTsKiyDtcQuRgaBvaq6P3Swg8JzpzXvx+EEKQ30cOCK
         m51at8x0kjWVXqXGuY1oSoZMwLnANDaDNwQHSDpzlsvzUOx/WonTxKJKi297PMUGtzDE
         jWrA==
X-Gm-Message-State: AOJu0Yx2SIqHZo5Q/CE7bYnHgEcHwFoLa/T908T6mHnZ9ddUe0SVK57H
	e7+kctLs0ivJORYMaILwHw6s5GG0KnYZpA==
X-Google-Smtp-Source: AGHT+IFb4ar8G4ElQ6yXOHOy/Vv2FzHcReEgQ5Y4Nr/1RQBB59XFx2oLfsHXcTgImR91Dzrgt9plUA==
X-Received: by 2002:a17:90b:17ca:b0:280:4799:a841 with SMTP id me10-20020a17090b17ca00b002804799a841mr15036448pjb.38.1700075203498;
        Wed, 15 Nov 2023 11:06:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ji12-20020a170903324c00b001bfd92ec592sm7669004plb.292.2023.11.15.11.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 11:06:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2023 11:06:29 -0800
Subject: [PATCH v2 3/4] libxml++-5.0: Make use of gnomebase bbclass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231115-remove-vte9-v2-3-c894df1c7af8@gmail.com>
References: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
In-Reply-To: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 19:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106770

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


