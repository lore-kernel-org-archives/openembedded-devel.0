Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08D6C25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:44:40 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.1784.1716572674214512112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eibsqEsK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57863a8f4b2so567166a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572671; x=1717177471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwoR0m49VTGEmSQtRmUmzRMbQgpI4F2JwwwIeeqB8bQ=;
        b=eibsqEsKWPIFh64hwbbTsSyq7wOrt9OuBq1IOpPELSAWGGeMIaAhS+qMVbrbE3EOff
         O7TMJb+aQPiVI51uzUtmBK91BVXM80iMploIsHARaMLj3N4U0NTZptmFhJAF1exfYCaE
         aKIIylO+YaVEIAMozM5jueY1SpLpuFHFE66EOetPUWZm9NXqSTYZLPae8yCXxrKDsJBO
         NgFxKFw4TL+1zR67noZenSDm7/RcE9fp1sCb0tYTzceU+uF7xFZ7HIN3+ID8OG9ZxqUH
         WD7gniI5bZL04+Tuai9hznTIFHnySG/6Y97AzyK4PsSgyn9/zlFrD90v1cgNdZHn2FBN
         5Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572671; x=1717177471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwoR0m49VTGEmSQtRmUmzRMbQgpI4F2JwwwIeeqB8bQ=;
        b=P4NZEKrNrayZ9UEQ8FElefYKjClUQSgcqhbuKvDyHBdekdFwY/vdMNyjf3ogaClq3J
         SLLZCBAVQf/6PFdIIvOu9fTJIseY4LJS5xMieqLVtbg9u6j+PxisZlpYhwtl0FWFUeP2
         LYLht2VCNRj5QczE+4WtvQ79aKMSPVytPZMtevufZxxKoWC6TAAgz0GBT5QqmgDm1zGY
         DxUp1K+mIOixrnRx8UhmFd1Ge+yamoQLhUlVSV5wkGBvfdnUnxfICrxviueiRJyhre0A
         fWYA22jjiFioPaTMbjgMdjFjx7C3rbZlg2EOBhZujEg/FJqwzJzq9FhPD2AvY1IxzlkT
         x2Ow==
X-Gm-Message-State: AOJu0YxNK9KaB4wJmDW/JuBkcYavyz7NLaDHYnq3q9JMdFuQGQDpUF3I
	Jzgkb6DNGG71xoDCvY5of7TcpHnayqBIeylVr3cFer6CgBbUC0PJChWsUQ==
X-Google-Smtp-Source: AGHT+IE5ls46rw6CYiDH6YrBc1qgPeeFYUZbNyeK3gxFeheVdrC+ElD3zjK5UbVbORQZY6htiPPOvg==
X-Received: by 2002:a50:d555:0:b0:578:676e:324 with SMTP id 4fb4d7f45d1cf-578676e0855mr38767a12.17.1716572671602;
        Fri, 24 May 2024 10:44:31 -0700 (PDT)
Received: from control-center.home (232-13-20-31.ftth.glasoperator.nl. [31.20.13.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852495e01sm1979737a12.63.2024.05.24.10.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:44:31 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-pytest-unordered: new recipe
Date: Fri, 24 May 2024 17:43:46 +0000
Message-Id: <20240524174344.2105779-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
References: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110521

pytest plugin to Test equality of unordered sequences
---
 .../python/python3-pytest-unordered_0.6.0.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb
new file mode 100644
index 000000000..bf1420cf9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Test equality of unordered collections in pytest"
+HOMEPAGE = "https://github.com/utapyngo/pytest-unordered"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcd3af2d38a4d4dfd5138c6f163dbe2e"
+
+SRC_URI[sha256sum] = "f61b4f6e06a60a92db50968954efac93e2f584290a49f53ad135e3f32f57e02a"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-pytest"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


