Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6693C10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:31 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.113083.1701991470590363719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W39HV+By;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so1087615b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991470; x=1702596270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkgMC1bVJEipoFptbY3j2Fl2HaYtpBWAzBcg/OPhUXM=;
        b=W39HV+ByH+YjYVwBvmUlThB4Xd4qr9T8clFO6mkmzW+MHWEnZ7DcfViY1xX4ggqb/e
         8xmo4gQH0titICTbujgfv6IJZsaTHbrhdoVbaOgQ5XoDWeN3vvbQcy/lnDJO4BPOyCXr
         pw9255zotNTteF2LPEzH+coUsEkkFZosbbEUy9VHZz4IeMAk/bYiTudB6tKfxVF8lK7p
         R8hTPm7G2mI+sOflhDJl4/C6au3j/xcBCtmX0RNwpyn0ixdRJdzl8KHJh2OfCAJ4LRyG
         D8doVhbUrtPG756K2JHHUQB3vUv1tuoBo4+4zBlasZfGYLvI9r70jW5OgM/IPn90zF3b
         GKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991470; x=1702596270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkgMC1bVJEipoFptbY3j2Fl2HaYtpBWAzBcg/OPhUXM=;
        b=vZ0aH9r7fyUAGkLcSAK8866YzaKBf3KzIBZ98WXcmtRVVL78k9a5Rm8qBaDeSB1BeO
         hawKDKWIXUiTQ7wvPpQ8fTKw+5eAmT50hAP1oExaNCeMvHFg1GTGuXMrYm7ZM7sU0pzw
         YaW9B/mUl8huk1yVPA1G29exWiqxzw/53lhxoDXutLI6pbECLz0rDh57ILHmnnBrTrYG
         yrzjSLL3gxb11OiJ538j16JSil8nI5Up/Xr6kFmwrMejLVMj2E0dfquGOoX2pvbIpfvV
         brCV70IhstOgiF4qiNet6Tq8Lj4N20KXN4evLZNSYCmJBrl7Ykr11uysr3eWqpI5Y3EQ
         UB7w==
X-Gm-Message-State: AOJu0YxHwMBpJiE3AwjOCFOW6LgDoQnBGfmcDHOu0jGj/J50QZCzW6+b
	8Oc0MssEhoOm3bvVtKbYh3zoYX2MAug=
X-Google-Smtp-Source: AGHT+IGdxChLJ5MCxxBK28UyFugyEAiOA6uL2CKa/LD3BEBiK/SF0J2VgXs3+OmySsEtrK7wmcAYww==
X-Received: by 2002:a05:6a00:84b:b0:6cd:faa6:fc44 with SMTP id q11-20020a056a00084b00b006cdfaa6fc44mr3129853pfk.25.1701991469615;
        Thu, 07 Dec 2023 15:24:29 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/7] python3-annotated-types: add v0.6.0
Date: Thu,  7 Dec 2023 15:23:52 -0800
Message-Id: <7297f8648cff813d9b0211ad5f17d38c2d56b10e.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107294

Run-time dependency for python3-pydantic

"""
PEP-593 added typing.Annotated as a way of adding context-specific
metadata to existing types, and specifies that Annotated[T, x] should
be treated as T by any tool or library without special logic for x.

This package provides metadata objects which can be used to represent
common constraints such as upper and lower bounds on scalar values and
collection sizes, a Predicate marker for runtime checks, and descriptions
of how we intend these metadata to be interpreted. In some cases, we also
note alternative representations which do not require this package.
"""

References:
https://peps.python.org/pep-0593/

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-annotated-types_0.6.0.bb        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb
new file mode 100644
index 000000000..79cbb66bc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Reusable constraint types to use with typing.Annotated"
+DESCRIPTION = ""
+HOMEPAGE = ""
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6afb13fdc220497ee5cded1e717ed67"
+
+SRC_URI[sha256sum] = "563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d"
+
+S = "${WORKDIR}/annotated_types-${PV}"
+PYPI_PACKAGE = "annotated_types"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} = "python3-typing-extensions"
-- 
2.34.1


