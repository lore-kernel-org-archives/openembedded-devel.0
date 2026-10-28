Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36064.1793161531099155735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=l9Fof6b3;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso280535a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161530; x=1793766330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmMT3+kwVDfmorQ0rns4OJPGCirkRqhLdFl6MlSNsuQ=;
        b=l9Fof6b3NT+xA5bSTNXYcHqNomzilIVV8uVN57b78b7jQo1Xgx6/UzwPe0pAuvessg
         CuUAUUVidD1ua0us5tpUaz6YlzfQu/jBgC0X6eeQFoDDiCuTaJ5HBDfV9ELM6hUb15jU
         k6qz1t7bQH933Y4BzQJ7r4l84MVPqIw2Brxk8QwXXEgez1I3PG3hnUB8Bw/GbyAnheT5
         fyEJ9VsLIIpd9882aAL34dN/yZOV9PqZKXxg3g5bKCWBvbmF140fpXoRhbvQMfppruqp
         LDQS42OcQhw1iozo16lxPa0Z9iGVVtZtYnOo1s6bGkXQVigZD8UGVVaVS5wNEJwdopuA
         rLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161530; x=1793766330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmMT3+kwVDfmorQ0rns4OJPGCirkRqhLdFl6MlSNsuQ=;
        b=ODltp18jMoKowBJqWyFqyFwin1qRLLSsEL5rve42bWTuCfsKX8B5jlTHlNoYAmQI/u
         TJwETe2RGuQDzWoWT+mlLRnG2CCDJYTZduG4x2EBue58VlIox+sV5odrYQGBzIuxuRXV
         2ohfZTgHQe0zwvDuQCIPZ3vPkdP7KixyvQHb6jUcvPkDwstZp4NvB8APvcLDr00p1JB2
         ojP/1L5rvRoR2WmLOXTS2M189/E8crtwpM+aQQ7Nef3hDAqSw2KAcykRX4ynjqL/HbhI
         R407e+UlAOOrA2CsWj6bo11+ShqhX6sKbaOMAhqUAVRcDpKttOaS25xKbUnQb53xBpCX
         pP5Q==
X-Gm-Message-State: AFq9FYIINmASSRE0V7hGjig/NeileL8rxlrJ0XNiZC7U75zkN8GldKdM
	6PGU9VuQ2dHkOjKZcNUU0HWWueMQ1PAZbZn0h/FMokkKQ+BPcub5npIB5O86iQ==
X-Gm-Gg: AYBFou1ww4fwjt02fU3AIFLtS5SMtlHiNuIuFJNm7sY5LT4qpyoTgACg3M6lQledrwQ
	fxQUdr8Jn6nrpfgHcHP4tW3ihOsdiUlQ7GqVRgUCI0KZKEAVe4WwVDRsetO938hVL9P0uEcAg2k
	8LiBaMGVd0dxnGHwOStnBR9LDfqpCNk64JU7uYa9ccmqLUMsbJZEhw9BQylCt1uGBzK/8l9aDPJ
	RcfHjHKdBJV8KuePWVL0X6aMMvps4dBY2xnrqrxuR/Mj4091c3knIScOWbYniiLHjiZDMxR1Ivq
	k+Xd8LbXSTuqDPmq4nijFPE6eHzhPCNQSQ+ea32iHqWz7vG1AdmN2gv745VOdZZYY5Pbketuo9u
	LOi/TlTnriTA0Ou57Vt/n8y6Bp0mXtWh6M4ooCSu0a2uLSxPIUKFE5SG5E+xzhIPvTHE2pHVC0x
	baW4enShBkiR5rxoaPOf1kP7AeET5pR0v8cSBdvzpuPMW8mLsHvVY7yHOC1ADVxa4DNbmp9i7pO
	cSba0RIVfdliSzMId+6otxNrNihbTNiuCxq7ZV22tTBuNMxl3KG+17fnvsgR1H+n9wdcUdJJQCf
	HYNGT7lnFLopNf47HLmG3Sy707IpVTngXAHDog/5y/mMrkJhGQg8FDqksKga8A==
X-Received: by 2002:a17:90a:c886:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3ae57e07e4amr871931a91.3.1793161530462;
        Tue, 27 Oct 2026 21:25:30 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 36/60] nginx: upgrade 1.30.5 -> 1.30.6
Date: Wed, 28 Oct 2026 17:23:34 +1300
Message-ID: <3ee18e1a429a409bfeef263a84dc3012f02aa69e.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131588
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

2026-10-14 nginx-1.30.6 stable and nginx-1.31.7 mainline versions have
been released, with fixes for buffer overflow vulnerability when using
alias with rewrite (CVE-2026-15176), buffer overflow vulnerability when
evaluating string expressions with variables (CVE-2026-93479), request
body injection vulnerability in HTTP/3 (CVE-2026-95101), session forgery
vulnerability when using TLS session ticket key rotation
(CVE-2026-97629), and use-after-free vulnerability when using
ngx_http_ssi_module with AIO (CVE-2026-97205).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6cdd413248db5aed93c6cc138cbfe0f83ed81f56)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb} (81%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
similarity index 81%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
index 6b638cdd96..5d699e63ce 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
@@ -2,7 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "6c20565aa2325cb82216ae804f4a4ff1875179014759a381c42ddc8e11c4906d"
+SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8"
 
 inherit upstream-version-is-even
 
