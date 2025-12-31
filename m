Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD4FEE57E1
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81812.1767167697776678242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKZy781R;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so56998435e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167696; x=1767772496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JP5yT/9/gdjhI5eT9vsqGuCD6TuYg/KRN2uGneH5toQ=;
        b=IKZy781RaeCfbfeVVriNdFWFbXPzlUHRUNaqIRLt7pEX8PIyvwRL6YxUNAVnwE3A6R
         lsWrlLsuaIPDBoj1EeWNyXfFXfQ3WiTMFsUjCy2W6jO5GdyNPVPPMsLmDDWn3Ow9bwl9
         m04FOZD/7/9wubH1qpqv/0/Db4dlfvHeZqwzoLKrWyMu3571fYImBXg4px/wZhXkXoah
         /+dSQw7MSmif8oeYS4iA3vderaJLroWCpNFrdJzDqTwJOn0a0/2fN8tdnDUbTM2HI6aR
         NhJjYWxYkGX86RoqOuETvDaDvg2MYuaSEilLsyicr44YNqrkUD9xTrGxgeNml0b2U4WL
         joBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167696; x=1767772496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JP5yT/9/gdjhI5eT9vsqGuCD6TuYg/KRN2uGneH5toQ=;
        b=nI2lNrutV+n5ztbV+pqu0czdEtBw+yKw+rUZAIfUkHc7QBu0I6UV4Br2xJuKgVWZAj
         iBEVMXO2LiDdILGhe4DuYiXwJAA/4choq+O/v8q57MOJ9wiPEsk63gTy55hCsLGM887S
         S/ch7Zorz+BxxMZ1K9xImzopsw0iONuJ1kuKANOAz/dxzufqh5WudaCpleeBxQbzk2LO
         oijTCaREZV9on5oPUcCytGDOSp4YnFS9AIPndnWIczbGE0vDQEOawfe32GXeQ4ZVNJkx
         nSqAAqEq+ivWyNhr/w+Te6OI6sN9OT7WXwB9Pf2/F4UJF1yysDRDIGHzWIP0KgGpUM5T
         ByLw==
X-Gm-Message-State: AOJu0YwfugbE7f8Ab4hkLlwXg3KlLi9wr12GY9QTdYi7UJ8hxefK5DBI
	I7wUzgh8POPg2gCOn3olQOoi3Ng1Fc/7wY1jIjvqEStQj/KzGAUI9i1SZ/fzvg==
X-Gm-Gg: AY/fxX48ePe+xl1jg7WN+3NV4qdaYfXH0AQSMf6V8HDtW96DOHxllB0+cD9vKR0TBan
	svjI5i0i6qzc5bG+HTnMwik+nMebxhC6C+VOrrBcDsMsQvecAsYCWWylKuzE1MtZet4jtYXqwjd
	eSoa0rDKQRm1MJHf+No7xJmoJXDIHhsFG9PfIa3QIQ7vpFXLCf1iwClPUi0ghuNzmj4nzv1Ohg2
	BGtb0R+pgweRnzugPYbimJzhIZV4XjrcDkpW8IvNao6Vf8fG8ISGfVAx0lsUv/Pp5ThkMbG0po/
	pcinPegeh1kntfcRfGx/nw75U9q0CbEAsEL8nnt2vuGyBwXNfvwfUFKIGuTqcq4grOiUUVIyoYn
	b1xrCJ0fbsAymoUO8HI8gpP7PkG0vePiL5qabLuj0Fc6GDkY43rHM6Kc7U6Cp/L9yHLY73iFYbj
	xQkEKqtqM4
X-Google-Smtp-Source: AGHT+IGpYIh3RMAtCuFUNbOuMagJ3myyVgULuCdirPHql/Z3sLvwuq4DEwwKAPYJdbtAMvMw8czQzg==
X-Received: by 2002:a05:600c:1d1d:b0:479:1348:c61e with SMTP id 5b1f17b1804b1-47d1957d746mr364233865e9.20.1767167696119;
        Tue, 30 Dec 2025 23:54:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 26/34] python3-markdown-it-py: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:28 +0100
Message-ID: <20251231075436.771395-26-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123066

The related CVE entries are tracked with executablebooks:markdown-it-py CPE
value, and the default python:markdown-it-py CPE doesn't match relevant
entries. Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%markdown-it-py%';
CVE-2023-26302|executablebooks|markdown-it-py|||2.2.0|<
CVE-2023-26303|executablebooks|markdown-it-py|||2.2.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-markdown-it-py_3.0.0.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb b/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
index 5ba4fc88b7..1944574fdb 100644
--- a/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
@@ -10,5 +10,6 @@ inherit pypi python_flit_core
 RDEPENDS:${PN} += "python3-mdurl"
 
 PYPI_PACKAGE = "markdown-it-py"
+CVE_PRODUCT = "markdown-it-py"
 
 BBCLASSEXTEND = "native nativesdk"

