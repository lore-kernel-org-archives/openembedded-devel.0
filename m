Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E7AC7EE2E
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 23:27:35 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.413.1684970846193324910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 16:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Isirbv9D;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2553b0938a9so624067a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684970845; x=1687562845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTvYfJ8w0fGj7mEDLOVtw5RF6tZmDCfotX0+R4L472c=;
        b=Isirbv9D1SPImWYUD29fRYWWgLeZHWsqtowXVd3mArfBokTRbevwHHb/sCyUcTR57p
         KDGNdSU/e1o9yGIvYtIADK+Rt72vAeL/BPKT/kDuVUmV/13BW7k/gWfgArPmSYdjvmxn
         kmIHA3ngmzLl4cxrhmNnukMq8WUessHeMjjCTIGwWNZqZk8kJCUQnklhr8iDPClqaudD
         fEL7Fhse4WBLoOf0rBkbohPi2yNKm5NFdSeyKyu8bq3h4MxFRzDH/mnKMyPu6DTePi+k
         okB+smvnetvrwtvkOIrHK2TYaP8Yd6AecdFhT34i/2I4AuIZuPHCKqVeCyOGq+0z/IBd
         hUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684970845; x=1687562845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTvYfJ8w0fGj7mEDLOVtw5RF6tZmDCfotX0+R4L472c=;
        b=MkrQ0rBKMxqEGuaQe5D7IDJ9mRlLjJYsd29oNpyzsYXVasoQPPmqIUbVtfMQvqleuf
         LOSc80PdCmaJtQdWZSn/IYq6qK/Gh9Ej4RO3BF7fvxxyZzKpaUxLK+CA96O8gaq/IbYa
         iA3g8L+fGYQhJ+gZ3wm093haZqH+/xhSPOa1thvs05AoTc4B5KcJ2lZblbbqw9ZHphGU
         /EFw2ZMso+APq0gPuS1sqSlETZ5cWebN1MzumDli9eGF8N+kXNJV5H/t6Fa9leRYuSrA
         fB6D20Wk9MUTHXn4Wusbgbh+Diq0WP8psk59m3hdmIqRRVIHjZX6B4UtlnPhTUzC9S4S
         JP9w==
X-Gm-Message-State: AC+VfDxqh7x4vEjR5PwExcXqjyD2Cz/M3gDJVDBvyGBs4g57HCb2wYUe
	3Bu4lYWNzOwXYBR8a5Yfs9ZPiLcY4FY=
X-Google-Smtp-Source: ACHHUZ4cCAwFKR191hMrXnfJwf8GDr+JGFmIIk0dvcU6eFvVAqbYsGO6akhtcpdKfu0LHbYe2vT9Ag==
X-Received: by 2002:a17:90a:788c:b0:24d:f739:d62a with SMTP id x12-20020a17090a788c00b0024df739d62amr18990240pjk.23.1684970845171;
        Wed, 24 May 2023 16:27:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id h22-20020a17090aa89600b0025315f7fef7sm1806013pjq.33.2023.05.24.16.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:27:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] freerdp: Fix reference to TMPDIR in libfreerdp2.so
Date: Wed, 24 May 2023 16:27:20 -0700
Message-Id: <20230524232723.869580-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 23:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102795

Fixes
File /usr/lib/libwinpr2.so.2.10.0 in package libfreerdp contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
index 0fc779a60e..4cb452608e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
@@ -54,6 +54,10 @@ FILES:libfreerdp = "${libdir}/lib*${SOLIBS}"
 
 PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}||g' ${B}/buildflags.h
+}
+
 # we will need winpr-makecert to generate TLS certificates
 do_install:append () {
     install -d ${D}${bindir}
-- 
2.40.1


