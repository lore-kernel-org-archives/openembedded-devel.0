Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.12940.1589899424067699657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJn6i4jl;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id r22so6495196pga.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+H3cw+Q2+wUCWT1lgFpzBqw1Af/ibu2tD3oS0G8t/5U=;
        b=KJn6i4jlAAXEJm7Ck0tfVorbvsLi3yJDUCP6rWjglq6JweQTrjqCxnRnk8xKmMYBDk
         MP2aKHlQEtcZ0WaMrRXLGt7c6ZQWv6ciSrTtNoBx8nAeN/yRrg6euz0vuwCThSPHNODe
         LNMJx6r3FOb0K7+XbrIvgnFkP+Z59NckopZ6jtkXiT/DoF7fHAO+wkjvLZqBI39Mgqby
         +j9aS2cfvXH90wwQLAHxSt7vs0oF/gGKVm5kUFKfqkI+kM40gyHcCoB8mt6vwf5iKFXl
         t9MUknEnM108OQkHu7R86WM/InPvirhEPbH6VFz8M4v2pQH41vuLaq0YhuRTsOfXFMqt
         QuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+H3cw+Q2+wUCWT1lgFpzBqw1Af/ibu2tD3oS0G8t/5U=;
        b=I/LYOEEaZKfSuhQxLNycPl6/GjBfN9FDNHl/w5dcoaiNliA0fEZXhiel24rF2K9Ttn
         FV7+N+Hj3HudTZmAo+LrXSM2jcipB+fw7YkLPIWDIbVUENKDQEF1hNmBK2/WvP5nfIf9
         RfRNUmgvTMpTNqj3BzqwE/r7407YefBJ8OnpHknjlB5mlqBmMAOFAcOBsSJbb2gVnWPc
         vshSZP7cz7t9buV0IfnSfKlkL3hEvteyNAJgV2MI4M9qs5VAFh8u2C+6tTKx51Y0aBjI
         NbQvgV/8NHUe+caA/gXHnZIqOe4EdWYmEi7HZnblCbqnQ06LlD7mvi/sJ+oH+OvGIG5Q
         wJBg==
X-Gm-Message-State: AOAM530UE3FaveUxJ2bekcn/hi37SEHGJfLbQru/O1xY1+YlOR/O+H/b
	hTBRq21bnXK4DmSoedQrgZRMGubt
X-Google-Smtp-Source: ABdhPJzx8kJUnprJiL6j6uWBk6EcbAeM0CQCfQbZIRUfsEMzMxfJdR5zz2mRzO8pNpB4fTZ6Dc9rug==
X-Received: by 2002:a62:9256:: with SMTP id o83mr7660494pfd.216.1589899423365;
        Tue, 19 May 2020 07:43:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 08/18] python3-werkzeug: add python3-logging to RDEPENDS
Date: Tue, 19 May 2020 07:43:22 -0700
Message-Id: <20200519144332.12822-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

werkzeug relies on the logging module, but it is not in RDEPENDS,
so add it:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import werkzeug
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/werkzeug/_init_.py", line 15, in <module>
|from .serving import run_simple
|File "/usr/lib64/python3.8/site-packages/werkzeug/serving.py", line 50, in <module>
|from ._internal import _log
|File "/usr/lib64/python3.8/site-packages/werkzeug/_internal.py", line 12, in <module>
|import logging
|ModuleNotFoundError: No module named 'logging'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f92b959f4a52ec7596aace92c8d37a370a132f30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
index b54399e1c8..58735c1c02 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
@@ -26,6 +26,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
-- 
2.17.1

