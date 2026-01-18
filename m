Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC073D4A5F4
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 16:27:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17250.1768753666805611935
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 08:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LALa0Pr/;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso31530895e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768753665; x=1769358465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7cz69sbLiVI+MZ5Z8Mpq0XoybGTGx8poaJS4kcJsNc=;
        b=LALa0Pr/64vojFIf69k5gBZa2YhWVfRNLsQRo645wOYajBifmLk1wkFuahVIoEQ3Zq
         n2lPNWjuDfshU+DoUQSEM/TdaXtxm6V0nLltEgbr8SSV0/dLuV+wnx2MK0fxr9/LVuhh
         1krY0oF9JaXuCScUzA5XpViI6CJTHVKGgjGf+vIWl8N1KMGkewlTktqbyEAlX9HMqjRx
         iSoLffJeqy3t7xyiZWkzv55Kl868+XUwlDUJpPONcMB87ieXtNHV3hAqplYjmQQAuJO+
         FHaBUbRvaHZlWCU2znZp3GUHpsSoF1wfIynnDFYzIHkpnfT+V5jlte/OtUNC0/neL23V
         ePdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768753665; x=1769358465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7cz69sbLiVI+MZ5Z8Mpq0XoybGTGx8poaJS4kcJsNc=;
        b=ANVbQ8UczBsgVRU4rMDfMMyD5GDQgGp/IXhk1ZzPkIsJI1XWAQsHCmK72MdVfJJoZS
         3bI5RynjZEYTk2p5vc+Mh4KvNmwrEB9qCR9RhM1fippfukgJ99RkBfvEqFdWgx9wL5WK
         hA5kdxnL/GMSe7S5Nn+F/S+2nHubiqmVu7SoBKjDW+uqnFb/oti/5aO7egvUlg2ckwE2
         +sMl+egnO7a/2CFCSQnQw6Ka005ZI1Qj4qXFcnywPVv2d90nQ/OAmK626J1a+RRDb6DQ
         20yd5gtR6h3KookAqLKcyNFIj014yOmMG8YyjTBx8cdOAgX/2Ik8cAacp0nHue45a8k/
         vXpQ==
X-Gm-Message-State: AOJu0YzbShJN9YG2r1Z5kEkZySXQn2klpEZUnNgFvgMzIZ6yd3HVVvcA
	CWu3hOoir9uLyA0yBeCFJKNj5MgTJKHokVVIvY1M9B8I+eiFh7x3o+X9r+SZEA==
X-Gm-Gg: AY/fxX5jLiRRDeFKTUY+6ELT+EYsGUdiGnb55f7fzA3Cxsb8yZPM2tMO8tPUf1DBJMe
	dB5ZaSwZtRurPfc9sveTWagE/OWO5b4Xpofv2Bkhx3PcBiZMJ3eSMv+OJRggxN1Cj9vum0deWbi
	XwnblmuT7t8ikiUj/I5boKiUvqHpJv7QV32DUWqMhb/KGrU8Il1pyHoVL0LVqwurRalCdiCu3sZ
	+PGfIiujnFaYCXzX3lqktndX0QaGWMhwYmdjl3UCcRXKirKNFuVQb/awfx/A016WhJDu3r4SB7H
	+mfEKeTM5n09InR5zNW/wBVVKlzsgcYL/XQ/1qKNKnLeH7IKcFnoQWP3+X7AYM6Mef3+1tIk0Av
	i7OyejXt9H9MTFER9gDjq6cByBwGspfi31k3z1yylDBcEfsjHMeDS3Hug1dC1pvAws2Mh9qRq8m
	x4KSqddUWY
X-Received: by 2002:a05:600c:4449:b0:477:abea:9023 with SMTP id 5b1f17b1804b1-4801eabdecfmr89996735e9.9.1768753665102;
        Sun, 18 Jan 2026 08:27:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe47dddsm61402165e9.13.2026.01.18.08.27.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 08:27:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 5/5] python3-django: add recipe for version 6.0.1
Date: Sun, 18 Jan 2026 17:27:39 +0100
Message-ID: <20260118162739.3764017-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118162739.3764017-1-skandigraun@gmail.com>
References: <20260118162739.3764017-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 16:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123576

New, non-LTS version.

Release notes: https://github.com/django/django/blob/main/docs/releases/6.0.txt

New features in a nutshell:
- Content Security Policy support
- Template Partials
- Background Tasks
- Adoption of Python's modern email API

Ptest summary:
Ran 18643 tests in 164.287s
OK (skipped=1404, expected failures=5)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-django_6.0.1.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django_6.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.1.bb b/meta-python/recipes-devtools/python/python3-django_6.0.1.bb
new file mode 100644
index 0000000000..9642a3c581
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.1.bb
@@ -0,0 +1,9 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "ed76a7af4da21551573b3d9dfc1f53e20dd2e6c7d70a3adc93eedb6338130a5f"
+
+# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
+# default. To build the 6.x branch,
+# PREFERRED_VERSION_python3-django = "6.0.%" can be added to local.conf
+DEFAULT_PREFERENCE = "-1"

