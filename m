Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECF1C83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 05:58:54 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.7497.1753250326644646033
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 22:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWWHF9qt;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7490acf57b9so4254771b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 22:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753250326; x=1753855126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JN8S12bhytzjFXKWLJ/Gc420mAPnuOnxSe3Sv6zOlZg=;
        b=hWWHF9qtqKBrG08YzwSUbG9GE82zLvceWcsOOqq+cepJ0sJVQ7sjyaK6MNRT3ZHI+h
         ffHHApth34QskJ/cGvEEMRbjjQ6e4iyq3sEmswvOZf/r4C2uX2lC4fcAzJpWSnlsMyaj
         uEbM2Lde4cxD0hnpPCzHLsrHhD1KBRr15a1Y6zK6D2qt3BtXzVd0siyb8bAIQE6w5uXn
         QCmjCHGJoTymu+aRwufMw6FPq4beN3Q52Vka3aDDT56MLRq5QXtLFPQKql3MCVDABgPv
         QdxwibRUoeHmgkqw+7SRbwjzkcJVC4YRr1pl4/XQ+hNRDH4oIo9zL0QXZOjz4UWTUKWz
         uYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753250326; x=1753855126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JN8S12bhytzjFXKWLJ/Gc420mAPnuOnxSe3Sv6zOlZg=;
        b=v6Rfaz6kLxja/hx++lXFpQN3chka0xSbbDzNPQU3xcm1P7rx3QWCFVY6D6LgeKmpza
         rBLY/GhyCGSXdGkueEyEw/BaL7LzzstZ3hCu1VeDaLpHtfUPwoOBzT/8FkNuQPrAIaen
         Z+TZpGriIv3MqAqQ+9zKTk++QEqmlUg9B7F922l+Iu+STPfHm/GHHnmsUCtt5upai0C9
         rzyHOHp+uIVvlv+95Qc6uMeDyQCB1+teal3opXC9R8xu244DiRS2xLVcmmgJlVf2NIkp
         lAMyBza1B/C/3MqNsqZf9zxRhZt3/dEG+0C4zQt+zMeWpgEVQOjxogWaC0UwcS/A3biR
         O/fw==
X-Gm-Message-State: AOJu0YwFF/6CMW3sVqueX1VzeAOeEn8QU/s3l7aJebZotkKbqiFldbrH
	xu7Rx1XWMrk3MotcSVakZg+kkVXvLfpDQc1c3Ac2UqCFUO8lEgQKZdGLqWwjrtkWF0w=
X-Gm-Gg: ASbGncsqM8z5a7h/0KyfhbZQuewEJE17Kg8gbNxHRaw1kQ/X+nfVhqNSI1RWVVhlPy3
	Vx9OAN68I4BzKXrNXgHdUK4wIXHelTouQHIGggP4Rh/M6x6oDOuUpWLqAYoQdccU+AGMrCmY++b
	/U33qfe8XlakALxagtMR5lbiA4bypsm0s+OtcNnYef2otL88/2nqebpxBKZzx/Hsp4wj1wHOArJ
	TNSrVoqKoY+qPeQsP92byHrhZlHm4WJB6o2xlvibU3gNaGvasm1C1A4expol0emZTY7O/83vJfL
	y2rtqNw1U5MW7A75VJhRH/wOXWGjBFn0ge0Wa+J9FSELG1NqzR2dy65pyPpN+lSzd/euSXCqNGf
	kFG/PrJOqyIhZug==
X-Google-Smtp-Source: AGHT+IGuAWbOgSk0QoG85bK/G8RMS1G7kMwJXsxoskGiPmiN4RhEquy10Xy3opZSUB+KOfc+ipeSqg==
X-Received: by 2002:a05:6a20:a120:b0:238:351a:643e with SMTP id adf61e73a8af0-23d4915202cmr2921463637.46.1753250325634;
        Tue, 22 Jul 2025 22:58:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d0184sm8858430b3a.50.2025.07.22.22.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 22:58:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] e2tools: Fix ptest runs after S moved into UNPACKDIR
Date: Tue, 22 Jul 2025 22:58:42 -0700
Message-ID: <20250723055842.3877849-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 05:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118714

Adjust for new paths

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index 38fa8b439e..219735acd1 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -34,11 +34,11 @@ do_install_ptest() {
     rm -rf "${D}${PTEST_PATH}/*"
     cp -r ../build "${D}${PTEST_PATH}"
     cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
-    cp -r "${S}" "${D}${PTEST_PATH}"
+    cp -r "${UNPACKDIR}" "${D}${PTEST_PATH}/"
     rm -rf ${D}${PTEST_PATH}/build/config.log \
         ${D}${PTEST_PATH}/build/autom4te.cache \
-        ${D}${PTEST_PATH}/*/.git ${D}${PTEST_PATH}/*/.github \
-        ${D}${PTEST_PATH}/*/autom4te.cache
+        ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
+        ${D}${PTEST_PATH}/*/*/autom4te.cache
     sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
 }
 

