Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD45AD3E18A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.29988.1729278833722512424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxmipEza;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e34339d41bso22715777b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278833; x=1729883633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okOXSj70K3fHHuJEyt+E4476ZpaiXsHiWtg7Zf1Gza8=;
        b=RxmipEza03F0De+Euc5Qj4uDiW19RZhQKRdvYZcHCu4dLgFF1MjgLhJHWc0vOPxGdr
         EMmBslIQbi1vDN6GYLg6pro4LJmR9xM6+lZPL3iQeo7KRvbeurWRaM/4widJVrBSWZBQ
         vAa7q4qqFtBMvCwmsHX5MQyysGEZrw42muYDuwKNNNR/wHuqMrUOP9s4GANR8quXKzme
         uKsPdu8zRuEZo1Mm6H82jOsq4PXKtf7jFOnHVMfF2oc+TF7RSDArCmhhs/hXMk2Fz8sC
         c9yGvRDGDFOjrLEIHr2UNRL6c1B0WEKD5UIroUkXWnEpPFr138ezEi7Qojz8V6Z8tsdb
         Bobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278833; x=1729883633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okOXSj70K3fHHuJEyt+E4476ZpaiXsHiWtg7Zf1Gza8=;
        b=G3qFUEHcas7JTM/h+r6ELaBxl79aeyrU+ygAQAwv6p9C6Bi2pFP3zz3SalcfL18wrv
         mJZ0GdMhB/ggRMogePf+M/9eSAav40IpVAmsU1/OHCLpagCY28AIk6El5ayIecd9vNlm
         TjWjJ1EcCAcytsP7mLg4XEziiYOzi1QFXeLeP31l/i/V7v+HRcJHPJqPs1KO/89M29Aq
         sJ/DW4D7VFgDsEKJIkvBXMDpk0IscR3ndK/6i4v0e31bCgVE3fl1zqaNYNDwsK8AvH0L
         2Yo/wx5AyetHy2krokeXLoF/QMYjve5UFEMpWdCkD8ystTSZ/KMYuP8z2CvRYix7RCAN
         BMAw==
X-Gm-Message-State: AOJu0YxgzlqD3Wu9lu0jtN+MUxk1cIyC2GrB8N+bSKrpCWcRJQuNlzhl
	cOtWnmQaij34aS7d+L8XjhfPWajPTQKh+4ffOSFgGMnklURv43EvHoKrnA==
X-Google-Smtp-Source: AGHT+IEiTiDwWC1iY6cz/ujB55sEvEVz7n1FYSpb0XE0fKVavdsogfn5LWAISjS33Oky9LNBhilMyQ==
X-Received: by 2002:a05:690c:d8a:b0:6e2:aceb:fb34 with SMTP id 00721157ae682-6e5bfbdd357mr32763197b3.1.1729278832382;
        Fri, 18 Oct 2024 12:13:52 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:52 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 64/68] python3-versiontools: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:51 -0400
Message-ID: <20241018191101.25184-65-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113051

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-versiontools_1.9.1.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
index 02639b590..8a83f1111 100644
--- a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "https://launchpad.net/versiontools"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=20;md5=02193721a38fd8a05a4ddeb7df8e294d"
 
-SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
 SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
 
 inherit pypi setuptools3
-- 
2.43.0


