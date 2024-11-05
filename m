Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E209D2C131
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.19560.1730817432950533877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQgnGw43;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e38fc62b9fso47427247b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817432; x=1731422232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZY2kYMIHOTVyl08BjbxXJ3a8uTwHWldzZo9EMCE35M=;
        b=dQgnGw43Ri4O6oAqNNFshqfz9+PUdbvA7y7DCqfgjEjm4+VRr0riUaS5rcOL3zG5JI
         NBNUhunG4cEQCSylM0yI9b4vPoEe98JIOV64bCqzW3Q1kswhDBV9l4SXLunIlL+GNHjH
         Q+kDhgfz/qL4hYe7VJwFy3Y5E4nC/d3w4LDD/lnB/JRncIAFzuju1PkUTvHr7dHYAh1m
         CK5kmbHTKLdIuKMHTe2OvK7DXFn9+pBNS8Vu5kiTTIyv8fjXPTq8HgfPsv6hPmWMmT5J
         uTw1YqPKxtsMCStDtuwQQBA6Mda7SKnF2Vta7u3sa3IvbQWAddOP+DfdGpxHF7w8TpUK
         ugbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817432; x=1731422232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZY2kYMIHOTVyl08BjbxXJ3a8uTwHWldzZo9EMCE35M=;
        b=sT1aR3SNmOypY4ZEtvBfGa38NKxYI06ODQfXms8xH12Hr4Jv6TnqK2fTodMvtUyeQq
         nAVn+enuzvdDxb/BSUIc8ueJBwTyiI9Bdoy32940E5xLJsLiZcBvrykseGJtgE20iNny
         P9UhAl1oS5X1S8ZKOY9LpHzO5wSb9SOlDi7YG8k8usKM6kX9haFqI8Ft4zIpxFzU5vj8
         9iszP4ZaFhzN7zsKA7cUin+WSO2Wu7VF0jlZYzsCSu/wkX+Vf/BuekmZwptBu8v+LaLW
         PoEiDqIH38j9cl/rB6iT2pBPZy67f+hsa7HaBsRFq7IkwfFhYQYqEyDvubGBH4s1rHa8
         Nagg==
X-Gm-Message-State: AOJu0YyqHoqmziROIBB3N8QN1IQE+xpj3Pyos4FU9xQEPfTS3i4/xNsZ
	fGJyI3v5DISwQmHiC+UO4lyK7A93hj+NnhXlQGvyrbFePVxi7nNgExHx6g==
X-Google-Smtp-Source: AGHT+IF572j1kpgZJVGdMaa/uQxI1BNNbj3p4Uzok+gMnVIrbIpkOh7IvesqCc3US5aAxuhJSFOinw==
X-Received: by 2002:a05:690c:6201:b0:6e3:28af:730d with SMTP id 00721157ae682-6ea64be79a7mr167809427b3.43.1730817432013;
        Tue, 05 Nov 2024 06:37:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 70/90] wireshark: fix typo in PACKAGECONFIG[zstd]
Date: Tue,  5 Nov 2024 09:35:35 -0500
Message-ID: <20241105143638.2301245-71-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113488

From: Ghislain Mangé <ghislain.mange@smile.fr>

ENABLE_STTD is a typo, correct option is ENABLE_ZSTD.

This patches the following CMake warning in do_configure:
  Manually-specified variables were not used by the project: ENABLE_STTD
After, do_configure does not show the warning.

Github issue: https://github.com/openembedded/meta-openembedded/issues/845

Reported-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 15758538ee4de90c146199ef831205f942786c8f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index b80710683c..3fa293d0cd 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[sbc] = "-DENABLE_SBC=ON,-DENABLE_SBC=OFF, sbc"
 PACKAGECONFIG[libssh] = "-DENABLE_LIBSSH=ON,-DENABLE_LIBSSH=OFF, libssh2"
 PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
-PACKAGECONFIG[zstd] = "-DENABLE_STTD=ON,-DENABLE_ZSTD=OFF, zstd"
+PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF, zstd"
 PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 
 # these next two options require addional layers
-- 
2.43.0


