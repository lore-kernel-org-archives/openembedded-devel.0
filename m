Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEB9CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 17:33:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2249.1762104817848790178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 09:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CaW7RExf;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so21720865e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 09:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762104816; x=1762709616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGuTjIs97OtEV+Md+2uSrYRTM/i2oagY9RX07dVCtH8=;
        b=CaW7RExfWGi+MyLbG3BSwDTZryP3NTllKugV5BT62QLFGqmepTsnnqHaY34r4/UvZH
         IF7Pu13BqSx6T38WTn7SmhzgD+FVBZWmrL816BRp0J6mO2+hCrhSoTaA+dotAfWpX7iT
         zoI/heMmyNaBWW3PLzCmwiS7+aa8PtSXNFBZpu3t8Ss3pjiII0tE5EQK4jL3mwMO6+2d
         WW+b3qc2RtECj27GKoqzmfUK06PcilGHMAoELh+S0JIhUBsXT6IV4CXywSG4eiZKVkvi
         aaLu4pgCeT33Jr7nQXO56+n3Wdr4QohW8v8tbzrD3FWEHAfQdUD+UbAfhuKshCqCl5Ks
         0t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762104816; x=1762709616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGuTjIs97OtEV+Md+2uSrYRTM/i2oagY9RX07dVCtH8=;
        b=msqDbgIxax5No7MeZ0Bcvl8HN9W9VYNXrKBuL2eYU75V2emm1enKWy6rw59I9YLloo
         dhk1f3FI7HO0vt7KYycFrw3wS7p8pj5sphQncXyv1ThDd4GikpDW4UwkxbqEEAaqZBnm
         QrK6tp6Wn8Bs3uKqg4nFRmhxjIXF8NbPhVi2BScv9kdS4GYfbf5IcXW70kek3Rz226k5
         1hA4QiFTyo6vKlydvrZs8me2MYU7uFcWgYKf2uZqJFSLK+3oHYr+q0tmjVKWI/8cUYU/
         jGt5GsuOJDCiu8kvk9OiH46qm1yGtBptwPXKgzha2LL2vENeqmEQTenEDWuOuRJC6V2B
         K3uw==
X-Gm-Message-State: AOJu0YykKrf88uJvB2QJSlXc6yx77vXjk3EFXH7mvmWsRDUu0L+CKp2J
	ecq/vkWnBYQVeL/cP1EWdknpGkuaKtK13ZaXA3HIn7vICD6W0mZ+wCtJXFZcu8sU
X-Gm-Gg: ASbGncuhOE6kxunxyFIFQfkX4Hd+lFKSwI1LKHmmC2NEpQKl/1l+OVkFdz6qUswncaJ
	vjXHKq6dDXC4szTmYjR6SUqAu4wvyqrHnYZ2owTlxO/2taTiwlBNk65d0b+hADZIHU6RhePbdwP
	oVYVm9WU7uuM8/VqnuGXSRFebZZSQUlmK7QHGRHeH/E2pd0gNOnUdmSg0GooIhGV0TjIWD3UBfX
	i5mztvKsYaUTZzcb6lnBC0cQUPXltXD4r63udpwLY6d/9NUAoTH1kExEJ47WKPgz0gxBv5pKFU0
	WcReZjMlI9NqQkHLWseAbeQpm2y7C6r04GSmZ/wQLzeSh5CUrqLKazbxtSzA2lj7E4OmNm8i6ma
	SP+BRzIWR5WmOaYyebGiA5Gkbvbrsdif90Wn3jg58HI7JFROWA+o4fJqVrZO0Uka4WfgSY6Vczt
	CaTQsrhYYf
X-Google-Smtp-Source: AGHT+IGESm9bnYAisXonrcLSWLsm5nFmVeW5BQt/ggwnwm37hpjMP1NyVkvwZ4YNC2GujQGxONYabw==
X-Received: by 2002:a05:600c:450e:b0:46f:b43a:aee1 with SMTP id 5b1f17b1804b1-477308e124emr89550925e9.38.1762104815918;
        Sun, 02 Nov 2025 09:33:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c2e6771sm108650735e9.2.2025.11.02.09.33.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 09:33:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libdbi-perl: from from PTESTS_PROBLEMS list to PTESTS_FAST
Date: Sun,  2 Nov 2025 18:33:34 +0100
Message-ID: <20251102173334.2074092-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 17:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121259

The tests are supposed to work now - they were not moved to the correct
ptest list with the last update.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 825747d522..580c79d6d9 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -20,6 +20,7 @@ PTESTS_FAST_META_OE = "\
     jq \
     leveldb \
     libcereal \
+    libdbi-perl \
     libgpiod \
     libjcat \
     libio-pty-perl \
@@ -71,7 +72,6 @@ PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
 PTESTS_PROBLEMS_META_OE = "\
     keyutils \
-    libdbi-perl \
     mariadb \
     ostree \
     poco \

