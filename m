Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D15EE6427
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:07:40 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.15550.1694761653879075617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmDXRNhl;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a9d6b98845so641447766b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761652; x=1695366452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1+qDdmi5eFk82QdMr0buY9HMci/iyUovulMrU+IfTA=;
        b=BmDXRNhliSAlaVLBH9B0HoqOa/mJe/L/n556LXPUcwf3ufs7MFoeXGPS7p8X3imV3x
         shTDoko1IUXld4/jgEJEvQLdnDaillMigP+X3TwzjC1U/pr5ea7qNh6SHsRaF1qAe6d4
         PZ3JK5SsjCASIQGE3PUezfz/hKeos1Stp0Ujo1bphDA0dHcPu9jqBKT2bPvE9gu5SZM/
         RQEJPn7W8DvZWb0kXGLrVV2lGKjNNhw41pN5D0tzxzRzhOi2orbRlB/luSuhw1FRx85e
         b7ku7fcp6tQPSV9DeLn1+oh+1p5+4rwBqHPjN/bw/05owPWxkQBVXDBRcPCUTNFyvNrY
         /ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761652; x=1695366452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1+qDdmi5eFk82QdMr0buY9HMci/iyUovulMrU+IfTA=;
        b=tBOCh6PcFekCbbrLrbLADWyvfM7kZjK+PlHBqLayXEW9usldGQFQDgzUbroEPfmUg+
         LoP88C25sSgKsHB93d2KRuV4G1YoeJjYVZuXIfazh3BIBIlkZTGXFjxUDXrwMSD/W+R4
         sOvGtwwwkkxWSVTfSZYPviYrAntfzXRAF91J4vvMp8KKWj/BdVZyelOgquM/GCv3qttg
         +NORKX7AXnLxHNe+3HQPkWrMItNqyKAWMcyKwLNV0Sl6glWzaON/O0pA5Je/ViBNVEzd
         V4747oyfX4uINZs356hDPmuPDB5+OyOgb37NeUF/0XTpgp4t4Q6mEk+cq6cj5M+oj/La
         H1vw==
X-Gm-Message-State: AOJu0YzZ8gKN4ACY0VTm+udFY7Xs+ChHIAZr2SPGQVJF1VwOXR04pI6J
	j5dwP/34SqyPssXNGuo9GRzWTEj87A==
X-Google-Smtp-Source: AGHT+IGcmshdZH1gY373ls224wWn7FmziZD2eeriAkwsc1dHA8SlNIHkx+EioKrLhTnBd1tJgqyRFQ==
X-Received: by 2002:a17:907:763a:b0:9ad:8a9e:23ee with SMTP id jy26-20020a170907763a00b009ad8a9e23eemr1111795ejc.13.1694761651877;
        Fri, 15 Sep 2023 00:07:31 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1969889ejc.124.2023.09.15.00.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:07:31 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH 3/6] python3-webargs: add recipe
Date: Fri, 15 Sep 2023 09:07:24 +0200
Message-Id: <20230915070727.4026-3-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
References: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104887

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../python/python3-webargs_8.3.0.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb
new file mode 100644
index 000000000..d8ce4ab40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Declarative parsing and validation of HTTP request objects, with built-in support for popular web frameworks."
+HOMEPAGE = "https://github.com/marshmallow-code/webargs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c3ff8567ef1f2a8cf223f30ac5a6f094"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "cab207941b0686c4d086c823632ddcd4343151644341a32fcf50b8eaa71e31c7"
+
+RDEPENDS:${PN} += "\
+    python3-marshmallow \
+    python3-packaging \
+    "
-- 
2.34.1


