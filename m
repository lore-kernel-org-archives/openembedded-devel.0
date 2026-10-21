Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10247.1792585768981126507
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 05:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VT8bJqvq;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac8a2ac52bso7510017b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585768; x=1793190568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OpqhlapWZP5WmJ5r0s34p458rP+ZPFE7magU6SdVj3c=;
        b=VT8bJqvqHGbmRgQaBDKHSCvWjWA9UpsXnqzlsCwtNhyGK7HDK+0KbFRKQ8E6Dnr/6F
         XHIIHm0rLtImHW+ewpRZI1NCWjShuJSPb/zU9vECAa2c0atjqfJwgwgJiSevTs9WCjsY
         voaFhS+7Mnpb9SbFoXXMJ7oALO7X1E0597JKM7gJTbCDOeOLVxpICy6016RoEiz+NfxM
         GM2w/3qgQ8tmqf3oSWZwno6KNqIOORpfxftDZkac6XXsWKRBHrDTv+glI+xNdaw6MjJ6
         02FR2OXu3y+SJ1uKnISOpLe1smjrQUVsJEKlbHM0zzoVEVKg9IjhG+Lq5rFaPTweWhD7
         v1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585768; x=1793190568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpqhlapWZP5WmJ5r0s34p458rP+ZPFE7magU6SdVj3c=;
        b=i3BiwNYMPfP2WhgZA8UYVnn5ZcJl0o/SrnYZ+BVq25OTp7202XJQspClD/kdHScCOW
         RD7oMM7MqAsoebZ7ewugFEQoSqgwav9iSJTg2IYZRArFzpYSfhsZ5v+smpwIWqRy64e3
         Gr6x42eoaFYsxzRRrvT41hI6FWqwGotXMW5Y6mhz7qmVIt85hEak+x1SzUiuJQoEoHMY
         E/5v2+6rFKTqH3Ca+S6eJYxizPO7bjTYvOZOMGwzsD0XiFzlHn7tXfr8vnpbQfzh85PD
         NV6WBjioxRkOkP+MZcnw7GpH75pdf7IyBaqk2GjDI/+G0OBijizf87cTmCHuTQgvGoK1
         V+kw==
X-Gm-Message-State: AFq9FYJjCZsUFn89bjY+S1ZAqpu9v8FaGdpnaf9xuxzjHEL4a1Px0sCL
	opMpUHbnqFDL/D1v0c1CBo2jkN6ptB4/RhTQ2miNfP7oOvQgcStrXUQ+gNhcFCq0
X-Gm-Gg: AYBFou1DQrwuEn2R5bR5/h0O2ptCcwFmngbwDDLZ1ZWnOik+gpeqy6dXIKZmJmTAHfb
	i9tzYsOprcXp0rq6nM/+yCGEVpxWSX+xuBqTflLDsE9JbSDsAdnbpt0a107Q0TzaaQ3WCNSb591
	BDmK3caqOKQpT4vCVomiDDOTMkPNX2BQhqem+YCXtO3i/XlagwBZ+Q2ODN7QyF1YViq0S+ADqy/
	BRmHnmKh6jGp4o8Y1DYJHIuys2fBl2KsO7EsTowvd9wIEhmiN5fb9cE3Qmo9TJZdLKSYd8U37DY
	Rx9tj3lK81WQfpfBPPuu6QsKlJi15ojIB4WInYNtL3Bpt1MGQKSbSi8Wkzqn/hFyR0TfF44KXvM
	8+BSCMPTGwfiEntW5ppCURO1UUOlkf5jxwDOix7LlegEQD+1gS57g8CRDgqO3S/JenPwSxChm8v
	hJMLxEcGowO0cf8f21MlsdlOrXGZ8OT1FmwMYNm0t/so39k9trWyThVkWNUeCy51iisBNFjJn7h
	socNIdPcHAnXDdv9Wyk2z6vSKX4RiKiLK97yQm99tdWNcVXqN8ptpKecXcLsKgrnqbLmUnoELnc
	g9eOkUVa34RWgOgd6+V6/NyxYaYWVPd2Ql1e2FpyFG6Y+9cWs97SXO7nlpHe7AzDnv1EISPRXOR
	ouBQ=
X-Received: by 2002:a05:690c:660f:b0:8ac:e48c:4f95 with SMTP id 00721157ae682-8b133b4bbeemr8702987b3.1.1792585767834;
        Wed, 21 Oct 2026 05:29:27 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b13012f91bsm10143327b3.34.2026.10.21.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:29:26 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.34.8 -> 1.34.9
Date: Wed, 21 Oct 2026 08:29:19 -0400
Message-ID: <20261021122919.2103875-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131299
Content-Type: text/plain; charset="utf-8"

This is a security release.

Memory corruption, buffer overflows, uninitialized memory, use-after-free

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.34.8.bb => c-ares_1.34.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.8.bb => c-ares_1.34.9.bb} (92%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.9.bb
similarity index 92%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.9.bb
index 058f3666e7..ae045bc25d 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78"
+SRC_URI[sha256sum] = "9364b70a12eb59a06830fb488d9357f90100dff0d98b23ea3593a183d43e6f2f"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0

