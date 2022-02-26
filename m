Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A7DC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 02:21:19 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.2552.1645842078448498025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 18:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oVnq/iWj;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z4so6192117pgh.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 18:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBugHzho+tintTmDJl0a4LxbVfIjNp6g/KaiBRJwduc=;
        b=oVnq/iWj/kz0nYRFBS4qTA1BPLSWqukb9XxyNSsG/ea3rrQdjLfojM1Bxt672E9J67
         kRQYCfFRzZGVIsuiHINCLhdWb4Elos/HzByKWYaRQ4pPsXFvG0wXCEEqQ6ov/Ap99TaP
         CQh8tBZPxmgtTqJ8GPPaICt223p6KVDuGVZxRQB/J9PGYZVSXSi9ed6ey21rXQ+ThWmx
         jl6H7WzNsub3ljwk9lBav90/NiwpIexSJdNY3rOFsv/6uAkJ1cn4/MI7xn9LmfDjtHqx
         TxFWajCUNgvICLHMvFywIJCf/xaOBfK0R2Wu2/QCaksvypfKlbNCriZUUbRMKFCHKSSP
         uduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBugHzho+tintTmDJl0a4LxbVfIjNp6g/KaiBRJwduc=;
        b=GFMpGpAdEmwQ49eHtuPFSMIuf3GICYpp5LK3EuSeX3/O5UYjExMgY5gW0L9UJ1537t
         yqnfILomt7lR3TU4VkAcm2PcmhcWH6py48oPUpcPW6gvWlDovP1MzUIVCpK86tDNtoXy
         mLho0pZBtEMknOCeMAf+DM2ZxRIeT0jQeH7ndLJo6khlohxvtBGI0CYmMsySJk8Yb5vi
         CvzTOnYRcePARDnna035MAaMl4yFSsjJX6WHn9YpuQXMO2QAyfzb2teVzDyrTNH+M9Pa
         czUWfnQ5ia+WlpsmHnGSVf4UFMF70OYcE+sJpqd2y4y+KR3QvVhPJyXsu9yL1bXKEl7h
         RmJA==
X-Gm-Message-State: AOAM530S5h6ar7L+DpZE5AZdRvN0Y9U0HVqGgyTrgcmVAzuNtBo1aVmk
	Di8ELfj//MStt5JpRXIdQ9wTh6fwWgE=
X-Google-Smtp-Source: 
 ABdhPJyUqBCL1e9rrOGR9VzJBR5O851cF6Ky34kruZ97d74Ba1MrHqQ0xUQM9kQbk3IuTS3i3+Q4fw==
X-Received: by 2002:a63:da0d:0:b0:364:b771:ff4 with SMTP id
 c13-20020a63da0d000000b00364b7710ff4mr8666636pgh.514.1645842077545;
        Fri, 25 Feb 2022 18:21:17 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 a16-20020a056a000c9000b004f0f8babedfsm4749367pfv.29.2022.02.25.18.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 18:21:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pyserial: also remove
 /usr/bin/__pycache__
Date: Fri, 25 Feb 2022 18:21:08 -0800
Message-Id: <20220226022108.1334703-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 02:21:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95531

PEP-517 packaging tries to also ship ${bindir}/__pycache__,
since we are removing all the scripts from ${bindir}, remove the cache
as well.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pyserial_3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
index 4766d92266..15646235df 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3 ptest
 do_install:append() {
     rm -f ${D}${bindir}/pyserial-miniterm
     rm -f ${D}${bindir}/pyserial-ports
+    rm -rf ${D}${bindir}/__pycache__
     rmdir ${D}${bindir}
 }
 
-- 
2.30.2


