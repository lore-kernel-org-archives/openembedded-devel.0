Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.557.1621121956786353917
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TDWsyOcq;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id k10so3751277ejj.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zEnD+/1hD7rWysMECKkavz93dPzZpCL5gBw0cf5zC+w=;
        b=TDWsyOcqw7MTyHgv8oX+w8lbQl5ZliRs7UopGrzxv8UioNIou0bxTk7XFHzinCbUdR
         cnb/FMElz9rQRHenA6OAxXLzmMS4lHszc2N1fF0FpUv51daTcBgA0JTtQHLcOn+f2rTS
         r6aH3ynR7mfXtpwwSpbXz0Q/K2cvKobkp9bLFzHJ1GWv4BHpQnt7gUQqMU9tf62wmDfk
         TiAVCHKvU1/5dUPgzE+kXowTRUQk0z+t2jsFZ38HiNDEBOKthtDjkD/bTsgieffAPEWk
         9zcJFLkkGxaJFg0DMjqdWHyvBdrIuaDb11dCQiEFbD/9ukopL8AszFBLIuir/IpVVWxU
         hOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zEnD+/1hD7rWysMECKkavz93dPzZpCL5gBw0cf5zC+w=;
        b=dbQvTg5S6LKH2LoiqVExj16W2k3MVPXdMXfplIgoKPWVDEh4Xop8Od2AGC/WsXQ+DQ
         gFQVZoySaOJAl4VjH3FfW5AoqMHi/PRDpLhCPfWn4npPIEcGr5RZfHPXtMq8RJoIZz4d
         4MmZqT237k3k42atfxLBjGe+U6uWg5eiKhpIj9+lgordmf2nu/FoL6usarHWEqFswmVW
         GLptzKZwhjZ4dNKgKB5CMPEXDAtj/LLJ+uIqAqxS1en8YM+cVl8OqfcRQ/ks2O2vsc1j
         umBWCCQITtmXLTEci2mCN/RN3KKzvsPcCC2TJM66AwVfHOvHGE6YVCqD4jxs78R70id/
         IaAg==
X-Gm-Message-State: AOAM530/hQtDxS7eKaR/RR6Wu7sPeh2bipWvGd4dFOkfAhiYro5QiIDe
	aeClEsPJspGA48FBnieddMrIvZDBCPo=
X-Google-Smtp-Source: ABdhPJx4Tt0h6IbY31kUqGTNaeWDkcQKd2U2PXeF59i8cKqmIFxMHRy4Fn771f5n87rl39abZxi9qA==
X-Received: by 2002:a17:906:fcdc:: with SMTP id qx28mr22745421ejb.375.1621121955387;
        Sat, 15 May 2021 16:39:15 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:14 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/20] babl: upgrade 0.1.84 -> 0.1.86
Date: Sun, 16 May 2021 01:38:46 +0200
Message-Id: <20210515233853.583490-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/babl/{babl_0.1.84.bb => babl_0.1.86.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.84.bb => babl_0.1.86.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.84.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.86.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.84.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.86.bb
index b49d9d7e8..d264bf8c5 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.84.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.86.bb
@@ -15,6 +15,6 @@ CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e7e38b8441f77feb9dc8231cb434a86190a21f2f3692c281457e99d35e9c34ea"
+SRC_URI[sha256sum] = "0b3f595159ad1b216cd729c0504c3a5f6cf780c641f4dc63fc164f3c0382c8f0"
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

