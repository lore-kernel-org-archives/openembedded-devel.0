Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43CBC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.155465.1703876559082798157
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ed/Gwa/3;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6dbf0561f8bso2562653a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876558; x=1704481358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyiRVe72ULWSXGoRpJApo+rcPsCOyNfBoljdfb6gl3k=;
        b=Ed/Gwa/3ve8cUfdARt8tPQNXZQoXMhk/4blyAvmzkoaDgSNVOltDwU8+ZwhM/sLqJl
         1h0OAHS5wrztcVtgylx5BlWYolsGlPeM8v3dyy06VIpLv65jM4stuoE34Oh1t8KLy3cG
         G/GFz5QU4rJ/586CftlSXl8Xi0Ux2/tgehxZ8dlYKvvroi+FJ4Vu4ncHOVHpqz/4Dy/9
         wUO/0zPccVvwW3EvQWx8z2mnD5IjkCSKTRRXQweAdc3SBc53j+fF9TKETkHLDTW7WHSz
         yB0rtvxrekgQo9EGM2XSqfQ3SXM2wwP2jtgTEnegiZOe6unopr8m13awrPcwZBmn6xkd
         AfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876558; x=1704481358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyiRVe72ULWSXGoRpJApo+rcPsCOyNfBoljdfb6gl3k=;
        b=vWgeae+PehE9cbQpbin66PQPzxCFeIT/PcmduCgovkipcoIbb+ngXkFbdb1eRS5EgP
         hWHzi4CdUC4AO3zJhB+hsuzhlO3dskHe5nmKGhRtaPspiPqB1i9pF0U3+sHDfTTMTXZR
         KSHa68LlMXnEd+9SkECcgkxit8Mq4RpQfO70RG9RFEHmdrKv5nMIltromGjUA6Eb/XeI
         FoDbZznlfZVauYgLPSxQdbU5kXEi+GzBpl29MIMGK/G8gxMLDR7onWbeCTK7VgCdGzaT
         kdXmKXlSgDWsHh3nl15HJTlwbx4yWIcaHyFYbeCaKYj+OZlKAfq2M6ZtJumBNkCasAim
         1EhQ==
X-Gm-Message-State: AOJu0YzV5UdPCwsjX+5VGVsiKNvgikGdbgRX6XwAk1/b/aOjlTdQuCUk
	wS4xWR3ZloWNH/f4rbcVrDJa05g1ZxMGwQ==
X-Google-Smtp-Source: AGHT+IEBrdkgPDrLC9nLusJ615RRpqsUkwf1QmyqmXj3J7kRUfiUCOxB3h8ulcvV2wPWECQ9ObWgFA==
X-Received: by 2002:a9d:6d8e:0:b0:6db:fc2c:ba2f with SMTP id x14-20020a9d6d8e000000b006dbfc2cba2fmr5046249otp.0.1703876558069;
        Fri, 29 Dec 2023 11:02:38 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 06/17] python3-scapy: upgrade to latest revision
Date: Fri, 29 Dec 2023 14:02:19 -0500
Message-Id: <20231229190230.135480-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107888

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ca49f2025e65713811e73e894c60cb78be1ed34c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
index cc3f2ee1dd..4858e4e579 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # If you want ptest support, use the git repo
 # UTscapy does not exist in the pypi pkg
 #
-SRCREV = "9473f77d8b548c8e478e52838bdd4c12f5d4f4ff"
+SRCREV = "0474c37bf1d147c969173d52ab3ac76d2404d981"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https \
            file://run-ptest"
 
-- 
2.34.1


