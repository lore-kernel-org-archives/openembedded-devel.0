Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC61FC433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:22 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.22043.1635617181826640630
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CEro4jmx;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 75so13119339pga.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2dZkqrA7eeUoc1AOMViIM7k4CQRfomN43QmPIDknr8=;
        b=CEro4jmxddsMLLRcwDNavoTPBxXlFT/YxXbHQE9MpH11AFes405mS0j2bbBy/cU9ly
         cnFQ2FvTEk1a2z8+TPnW5tWHcqcAvnZ8EeyxAyuNLa3IjLK2g2HzE3pn7CIJff4/tdSU
         nvWju274sENJHhb1cqCMxTPbI5pnfjGVovtkOJJXA9W7razlnX+qGLIW9ysrfVMbCaaM
         24AkSgublwKryo57qKxVAmt2iMQXED1WTDS3M1Q14IBomaclnkGV/88tAZR147hnwCh9
         UXSvRkSRz8kkWja6+35pcxpq4GDXAX37feII9hg6YLkQMQXc73J2DXpoxXzSRECXulgJ
         Pt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2dZkqrA7eeUoc1AOMViIM7k4CQRfomN43QmPIDknr8=;
        b=xGurbgpOBlf93zmzcDwKygX85AFKI/yUZASrCv/wWu0VK2V0yHhZyMbblYJ0W6Texw
         5Ry7kUIx7QWlSWQnHWuhb/EAbuOXw4oXfexqobptS7Vlh3sXNeIgnInKzs4jryWQMAKm
         glA0MQnAhkaQ3xsilRznO/xeJDX6Q5DwSp3DUiLuLp25r9e4yJijHyN2B5rlUE6OUo1W
         DQ9Zsa2ZWdEj5Tzuf6/FNOutlnpMLvenJEmpsZysW5zbVEiWOuFvTmjOrF7hOTpn4/wT
         INJiRhwxqjlAld1256ZpVR6asUK0wsl5FfZ4j4x0D6PfV2gYo/ErFXNHEyQSiCdNgecH
         M4RA==
X-Gm-Message-State: AOAM532XXmX9ofenl/bkEw5lJmhe9NQkm4L4QTq4dt1xBQ/1qNJahNyI
	4qLPoxZvDhEJV3G8NXWMrJj1Skf7ow0=
X-Google-Smtp-Source: 
 ABdhPJznoal+6CmOj2G3mxH9eybjeLsv1W8ijx9+/o2l4NHxNjDa/qFGZ/n4xSKaYDBQmlX794EypQ==
X-Received: by 2002:a05:6a00:24c3:b0:47f:837e:a6fd with SMTP id
 d3-20020a056a0024c300b0047f837ea6fdmr8978423pfv.71.1635617181134;
        Sat, 30 Oct 2021 11:06:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/8] libcdio: Fix build with ncurses 6.3+
Date: Sat, 30 Oct 2021 11:06:12 -0700
Message-Id: <20211030180618.2200698-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93673

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-format-security-errors-with-mvprint.patch | 40 +++++++++++++++++++
 .../libcdio/libcdio_2.1.0.bb                  |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch b/meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch
new file mode 100644
index 0000000000..09e7dc3dfb
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch
@@ -0,0 +1,40 @@
+From e5e54be286bf6d8336b747503c803750bc674c57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 01:28:18 -0700
+Subject: [PATCH] Fix a few -Werror=format-security errors with mvprintw()
+
+In all these places a non-constant is used as a format string which
+compiler complains about. Fix by using "%s" as format.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cdda-player.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cdda-player.c b/src/cdda-player.c
+index 69eddee..8834d60 100644
+--- a/src/cdda-player.c
++++ b/src/cdda-player.c
+@@ -298,7 +298,7 @@ action(const char *psz_action)
+              psz_action);
+   else
+     snprintf(psz_action_line, sizeof(psz_action_line), "%s", "" );
+-  mvprintw(LINE_ACTION, 0, psz_action_line);
++  mvprintw(LINE_ACTION, 0, "%s", psz_action_line);
+   clrtoeol();
+   refresh();
+ }
+@@ -1029,10 +1029,10 @@ display_tracks(void)
+       }
+       if (sub.track == i) {
+         attron(A_STANDOUT);
+-        mvprintw(i_line++, 0, line);
++        mvprintw(i_line++, 0, "%s", line);
+         attroff(A_STANDOUT);
+       } else
+-        mvprintw(i_line++, 0, line);
++        mvprintw(i_line++, 0, "%s", line);
+       clrtoeol();
+     }
+   }
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 2340132984..2becafb2a4 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2 \
+           file://0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch \
+           "
 
 SRC_URI[md5sum] = "aa7629e8f73662a762f64c444b901055"
 SRC_URI[sha256sum] = "8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b"
-- 
2.33.1


