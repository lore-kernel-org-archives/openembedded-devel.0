Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.902.1793420136064443561
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 21:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HrkGzGRq;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b056d58f2aso13509717b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 21:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793420135; x=1794024935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWHYk6nGLCu4nq7mFEYbxMNLg4di1OaM+5aq1fAgsBs=;
        b=HrkGzGRqh72mUfUQQNZ72ZVR3SkB6Yk7Zc6Vj0+U/ntzAJ602pZ9Mm1hxTOov1ATbu
         fRts7Xf25vTXqUB8AGhfqqcmyt4JsD/HlE8fheCIcVMzBEQxwjiKOHYFQ0p4SCOcrY2G
         ilArgWc9c3Y5xQd8vOKVaCNPL0RqxqjssZlP0luDjzcOkwaQkbgodXs+jTYTVLDLwUel
         qkYu4Edn0h+AZCjEntyzH0ymrH64crVKDnz3SVjCs8qrTUaqjLMf7Mo9FbQeV+YPdCmA
         fQQhry/TlPKonrJGiR+bK/kghalSmxF/8HH2OM+QiFUXRHTcdvHjuEEXzR9j/hZm/bF1
         3tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420135; x=1794024935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWHYk6nGLCu4nq7mFEYbxMNLg4di1OaM+5aq1fAgsBs=;
        b=TPsmDnBo7TCRq3+SxXWJ5y4DMpiQyAaJd4+AJXhebMRJd83z8mgv68axUioRcrBX2Z
         oIjucbGsams3hzlVULDe1yASiTFo/PCL5M8htimCyQb9ZRCQMeMbeLe7w0n729yPINSj
         7TujXZcD11FgzbhiAtf0t2DctAeKUb0Vqh+699kpokP/XDxoyHr7vL61v4bQSj7vrA0o
         5Rtgh7Hu+Vp1LCLdje3c10/vlkdS12y/74R1gEdMsRnT3eDP1a7UG/wciog96sWLdl9L
         jmmY0skhN+GfraEDhUQKPGJToCG6vMMrwkpCnP4DUGRi4EKB5nYAAXmyNTMcdIqSLQsH
         E+9Q==
X-Gm-Message-State: AFq9FYLPa87p8mK3l0C0rqHatV1WwGO4/cFn7VTNPRkKvbkUAYKriS9k
	Ok74GPbsOOPRvs6f7U7rOnqy6/npRL3wrXgdg9sIkDUTR3hT7/6FrBlbNwl1pZYP
X-Gm-Gg: AYBFou0iJhTTAxHG8FtH62Tdl3fWwuaacygYoa3q7MBMAON9F0mhqVhs4VZtZNQn2Ox
	vHWwH7CK3+PC6HzxXVgwSInJSINQGiT5f5QNT9dmJncF/CNhRtJr73Df0ThNijGuHhXcLS0hyma
	cR1q5g2ESZ9x3xao742QXKlDjw2d08+xKY2MEyplZ83AF7da4P8f4ddKBVWEkjreMxvCy2jxfTg
	rDbyRLTtMIndi+ELoq883M/3A1je2RknMX2nof7PC7smPiOb7v84hmVyLjzB3Q82PU0d28PmMjj
	G448u+jKjd5cMofK53Rz1w3R4ghnwDexcszVYujMDMT19ds8v/KkkxUeL5CqgUCv/JEgQNAftxY
	5R8m9Fmz/VcOO4tZb8io6HL7F6meUHidHCMf8n5lyvFiimn5U7VEVxut7NmYzYIZkG9sblbe3Z3
	NAWNT+43OCMwC/0fPbDkSzOqdlRUks2oWHm8ueLyO1N/HFph8ngJ2e5xnWiwJXADEfRUZ3chJhf
	0ExznKtHE6bP62SiDfTEYXfJTbHRrR7wdVDLbYczrwkDjwSmPpFCkVBt3j7msDNAI1luXMMLb5d
	uDq70HFUsEPvVf+JM7n+ZnJBpqhJrJ0KeyjwudPE05MnI8yYG2FFxo/lRD1Tn9AnRgS67JK/za2
	3cr9rLv5/24KtHR5YNCbhGo5oX9V8k0N3Js0p/lVKImflm7qHCG8Y
X-Received: by 2002:a05:690e:168f:b0:679:887f:a2b1 with SMTP id 956f58d0204a3-67ba5002bcamr2160654d50.48.1793420134768;
        Fri, 30 Oct 2026 21:15:34 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2701f8sm1033176d50.6.2026.10.30.21.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:15:34 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][wrynose][PATCH] nodejs: 22.23.3 -> 22.23.4
Date: Sat, 31 Oct 2026 00:15:13 -0400
Message-ID: <20261031041513.261844-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 04:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131724
Content-Type: text/plain; charset="utf-8"

This is the October 2026 security release.

  4 high severity issues.
  3 medium severity issues.
  3 low severity issue.

High severity issues.
  CVE-2026-105482
  CVE-2026-105483
  CVE-2026-106069
  CVE-2026-111497

Medium severity issues.
  CVE-2026-105481
  CVE-2026-106072
  CVE-2026-106074

Low severity issues.
  CVE-2026-106070 (affects only nodejs v26)
  CVE-2026-106071 (affects only nodejs v26)
  CVE-2026-106073

https://nodejs.org/en/blog/vulnerability/october-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.23.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.23.3.bb => nodejs_22.23.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.3.bb => nodejs_22.23.4.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.4.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.23.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.4.bb
index 1a8a50434c..4dedfe36f8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.4.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "bd97093e1a1e9243338950c174a693a64d4e0926a9c6ce259962bc58d5e96909"
+SRC_URI[sha256sum] = "7b9adc82d612d0a2a863d96c46de2292552e250cee51956ebbe0146c42aacae9"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0

