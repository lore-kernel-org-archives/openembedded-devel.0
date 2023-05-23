Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864CCC7EE33
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.13895.1684816023228986589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hUh73bXr;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso3512346b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816022; x=1687408022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpITaf8uuIOlzc3yaR/dC82wIYtbi5GNWyl1zu/Daqs=;
        b=hUh73bXrHWvS5Q9i4R9wLcEPq2nDRTnKxqxsBnyd8iuR4wNB+tDsB+fSujzkkvmIfF
         FSEdYdaaS8QPCKoQI3bss5KQ7HH0+kihNDs+EU5TMpjpb4RI9lYSvxKRF9Ii89zx36RL
         5QLBSoMiIhXWJEOeFWKbATIUBUk9BmNat31tjjFDhMWZWlaNVWAdEGOLi0jvq0pjnNQV
         JcZCntPdvlvCNpsf4ekUHkQTyqu4G/2BbCbX/F/guTf/48VYDHPOfZL4B/6OdM67kWSx
         RtTXjcsiG/06angXphDaU6pBneSmXXnqIZNjk1aulr17zx+otfL/dSXc0LvJXfNKCNnB
         HFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816022; x=1687408022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpITaf8uuIOlzc3yaR/dC82wIYtbi5GNWyl1zu/Daqs=;
        b=iX365NHXgodKunsPy6hzwT7YkOlZP6WXW9LTqyEtaEBZoyf9uHmoE5B53uAvXT6Ki5
         8yrHIBgbaMp3aFY2UGuOqZQR4UN52cUkHF2yBkljLD1Vgn+5jQBgLFyrsItZLJWP7JEU
         TnOFAqoBRvnlzgobUNrnCU2fZBrHCRSbIPHJwzYnE7aawxFkBrJvKBGDO/jhQapGB6Ox
         vtIKQY4By6++EdMCL9I6mSvEPjp5Or9GTVXYcN+/buJ0MeXAAYjpBxZrGIqCJ2ElyIrq
         oiOHBFjn8QOE5+htQd805gii9qIg6AwK5NETEI41rULo6+PmOwtzHRUM9+Jtu7N4UgZ4
         7I0w==
X-Gm-Message-State: AC+VfDwTZ4tXMbvTUxddFOdV5FJ6tTPXtEbZ1lRBo1Obs3nqeqN3tmPd
	MScdu3kb2CBsOCoF0TekLLqe3fE4Otk=
X-Google-Smtp-Source: ACHHUZ7AVOmaO5Xac8Aep0eiNzDdPQeRxX+dFEDxmX0dJKylXZ38e0QmOHlPuTDcKDXDoGtNhtQuDA==
X-Received: by 2002:a05:6a00:23cc:b0:63f:ffd:5360 with SMTP id g12-20020a056a0023cc00b0063f0ffd5360mr19261272pfc.21.1684816022301;
        Mon, 22 May 2023 21:27:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 04/11] system-config-printer: Delete __pycache__ files
Date: Mon, 22 May 2023 21:26:51 -0700
Message-Id: <20230523042658.4159559-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102719

These pyc files include references to buildtime TMPDIR, therefore delete
them and let them be regerated during runtime if needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../system-config-printer_1.5.18.bb                      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
index 883d582371..f0ff24f376 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -21,6 +21,15 @@ do_configure:prepend() {
     touch ${S}/ChangeLog
 }
 
+do_install:append() {
+    for f in __init__.cpython-311.pyc cupshelpers.cpython-311.pyc \
+        config.cpython-311.pyc ppds.cpython-311.pyc \
+        installdriver.cpython-311.pyc openprinting.cpython-311.pyc \
+        xmldriverprefs.cpython-311.pyc; do
+        rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/cupshelpers/__pycache__/$f
+    done
+}
+
 FILES:${PN} += "${libdir} ${datadir}"
 
 RDEPENDS:${PN} = " \
-- 
2.40.1


