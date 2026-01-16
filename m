Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C74C982D0
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:33:27 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8684.1768577597332931948
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 07:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7BjpH1I;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso11636495e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768577596; x=1769182396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7cz69sbLiVI+MZ5Z8Mpq0XoybGTGx8poaJS4kcJsNc=;
        b=Z7BjpH1IT6GfY8uWK82BWtcU0ZjhVMhmnjJSVAPKC8HoQH5lLAMIns5bPy1QASGTDg
         I3iJXlwSiE/6rlP/eSjMSUpEVBXPsGw/6d4qhpacQjB9qEz4TgvHfpJMjdzgkmmOAZCe
         JuWwOWtxtXSG2vLxN/WfoOQwCWc1dcGRXQQlw8gzWIeOnVedBQJ2+lYF0LkmsiGmbxeU
         B1BTYFgOBCh39xkuL9wgCQpJuBDrrCez6Qszd9e9gob1U5cymhzdTGrFXHtSXrtet3zs
         SB3zT/0Zm6JktDedFQsJCcfBZRbCZ2xyh1VTkdQvkBZQbFkZRhugdAW+XHXBO0if3oFL
         rHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577596; x=1769182396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7cz69sbLiVI+MZ5Z8Mpq0XoybGTGx8poaJS4kcJsNc=;
        b=r1hYKxVNdv2dGJZkrJIHTAMeoRAPeYaPXuZfudjFwcHNLiMMq6Z197EtGmlEIItNcY
         6waK6MXlhX6iEjjCnQ9xlTbzFTgnbiAFp53hwd/tZ8/QFhXoi2dE8MNJaI9tb1f6Dp4F
         DuiCuN1mTXjGIIVQqoSczRvs+pyvk4aAyW5HTAiijg0uT9bSju+/6Ok3WXswYSdKqF3S
         WMlOjiZ6+QBO1T53O3v7LsjshqEt4FUv5KCcQj9dkx38duPPifGeKhydekFxA3gTdWYe
         VhzoSfrlQAAhSJu02yu+u2q1XzR4nbwnYk/LxAJs4dvw3JjyqfcIcOqQs06R8TIhxn3P
         m3tQ==
X-Gm-Message-State: AOJu0YxTNZfMgFOXSI5bv9IPR/MDFJXYRELQkYazTYc/QnfaJf/CUo9M
	fsEjKg0sXRoVcIpTM7nBNzHfxp3wyz7YvmqfWUFdUiNPf6VzwHo2qYgUlhVWzA==
X-Gm-Gg: AY/fxX6DiSoUCXRsyM0W9YOeNJsRby9lunf/38hrNS34vOoL5c+5qyDDd3V7D7Ikqk1
	/K02aIFQASRbS/HXdn7fucyB2aFtlvqLjRw5IQJHHbJdoQLkgphTXHRGubC4Y9r1oFdSnzZEKkH
	77JK6u3+TEtzn8ssi9BMJqCeP8dyLT68pOPMORksXG68DvqqocuhgienFiq4ExULgodQU9S1lqb
	Q3+fYfjoXldeddlGejr5GLAdDUsRQEiPY5nObwGZfHx0vveKKEcMxZ/lNUCQfGRzer/LrD2rGJo
	00S9d8eKpTiC3a4AyClWH3om7/iUdc3YpZLAvzeLCpHuomRtkIkb4byhhMa7vCLNdssCP0XMJKS
	kmOIarYkMTmy7XN1sJXo/pEaAfxe0T6+JOOwhnpRAvhk0ocwxCv2KrrNVUyaNqCI6n9gjgOKk7w
	ODOiABCDQ6
X-Received: by 2002:a05:600c:1552:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-4801eb0e021mr35882185e9.27.1768577595567;
        Fri, 16 Jan 2026 07:33:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801ea19f94sm21010985e9.3.2026.01.16.07.33.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:33:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/5] python3-django: add recipe for version 6.0.1
Date: Fri, 16 Jan 2026 16:33:11 +0100
Message-ID: <20260116153311.3444648-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116153311.3444648-1-skandigraun@gmail.com>
References: <20260116153311.3444648-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 15:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123536

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

