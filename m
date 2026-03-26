Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BC910A88D2
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:14 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50120.1774538533337131528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QQI8eecf;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so10453295e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538530; x=1775143330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG7RBfvPsRBoo8CN+EdIFhwGBD8wxUbJzVmbAQ6LbMU=;
        b=QQI8eecfU2DL5V3/YTYy37Bb5oD6tbba1DdwO/xDpDSX1LFVr8ietWesByARRJ/tgt
         a8UXcGBEsXMSOyZ0WSDlAbJYALOugkXuN0m24AWjn1vFVlI/SvFKSry/4RrFkSvFM0bB
         XXtmjbjZfclOJhmZznxsl4Dt0B8VLMiqscHjhDYQuLzg4OWsHRURiUaJckUPVBMoPwCD
         bijA6PIagVnXBNjVQqulUDQlAlFvj1fYABHuooFn0F5T2qntDQr4zU25eLz5BDkDjUbG
         MRNwsTMaiZo3xXhCWi1gnmdxdZ5hsXe2lr7iVAktKtpwzucqUWbnjWW+Vu+2N/v3hTH1
         jYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538530; x=1775143330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rG7RBfvPsRBoo8CN+EdIFhwGBD8wxUbJzVmbAQ6LbMU=;
        b=VibLsi4U07g6d+8+WlD71YJaj5B4jzPB8W8iT88q0ruqmmPaVRVQYZ5U6JTSA/eDmb
         A7ooUjtIrVXMzMr1JlTq/7vrJK4AQ5oGY0469Tyqaghrm6hQ55Sd+pzumhn5lG2Wl3Kv
         GVv2L9sJBo+XJARZdrgfcKienoeSw3BVgR9NfT943SffXK+RYXlZXZEOqJcHcJZae7T+
         amegveYRV0+CaheVQsf07buT1nrfDlwdywqcdB14T8h2gNviAvFTwud6cU7Zk2ELoV2A
         BuIV4QYVTQ4y311usgDnUoZ7Zk2DUGfF16EY/8YpJDKXrpqXhzpH2g+VgNRSCCUfv5SV
         pXkw==
X-Gm-Message-State: AOJu0Yy+ia0m6YnIwAXWz0BPPqDc06C5nplp478W0Um2+nWCUUlDDHwW
	tlF0D1Ozvj7BHrizdkOLcRqHNo9YG5mffpbGzCH5iOY4gTXkt4RTmWW57Wo6Mg==
X-Gm-Gg: ATEYQzyW512YwT59yaWG6u/Iz9dQ4mGQ6HvGgC8ZXRpugrDvrH0Od+X8gxCUmAkx+Zv
	A1S7QGLQvtCtLWy6axQ32S2W7tyk9lA3Wv/lWOGLa05BuydxyRgPrYq28Y9Ui1rQCVThfO4CDp4
	FpdXeywWb1diEdV5yfZae2O+HITRnpot0/pl4MQ9Ve5zlhJRGvOmcziyfqE/dUA9iRwsg/dYiin
	0LsLcrnyciSdnFxeyacXKFokEQZn4zay7axqMCfJeUCwU8eAyc9Cx5ryc4xg+6EtNTDBCx4bc0Y
	kcSTwND60UAczoPMPn2zaiDA43Ona3oomGJm0mTnIZTo2VFES00zws7W2WQ0DMNAVAC8WeRTrOJ
	z770+VK5Y9bQaGt4rTniDybuSTRk4S1lPzMYIuCJUqd36UNOR7nfQBW+7aKBv0vnxBaA8FE9Pp5
	ZXjYHj2gKiNH8Z1Q==
X-Received: by 2002:a05:600c:c16e:b0:485:3dfc:569 with SMTP id 5b1f17b1804b1-48716042b0emr118049485e9.16.1774538528873;
        Thu, 26 Mar 2026 08:22:08 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 09/13] upm: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:34 +0100
Message-ID: <20260326152143.2224099-10-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125749

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 9b809ce727..df60fb5a81 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -45,7 +45,7 @@ BINDINGS:armv5 ??= "python"
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', 'python3-${PN}', 'python', '', d)}"
 
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
 do_configure:prepend() {
-- 
2.53.0


