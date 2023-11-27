Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DB7C0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:11:39 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.94388.1701090695602037303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 05:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IF28YCTA;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so5556319a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701090693; x=1701695493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlqMTi0f5mIcOc+t6qt5tO8qNCKTace4lHxon838O3w=;
        b=IF28YCTAuMczoX4xFE/hi87Jw8PJ6ZndZxVMRcmmK2VnJnj2RUgOBi2ivl0oHIsqZ1
         B8uixZKlEcX4ihfGZyh/+divFt7nIJpakfIYeza1tkyRVpVKG23pdQ3lV5ZmAM65YnAP
         Lv1Oku8pfd0U0cF3QueJ/i5KtMS1N8IB1iKn5pbBKQjHcBkAxVjkjqpNsuI0NL7wLfiW
         CMBnqjc5XUwRnMsDHV0wGbGbPemBXk3one+YcoX7CK3XaXpADrdsjgMKvFXfffTiAA4U
         lvpRscwQWo62o3heL2fJf0TnSv6j5KXjO3qszls5PETOvf+ZZTZb+bPIvn5mmcQup50a
         CRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701090693; x=1701695493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlqMTi0f5mIcOc+t6qt5tO8qNCKTace4lHxon838O3w=;
        b=CGxF508885g4vtHRjI6C85u0CAKOXziC4IGS21Qiep7XN3splwP2IkcNrxQJ2/+3aY
         G8/WTSJ2carQzzWarpwR96OIJDbuvas2QERneQMtyhieH5JdudNDlmxAg103yXSWcJaO
         y+BRMtZaGPNcQh+S9O1kvexJCYn021Fugukx21pE/eJM98bY2kmyRuHGRxeEjkouDYn2
         +MoEWSwGDqjVRYuIoRMm68rxWfa/kRzA61kJ5Kx/NStxbfJYpG6Ck/akP+y0F1OYmJdV
         aY7S5Sdo3QzmWKheYS/N61xH9G2fNS9g/NL0Pn+zNAQB7x85P+ruCsGuoKTlAO7caZjt
         zu8A==
X-Gm-Message-State: AOJu0YwZ/gFME4/Er4ia5Bbep7uTxYEsbpw7NLhhVClS2UhTm14HzKz7
	1N3JeDmc86T7ZNx4ANcTY4YjZVNQKhlVUA==
X-Google-Smtp-Source: AGHT+IHbevwRBTEomeMDLFprOd71+CHRrP/NGmD6ZpbFleYBKmFB/J95mDUmo2v3w6HXNG12Hr3qVw==
X-Received: by 2002:a17:906:530b:b0:a0b:d4f4:ef0f with SMTP id h11-20020a170906530b00b00a0bd4f4ef0fmr5260430ejo.43.1701090692942;
        Mon, 27 Nov 2023 05:11:32 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906048a00b009c921a8aae2sm5628305eja.7.2023.11.27.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:11:30 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] msgpack-cpp: upgrade 4.1.1 -> 6.1.0
Date: Mon, 27 Nov 2023 16:11:01 +0300
Message-Id: <20231127131101.1391708-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 13:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107058

Changelog:

- Remove dependency on boost in chrono.hpp (#1076)
- Add support for std::variant behavior (#1075)
- Fix msgpack::type::variant behavior to respect MessagePack format (#1071)
- Add rebind allocators (#1065)
- Change CMake package name of C++ library to msgpack-cxx (#1054)
- Unified all C++ package, library, cmake, tarball name become msgpack-cxx.
- Change CMake package name of C++ library to msgpackc-cxx (#1045, #1048)
- Fix config for new MSVC preprocessor (#1040)
- Fix compile error that direct inclusion of chrono with MSGPACK_NO_BOOST (#1038)
- Fix noexcept on zone (#1030)
- Improve cmake support (#1028, #1032)
- Improve CI (#1023)
- Improve supporting platform (#1021)
- Refine double/float packing (#1018)
- Refine include files dependency (#1011)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../msgpack/{msgpack-cpp_4.1.1.bb => msgpack-cpp_6.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-cpp_4.1.1.bb => msgpack-cpp_6.1.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.1.1.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.1.1.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.0.bb
index fd08bf85c..5f5507bc7 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.1.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                    "
 
 SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-cxx-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8115c5edcf20bc1408c798a6bdaec16c1e52b1c34859d4982a0fb03300438f0b"
+SRC_URI[sha256sum] = "23ede7e93c8efee343ad8c6514c28f3708207e5106af3b3e4969b3a9ed7039e7"
 
 S = "${WORKDIR}/msgpack-cxx-${PV}"
 
-- 
2.25.1


