Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0283D29FB0
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:17:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.40604.1730877470853610991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 23:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h1Ki+plk;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso4272387f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 23:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730877469; x=1731482269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WOiDcJ7G6R5B1GhAi8npc7SrfZLcurUZI/iTj++foQo=;
        b=h1Ki+plkFoI+UjCQGNKqRlsKx7gg2ACV1QahZSQk5W62tnZLRbCO2UEK34lfX8lYRb
         XeveNQkRt/hw9Jmw+3IgwdO1c8jSTthPOC7q3h94ka8nHS9+1bCl35pmiqQh0m0kwGLF
         8tnxGonwGyb7Q0hFaJtNc1SNeUokGeEx260hgWg9bOJolN6yPmfAPPOe6idvmTHaAKge
         +TI0MI/z2qeesu3D6Ya+EoVeJud2WCmZZ7jbLOH05IpSowZUg6unWy3mEU6572t2WmG+
         DQaSfkhACZA+vu2cD+922XeDB02vlNg0eJoJYPyZGo9//jdF4YzSfkidrOXWWy+ou8B7
         J2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730877469; x=1731482269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOiDcJ7G6R5B1GhAi8npc7SrfZLcurUZI/iTj++foQo=;
        b=HvVb86Ye6yHm83Ux16+ovH7SHa0tPUMPK2eNtUYiRNbDr73SFYBaSgl30FmWRari44
         2Uq1UmkXjUB8tOohArUxgAsUzLzxeZf87EM/at0AeUWqZCEjuaLyO8Ey/aVQ8n7N6pb+
         3PMyUF1pvTvBLa5s7bxgs0pMnYcR9onkdv5A09kl4/bACeVsrEBCpmsrHmVG+BYn1dfc
         nb25NDjhx6OQA4RKo07xTx0CVwFBs/K5hw9H1Eor6zmugOH8rc7jDespvNx1qWpi4VWa
         cqLdAPg7Y0Yw21/qcViKzrpiLR42iSedACqtwVLqVDUxWVqJpSq1h/CXM3p/3CabGxhE
         1zwA==
X-Gm-Message-State: AOJu0Yz0L7mbrdtCMZ4yBLON0CiSug2wginKQD3wNLBo26FkIcETYJ/f
	WPUQWhHfsNKCPOBYx9z1nAG8HYQNtKG5Fj18S3P/nl1nTp0Y/jYkrHjbA7Sc
X-Google-Smtp-Source: AGHT+IFAoOXqaKWo0+zbn1fQK+aMUOwVqvQY0ewq03ImwKchzGLgBQ4vD0+jxGupXeC5JgKLnKZadA==
X-Received: by 2002:adf:fbd2:0:b0:37d:5299:c406 with SMTP id ffacd0b85a97d-380611e4b44mr25089803f8f.38.1730877468732;
        Tue, 05 Nov 2024 23:17:48 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432a267dfadsm43294625e9.0.2024.11.05.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:17:48 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-xmlschema: dropped Python version in SUMMARY
Date: Wed,  6 Nov 2024 08:17:41 +0100
Message-Id: <20241106071741.6546-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 07:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113732

The info at the homepage was that the python version 3.8+ is supported.
But having this info in the SUMMARY has not point.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
index b29862b1d..26792c3a7 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+)."
+SUMMARY = "The xmlschema library is an implementation of XML Schema for Python."
 HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
-- 
2.39.5


