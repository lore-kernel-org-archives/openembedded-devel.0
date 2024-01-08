Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A87CC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 01:11:05 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.29611.1704676258304957468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 17:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0dA78Y0;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bba50cd318so1900794b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 17:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704676257; x=1705281057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cg+t4ERhPxaKRFBWzODY/ULPx3GKXD+w9IgN9SRQzVY=;
        b=k0dA78Y0a2+SDa7jb6JDpWyeCftfgeRjERy0VHVDceA5x8Tn48H7GkC1ISvuYqF2jV
         UK6pxhi2x4ciwvAyntw+1pdQmfKSnOHSDteecE/9+RARREIf7RtE0CxsWV7lXCrW5VHg
         hwCHwZL/IXvRuwL83czgoSm4SzCRaLMfa/vzkryz120qe3rfTMW+w+E2UOzZPQ2xygQ8
         choraKrBNZveo7BvWPK5pr1E5zpE5kpyDIU9pjfEjmh3I8vSV4N9yaQs6Dl2oAFjSvCO
         t6OmyaFfJtwPZ1lUwAeko9kYYfsuF259s+vCxgNAdObhNkOr2bNr1wTn6OBgBH/BMRhq
         dyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704676257; x=1705281057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cg+t4ERhPxaKRFBWzODY/ULPx3GKXD+w9IgN9SRQzVY=;
        b=auxfYQnGnvDRm/aivlb6WCXlwtCiy0jJtnVdOcb3IhkVHmNWfKD70ijadR4Pa57EKK
         J1nl7kPUM7yamMIbqB1cRSzYGjKm/6qe4FNQZgnOTKRbrgaW0T+70W8wclT0PtTr/2Yx
         OY5prvTlweUYn8Lp980ygMsSfh4BmrKQbajbJLvkqYWNr3P4ttuByoyfKftzqkcA2phb
         fDeJGISt4celA83+snKNf3Grq846JbsE4ZWyc6w21NcsGVN8GGahngbtmgLGENfS07G5
         SklZZPCT9AIphNZNr9bNt5Pj7dRIfINkcrGfGUQzi1HMDIthJb37BIs8XJ0ZMQOn6TD8
         djcQ==
X-Gm-Message-State: AOJu0Yx1PNoyyLuDk/c+I9hdrHtt2PHvili4XzTKGTHpRi3hwQFRQtyz
	qTuiYLM8COSXoO3CY4+OocJ5HrSwonk=
X-Google-Smtp-Source: AGHT+IEKZrHi+WVvNhVXyPuRlXIO8bC9r/RO8uXSx5k+9x7/XKua0oeqJpa13q/c3OTMMnU1RGi+4A==
X-Received: by 2002:a05:6359:4120:b0:175:73f2:a950 with SMTP id kh32-20020a056359412000b0017573f2a950mr3725161rwc.21.1704676257027;
        Sun, 07 Jan 2024 17:10:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b001d4152a6165sm4969113plh.182.2024.01.07.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 17:10:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-oe][PATCH] libtinyxml2: Package needed resources to run ptests
Date: Sun,  7 Jan 2024 17:10:54 -0800
Message-ID: <20240108011054.856869-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 01:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108079

ptests require additional xml files to be present on target for tests to
work correctly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index af5a994d22..cece68c632 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -19,6 +19,9 @@ CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 do_install_ptest() {
     install -Dm 0755 ${B}/xmltest ${D}${PTEST_PATH}/xmltest
     install -d ${D}${PTEST_PATH}/resources/out
+    for f in ${S}/resources/*.xml; do
+        install -m 0644 $f ${D}${PTEST_PATH}/resources/
+    done
 }
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


