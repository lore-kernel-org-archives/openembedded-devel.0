Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.29051.1605022190797590217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 07:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDHCvyWg;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: rosbrookn@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id h12so8800325qtc.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 07:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eqyBiioFB3hJ/tgpDOBOck0Y4cqdgh4ZGG+OVBZrin8=;
        b=VDHCvyWghsh8g/5cepJ+rKX2Q0N9Cpls63DN7ku4LNh9xKVweIsCnLf+Jkbuy5ZQIX
         ld9OMWbGq3CMRuW6DEdyrUab/NTaENtGProKw+NjCtg7Rb+2EpTe95o1M/7pGnP/ULYf
         +Pw71gAdLSFYdVO1qrU2mTP/wUL81ndh/lEKVem5gm2fkEyAH9THRFDMGAZ82I9hRJDy
         5fENAre+b27+gcBZV1AIfDUqSNr3ycRfBhohrzI82APPyGIpHMbCctQp7kk7UW9EP1RT
         mcLoInET71jZbFpyMvUevi79f5Gp7t6P95c2UJa1ynzxoCTVnv9WhGo2SjWLD+hvajr/
         QDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eqyBiioFB3hJ/tgpDOBOck0Y4cqdgh4ZGG+OVBZrin8=;
        b=lupSxCV+cmsHEP9PvYEz41we7w8UtGp9957hLiMgMHu6WucLrdjO50wnRpQGsRPxyE
         JNNoZChTFKsuiVkWAJsdflGC/JoqfqfBOduI3pQp2gt1PasDOhXZmFg+j2NN8PWaaU8c
         C4+VSWqvnCqVsMY5jh7SVEUC5o7+9pXcoUVDmh79qZzA0QzLSrmno5JmgpZEmFDaXQBZ
         dA7JHTTBKUy10wVNzY0teIxDXd2GQn9Scr/nYFp7xI72pbx6bvgQGiVMC6L7aYmFTq9m
         AoZH3GDk/D4YtIs40cz2THfACzfKvFx2VXS/nzpFII61J5w3NX3VJ3O3cAQTFgoh3gzF
         mFUQ==
X-Gm-Message-State: AOAM531nM+OUDv50F9zb5HkldTA52PCY6a0SuiaGLeFE9LRpUPy90pNV
	fQy1/HIBU+RiIuIi/A5j8AMInlezlnSqKQ==
X-Google-Smtp-Source: ABdhPJysoj1qmUpHv+tuY7gIF2SRKQvwCKP7pfP+ZvgYQe2QTCSfaBKVQ3o0mK5BoExSOMaZl5Csfg==
X-Received: by 2002:ac8:71d5:: with SMTP id i21mr7512808qtp.4.1605022189612;
        Tue, 10 Nov 2020 07:29:49 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id z13sm8680549qkl.2.2020.11.10.07.29.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 07:29:48 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH v3 2/2] strongswan: remove ldap from default PACKAGECONFIG
Date: Tue, 10 Nov 2020 10:29:41 -0500
Message-Id: <95282eb3db94a9c8a53b855e897aa7fdc590711c.1605021370.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1605021370.git.rosbrookn@ainfosec.com>
References: <cover.1605021370.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since ldap is not a standard DISTRO_FEATURE, leave it disabled by default.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 7f2a2b1e4..bd3e87a3f 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -27,7 +27,6 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 
 PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
-        ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
-- 
2.17.1

