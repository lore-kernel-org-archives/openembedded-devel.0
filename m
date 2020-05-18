Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.43709.1589813409681647124
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r5NGZ8WI;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id s69so5329799pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oSIxVdK4iN+Zy1mh0QPQXM/JGo8pT4g98GoIZgzpcYo=;
        b=r5NGZ8WIWwU4ee0ErScfiHNhmcBjhe5AZ96RrPTfyQI12XafZVhO5/L6iPMaqW/byF
         OVhoLsBzEMUqEe4OMkzqfzFweENPiLssz/vhM1BCqufuP4FPejo0IU9QoAwlqbnVmw7H
         V4TTqLacq10Nk+FnGpJ1Dfv24CLf1EC3TOkFeAPKVc8JDvKaSh/ZTG4OFG6TfkIugcHR
         970FHKHTUtazcIahrBLDe+D5GLU14j7DnA76/4rCykHlZ6GIKRIDeWR+Yq+Z4fF+jbqD
         T9v85E0NDCf+9mqZgOoJ+lCBSxKbVPme/SY0Bsv9TMu39iHYF+rVaXiHOkLIOYs18D6I
         bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oSIxVdK4iN+Zy1mh0QPQXM/JGo8pT4g98GoIZgzpcYo=;
        b=OyqPcpADmBJG521VJvz6NKbmEgvgdQymbS0NBz78Mo62YmN/qRbOPLW6x4soabR8IR
         mfmg6aS4aY7yRatJS5VCjFHiUI+9R7IA/heSdR9tU8lvanAX1JjagrtVJFHudeq+reQw
         ChKxpOC9CzsM4C5IjCXsR2rsJgWQmndGTpqJLOzVXR7k3NmuVw+3qlSucZUfsoWxbjTo
         Te8g8Rzj7KRvhncvxMtUEQrqAENItj5/cD7S/Fs13YhAAdDgjB5Tz6qr/qs6koBVveNX
         G892gVmHZjnct4+gBx4PSq3mC39K/vOe88YbU6MOnCZzUT+Ohg5joZ5QWq9j9imDPqxj
         uP4A==
X-Gm-Message-State: AOAM5319Oyeb8l3mr7Z83RJWRAOzm3idQTFUGl2ZJ4R3kTCOzVylaXTS
	zmmFV4FpQWvW62Y1OJhSq7t2ocLm
X-Google-Smtp-Source: ABdhPJzjePsE8C5+anClBDbYb5eYwVrlO++5kdHEBe6Cl/TKtGoDB8B2CJz6qH+ZmpXLC2efMux0Hw==
X-Received: by 2002:a17:902:7c16:: with SMTP id x22mr16547555pll.244.1589813408940;
        Mon, 18 May 2020 07:50:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/57] tcpdump: Fix PACKAGECONFIG for OpenSSL
Date: Mon, 18 May 2020 07:49:07 -0700
Message-Id: <26eeb83572ebd70de831ab724d254811e6b8912a.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Alexander Vickberg <wickbergster@gmail.com>

This fixes building TCPDump without OpenSSL. Current version does not
recognize the option --without-openssl.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5b7ed1a8730a6e2c17d4650ee140b306483a3d9c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 05fc99bdc7..94543dd1da 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -27,7 +27,7 @@ inherit autotools-brokensep ptest
 PACKAGECONFIG ?= "openssl"
 
 PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
-PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl --without-crypto,openssl"
+PACKAGECONFIG[openssl] = "--with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
 # Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
-- 
2.17.1

