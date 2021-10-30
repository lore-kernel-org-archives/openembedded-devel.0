Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6F1C4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:23 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.21621.1635617182666292685
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lxXLNF/X;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id f5so13059278pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=useLRthfTNcFqculHDqCa0CUc/C+CGFHLjACMZgUpzM=;
        b=lxXLNF/X37F8KugSRgykult7yDfavLcw9pzz7rFuY2085KowKSwwSmNWv9zmNvxvrx
         02QgXP/OsaTih3u6pf07MUu9qST0BYfibG+Jy8adgj9WJv+0ICrG2lcy9V5+sQXW/Lfu
         A4hwovl7Ikp4uJ2+kZbs35ELg0BUx7WZ92qIHpIH9oWGusxVC0zejPFoGlahh1RNBrtg
         L2AG9YyblXCO8HqBiBQl5Q7fVuAmgTgBvWYqJU1YU5Egsxuybbum3js+J0HpujQYU7aQ
         J0zO4/HatzjP/QMDk4PSJiDh9MqG87CjjVc9tsaWyTzg26jQztWlvE2AsUF4O/OBZDju
         +nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=useLRthfTNcFqculHDqCa0CUc/C+CGFHLjACMZgUpzM=;
        b=p4c2tnAlYJUctUP1SO18221yoKdU3sM8JBxC1R7td0HsleHjeEwfevWg2aDEecx4Tu
         +lbk5QIG5vPyhHvOv49puNKB3H5hC3wRCtjnDEjpsXwk60rMR/2ESJx/nTpP2PgqoxPA
         EigYH6OnIitS+3xO7e9SFlydWcRMCs65IpoTIX0Zkw8cgtjlc8Hw/zsYSgsnacIgUHXS
         E147RX5rleSjPj8KYWPvdPUfo+NP8dqg4y2r4dK+lH0ie6SvwzfZiZ09qR7gMtbuEf//
         HBsGhIHZVMLlnUFEiUzd7ZjAJppAR0ljE9/grBikYwRFZcpBh0MiTi0+4UHRUnXI4DBG
         F+1A==
X-Gm-Message-State: AOAM530hI3js5Drk0W+fEmyLXidIgybQczIopnMYZlPXbAUY3hO/Dhf/
	RgPHvo+XF8u0OmUYzbhLl+AstzHuEv4=
X-Google-Smtp-Source: 
 ABdhPJzayoh742/Aywh05EvsQgtT7GQHy5fR21Pr6fyDCNrM+HNyLL9BYAmrwMEJxOuOkuWdyCOFXA==
X-Received: by 2002:a63:3759:: with SMTP id
 g25mr13634745pgn.231.1635617181967;
        Sat, 30 Oct 2021 11:06:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] nmon: Upgrade to 16m
Date: Sat, 30 Oct 2021 11:06:13 -0700
Message-Id: <20211030180618.2200698-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93674

Fix compile with ncurses 6.3+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ror-format-security-errors-with-mvpr.patch | 175 ++++++++++++++++++
 ...0001-lmon16g.c-Adjust-system-headers.patch |   8 +-
 .../nmon/{nmon_16g.bb => nmon_16m.bb}         |   9 +-
 3 files changed, 183 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
 rename meta-oe/recipes-support/nmon/{nmon_16g.bb => nmon_16m.bb} (70%)

diff --git a/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch b/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
new file mode 100644
index 0000000000..af79efed96
--- /dev/null
+++ b/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
@@ -0,0 +1,175 @@
+From eba852316735daec27d4ff11483018ca596312d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 02:11:49 -0700
+Subject: [PATCH] Fix a lot of -Werror=format-security errors with
+ mvprintw/mvwprintw
+
+In all these places a non-constant is used as a format string which
+compiler complains about. Fix by using "%s" as format.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lmon16m.c | 86 +++++++++++++++++++++++++++----------------------------
+ 1 file changed, 43 insertions(+), 43 deletions(-)
+
+diff --git a/lmon16m.c b/lmon16m.c
+index 7e46642..1d53367 100644
+--- a/lmon16m.c
++++ b/lmon16m.c
+@@ -5475,20 +5475,20 @@ int main(int argc, char **argv)
+ 		    /*
+ 		     *mvwprintw(padsmp,2, 0, "CPU  User%%  Sys%% Wait%% Idle|0          |25         |50          |75       100|");
+ 		     */
+-		    mvwprintw(padsmp, 1, 0, cpu_line);
+-		    mvwprintw(padsmp, 2, 0, "CPU  ");
++		    mvwprintw(padsmp, 1, 0, "%s", cpu_line);
++		    mvwprintw(padsmp, 2, 0, "%s", "CPU  ");
+ 		    COLOUR wattrset(padsmp, COLOR_PAIR(2));	/* Green */
+-		    mvwprintw(padsmp, 2, 4, "User%%");
++		    mvwprintw(padsmp, 2, 4, "%s", "User%%");
+ 		    COLOUR wattrset(padsmp, COLOR_PAIR(1));	/* Red */
+-		    mvwprintw(padsmp, 2, 9, "  Sys%%");
++		    mvwprintw(padsmp, 2, 9, "%s", "  Sys%%");
+ 		    COLOUR wattrset(padsmp, COLOR_PAIR(4));	/* Blue */
+-		    mvwprintw(padsmp, 2, 15, " Wait%%");
++		    mvwprintw(padsmp, 2, 15, "%s", " Wait%%");
+ 		    if (p->cpu_total.steal != q->cpu_total.steal) {
+ 			COLOUR wattrset(padsmp, COLOR_PAIR(5));
+-			mvwprintw(padsmp, 2, 22, "Steal");
++			mvwprintw(padsmp, 2, 22, "%s", "Steal");
+ 		    } else {
+ 			COLOUR wattrset(padsmp, COLOR_PAIR(0));
+-			mvwprintw(padsmp, 2, 22, " Idle");
++			mvwprintw(padsmp, 2, 22, "%s", " Idle");
+ 		    }
+ 		    COLOUR wattrset(padsmp, COLOR_PAIR(0));
+ 		    mvwprintw(padsmp, 2, 27,
+@@ -5579,8 +5579,8 @@ int main(int argc, char **argv)
+ 			/* lparcfg gathered above */
+ 			if (lparcfg.smt_mode > 1
+ 			    && i % lparcfg.smt_mode == 0) {
+-			    mvwprintw(padsmp, 3 + i, 27, "*");
+-			    mvwprintw(padsmp, 3 + i, 77, "*");
++			    mvwprintw(padsmp, 3 + i, 27, "%s", "*");
++			    mvwprintw(padsmp, 3 + i, 77, "%s", "*");
+ 			}
+ #endif
+ 
+@@ -5597,7 +5597,7 @@ int main(int argc, char **argv)
+ 				    100.0);
+ 		    }
+ 		}		/* for (i = 0; i < cpus; i++) */
+-		CURSE mvwprintw(padsmp, i + 3, 0, cpu_line);
++		CURSE mvwprintw(padsmp, i + 3, 0, "%s", cpu_line);
+ #ifdef POWER
+ 		/* proc_lparcfg called above in previous ifdef
+ 		 */
+@@ -5673,7 +5673,7 @@ int main(int argc, char **argv)
+ 				 100.0);
+ 		    }
+ 
+-		    CURSE mvwprintw(padsmp, i + 5, 0, cpu_line);
++		    CURSE mvwprintw(padsmp, i + 5, 0, "%s", cpu_line);
+ 		    i = i + 2;
+ 		}		/* if (cpus > 1 || !cursed) */
+ 		smp_first_time = 0;
+@@ -5704,16 +5704,16 @@ int main(int argc, char **argv)
+ 		    char *wide10 =
+ 			" 10%%-|                                                                |-10%%";
+ 
+-		    mvwprintw(padwide, 1, 0, wide1);
+-		    mvwprintw(padwide, 2, 0, wide2);
+-		    mvwprintw(padwide, 3, 0, wide3);
+-		    mvwprintw(padwide, 4, 0, wide4);
+-		    mvwprintw(padwide, 5, 0, wide5);
+-		    mvwprintw(padwide, 6, 0, wide6);
+-		    mvwprintw(padwide, 7, 0, wide7);
+-		    mvwprintw(padwide, 8, 0, wide8);
+-		    mvwprintw(padwide, 9, 0, wide9);
+-		    mvwprintw(padwide, 10, 0, wide10);
++		    mvwprintw(padwide, 1, 0, "%s", wide1);
++		    mvwprintw(padwide, 2, 0, "%s", wide2);
++		    mvwprintw(padwide, 3, 0, "%s", wide3);
++		    mvwprintw(padwide, 4, 0, "%s", wide4);
++		    mvwprintw(padwide, 5, 0, "%s", wide5);
++		    mvwprintw(padwide, 6, 0, "%s", wide6);
++		    mvwprintw(padwide, 7, 0, "%s", wide7);
++		    mvwprintw(padwide, 8, 0, "%s", wide8);
++		    mvwprintw(padwide, 9, 0, "%s", wide9);
++		    mvwprintw(padwide, 10, 0, "%s", wide10);
+ 		    mvwprintw(padwide, 11, 0,
+ 			      " CPU +1--------+10-------+20-------+30-------+40-------+50-------+60--+--0%%");
+ 		    mvwprintw(padwide, 1, 6, "CPU(s)=%d", cpus);
+@@ -5755,16 +5755,16 @@ int main(int argc, char **argv)
+ 			rows = 12;
+ 		    }
+ 		    if (cpus > 63) {
+-			mvwprintw(padwide, rows + 0, 0, wide1);
+-			mvwprintw(padwide, rows + 1, 0, wide2);
+-			mvwprintw(padwide, rows + 2, 0, wide3);
+-			mvwprintw(padwide, rows + 3, 0, wide4);
+-			mvwprintw(padwide, rows + 4, 0, wide5);
+-			mvwprintw(padwide, rows + 5, 0, wide6);
+-			mvwprintw(padwide, rows + 6, 0, wide7);
+-			mvwprintw(padwide, rows + 7, 0, wide8);
+-			mvwprintw(padwide, rows + 8, 0, wide9);
+-			mvwprintw(padwide, rows + 9, 0, wide10);
++			mvwprintw(padwide, rows + 0, 0, "%s", wide1);
++			mvwprintw(padwide, rows + 1, 0, "%s", wide2);
++			mvwprintw(padwide, rows + 2, 0, "%s", wide3);
++			mvwprintw(padwide, rows + 3, 0, "%s", wide4);
++			mvwprintw(padwide, rows + 4, 0, "%s", wide5);
++			mvwprintw(padwide, rows + 5, 0, "%s", wide6);
++			mvwprintw(padwide, rows + 6, 0, "%s", wide7);
++			mvwprintw(padwide, rows + 7, 0, "%s", wide8);
++			mvwprintw(padwide, rows + 8, 0, "%s", wide9);
++			mvwprintw(padwide, rows + 9, 0, "%s", wide10);
+ 			mvwprintw(padwide, rows + 10, 0,
+ 				  " CPU +65---+70-------+80-------+90-------+100------+110------+120-----+--0%%");
+ 			if (wide_first_time) {
+@@ -5813,16 +5813,16 @@ int main(int argc, char **argv)
+ 			rows = 23;
+ 		    }
+ 		    if (cpus > 127) {
+-			mvwprintw(padwide, rows + 0, 0, wide1);
+-			mvwprintw(padwide, rows + 1, 0, wide2);
+-			mvwprintw(padwide, rows + 2, 0, wide3);
+-			mvwprintw(padwide, rows + 3, 0, wide4);
+-			mvwprintw(padwide, rows + 4, 0, wide5);
+-			mvwprintw(padwide, rows + 5, 0, wide6);
+-			mvwprintw(padwide, rows + 6, 0, wide7);
+-			mvwprintw(padwide, rows + 7, 0, wide8);
+-			mvwprintw(padwide, rows + 8, 0, wide9);
+-			mvwprintw(padwide, rows + 9, 0, wide10);
++			mvwprintw(padwide, rows + 0, 0, "%s", wide1);
++			mvwprintw(padwide, rows + 1, 0, "%s", wide2);
++			mvwprintw(padwide, rows + 2, 0, "%s", wide3);
++			mvwprintw(padwide, rows + 3, 0, "%s", wide4);
++			mvwprintw(padwide, rows + 4, 0, "%s", wide5);
++			mvwprintw(padwide, rows + 5, 0, "%s", wide6);
++			mvwprintw(padwide, rows + 6, 0, "%s", wide7);
++			mvwprintw(padwide, rows + 7, 0, "%s", wide8);
++			mvwprintw(padwide, rows + 8, 0, "%s", wide9);
++			mvwprintw(padwide, rows + 9, 0, "%s", wide10);
+ 			mvwprintw(padwide, rows + 10, 0,
+ 				  " CPU +129--------+140------+150------+160------+170------+180------+190--0%%");
+ 			if (wide_first_time) {
+@@ -8274,7 +8274,7 @@ I/F Name Recv=KB/s Trans=KB/s packin packout insize outsize Peak->Recv Trans
+ 			    formatstring =
+ 				"  PID    %%CPU  Size   Res   Res   Res   Res Shared   Faults  Command";
+ 		    }
+-		    CURSE mvwprintw(padtop, 1, y, formatstring);
++		    CURSE mvwprintw(padtop, 1, y, "%s", formatstring);
+ 
+ 		    if (show_args == ARGS_ONLY) {
+ 			formatstring =
+@@ -8294,7 +8294,7 @@ I/F Name Recv=KB/s Trans=KB/s packin packout insize outsize Peak->Recv Trans
+ 			    formatstring =
+ 				"         Used    KB   Set  Text  Data   Lib    KB  Min  Maj ";
+ 		    }
+-		    CURSE mvwprintw(padtop, 2, 1, formatstring);
++		    CURSE mvwprintw(padtop, 2, 1, "%s", formatstring);
+ 		    for (j = 0; j < max_sorted; j++) {
+ 			i = topper[j].index;
+ 			if (!show_all) {
diff --git a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
index e8debe56af..5a8b046039 100644
--- a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
+++ b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
@@ -9,13 +9,13 @@ defines from sys/cdefs.h is used
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- lmon16g.c | 4 ++--
+ lmon16m.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/lmon16g.c b/lmon16g.c
+diff --git a/lmon16m.c b/lmon16m.c
 index cb27e09..d2a11c5 100644
---- a/lmon16g.c
-+++ b/lmon16g.c
+--- a/lmon16m.c
++++ b/lmon16m.c
 @@ -63,7 +63,7 @@ static char *SccsId = "nmon " VERSION;
  #include <fcntl.h>
  #include <math.h>
diff --git a/meta-oe/recipes-support/nmon/nmon_16g.bb b/meta-oe/recipes-support/nmon/nmon_16m.bb
similarity index 70%
rename from meta-oe/recipes-support/nmon/nmon_16g.bb
rename to meta-oe/recipes-support/nmon/nmon_16m.bb
index 32b60fef9c..723da85d0f 100644
--- a/meta-oe/recipes-support/nmon/nmon_16g.bb
+++ b/meta-oe/recipes-support/nmon/nmon_16m.bb
@@ -2,17 +2,16 @@ SUMMARY = "nmon performance monitor"
 HOMEPAGE = "http://nmon.sf.net"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/Documentation.txt;md5=dbb13658cf55d687c4f2ff771a696d4a"
+LIC_FILES_CHKSUM = "file://Documentation.txt;md5=dbb13658cf55d687c4f2ff771a696d4a"
 DEPENDS = "ncurses"
 DEPENDS:append:libc-musl = " bsd-headers"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon${PV}.c;name=lmon \
            ${SOURCEFORGE_MIRROR}/nmon/Documentation.txt;name=doc \
            file://0001-lmon16g.c-Adjust-system-headers.patch \
-"
-SRC_URI[lmon.md5sum] = "246ccfc74d5af55d992601fc4d3d4a72"
-SRC_URI[lmon.sha256sum] = "da82dd693b503b062854dfe7dbb5d36b347872ab44a4aa05b97e9d577747f688"
-SRC_URI[doc.md5sum] = "dbb13658cf55d687c4f2ff771a696d4a"
+           file://0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch \
+           "
+SRC_URI[lmon.sha256sum] = "2bed4d45fdfdf1d1387ec91e139c04975d5f838e3e0d53c0fe2d803a707e5fc1"
 SRC_URI[doc.sha256sum] = "1f7f83afe62a7210be5e83cd24157adb854c14599efe0b377a7ecca933869278"
 
 CFLAGS += "-D JFS -D GETUSER -Wall -D LARGEMEM"
-- 
2.33.1


