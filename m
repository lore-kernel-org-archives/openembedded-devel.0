Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F23AC02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 17:32:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.122605.1738690349205110703
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 09:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auWTzfN4;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4363ae65100so69684685e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690347; x=1739295147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SDN31FrgUtLziF2CVGgcYeHX5sNk6vXR/6v4Z93oXo=;
        b=auWTzfN4FPshFjYl0OO8gnorle/Kk+AMvOsWx/4qQxYNUmS0a4sz2MCEOKSvSluuZK
         5VbZ7fk8H3lP6WEkIXYWbOg5jVswbakvijqq0z3AWYzbKbp1+hXCa/j03vz8DzSrUhCA
         p/sw5ttYJFf8GXoJwk2LCnshOl/GcJVroi/LkQpuYIoIMZ2louKsThGbWIr8V9qhEN9I
         eJRZ4D+7SY6E8hR7ISJeGOcD4WmPXslmVn+o5XOVKhDGBXCQHgGhw5HTYGuqNsEkP0be
         EIODdek3JVYclmz2Jq1mRQOP7Jr6+e/ioVliGct2d8r86Jc8Ir3bsfsBrpxduu7aTCoP
         aR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690347; x=1739295147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SDN31FrgUtLziF2CVGgcYeHX5sNk6vXR/6v4Z93oXo=;
        b=tfFkaj2l5XIsF3CJTX/ZmicIAsiNJHD3G5k8m3UtTmHpdQGOGXuEhieza63sV6w0VB
         TJ/FE3enDWcydtJ1TpgunVldcxtVlxp7lyNMIlPYlY0P1xYWU8dDXMoIUWMSMyplA2ZQ
         L5im1Vv3sZE8JDsGKiK5qNjAZVQKc+p08PPsLyPPysJHAORAcmawkcbbePv2G9YmcyKq
         1UVinVCMqr9hzj9cIA5y26Zlo6Z2TMxcDNBaOwcHtO9oxuWe1dQ6Uf6dB6fVMOa/ieRC
         Y/H57GYh7qBFTLd3sY+hkIKfeTVl3TvYc/rVYMXKQ0O0qlteGvep89oB8pNdUmmrCa1L
         g6BQ==
X-Gm-Message-State: AOJu0YzRTF76Wv1CI16GNSyOdqKrOVlgWEzMSASeJxveGZqWH7myNejf
	tVew+Q4CfOwTLt3P7EUwRHsJPKHq5GQfm6MvKKjkG5beKPr0RGXQB8acew==
X-Gm-Gg: ASbGnctnZkx8YO7kpCZxJdHMyfnD91ZTQnaTzL/Nz12PUQUdlNnzP666WXmy/7jrxef
	igfO1df3ufTOY6gXe42PWZrtWj/m78nNBzhcePrT2suP43DNIZjXzaWmPvd9gO2YYZQ/+aiDidf
	aHGuDTds1abSlKKC65Wc5bg/zIQZDyzJH4r6G6LlfDWstM1X01qK2YkFEi2uzI/+uJVI+O3ZYoD
	zyLoFpbSKHRY0Q5PYji2ZnOb738F9J221hd6PaC/3quG1Vw3l2w6/fC2T4Arm/YefLeu+Eu83X/
	0h9b6/r7Ig+eGIRUq85EuBSnkC2bVgbDF2LY9blYA2sc/eyz
X-Google-Smtp-Source: AGHT+IH1x0ZrceMAxJOkE9YdyjfhmaxzoGxjBHu+2xMl9ll2KPtzUlwgAge/j2Iks/TI+iDzaf4NqQ==
X-Received: by 2002:a5d:5181:0:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-38c51969ff9mr18895051f8f.26.1738690347473;
        Tue, 04 Feb 2025 09:32:27 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db26fab50sm391806f8f.52.2025.02.04.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:32:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] python3-h5py: add -Wno-error to allow building native with gcc-14 on host
Date: Tue,  4 Feb 2025 18:32:22 +0100
Message-ID: <20250204173222.304849-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204173222.304849-1-martin.jansa@gmail.com>
References: <20250204173222.304849-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 17:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115276

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
index 64abe73cba..df57bfd884 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
@@ -29,3 +29,7 @@ RDEPENDS:${PN} = "python3-numpy \
                  "
 
 export HDF5_VERSION="1.8.21"
+
+# h5py/_errors.c:2115:64: error: passing argument 3 of ?H5Ewalk2? from incompatible pointer type [-Wincompatible-pointer-types]
+# h5py/_errors.c:2365:66: error: passing argument 3 of ?H5Ewalk2? from incompatible pointer type [-Wincompatible-pointer-types]
+BUILD_CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.48.1


