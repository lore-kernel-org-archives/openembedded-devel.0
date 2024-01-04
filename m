Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0BBC47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 08:45:11 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.49915.1704357903936901033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jan 2024 00:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZQ7ibfk;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a26f73732c5so25779466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 00:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704357902; x=1704962702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVhzsgGdWrNdTJ/VMPhZk5hQgxbrjORxk7C3qpY4cuU=;
        b=jZQ7ibfkbMXeMxS33R0GFNDBL2JOR3ZaoM9sVE8LC0/DDrVtuGGj5uF1BP7cHMp/ar
         LTyzPPEqs5vsExk4vwtKFBeA6nRZJn+0NhQ512lAhmmipeBtPPcRY4kq4iKeE7qpXKrI
         SGKHOZ7Ha/UsfETDREn21mQPb4jSzeYaYKJIc+ETKfAEA4JHE6SKeraD34V2PaNxU+Kr
         9lcgU0a1rUaRV3AzQv1IrpyJCdrgr/5s16+jWzjWUE+SmYiqF1tG9bZ1BHWeolTGuq4j
         of6bJbe3tivIvSBGSStfIOE/odKsNn3tDVHYOB5i42mjJI0Vdk8TWGfeAOVN2etOvYZF
         MbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704357902; x=1704962702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVhzsgGdWrNdTJ/VMPhZk5hQgxbrjORxk7C3qpY4cuU=;
        b=IDwz/+/uqBSMH3NMV3aqOO2JFZA66QuaMhR6MBUhzvz7rJHAHmoz7nnzCKfgmPZdEA
         wXLnHbRWUpFwHAGO4DdvquDQeCaaNRnCOiNWA/XvTZuo6rx999NJTUCH4wAsHXG1F+5r
         dFKCG9ytewir+UjiWj+5wtyI5QKj7x/uzIoTGtizWLtHqgyTQSPI92KQOYCkPBN3DMw7
         drhbp502xEkMgshipwD01Utu7mnPnPUDlrMJp/7k7OVMi2RjZSOV78BEI4MLcZPPiNk/
         53WgKBcOyn76sxGxf8VAKBOKBB4HKnboKlcFGzlTRhQ0UV2ZEgqggF/Z8PQxNrI545S8
         bkmA==
X-Gm-Message-State: AOJu0YyY6bWaoEBD1eivVSiW6XAIjr9e6N0zbkFosqjejXEXObii1nyb
	wXO422Q/j6M+shC/UQG8hyBNvNxuK8w=
X-Google-Smtp-Source: AGHT+IFQLl/C0GKvUL+UMugOi3kkdxZeJSzVZFWgBySICEo2yqrP3/vftUft+h12zP0EsvQBLrDBAA==
X-Received: by 2002:a17:906:1ed5:b0:a28:b74b:27ec with SMTP id m21-20020a1709061ed500b00a28b74b27ecmr127714ejj.111.1704357901487;
        Thu, 04 Jan 2024 00:45:01 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.193])
        by smtp.gmail.com with ESMTPSA id ef13-20020a17090697cd00b00a28d2e95152sm460441ejb.129.2024.01.04.00.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 00:45:01 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] onig: upgrade 6.9.8 -> 6.9.9
Date: Thu,  4 Jan 2024 11:44:58 +0300
Message-Id: <20240104084458.308808-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 08:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108038

Changelog:

* Update Unicode version 15.1.0
* NEW API: ONIG_OPTION_MATCH_WHOLE_STRING
* Fixed: (?I) option was not enabled for character classes (Issue #264).
* Changed specification to check for incorrect POSIX bracket (Issue #253).
* Changed [[:punct:]] in Unicode encodings to be compatible with POSIX definition. (Issue #268)
* Fixed: ONIG_OPTION_FIND_LONGEST behavior

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/onig/{onig_6.9.8.bb => onig_6.9.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/onig/{onig_6.9.8.bb => onig_6.9.9.bb} (92%)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.8.bb b/meta-oe/recipes-support/onig/onig_6.9.9.bb
similarity index 92%
rename from meta-oe/recipes-support/onig/onig_6.9.8.bb
rename to meta-oe/recipes-support/onig/onig_6.9.9.bb
index 214459228..b29437db1 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.8.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.9.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e"
+SRC_URI[sha256sum] = "60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf"
 
 BINCONFIG = "${bindir}/onig-config"
 
-- 
2.25.1


