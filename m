Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAACC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.22045.1635617185861102405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5N4K8e1;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v20so8954736plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qthIUah5Zy8xKgECCH5NvXZHtjtbgI0BA1xD6dBG1pY=;
        b=d5N4K8e1QWLCqRwjBGjTECK2qU7IRIloi19D4R7Mo5/MqlUICqoC4zyoSm+17oWbJj
         Fek08aPo9i1/t1473bJ+skogTrvt1V+3HDb4JdZMcF+AOlQ59hqqrxSJB3d+aBox/Zbg
         3X75tTjJ+4hCMS9kzzeXuWeBW3T2DL3gGNOml05fjP0Rnj2UarUa0+FxgRt65hmVu3k0
         Rg1lh15hf5ADLsd84NkT+G9q/+Xr6UapXabWhPVl1x+UfgStwAq+TcqQVsh+VO3twxaU
         JkLXAmoLH6kemzpLmGGyO678kB8Vv1uSuCU0mShY77VtfKDUNyDAXAe5zN1425jA0J0B
         6krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qthIUah5Zy8xKgECCH5NvXZHtjtbgI0BA1xD6dBG1pY=;
        b=Pej0P2Et6TMooMa15dCLVlgr9wloCuwl5cPZdtxhzBmGtxsUsBKNUQu46DIrKImvpu
         q+5SKZvDrp68FqROOtU5KD2y7scCaLHlHQVQy8govDWpn8J3uMBcCBuEL4WaXxl40cdS
         t9mIg+4kuk7kPwArptCNrypTarvtAQJJ4v/OjuOLXRtBjTJ1oZldQ5NGBu2RKZZs1ObJ
         Ll1AMUI3SIqMbYz+7zb7pe04CpYnlAiV4TyQHlHoaNQOhc08H3Tg19KJykUJIkt0QSFA
         JZL02ACJYUv1JFXHU0eaRfXEkrXFnkWqr1SjjYZxfupq8J2wvNpg1K+HMsrkPcqBXPQi
         HJhA==
X-Gm-Message-State: AOAM530n6yJdRwx/Tcz9yTWrzeMDnzAx0m49mV2OQSZz0juWJ6vt13FS
	2z1ToEqCipyzfc2vJY95U51dp+7HTuw=
X-Google-Smtp-Source: 
 ABdhPJwgkcyg0PZUH5ejVRzAhTRRg6tN4oIWcVgxsHmA65Obtfvfk4qMEoj3adGANRIfSkWEzoxkMg==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id
 r15-20020a170902be0f00b0013a095e0a51mr15887130pls.44.1635617185192;
        Sat, 30 Oct 2021 11:06:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 7/8] mtr: Fix build with ncurses 6.3+
Date: Sat, 30 Oct 2021 11:06:17 -0700
Message-Id: <20211030180618.2200698-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93678

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ror-format-security-errors-in-printw.patch | 68 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.94.bb           |  4 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch b/meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch
new file mode 100644
index 0000000000..5a8ee49d53
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch
@@ -0,0 +1,68 @@
+From 628b4b3a16c5e3416aac3eea041ff03375fb495b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 11:00:59 -0700
+Subject: [PATCH] Fix a lot of -Werror=format-security errors in
+ printw/mvprintw
+
+In all these places a non-constant is used as a format string which
+compiler complains about. Fix by using "%s" as format.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ui/curses.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/ui/curses.c b/ui/curses.c
+index 34bf30d..c24cf28 100644
+--- a/ui/curses.c
++++ b/ui/curses.c
+@@ -432,7 +432,7 @@ static void mtr_curses_hosts(
+                 attron(A_BOLD);
+ #ifdef HAVE_IPINFO
+             if (is_printii(ctl))
+-                printw(fmt_ipinfo(ctl, addr));
++                printw("%s", fmt_ipinfo(ctl, addr));
+ #endif
+             if (name != NULL) {
+                 if (ctl->show_ips)
+@@ -485,7 +485,7 @@ static void mtr_curses_hosts(
+                 printw("\n    ");
+ #ifdef HAVE_IPINFO
+                 if (is_printii(ctl))
+-                    printw(fmt_ipinfo(ctl, addrs));
++                    printw("%s", fmt_ipinfo(ctl, addrs));
+ #endif
+                 if (name != NULL) {
+                     if (ctl->show_ips)
+@@ -650,7 +650,7 @@ static void mtr_curses_graph(
+ 
+ #ifdef HAVE_IPINFO
+             if (is_printii(ctl))
+-                printw(fmt_ipinfo(ctl, addr));
++                printw("%s", fmt_ipinfo(ctl, addr));
+ #endif
+             name = dns_lookup(ctl, addr);
+             printw("%s", name ? name : strlongip(ctl, addr));
+@@ -700,7 +700,7 @@ void mtr_curses_redraw(
+ 
+     mvprintw(1, 0, "%s (%s) -> %s", ctl->LocalHostname, net_localaddr(), ctl->Hostname);
+     t = time(NULL);
+-    mvprintw(1, maxx - 25, iso_time(&t));
++    mvprintw(1, maxx - 25, "%s", iso_time(&t));
+     printw("\n");
+ 
+     printw("Keys:  ");
+@@ -760,7 +760,7 @@ void mtr_curses_redraw(
+         startstat = padding - 2;
+ 
+         snprintf(msg, sizeof(msg), " Last %3d pings", max_cols);
+-        mvprintw(rowstat - 1, startstat, msg);
++        mvprintw(rowstat - 1, startstat, "%s", msg);
+ 
+         attroff(A_BOLD);
+         move(rowstat, 0);
+-- 
+2.33.1
+
diff --git a/meta-networking/recipes-support/mtr/mtr_0.94.bb b/meta-networking/recipes-support/mtr/mtr_0.94.bb
index c046499a2f..c066be1428 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.94.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.94.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "2c73cbf4094e4eed343ed11ae5bab2580f3122d1"
-SRC_URI = "git://github.com/traviscross/mtr"
+SRC_URI = "git://github.com/traviscross/mtr \
+           file://0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.33.1


