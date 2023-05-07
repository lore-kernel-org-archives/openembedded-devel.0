Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAF2C7EE24
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.69008.1683477212813701495
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ec1cvTGM;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55af4277904so56714697b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477212; x=1686069212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pezH43/cLpf8FmPAqppYYW9KQegrwhgKclZfvdYQI8=;
        b=Ec1cvTGM2nBbiDL8pRYRDe6HRcDfk9UzE8uaLIc/sXshqR8qMrEvTZ/H4ch0KRKpEx
         5waRvQ98ET0NbTcJGgGMXat4b8inKbIHFSkuHIuVPmWf2xGLxFEMHci77JL9Mj6fM+NS
         NJnQT4kS90bWBlxn3V8+eexd4F0Yb2uIelV+Bw++tByhDwXnYu9jL0gkMiE0A3cGyfVp
         AqDFfjAmDj+DdO6KD4dZCT1kRRqYT6ECc/AkDvZZi38beAPpS3sEy343FxIUYyVoYzZG
         S/yIA96e07G8Pr9XrsZOhJ2c8B+kk885+5F+IS7fHrkHypmsDhV7KbCuY31sQgZ4PDgm
         sjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477212; x=1686069212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pezH43/cLpf8FmPAqppYYW9KQegrwhgKclZfvdYQI8=;
        b=Js8sbSUq5PmwdvQzmtME90dqHxZ8O+0hGQU8lldPp1FAualkaclYUDDBQ5uPa2E+xP
         bz60BKRGPXJ6G1TTgF1UMWMK574UL9t3aqRawTdWNfqREojRF0RpEVZEh5x0x1mGYV0Y
         iH7rSEWDjtTvLv6sxL43OgupvKUvPnI+ufHWRFGW8w1DO9FP8gymso+lUpTL+idmoNmb
         C5ypqAynjsTFzQDtD/ki36p09qoj0rZe8UuMoHmjTqglN2C8qKWIr6pn0+YznyPci/jH
         bOnvPcigUzu1DRf/ZVI6Zk9l61oRXyftHlGM9iZXZJL1gn9hTZvVuHR1vDmDYHKdNHkV
         CAoQ==
X-Gm-Message-State: AC+VfDwF2h4ZROMs1U8cjwsfHAz02YVq57D05PN5bS7Uzy5RlYZrMJVi
	s4MIEcSrfSm4Kpm2kvNPiCcSwK1dHrw=
X-Google-Smtp-Source: ACHHUZ69w/sYTHERkmHCCNUxmS99FQKsW6eBv3WvtWAHfrdE/GsHm/ymzTCkq9rTXyDOkfii1p2hRQ==
X-Received: by 2002:a81:4a0a:0:b0:55a:40d3:4d6f with SMTP id x10-20020a814a0a000000b0055a40d34d6fmr8385401ywa.26.1683477211788;
        Sun, 07 May 2023 09:33:31 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 23/29] p910nd: Switch to using github for SRC_URI
Date: Sun,  7 May 2023 12:32:59 -0400
Message-Id: <20230507163305.3261044-23-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102353

From: Khem Raj <raj.khem@gmail.com>

This is new location where the project is developed now.
Pass CFLAGS to compiler cmdline
Package init script

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d6e59649ffea462899144748540c059ad8753240)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/p910nd/p910nd_0.97.bb | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
index a27edb1410..cd7f79ea60 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
@@ -2,21 +2,28 @@ DESCRIPTION = "A small network printer daemon for embedded situations that passe
 HOMEPAGE = "http://p910nd.sourceforge.net/"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3d82780e8917b360cbee7b9ec3e40734"
 
 PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+# v0.97
+SRCREV = "57ebc07ad8723ea4106090536c58c7f7160743e2"
+SRC_URI = "git://github.com/kenyapcomau/p910nd;protocol=https;branch=master \
            file://fix-var-lock.patch"
 
-SRC_URI[md5sum] = "69461a6c54dca0b13ecad5b83864b43e"
-SRC_URI[sha256sum] = "4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f"
+S = "${WORKDIR}/git"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "p910nd"
+INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 do_compile () {
-    ${CC} ${LDFLAGS} -o p910nd p910nd.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o p910nd p910nd.c
 }
 
 do_install () {
     install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
-    install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+    install -D -m 0644 ${S}/aux/p910nd.conf ${D}${sysconfdir}/sysconfig/p910nd.conf
+    install -D -m 0644 ${S}/aux/p910nd.init ${D}${sysconfdir}/init.d/p910nd
 }
-- 
2.25.1


