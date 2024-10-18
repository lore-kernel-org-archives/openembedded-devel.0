Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819A5D3F2B0
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.30101.1729278829623442624
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKn3pN+j;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7093997dffdso904055a34.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278829; x=1729883629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOTXhTNyi/6ypvpYCQyMXeq534pSxYTpFAusSnIb320=;
        b=DKn3pN+jMDiReATygK1AWhfjc3wYaPP0Bmg1R9hRPeMVtmiUFxvojRr9eoGGcwuHM0
         0C1xaKLrBgyF+AfWccKzovKqPSPCBttxxhidm78dPBAhiFSamuW0i0eLDjueVgFPCWyO
         2nRXN50ezsqVMiMkul6RZOoIFaN79ZFJNmJA4X/SJllJLGVnf92q53BCDWbbQmVDqMc1
         7AmuV96IibeWtlSQIo3LbnkG8nikUiYf9A4lYA1V2o7GwFAo/gdDtgg6oRdkaTP7eD3x
         9BzvUWtLxv4dkejLSpxNeZos/z9YutS1iXFHRirgnAAsHQBXHSp/G3s6qg4rDRTIZ0WW
         K4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278829; x=1729883629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOTXhTNyi/6ypvpYCQyMXeq534pSxYTpFAusSnIb320=;
        b=SlRe+yP+VZqeJKX0hE1pOSM9AolYCQTdDJgxdA3hJvNJnwxG9IuG33CPliBHPXUomf
         0DUfmmMuJxw53H3cncDg2BwmARsNixWjzTYg6V7FxX+YXY4VSS4Zr54JUCWY4HJH4XNn
         WgvBHuFaHpSguGPVncis3mh76Omzr4/M3SIQP7+smZNyETUDBTUZW25UR8VdZXU+PNSw
         W9cFv0Vj/+WrbsRSRO9ejQuhlnZYRV/KyTGEaRGI70M3YgwJL82ZsnZP/zdde2Ye/A/A
         KVLsdQC6CcP6RLKWbGKXrHO+lN2SBKcYey2R2k5xRSeta4unP5e2m8EyyhrGs3PKILHh
         FiBg==
X-Gm-Message-State: AOJu0YxqAYRFr52BXWGZE1dITshrY2iZQ2meRnDnWtIVlB2MP1kf/0xa
	wYYimr/O0xLYs2KQeKtievucrBbAAF8sGhNXwaNkmLDNuRds0aUURvwyMw==
X-Google-Smtp-Source: AGHT+IGQsvnmab4/Kzea0bbvt+AOCmGyvBDODWR8rpQGG+osqIrutStef+Ln5aSwuh5Fz89Uvq2czw==
X-Received: by 2002:a05:6808:2e47:b0:3e3:9b23:98fd with SMTP id 5614622812f47-3e602cbea6dmr3162385b6e.23.1729278828404;
        Fri, 18 Oct 2024 12:13:48 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:48 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 58/68] python3-rfc3986-validator: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:45 -0400
Message-ID: <20241018191101.25184-59-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113045

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
index e374979cb..b06634e5a 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3986-validator:"
 
-SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
 SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
 
 PYPI_PACKAGE = "rfc3986_validator"
-- 
2.43.0


