Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.20521.1600613450997610519
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TlItUYKK;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id lo4so14265054ejb.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KapgjJWArhcWBr1QfG25g+bgziA7yWOcnl4K11CM5uc=;
        b=TlItUYKKwgtxe9cegcvrJSBG5qeigTKqSFqyu3o53vGIhmHtyx0Ujk9TyOgJXoXdeF
         gYeSjECxl4dHFDgNrE9ql9qaXh9rkr6YeuOaP2KQdjkDI00CFZhCQpgRJeHfMsfo6bvb
         lxRi6qoAd1mkxTYaHDcKz3VyA6q8gQVkc6WqlwtXQPyHqaafGa9d+bVE0jT5kam6+u96
         oFGW8rgzYQ0TnEMS8PWWk2R5FVUUAAiOwiSTlLjSqnxFHizgPpKoikesWaKUxMvvQeNy
         OnB6b70I1Lt6iUvU/HgwG+8VGoDPsGCLJa7JYvKtU0iDSiYBiZCfrY7HMByxBxerBuQt
         Ipbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KapgjJWArhcWBr1QfG25g+bgziA7yWOcnl4K11CM5uc=;
        b=KECaHynugq12+pDoJd14HD3cN74KafXe2ZoqNlzkpVzqH1pLRuSx4grIsuCliwXibc
         ZXko/T3UeC1G7KkAfzgO4n+LrxImNsBNZHOc5xogS9FIs0jH/Qxxt25aIpsMKMrcw7Wc
         5Cag07mkACTpswZgXXzUmgrwE2dPyEIejbSt42kPAfCPrSKiptFuHgzEumZmJE1VwEgl
         BtBuLUVRutU27OGNqhvPiY1fAy1z5U3W0FlvVYHndLSfL5+oWH1ZoaD86xdGop7rUZ0c
         Q1HhN3dSpfxf1N6BP8JW3Bg9UhWKOXiZZQBCYLMO7sLmzLRpnmt7JLUnt/vnvAtHnWG8
         niHw==
X-Gm-Message-State: AOAM532vzu1tbQABW12bqIQFWZgJ9z6sRLlfUbYDjIcZiKebmsIMWEST
	YbATy+A/hpeJE0d/9EJvjARaioWPyzQ=
X-Google-Smtp-Source: ABdhPJxRfbzD766A464zMe8r+XZvS02IMLi50WQJjAs0cjGQXpDH1sRyka0cA0sCxNvlttil9wVFCA==
X-Received: by 2002:a17:906:d9c3:: with SMTP id qk3mr33563512ejb.207.1600613448716;
        Sun, 20 Sep 2020 07:50:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:47 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/11] gnome-settings-daemon: Remove wrong RDEPEND
Date: Sun, 20 Sep 2020 16:50:29 +0200
Message-Id: <20200920145039.2240-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Since variable was misspelled it was a no-op
* There is no gdbus package (gdbus is in glib-2.0-utils)
* Did not find any pointer in the source that gdbus has to be installed on
  target

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index d14d6b503..e14891a23 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -55,5 +55,3 @@ FILES_${PN} += " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-3.0/libgsd.so \
 "
-
-RDEPEND_${PN} += "gdbus"
-- 
2.26.2

