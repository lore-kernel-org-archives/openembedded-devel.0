Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F001DC433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:50 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.25960.1651346321059723884
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MYBW8KWt;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1182060pjv.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m2+O6fbaBB+zh8liFcz082BIG45IN/0tBSyzh9nNFTA=;
        b=MYBW8KWt6p93K5zDdfJOcZecin2sn+NP3syKSewKtVpdoHfdkFR1g1TTmaP2SVCp4W
         xFa5pLlGxt9PjU7PfzUCaryhYcxR28LUk4KqFIu4wHsB0T2LE3MBrMsfMocIDB+VxWAb
         LDQ2w4nGRaavzOJPRkUpj54n7GSt5B1i5g5vhD3QOJQXtLeDZhUdmHxvw/WH8W/UW7hF
         H2a3cY0Lnjj44R8wws9we7UiPvNJuWSFegDDFDPLEgVDX38bPKd5873BpkZSYUnO38L/
         kjmSmziE7lICXDIgRgNYBTYtgKYafIleSbJQTnaYP7RPF6TatWyD2DkhXigbgWHKpPE8
         x0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m2+O6fbaBB+zh8liFcz082BIG45IN/0tBSyzh9nNFTA=;
        b=VW22UvkUmUny16a1vcZNlpFSxuuE3E7HqwDVPbagFkRNT94v2kLAyutEoiWR43VqTG
         DdKVVXoX2VZbA/BQZK3IwUUPeyeqXb9jiYeVcB0olVUaUK/+8NRFLItiA0EB8l3N6dTz
         Wo3l3F9dPjPUWfFB3HbpQnX2wufCgh26AFysSJ6nyKIR0nbrWcsFwedL5DLqe1IR7K3T
         dJlMfI+hS5ijrjhC4zrle1DCEEQ10VTBImnDq+9Z0pjHqREK+TIRtPxrDRoDhqgv2J5Q
         3M1gaMSewyvSlgJjgvEHoLX1LbpJ2F5HCaiej9bUdKmCePw9H5JsG1fSxcjZtUa4rpZI
         3Klg==
X-Gm-Message-State: AOAM531oMnuthldW7dJlcsp7MqVoVxJLPybaiN+5kcNMaoX1YdqYudG3
	Kq3lKVE90gPGQNjabL3se67uxZRJLn585w==
X-Google-Smtp-Source: 
 ABdhPJydGz/pB6I8+ViLwNKC6LedtWtclDxZlaUi9p7hcbvRqYRYotYoA4Su99A0hluTf1LW+OQG2w==
X-Received: by 2002:a17:90a:398c:b0:1d9:5e2b:b043 with SMTP id
 z12-20020a17090a398c00b001d95e2bb043mr10300563pjb.101.1651346320290;
        Sat, 30 Apr 2022 12:18:40 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 10/39] ufw: Fix build with usrmerge distro feature
Date: Sat, 30 Apr 2022 12:17:50 -0700
Message-Id: 
 <ae2e614954567483b716f07aa7522b20d7115ce2.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96877

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a47c833126334404fcad459cc683e304fee54595)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index 70216a85e3..6dca784bf4 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -38,6 +38,13 @@ RRECOMMENDS:${PN} = " \
                      kernel-module-nf-recent \
 "
 
+
+do_configure:prepend() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        sed -i -e 's|/lib|${nonarch_base_libdir}|' ${S}/setup.py
+    fi
+}
+
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/doc/systemd.example ${D}${systemd_unitdir}/system/ufw.service
-- 
2.25.1


