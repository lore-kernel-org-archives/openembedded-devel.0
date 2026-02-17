Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59455E6816E
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:31:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9269.1771324270810179120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aEjN0mg0;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43638a33157so3919402f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 02:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771324269; x=1771929069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4aP7ab3TQBEO1Vtm4vaO71lDRjAKzMsEbh6sm30g10=;
        b=aEjN0mg0YKKXhjLEd0pgFlQ50aJv9yB4fHNWmFh2/0lEpy2I6e5RtMXi8GGzgajw6A
         O+q7kVX42BQOqWvTN3tGBe4/We0a5WG9b8piXMu84h7Sf2kcsVURhL2WgPjyHVu9aiza
         bbf3xtVzvyDZdEUQg/aJjxKZEmHlhUxA7/apU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324269; x=1771929069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4aP7ab3TQBEO1Vtm4vaO71lDRjAKzMsEbh6sm30g10=;
        b=SufJnEzBoz2VKDxlRASWPbJqRjn5biEorZQzxJHbkEgh7Omv2/Xd2yrGwxQZSJnX6C
         4Cayt0MnNKK6csmcW1A0hW+TjTv7glFvUdmUWhQ2f/pPB+1tKPSQq93RHjDlsoeGOU8J
         o4hEXkAP12xdT0cLshmiIG/3EAnZh+3U3SUPYBJRFgUIK7NUokncMJvtYdFYjviJ9i/f
         ScIrXDoV4azxPen1qdiF2Vmscw67biBXzZBYRi31jQ3kPCuRr8Jxz98bemO9RrGltp50
         XXGLLK1DD0XkAnEQpC5USobhdwDcTL6bQCCa8uT//kd0xRuKncwtv41exkJpb8IPg+Of
         g2wg==
X-Gm-Message-State: AOJu0YyaxSVhq+q4UEYXz9yGefrLeFfvRXvCo+KTbDWV4Oa4NfGzvoxQ
	vaIOqSUomto4qL9nI3IjVQwgPgIpCy0WaA4TwYeCX5E1DngWSMy+evnnf7VeH00QlpPmY3hsqMS
	g5ioX
X-Gm-Gg: AZuq6aJnCSysBf3DIXMpjfN5MpclMDDrCCruJo8nEf3baCqN+6h/rPVsJ8BUKDWpCv7
	zbfwMwGrviOyOXdLJgbN1nk1/+7GRCyTYpEG7jBKb/1oNDUEQ+sK3CgVTQ1o9h18j/YilutTCHr
	MX39fZPgPevkE6Rf+EA72w1U9XsTEULOvC6hTWUt32sEbFzms1tG3RJBM71oMHK7m9JRUULMzCl
	OAxZlBjWDRkuX1IS3JCSrOhuPyKak7Ay/DQ86Q1ZeOb2PxsFMN7+dctRVF89T80yLS5AeAZgm3x
	VQHEIu2iMpIdm5i34QYpbvmaH7msMAbOfGQxxm8r5QkKZmL+C7uDrjyGviZYSYJCFtKJbgNuKha
	JiY14hpknbyByKyisYn6h8YNg6uixo4M/oIBMJjVHYWfIuewC3GVHAWAKKnLPPM4IVHBgLnYZXB
	eHbYq5oErsjuDBOZx2ifrckJmqouQld64pt423u+y6ImhyPwI=
X-Received: by 2002:a5d:5f82:0:b0:431:3a5:d9c1 with SMTP id ffacd0b85a97d-4379791c1a0mr23790699f8f.30.1771324268369;
        Tue, 17 Feb 2026 02:31:08 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm33305378f8f.31.2026.02.17.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:31:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-platformdirs: Upgrade 4.5.1 -> 4.9.2
Date: Tue, 17 Feb 2026 12:31:03 +0200
Message-ID: <20260217103104.2849723-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217103104.2849723-1-leon.anavi@konsulko.com>
References: <20260217103104.2849723-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 10:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124447

Upgrade to release 4.9.2:

- docs(platforms): fix RST formatting and TOC hierarchy
- docs: restructure following Diataxis framework

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-platformdirs_4.5.1.bb => python3-platformdirs_4.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.5.1.bb => python3-platformdirs_4.9.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.5.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.9.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.9.2.bb
index 666ba6805e..cbe638d47d 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "61d5cdcc6065745cdd94f0f878977f8de9437be93de97c1c12f853c9c0cdcbda"
+SRC_URI[sha256sum] = "9a33809944b9db043ad67ca0db94b14bf452cc6aeaac46a88ea55b26e2e9d291"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3


