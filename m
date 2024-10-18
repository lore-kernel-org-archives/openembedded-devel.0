Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705B1D3F2AB
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.29977.1729278821201574013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DM8M8dQY;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e214c3d045so20733837b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278820; x=1729883620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEQbDQcszlHQ3RuZOPCjq/iE6HKYzXzcBfomEGgFkro=;
        b=DM8M8dQYmUTojEix5D1T5wZg1h8lLzLeXDwqT++urp4a6lztFmkRCGtf+t3a+mL1db
         BZ2XYiHENnonTrEBiOu7ZQmvcw/jisMupEalsGq6DH6WWa32kqRGiFMSO17eFBTZuUsO
         kkzlr4d6pfog5toTIWg2elKap2hfAyhlvaMy/Kvd78/QjyzM/r2s0sttpVk7TyTTWGSa
         Qi7JYLCC5iCttavd1Qmv02byQppLtTR7azZ6zjMXSQZY8MaovwG7LZdynV7AQLOD6e5j
         BT5QqIvvw4QsCkePadlf9+CyxY+DXFkdRlr0DwgbST6zYBaaCxHaP8rCbsPCULQ7TdG8
         VjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278820; x=1729883620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEQbDQcszlHQ3RuZOPCjq/iE6HKYzXzcBfomEGgFkro=;
        b=vSOcPivvx613ArIvhy2jXP/ubTau7Bmro8TZbhofTRYUIXCc4TTChcmGmn6ipozV0I
         y6ZEa7vDrSX2P13K6vaJpF/cwSFCcpL+/Di1slrijTb0z6M3VvridVf8jK9l5JiqM4Z4
         aWFdjp44SOhTRbPVHtKC2AHMAEib+fEeCnYvQp8UMezK7otyD8WGI+rsqAsHrTTDxGtO
         wXHovrXISng2p0iCoqvgTUFME2SPh+g60nOle0DFoW3LbMiM6W75zYG7N1VrXiGe6Ku3
         iaSf3nnNTmNvOJwFvzN+qWd+1VWNac/o9fFFncOop4F4+CBjGOZfUphCyIm6WSfcyJbZ
         wIiA==
X-Gm-Message-State: AOJu0YxaZRJ5DVKn16xHimq79M6KVQKIj0cdEd1/itS6hgvCzgfdaDEY
	K4orfSt0XlV2MZIIofmGUIaBMWwaODgEhkknNem/0A38bCKWLa/K23Yk4g==
X-Google-Smtp-Source: AGHT+IF1EbDTOiNknxnbuytvi10unegpdp/IZJ9RaqnqsLuBtMWhhEs30CL6S2P3FFHxKdk0qnqDzA==
X-Received: by 2002:a05:690c:2e0c:b0:6e3:ef6:a40c with SMTP id 00721157ae682-6e5bfc8cd76mr31366937b3.42.1729278819882;
        Fri, 18 Oct 2024 12:13:39 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:39 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 45/68] python3-pep8: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:32 -0400
Message-ID: <20241018191101.25184-46-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113032

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index 68507e248..6c7fe4df3 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
 
-SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
 SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
 
 inherit pypi setuptools3
@@ -13,5 +12,4 @@ RDEPENDS:${PN} += "python3-prettytable \
             python3-cmd2 \
             python3-pyparsing"
 
-SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
 SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
-- 
2.43.0


