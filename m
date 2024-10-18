Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715A1D3F2AC
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.30098.1729278827501966159
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xz4xookX;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2e3e4f65dso28902907b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278826; x=1729883626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Bfkuj9fSZnMH1TheEa2gieUb12HVfwv0Cu6zQixK6Y=;
        b=Xz4xookXoq6sy+Nr+GYWTEUdFzF+dH41Rb4uka2ngBn/AAmoYsubEgIXVcU3gecZCG
         RsHlvlHa6mT/WVa/6tH5A9ZVNmseKSIQWdgIGQTOWkWMVt5nEv8o0JkUL8MqTX3ShGwa
         OGieUVjiuHm99qqfkT0ndV/I6zjlBHAt+BsMgXyayMjRUpE7gEWi1mEIkRxqlzSXsyTt
         ILdgFfFdDKTp9MmnaYRd8D9zkfVmBnEuFXbYZM/vO4301klMdmWIO/uqvLYPOwLpWC/B
         7kh0iWZzDasOvi9E/+Y9j1pcpkmzMwHZu8QMeo6aXThABnGkF62rpJRt9bnu/8CJF1tB
         F9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278826; x=1729883626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Bfkuj9fSZnMH1TheEa2gieUb12HVfwv0Cu6zQixK6Y=;
        b=o8TtCdGjtVyWf4PerZtfpO7t3qnDmM81Dlb32AG6/wnowhFOkh2KNhBrS0DtJ7wi0R
         NYcsau+77xt/m0uVMrhOto1VtUm4BpIImiXu0++xcCZZimOd+3RADrDy7lvVbJkaZMhF
         avBdXOeveXWDNusihgrwMqISTnxArMc3sWFdc/G/rbvte87C8gEtHlsXT5eV+G3UxQO3
         Y6AF4v78rff1x1sc1WVSep9os7ST4SCDBYcXN1mhDuc5xZaF9aIlQhjeHbzWBjC85l5T
         IZ5oQa8/8mjUeo+JoX4GuH3lRBSW71oBDvIhfEK4hld5iynE6VAZq/F65qeUE+fS/zU8
         yGSw==
X-Gm-Message-State: AOJu0YxTpQ1Jihcp3tsVW8+T7SunwdmVGxxcE6Y7cpPCvOx2Yr8ttBfw
	cQb3eph1xeZ9FhHTZTn2ujImbJ1I19WdB0Xs7wdPfmIqByYsL6xlqkhCyQ==
X-Google-Smtp-Source: AGHT+IF8tnInUvfs2j5ZqbnrwksQZsMr/h8z5DgCbUSnSUPmZWWWS1/xFgTkJP+ga4tlp3DLqaEUvQ==
X-Received: by 2002:a05:690c:87:b0:6e3:29ae:a3a5 with SMTP id 00721157ae682-6e5bfd4f8c6mr41505657b3.34.1729278826185;
        Fri, 18 Oct 2024 12:13:46 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:46 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 55/68] python3-pytoml: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:42 -0400
Message-ID: <20241018191101.25184-56-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113042

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
index 171708596..49390df83 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cfff423699bdaef24331933ac4f56078"
 
-SRC_URI[md5sum] = "e59dd36a559dd2a876e4c149c69e947b"
 SRC_URI[sha256sum] = "8eecf7c8d0adcff3b375b09fe403407aa9b645c499e5ab8cac670ac4a35f61e7"
 
 inherit pypi setuptools3 ptest
-- 
2.43.0


