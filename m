Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3007FC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 17:36:13 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.2047.1698773763995779626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 10:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=H0A2Xw+o;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.181, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-41cc7379b23so36862031cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698773763; x=1699378563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKC8wx9U7UOLRoKWfv9UBp+U3hallBMamktOHgC3gI4=;
        b=H0A2Xw+odE+sD8f7n1xlWFMShxc4jDDRek08KbJIxYVpgaRSKuODA6hxruUWfhLd5C
         yfvurH4VAtsAZekgd5cfFiR6M4zd6aHDkT+Vf3ixUrllENarTuw2cBV2Cwp0Dli+A/6K
         cG6x7/ebR6F4bv/yWPzGqtBTrS8vAiIa83NkNvjiqPSOq/BoIfjQGz9EeF6t/SYPXxr4
         NXOlBMOL7zuZNgDLAWo73KSX44TEeCBN9fcnt/knV2LWw2GPdBg3/y4x+5R38jnmS56+
         5rW3FEe/mOBhrQU1TeexrG3WPdbNdOrRGDD34GGJPQ+SZcPPRtLzRUDG8L1nqhkTKPu8
         4evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698773763; x=1699378563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKC8wx9U7UOLRoKWfv9UBp+U3hallBMamktOHgC3gI4=;
        b=efLCWRwhbUsR6v1nL0woBdoQDidYliCUN4/ki4ozVXiBMbM+FUcAYSGuU34F4QeE7z
         LhwWr2bhvYScCtlOBQf1nMLVcDzbTKTy45F1WMblQ88OuxVUjQlfch5QkVZTVKo/E1/a
         VmaWSCK9kB07IhVNO2I2vtgia6ei9PSzAMI/srRNt3x2O/msCbgTcjBgFKx2sLMCojPh
         hPDL3qg7XVSNisHilmoOcHw0exvIxN9qa9e1Pg2MH0sFaQ2rjltpP0WwxVR9CLBCn/nP
         HKzw/9TBoa3SXfilLZIJTMErkE2CVPPMlsm0s8+BQwCUKX26Hf6YU3DcU/TERU65JTm4
         aP1w==
X-Gm-Message-State: AOJu0YzvEij4wFor0d6N7UfgR7DJCxqXNPi7Wpy8pmODRlnJ5eYU2mg4
	ZZNoytpGnSiYR9bzBqwDb/G0ZWkuwjCc/BvXB1X/pg==
X-Google-Smtp-Source: AGHT+IFS66cETHiq7QnaL7LlgmxmcHtpcCk1chMerVmPZaJYlkLdrF3wLa+JzuDsasfXoxXljfdTFA==
X-Received: by 2002:a05:622a:30f:b0:41c:d9e7:7782 with SMTP id q15-20020a05622a030f00b0041cd9e77782mr16793875qtw.68.1698773762815;
        Tue, 31 Oct 2023 10:36:02 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id e26-20020ac8671a000000b00417f330026bsm679984qtp.49.2023.10.31.10.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:36:02 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 3/3] python3-zope.event: Add Zope.Event Python Recipe
Date: Tue, 31 Oct 2023 14:35:54 -0300
Message-Id: <20231031173554.1786139-4-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
References: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 17:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105806

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit adds the python3-zope.event recipe, which provides a simple event
system. It is licensed under ZPL-2.1.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../recipes-devtools/python/python3-zope.event_5.0.bb     | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zope.event_5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zope.event_5.0.bb b/meta-python/recipes-devtools/python/python3-zope.event_5.0.bb
new file mode 100644
index 000000000..1955ef4bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zope.event_5.0.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "The zope.event package provides a simple event system"
+
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=72092419572155ddc2d4fb7631c63dd3"
+
+SRC_URI[sha256sum] = "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda6955f96bb9b91e67cd"
+
+inherit pypi setuptools3
-- 
2.39.2


