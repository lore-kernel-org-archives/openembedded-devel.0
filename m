Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54852C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 16:18:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.24900.1739549900754552666
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 08:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hk5pM3A+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso1199920f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739549899; x=1740154699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH5UB37F+qrqkPEPrBvRX9EsUpVzkvEWUArayQTAMuw=;
        b=hk5pM3A+p6R/2mfanswj1zPdDPqZf2Z++rNaAwrenfF+Ol71FjdfJbJ0yqafoC9d1R
         hPuQzTYBX8s3hyNrPz+Fx5KGpRKT9zQCR3LT4UaCukP9FNoGNPe2AfVzDhqPFvVkQZ1H
         5/BHzPgU1fcghIEulStxd+MgfSRHE0Qk4sdAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739549899; x=1740154699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH5UB37F+qrqkPEPrBvRX9EsUpVzkvEWUArayQTAMuw=;
        b=ZJmqakVFWWLYQacn7vBwxpQo4ppV05WuJ4lsPuMcNOM1RLcKE+w/RxkJu7sJfXBI/r
         jjVTALhnqw6NN490tdioMXseOykq3JDEUXT+SOFziELXxQ/1VOS8BDzKevgrQ80tED3Z
         wza6YHZRr+YfyazofrT5L9K88Bph7E7q6bOsdletf4s8BkUa+a6QmFApuCZDs5ZaaoWE
         lvm0PPqYhmWp2dSpmZdqbxUzeFDCXYcBDuY5wwR2FynkM4J4Sqez3yWWeURIM8CbgP3m
         C3oLyDPkL3xpUVEqS7E4rqboW9enROL0gRIc3ypS+8ymxHSO5CjZATFPxXlw70FjTIdD
         AZEg==
X-Gm-Message-State: AOJu0YzLmVDVAJPRCAxky/bdlYXNblEzhw/ZaRPiWtoGzh7/bJpFNzK8
	QpHuODu8CPytC+PxC109WTlHoESQN5braMoYJw9EZEb7IbKdItEpWcmBOdHUFES6LUCfyocOttp
	w
X-Gm-Gg: ASbGnct5dWtVm5Pks9FmVSASXb7hHirdRVlCR3Ivu5gbNB6Z/j4CtHhTmh4shJIug4k
	QpsM+eQ+ONDX41OoZjnL2X0afXvruR5EsoGTwn4Wq8OB6UVYlNypCRgXFAsYUU965QNin0abh5R
	RJYYvMNViZ9pchbhVmehZ9egZrfMc01WYfU41eFRAZrPf9vAdATjKrIoXOsaozpQPBguBreylE6
	lG7rFHdiM3s4NdHBPNu6ldauFbbEoPjlJiOKh8lDQI4Rb0ueEgYKlfIenXZrTqSbA/F/BK0mnow
	IQzKcOMq3TMQ+dRClu3Hc2PN7obiJA==
X-Google-Smtp-Source: AGHT+IGt6we20fFfmeW/qhfaCe7KdwFCPQLCV72XojAuCtG4ZRO0vnuYg4jEcVp0FKlfmQZu8AM8RA==
X-Received: by 2002:a05:6000:8c:b0:38f:3311:ec49 with SMTP id ffacd0b85a97d-38f3311eed1mr492236f8f.50.1739549898921;
        Fri, 14 Feb 2025 08:18:18 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fb6sm4915287f8f.44.2025.02.14.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:18:18 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-mypy: Upgrade 1.10.0 -> 1.15.0
Date: Fri, 14 Feb 2025 18:18:14 +0200
Message-Id: <20250214161815.3120205-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214161815.3120205-1-leon.anavi@konsulko.com>
References: <20250214161815.3120205-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 16:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115487

Upgrade to release 1.15.0:

- Performance improvements
- Mypyc accelerated Mypy Wheels for ARM Linux
- Improvements to reachability analysis and partial type handling
  in loops
- Better discovery of configuration files
- Better line numbers for decorators and slice expressions
- Drop support for Python 3.8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mypy_1.10.0.bb => python3-mypy_1.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.10.0.bb => python3-mypy_1.15.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.10.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
index 534ff90666..ebcac51ea1 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3d087fcbec056c4ee34974da493a826ce316947485cef3901f511848e687c131"
+SRC_URI[sha256sum] = "404534629d51d3efea5c800ee7c42b72a6554d6c400e6a79eafe15d11341fd43"
 
 BBCLASSEXTEND = "native"
 
-- 
2.39.5


