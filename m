Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7969.1793701455463924449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FO90ZwJ+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so26615885e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701454; x=1794306254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ua+pqjU0sNh89Q1d3nxJWIXwKdMCbOWBjqRCtLSDXX0=;
        b=FO90ZwJ+5GyJx9RVoGI6kR/7qvUmNOuRW3GUfqqoEq/vqTlumxuFy0Qhxi1o8jWAFH
         Vgsxvyo7f/LhPc9X/tcTpRT46evqtPmm6boIoqQi2JjnV90zoVyAspU6jcJQmy1IYiev
         OLDS10st+YoGFXRlX794HU7VKaTY4FSOBuf6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701454; x=1794306254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ua+pqjU0sNh89Q1d3nxJWIXwKdMCbOWBjqRCtLSDXX0=;
        b=JxoztqDURvwg5pqmVlO+xfWEb1jRBw1frZkA0hkNG7ZZneJOLoRv9bZ7DrkHWF1Jf+
         4QzurMgXbMFzMAkclg12/WjG7RDrVOK46nN3UJ/hnWpLaU/o2BbbOAUZ20q4rQZZJDLJ
         JwULAiERA/x0bPf+19tIcgDFUOzP++kGsixuMLUqb2khNQl63CpVnq2tNM9POGBarKuF
         iK4PuRWFtS+fFsppWglE+XIai0VKdZYV9UCiLzff1ksdlYs/XpC3ckcXb+WlEdo+OtT5
         LbdFFVPSZRji4lEmmUxjnHRXxP5fNyOs6ZXvCOTSpnawSsF6Ctwq+vda+434kdVy8Dff
         0i0A==
X-Gm-Message-State: APuU4Z+QMxn6keUUTRmpllUtUEqOzq8JMBpNgZpOX4+mhjn1NWiYl7qm
	p87XKjO9r114ZR2RvtVKHaFg7VDyDTFbIB75VlPgbSCfTLdRfUipDQlP7/nLvDpsULpx1rjPlYf
	PC4lR
X-Gm-Gg: AYBFou0r2ImdBat/+0RW+sXDFn109dH/iL1VzKYOnW6Y5SYcIxSx4wDjT4YNFSpadBA
	wsnRJQXSuZlQPgcB7WGYyiM6aJzyh+zEAMydREnbukVfw26K5L8W7T2IZ/eqF+Pcijp3RIBGrrg
	eSaGyWeK0Uvn7atRWIsf3TX3VRPtBDPuf7KKyuGxr3earRB4fUVUzz9TJEdTE8XakrUhmQqflH+
	DHdIoQ2diLG8sGBsew3GIjUO1M+zdQkfMlnwKb8ymH65x6yuvUK+TUnDD9P6TnE0VhWS0BYT6fN
	IgNfYVRZ//0ggy+im2VSt/Q+GhCtNuosYlDqIhYJ7sfjfG+32caF/gtJEVlMQFKzujP6/i4O+I1
	Lh5DFrEPvN11Mbd+A0D1xNqAAY5j0qveys0cLGwiiXcFMZ0d7nFoOu0tcj6ywq3U5K0xPmEu0jW
	BR/khnudfVyoJoQDmd6yg/p7xbJR3MKO/UCCeW91DG3aDMi+/RsZJ2hwOdM+2of8hXsFkAMO/gZ
	+1iO+9KsxyN4ETrdHM4RPeFnNGXER0aid/q2mUgc0Z0AvR8RHuV7EOWi2rCzVzKruSm8GnYP2xl
	OZtXeCb1TS/lLw2marHut3XKBlRA8tfaiU3iTkpJdIjobPvq9qZnXruK/by+Bw6NiXKuRFmDkVk
	XAKO8nn9JWsMmWN9BfZjM92tMcn8DkiArtP+KIciu+McbRrbOa++dGg==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr289203955e9.20.1793701453771;
        Tue, 03 Nov 2026 02:24:13 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/22] python3-huey: Upgrade 3.5.3 -> 3.5.4
Date: Tue,  3 Nov 2026 12:23:37 +0200
Message-ID: <20261103102350.1952237-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131772
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.5.4:

- Fix possible hang if worker holding the stop flag was killed
  while holding it.
- Lots of refactoring/cleanup.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_3.5.3.bb => python3-huey_3.5.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.5.3.bb => python3-huey_3.5.4.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.5.3.bb b/meta-python/recipes-devtools/python/python3-huey_3.5.4.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.5.3.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.5.4.bb
index 722d25baca..9a5bd19d0b 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.5.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 
-SRC_URI[sha256sum] = "3d9e8fe95638bde843fbcfe38c063d906afa0d4b0cf94955a24c0f90eb09bb44"
+SRC_URI[sha256sum] = "328f5a2dd1406621e5edb17d45655ae232ad9f32c0795ca8dc0bfc121dd7b30c"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.47.3

