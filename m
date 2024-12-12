Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7253FE77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 21:21:08 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.2152.1734038461580991586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 13:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-29fb5257e05so369956fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 13:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734038460; x=1734643260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mS1qKzqnhwYpFzzFMnqBV1BIDNNyjTU4TwVV6/dEeNo=;
        b=Nw1JYH/msHKIGvEYmBrLdexkiTKBepkXn4Ys6dySnhdGMXEdjHx7vitt5YnbtJbBaH
         A4X55s84HSkJPMIBUSpmA4IhT37/lBRCVgJEeKqCsUtpKWWuxuY3IaAdd4JDsky22xNl
         ogwEQCoLMjLuFmAdaSv/tzN2SrkbNWuVnkYxiOa4uagWQS6LNd1A5Q/SLPNvmcCnBh0q
         j9pTdN6XUJjQ7C9u8x1hca1+7TpewPayf2j6ZOUI+ALC5QQVeT5UgydoER51Rb89mUCk
         ZEtCNXgjYX45EfIM8bh90ukpNhkJIG5yKAyaghECzVWxMahTQe5t5u0rpX0l6awP1yax
         w5vw==
X-Gm-Message-State: AOJu0Yz/cY0b2/1x2QQKuag+7BMQWkvvNnzoLRmKlxksAsDcyTsyBGA1
	QWwS4M7seETUyjuVtp7F/W1KYYoBtzBtO/ZJx2Ajj32fXSH2BuBwczM3Vg==
X-Gm-Gg: ASbGnctz6PfdfB5Cpj6LLPmqGaraCVFai4pofdq0+gh40gQR6aQjzB7Lxmu1RcmP6rJ
	qqO/wPZrt8N5oW7oUm/0SPrqW3SyDJ4Y5RsRu2eey/Zae4wtfqfZgVoEjVzZyatCSgStJLbRVRI
	6PPtClYmk8Q/2/IkB/vv0gFZxzHDOS6C7yoRdZ2PTGN/Lv/wx83/KxHg3kEjJJ9F3T//AqfwXKO
	SN364IUSZC6YYbmKAVmng71rZuAmZvTgUrqoPx6GXRkewOk9gQpIG1zjmULGTzeIm5Yq38mWf6s
	tVuewIKhTgROeqV58ZcQnHGhWw==
X-Google-Smtp-Source: AGHT+IG/aLa58JjmklC2MATQ2/QGVPKSjB+8cEZbz6mCnzISy0QerX67jt/UAzwyt3QpPQL01k9kyA==
X-Received: by 2002:a05:6870:2155:b0:296:c3cf:39ed with SMTP id 586e51a60fabf-2a3ac99f488mr97921fac.38.1734038460439;
        Thu, 12 Dec 2024 13:21:00 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f5665c35asm4495836fac.11.2024.12.12.13.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:20:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCHv2] python3-prompt-toolkit: set the value of UPSTREAM_CHECK_PYPI_PACKAGE to enable version checking
Date: Thu, 12 Dec 2024 21:20:53 +0000
Message-Id: <20241212212053.3548401-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 21:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114305

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
index 3ed18905f..fc9991e37 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "prompt_toolkit"
+UPSTREAM_CHECK_PYPI_PACKAGE = "prompt_toolkit"
 
 RDEPENDS:${PN} += " \
     python3-core \
-- 
2.34.1


