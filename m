Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.1815.1603824824407155949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 11:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: aehs29@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id n15so2074017otl.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2020 11:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwO7YptZyqhHIejlHJqRCs8Hj7BM39VpAf3h6x/bb9k=;
        b=I4sLOk4UDdhz6083+eVimsREyHKWHoBSMOTELJMm/CGwN1HIcnV/ZqkQdwqJdP+1uV
         AfwZ8v107rbbGsz5Z5E0isJhtCtBXhI8Lnb1ub9TaEjrVRuQ7htSREXPNDEKV50GDfVj
         a5Co71+Kzd6s+khVcnn75r5CHkrrtBeVBTzNmcr2U5o8lQQPU9rYcMk14hXn9LuYzc6N
         ZDEqIbokO6N2bvnCTcSHibJNjUXV+q3KcMWzJQFi4HT1hN4/bEdhPtISW9voUP/p1Yu0
         EupldHmZpJL/d9h3XavjjhY4GJM0V31IXEBlUZR4qJJsCPc1skbkpHrqya7bMvPF7ACa
         cUOA==
X-Gm-Message-State: AOAM5320SnS2H4pa/hTOhob/DO+POILKJKMZXg1vonWxqEGRMHvLMjVt
	faqdywBUKzUvQCFW03+gF4lHhSqpsmsPvw==
X-Google-Smtp-Source: ABdhPJwv80rroXkF6s3WzMpNN3rpcACn8pSsfCRVlbChRP4JP8MUPAGPsTWAoYm+zy61BqG9d48KmQ==
X-Received: by 2002:a9d:7419:: with SMTP id n25mr2506683otk.183.1603824823302;
        Tue, 27 Oct 2020 11:53:43 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id b16sm1353303oti.4.2020.10.27.11.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 11:53:42 -0700 (PDT)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] emacs: Fix packaging for emacs-minimal
Date: Tue, 27 Oct 2020 12:53:18 -0600
Message-Id: <20201027185318.2013100-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Emacs-minimal needs disp-table at load time, add it to the minimal package

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta-oe/recipes-support/emacs/emacs_27.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/emacs/emacs_27.1.bb b/meta-oe/recipes-support/emacs/emacs_27.1.bb
index 9b3adcf9d..cfc089b3b 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.1.bb
@@ -177,6 +177,7 @@ FILES_${PN}-minimal = " \
     ${datadir}/${BPN}/${PV}/lisp/international/uni*.el \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/vc/warnings.elc \
     ${datadir}/${BPN}/${PV}/etc/charsets/ \
+    ${datadir}/${BPN}/${PV}/lisp/disp-table.elc \
     ${bindir}/emacs* \
     ${prefix}/libexec \
 "
-- 
2.25.1

