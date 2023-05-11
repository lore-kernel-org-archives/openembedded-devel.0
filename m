Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2C9C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:06:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.60164.1683813968076761417
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 07:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=ssxYF9Nx;
 spf=pass (domain: linaro.org, ip: 209.85.210.172, mailfrom: jun.nie@linaro.org)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso9356033b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683813967; x=1686405967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjmCgzp3gI3qq41jmx5MKJ+usrhi/yGXrg62g7cybjk=;
        b=ssxYF9NxTtHhbRCqdaIKeyO+A1wydpgMrL4YbY5PPymKmKu8c6OKDZtkEeGkAGJduj
         m26sFLo2VGXVC+7viHg2mMnQCHDRYAp9blzXjm0yJ3WxIowJTb/AnebVTdAYQkp0Muml
         ZXDYqMqnxu9FVurCV8iJNehxbmT60yJR9R1zR71FNsWaj8pHaVuYSJDgX6PQy2AxfMnT
         KBe9l4UDGxaq0WD73/qLxoOikJrsO+CP4qF/yH/i7xRduktMLwejxUK0jl699i7Q1D6h
         oHaqgShHuw0QxXlDOrPdGrOulALsGO7MaUBQuZwfzDYD6e0icgxoliJei3j8nEoSZ2Zx
         d8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813967; x=1686405967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjmCgzp3gI3qq41jmx5MKJ+usrhi/yGXrg62g7cybjk=;
        b=J09n75TK4M07pUN3k3WbQNF+/+6kmnJOfSy3dOOmDhqgpXX5EVtuczPQpix6H4E9Ma
         A5VTzMXMlgdkzdtjjMtsD1oq2ZTBlu8VjPo9+0Kk0raMpUBD4FQ4w38ltztb9A/JvXJA
         p02TdTk81wuQVwiuBSmjzca0eKnspvTCNVsU7N66s90bX9X33iwMZnoyas2imwiYvMxL
         gwLaH/8ouDjGDZCFKU9wniPYovd5lOG9PSrcjEFZyyP4nQ+rLIuGdPoiPUVQB/+OxfWf
         WngUlioVRLcwODhlwVc9GBAgJw8dPk4vJqTDk5RGhN+l/ldeVjDCxlj3/PrykbG1LS6u
         OnqQ==
X-Gm-Message-State: AC+VfDx6EPePnOceUztqEjjntwzuRSvTzCX3DTbsaPASs2M9mnzME5C1
	GlonNbOKGiZAgfo94BTOoMxALQ==
X-Google-Smtp-Source: ACHHUZ7UPH1VCjhr6GGhEme970V6Un/iMVOYBpQ27ZPbTGS5rIBahiXzkKcB6MDqLUCeMy0VhGtBBQ==
X-Received: by 2002:a05:6a00:17a7:b0:645:454c:286d with SMTP id s39-20020a056a0017a700b00645454c286dmr22319947pfg.3.1683813967432;
        Thu, 11 May 2023 07:06:07 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m3-20020a63fd43000000b0051b36aee4f6sm5033731pgj.83.2023.05.11.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:06:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe][PATCH v2 3/3] python3-uswid: Add initial support
Date: Thu, 11 May 2023 22:07:44 +0800
Message-Id: <20230511140744.2918627-4-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511140744.2918627-1-jun.nie@linaro.org>
References: <20230511140744.2918627-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 14:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102544

Software Identification (SWID) tags provide an extensible XML-based structure
to identify and describe individual software components, patches, and
installation bundles.

CoSWID supports a similar set of semantics and features as SWID tags, as well
as new semantics that allow us to describe additional types of information,
all in a more memory efficient format.

python3-uswid is used to generate the CoSWID data blob. For example, fwupd
project requires CoSWID data to be embedded into firmware binary to hold the
version information.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../recipes-devtools/python/python3-uswid_git.bb  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uswid_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-uswid_git.bb b/meta-python/recipes-devtools/python/python3-uswid_git.bb
new file mode 100644
index 0000000000..6b2089893f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uswid_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A pure-python library for embedding CoSWID data"
+HOMEPAGE = "https://github.com/hughsie/python-uswid"
+SECTION = "devel/python"
+LICENSE = "LGPL-2.1-or-later"
+
+DEPENDS += " python3-cbor2 python3-lxml python3-pefile"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
+
+SRC_URI = "git://github.com/hughsie/python-uswid.git;branch=main;protocol=https"
+SRCREV = "3223034abef88ae29cf79fdc7fe11ec7e21e11ff"
+S = "${WORKDIR}/git"
+
+inherit setuptools3 python3native
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


