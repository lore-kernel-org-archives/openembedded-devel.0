Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475C8C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:06:06 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.60158.1683813960989633875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 07:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=v8veHa2m;
 spf=pass (domain: linaro.org, ip: 209.85.215.172, mailfrom: jun.nie@linaro.org)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-52c30fbccd4so7796822a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683813960; x=1686405960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y9/qPvqaKYDlrdIBRPxpUF/O8Sr3vTZoxgaCOTvF9c=;
        b=v8veHa2mOSwOAYmpERx+e37DXxEeS3Yay2p0xHS0xHEJcotVzR8gB17UmYkadh9vpU
         CsQKt+CfnI8AXJx6DIg0w61SyRPbmiDpP+XhP+fQqFXS7pMTMjxBqbo/GzvMLZjaMxQc
         VDQ0O2sax9Aw0GN6doslrsTc21kYNgwh0VLzKOgg/w/rO7HL5z+SDG3l5AT9fJXpOqsH
         2ukRCu3mMGxQyHb4mZedEkix3FezX0n/snUSP5uVCQjFQPJfmLfsHF1NJxnMevcA9yw5
         TTBa4p0rv9yMshCfmvfwOxpYnjUrfsj7keizdmjbW2XeKTKgiRd1cWRQ900iXGZ7HHHf
         Aj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813960; x=1686405960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y9/qPvqaKYDlrdIBRPxpUF/O8Sr3vTZoxgaCOTvF9c=;
        b=IM6jJufsFcCDzkw9LbPGIbfFK+jxL0Bf+ID7MzoUElaM2RzqpPb0Bsxe6BHC8+1KHd
         SQUcmt5I/ffwHGY/oVADs5+tIk7bwna2vtk2prwDZueZg4OPQ6P2jQXeaFjDx9NU9X5n
         M1MdMX3wZvU9dPrZe8aIu/wvf22qc5/+5Unm50tNfC4aSEDGwnEdfwHM7MV7mUYtsYbP
         N0K1IJ02RVxCgs6JRucKG1VzuTCTYfr6clszvVynb5/Ph5+squHRoE18LXzvKF/Q9uYJ
         hKyqmYLbsa8KFK6okX7rOfFFLlABRDtzw0Ns4H96Xh88ne3IEs2MPBAuZEMRVT6SU/sc
         D9LA==
X-Gm-Message-State: AC+VfDzhhMj9jSlz/OcjMS8sezqrfhDeGDdwVV21FFwDOvQtkn8VDkA1
	xpDrIkYL4VBiKEGetdy5iVGLxQ==
X-Google-Smtp-Source: ACHHUZ7QvjwVGsgFHG++RajK/Px2kkJXfXURqjrq8gFtbygQVhXzFMcHEsGIi+I/XSUpGmM7PvKfpA==
X-Received: by 2002:a05:6a21:100e:b0:f5:7035:9a05 with SMTP id nk14-20020a056a21100e00b000f570359a05mr23980271pzb.29.1683813960393;
        Thu, 11 May 2023 07:06:00 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m3-20020a63fd43000000b0051b36aee4f6sm5033731pgj.83.2023.05.11.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:05:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe][PATCH v2 2/3] python3-pefile: Add initial support
Date: Thu, 11 May 2023 22:07:43 +0800
Message-Id: <20230511140744.2918627-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511140744.2918627-1-jun.nie@linaro.org>
References: <20230511140744.2918627-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 14:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102543

To parse and work with Portable Executable (PE) files

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../python/python3-pefile_2023.2.7.bb               | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
new file mode 100644
index 0000000000..580b17413b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python PE parsing module"
+DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
+HOMEPAGE = "https://github.com/erocarrera/pefile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+
+inherit setuptools3 pypi ptest
+SRC_URI[sha256sum] = "82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc"
+
+PIP_INSTALL_PACKAGE = "pefile"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


