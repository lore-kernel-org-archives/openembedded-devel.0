Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.2250.1585607190997605559
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 15:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YlcW38YW;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id a25so23671493wrd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vnH+c9uHnMl957/LmYsSW3kcH+/dq7crr7yM/w3MZjs=;
        b=YlcW38YWdNvFhxh+8hcwBRcHT80jlFvDS/yqus1Re9xj475tQORMhwY0fOmpgalsK/
         ZyPZDl8CFrpCSvr8Ntk9Be8FleunRjfFgicQJjuCn67ebpTPrFFuKcjoKoTSp6OGJ6sJ
         HX+encrZWEC3/q7cAoj3PVgW3uS5kbVlQhffw2U8j/kb/6LF8zr+Caofje+GfBFV0b4o
         7x4b6AsVE1KaL7Q/1MvI4ucekNiupKI0oHKnnDxqjzdlmWo1Sl+d+srMOOikum2dzLF3
         V0Xg6CvpCMKu6uyfbVQWjWE6Y0UFLtGtxm6tm2HAhf3CS6mR8u5D1s4uSDajzsoMOo2C
         sqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vnH+c9uHnMl957/LmYsSW3kcH+/dq7crr7yM/w3MZjs=;
        b=pBs5fKZ5DWJXduwLXMHuXn5LlzKQqWHyo/8/YB38NaMA5YiVKCjB3UnUUHDe0KWu2/
         T340qE50J791452VwgNfktrbGu1MIy2ADweez4YDcsrPra0v+PjAIdhykVG4Hoy22hBS
         B/5CTdmjk3p8U8vTSBn0St89NSuBD8xFf2nmif3MfdhD9BE4uk7zPZB4izClLINI/0lh
         xqk4Jlx53xsqXA73PQ6VapN7gW7p57Q/gdaJ+lTLE3uCWmjiJbmBogsuY9LyXRNJvSxu
         KkbTRA6lhHAJe27kxzriVxSWiTj0FVHPRIJOivmt+uzhUAp/yrYzxMTPyUCRWQhZGKOr
         GZSQ==
X-Gm-Message-State: ANhLgQ0sET7QVBpW2gfyZfaK1eJhbkKSawOgDJOqM9jjub+fcBPipflA
	GPgntiwbUvml8+h5lmHqgykykQaFQOY=
X-Google-Smtp-Source: ADFU+vs8o5PsS03oT+jVv++mLIkChProOh/zVAPrHdH1iLMz+OK1goRBUcVBLblPYQFDNOfmvRZiOQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr16939486wrs.391.1585607189383;
        Mon, 30 Mar 2020 15:26:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030968BA11C5DB455F3E0C.dip0.t-ipconnect.de. [2003:f0:7f03:968:ba11:c5db:455f:3e0c])
        by smtp.gmail.com with ESMTPSA id z1sm12002404wrp.90.2020.03.30.15.26.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:26:28 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/6] xfce4-session: upgrade 4.14.1 -> 4.14.2
Date: Tue, 31 Mar 2020 00:26:12 +0200
Message-Id: <20200330222616.2354-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330222616.2354-1-schnitzeltony@gmail.com>
References: <20200330222616.2354-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.2
========================
- Add support for xfce4-screensaver (Bug #16522)
- Try xfce screensaver before cinnamon (Bug #16223)
- Translation Updates:
  Albanian, Belarusian, Indonesian, Polish, Portuguese, Swedish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-session_4.14.1.bb => xfce4-session_4.14.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.14.1.bb => xfce4-session_4.14.2.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.2.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.2.bb
index f50a545dc..f497b7666 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.2.bb
@@ -15,8 +15,8 @@ PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-SRC_URI[md5sum] = "36593207ac0c67c81907a4846f4b604c"
-SRC_URI[sha256sum] = "dc1c90da56b2d8df18fec6c0c30d6bed4e7646d8c8214fc931c952ba86c3b77b"
+SRC_URI[md5sum] = "5ad23062fd08ef5f5ad9b4389c7b54c6"
+SRC_URI[sha256sum] = "fbe3a4a60c91589a2024ce12b2d2667625a8fedcbc90ef031831f56319f597af"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.21.1

