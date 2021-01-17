Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.21060.1610905024689912491
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHvNNAxa;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id v1so7976551pjr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hQnyVsv98SLX22q5+L4u+ew7k6ZeEhxEDBb5P1G1Dv8=;
        b=gHvNNAxaK8niZRps3EKOiIgV0E2UIqKKrdwm+g43Xu+1wkkJ4nlAvajZbO+udHk76i
         DoDgbBNr/6J8MMJCzUatRMGPfSat87PIo75VzbOzJE1nVhLMESwCrkwzWwjUKouRMfYR
         VRrFRTPWqlFwJtlDC33Yhe8MbsTfgZx8BT552XAPOs70hzu5po08XmiCXa+UqZrprPyn
         v2g2LB/7WgmrrzX0hlUgy6rDwnK1j3tbP4fL+aYjj1OiFU3ld1FlntBJ0hDUQokXBEI7
         PObjOwIDfUF+2wk33BzDE7q5Mp8E0FG9nT3O2CS4kHDluIOpzYTAuR51U1EOH1gP2LFp
         HHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hQnyVsv98SLX22q5+L4u+ew7k6ZeEhxEDBb5P1G1Dv8=;
        b=Ic8uAyYeJ+WEqghsZcdTupk3djN9wqaPzuMSF3ri/t3EB4h7mn28eD9Yxa+zBzfNBF
         6ZhNRJbmMudp11RnHp8S6f/Yq7+U4jPJaTA+RRDiSk/kbJpjmhYjsoYKSHibnZ6dQKTl
         epeRY/gDMrMKhik4ue13r6lur2MD4NAkGgGBn0+YUKEs0X5Dqm8sStTEnA9pCP0rEmNQ
         xHwgtPnOF0eaAUdQRMJ+3TbhBnJknEQMtcXHAUwNJKy7j2Vy9zjbJ+4FtKCshkU3q95Y
         ZDW/PHPBvD01JXZG6zwUZ0CKrfD5zCL6G1Q0v8GglkvaNeElxciq00obZc6E91U4hCLa
         Be+g==
X-Gm-Message-State: AOAM531AWlrlM4ZZSikBzL0kK/+B5BzntfcLO5iEEYtZ9AAKhWJLveTk
	8bzLHJe+9923feKnu0AYC4yRbg06uOlJYQ==
X-Google-Smtp-Source: ABdhPJxnLno93bRQLoLkoZ9sDnHfBmsON/0UJEqLybRmE1YRAkX00Ir92k5YGUd0cQs8DT/84iW4LA==
X-Received: by 2002:a17:902:e887:b029:de:7863:19b0 with SMTP id w7-20020a170902e887b02900de786319b0mr11610146plg.42.1610905024150;
        Sun, 17 Jan 2021 09:37:04 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:03 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 23/31] tclap: fix branch
Date: Sun, 17 Jan 2021 09:36:28 -0800
Message-Id: <6313a640ab1a4ec27f41324405c7d0396fe2d8d3.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Chen Qi <Qi.Chen@windriver.com>

Upstream has deleted the 'master' branch, so use the 1.2 branch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 583fbb4775a960391cb62d55164b91570a70921a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
index 47ab2fd7b2..bba8d5c215 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
 
 SRCREV = "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
-SRC_URI = "git://git.code.sf.net/p/tclap/code \
+SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.2 \
     file://Makefile.am-disable-docs.patch \
 "
 
-- 
2.17.1

