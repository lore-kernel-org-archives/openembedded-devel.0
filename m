Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF3EC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:23:05 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6880.1684797777358250904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 16:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mXtPZZdR;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d341bdedcso2779051b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684797776; x=1687389776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amteWV9qR3/wX/Rmfm0mRlrw+DrcKS5n76vPZj43Co0=;
        b=mXtPZZdR3aq0Cn3mi0ZuyQBSWc+NwJ09gYCVstqWWawhJfJF6ToeYIUQ2bsiG/kbl8
         Yb5gTb47ZT4zknC2MFK0xXvnE6OsIyEBIeNdSXww5cgLRGNdupvjkFpC2U3ILV7U3GNm
         Je35sNHiHTCk1IRxybP5QKKgsE4eior/u2poDjHg5qv5vcb9uFvoLG2LZHcAjvUU3VrL
         iwz+USUUQsUle83UVVhI4owLQIuAeH1xiykHQQLc38s9P9h+7j+uHzbFKMsyilLCdzYk
         6UOWvmQWnBh+AbNwv6Txboigaa8s/o1yCLrCqmZcui9A5FYg4YIoUAGfVJgYr/FLwFH/
         4vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684797776; x=1687389776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amteWV9qR3/wX/Rmfm0mRlrw+DrcKS5n76vPZj43Co0=;
        b=L+OTP+cbKB8EHo0ZpOhKB7Q0Z9cQ0Gr6ZTNdrQUuVpHnPUtDH3EX3u/DXmwnxyzMkZ
         6GrEOfJvQtyz7/KIaa23adONPm7c23ck6GthnPjvrgC3IITUPRdTD/tGA9NUGAMUachS
         eYwp8txEijErvXD6+HJLE6eSjUtxSHSfhMrr+PEkWQjCgijUJ8NV25jPoF11iV+0Q+wu
         UxfQ5wjM31/dyDKhzdgNx25doDEzSAfouTEutjfQhT3/bisP8F6teTq35Q1dRk2rRxaM
         gGfkaVb+e1+NRXSzDGSBh7JB07EssuuwgINHESAZv7u0hnVkLbv9NHWZIDzqLlCCu6Iq
         ICUQ==
X-Gm-Message-State: AC+VfDwC5fZZtI3TULaZIilCJxlim1DrPEPVj0pVMT10H8FXgSVPWcM3
	yCKdQ44eMeszztjemIUoTXjh9/6giwI=
X-Google-Smtp-Source: ACHHUZ7857c/Uok3aRwM+hIXlaG2NRMRH2+7uZFGZbvhgQQAVWXcq5qG4gG924kAg8M3RIFkAxpNIA==
X-Received: by 2002:a05:6a00:1882:b0:64d:42cb:42af with SMTP id x2-20020a056a00188200b0064d42cb42afmr12305485pfh.4.1684797776506;
        Mon, 22 May 2023 16:22:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id x22-20020aa793b6000000b006439df7ed5fsm4621267pff.6.2023.05.22.16.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 16:22:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/5] oscam: Fix buildpaths in generated sources
Date: Mon, 22 May 2023 16:22:51 -0700
Message-Id: <20230522232252.3475281-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522232252.3475281-1-raj.khem@gmail.com>
References: <20230522232252.3475281-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 23:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102714

Fixes
QA Issue: File /usr/src/debug/oscam/1.10+11491-r0/config.c in package oscam-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index 25ada0ad00..bd2df5d8d6 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -17,3 +17,6 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir} -DCMAKE_BUILD_TYPE=Debug"
 
+do_configure:append() {
+    sed -i -e '1 s|${TOPDIR}|<TOPDIR>|g' ${B}/config.c
+}
-- 
2.40.1


