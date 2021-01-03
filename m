Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.25408.1609683189240050385
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pt7HVruz;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id w1so33398889ejf.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p6KHPOzTE4VviQQ+lXAn3HDn9GvAC2Lruu9WfHfBWrE=;
        b=pt7HVruzvvAjngqzJR5oQr1xG6FX3o6w6VOwKYb88fcFGXJ8a3b7+jRNAwlbEshdR7
         oIEFEdVm/n8E5Jo4oE1dw9XTnDCsxcRFsJNh8ii+pr7UO/yf2bjpO3Po8mNVkTKVS+MS
         WFOHXdybIfHMWPcLZLNq1ZRXUOd6QKJ+/yb4tFgh8S4dEGY6rwxeoYYfOo6DAhfZpEWD
         a3BCMvp5buudkYRUHRQmP5vb8O1eaPD4Oo2Ym7+9/sDtTBTGpPFq0BwGgt6yBDg5YC//
         gUJF58KzWuz/lUSb8UTgHPHFzO/fKi6t2+GJuL4tyzu6GoarsTdDjzLheqEuz/JLWE7r
         sc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6KHPOzTE4VviQQ+lXAn3HDn9GvAC2Lruu9WfHfBWrE=;
        b=a97UISByCBteMmoNMzzEXAmBtgPivsd1qSPYPz8cJNOJtbdkI1bAJKn0XoYqgkdWM4
         bjYHkODIqmmMTXKKzE9ZNQVAB0zpsAK9CqrYYUZebwID9tRctVlPfiKn99ycYBVrJQNn
         njBa6AZGaJYNUnXOMD2loJcsCjtz5NfgzqViteixeQF/ukPrA60/ofmuFKP2QPKcRI7m
         +LcqiQt8snYy2i+J13nZsqNyUU6fGWiMqoBrzucn1Ea2OA8xqcAu9Ixh8EInj6nhAw+3
         yZq0b2PyqNWb2cg39atGrHScW/xj9nHGEkOvn+qWMucHLGJTtNFANWC3gADaixkdcqKd
         8T4Q==
X-Gm-Message-State: AOAM533olwyX7TR20GXZIzZfE67TkAYLTMlhbvAGxdCCCyNlIf+T1ObP
	H0PV2WJ0i9ZAl95ljvOAnfIitW8b2+k=
X-Google-Smtp-Source: ABdhPJzJ3TDHWmDdED+y2M8SJNmtLBqga6jrXPMlmjbIMx+vyt6j77ZBb+RbRwEV4INhz94CiLNuEw==
X-Received: by 2002:a17:906:add7:: with SMTP id lb23mr66771693ejb.352.1609683187893;
        Sun, 03 Jan 2021 06:13:07 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:07 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 09/16] xfce4-diskperf-plugin: upgrade 2.6.2 -> 2.6.3
Date: Sun,  3 Jan 2021 15:12:40 +0100
Message-Id: <20210103141247.1637618-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.6.3
=======================
- Fix build with panel 4.15+
- Fix missing-prototypes
- Remove GSourceFunc casts
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16160)
- Update .gitignore
- Make build less verbose
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Belarusian, Chinese (Taiwan),
  Croatian, Eastern Armenian, English (Canada), English (United
  Kingdom), Galician, Greek, Hebrew, Indonesian, Korean, Latvian,
  Occitan (post 1500), Panjabi (Punjabi), Polish, Portuguese (Brazil),
  Slovak, Slovenian, Spanish, Swedish, Turkish, Urdu, Urdu (Pakistan),
  Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...diskperf-plugin_2.6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.3.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.3.bb
index 6a72c89a6..31eeefd6a 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.3.bb
@@ -6,5 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 inherit xfce-panel-plugin
 
 SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "538119ea97a217695b297e2d165b305f"
-SRC_URI[sha256sum] = "fd2e9843da5822de96a7829e50ba496c34a50fb8492d5b5f792558c6b7ce9644"
+SRC_URI[sha256sum] = "73b1ea2deb2403287337e8521d21345fb2f88445f9030732fa28f1bfa5d51c59"
-- 
2.26.2

