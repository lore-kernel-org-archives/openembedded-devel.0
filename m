Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66DAC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.5178.1669792763294560203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qzJAvNiz;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so1460487pjt.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trt0w07syQyyVK5L4pxFCjYIyLbdpchBEoYgxKNbzKY=;
        b=qzJAvNizNHLt43qGng7FjeAD0HVb345Y9a5qU8mBkQ8B8Y2lpvgP3EQKbTOR//Zwyp
         +CFuyVkg8mlgAzEld/LJiPZOsNFQlgHBJwGDCyqOCxXh2UnYU9/eMRhE27otuhiRco+e
         7jWtBX/DMzaJ+CblJX9rfnaiL1BbRq/AwVdkc6hsmWHi+Twcer+m7IQRBJqOE5AENSSN
         2JRofZRjwrMeK2XUx8CVwDPJgNLaLdNhFuuImgsOktovagfdZbAcOQvFOEZdemLjOYO1
         837pxaZdSebdB2XrtWoE7jdMCRDm/eLmoFSgD0zbYVubJsLWLboE9CU3JkBi+4RwaiKc
         i5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trt0w07syQyyVK5L4pxFCjYIyLbdpchBEoYgxKNbzKY=;
        b=oKd3078pinwQg63LpDtaJ0BFfWpBIM7yOTqy4nFd4nsEWGa3YyeYKbjqHZ4N+3LOt5
         UfymS+l0ESBLrA6cq2crJLPCS1IKBg4zDMh6+ydnUwlCj833hVbwjRa0zI2GzIMloFz7
         QR3WMfACqimAJkv6rNLTiJM7CqNwK3Ct0O0pLe46Pmn1rOi/59LohRkivg4FK3T87uqm
         S0owFsmRcGKeXUzUoXRyoxCiLUfLpmLiM3FEfGB35+IViDJ+ilBge+s/KGvdKqFdAQZf
         iOZQ/TitwnDfpopXYMNC0LvopT+zExQ+3/88SdgUlEpKpGGDhCZjOFa+srk4ialw+VLU
         HkcA==
X-Gm-Message-State: ANoB5pkLF3IUA7nFtSatXz9X5LnrWZwNtxVzrk3ntARCevI80GlEJCso
	r/1s7UBYGeUhOy0Rq+Z+da0PeeOyD6U=
X-Google-Smtp-Source: AA0mqf51ZRMhuFpGOYekWUSh7HZkRcMf4Nvp+AkGXggCn1PJAnsWPEBI4sBHqJYl1KwdwT0Q6lWryw==
X-Received: by 2002:a17:90b:2743:b0:20d:4173:faf9 with SMTP id qi3-20020a17090b274300b0020d4173faf9mr68888672pjb.147.1669792763400;
        Tue, 29 Nov 2022 23:19:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 10/10] flite: Add missing deps on alsa-lib and chrpath
Date: Tue, 29 Nov 2022 23:19:13 -0800
Message-Id: <20221130071913.1805812-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99867

Disable parallel build to avoid build race
Fixes

| make[1]: *** No rule to make target 'flite_voice_list.c', needed by 'all'.  Stop.
| make[1]: *** Waiting for unfinished jobs....
| make: *** [config/common_make_rules:133: build/arm-linux-gnueabi/obj//.make_build_dirs] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/flite/flite_2.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
index 9ab9c0208d..0a7680a8c4 100644
--- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b3b732d1349633a53e69356607fd2d6c"
 
 inherit autotools-brokensep
 
+DEPENDS += "alsa-lib chrpath-replacement-native"
+
 SRC_URI = "git://github.com/festvox/flite.git;protocol=https;branch=master"
 
 SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
@@ -14,6 +16,12 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-shared"
 
+do_configure:append() {
+    sed -i '/$(INSTALL) -m 755 $(BINDIR)\/flite_time $(DESTDIR)$(INSTALLBINDIR)/d' ${S}/main/Makefile
+}
+
 do_install:append() {
     chown -R root:root ${D}${libdir}/*
 }
+# | make[1]: *** No rule to make target 'flite_voice_list.c', needed by 'all'.  Stop.
+PARALLEL_MAKE = ""
-- 
2.38.1


