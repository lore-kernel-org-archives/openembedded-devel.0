Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AC6CA1016
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 00:30:29 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.web10.548.1757377822807694299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 17:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQyOjoGi;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-5fe42994547so973624d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757377822; x=1757982622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6fW7oGf3zb1eeecGsPKV769v2AO60bkQFhnOqetMwQ=;
        b=QQyOjoGiGm6G5tBkczUo1Trn//E2BdHJBIqri0LCWlne56+1AXhwgBzsAR953jWFjR
         mu2CyqNf/UK53Au0UmulSXyX2PtYdpZYNu9fF3ueFO0yAb1auNdGwM2sBkhIZcjr+bA7
         Uk7XO9ZzXwLmNU7f3N+b/AShx/CgLzrxavixnS1YTbyyVTcuAuw1p1j0U6l8hUeV+N3B
         o+UlzmQ5pulD50MCp9UmWAv05RHGCWf5ono+agctjVDgrxoOxX9NkKUOZLiDawlLDfXJ
         PGI3IcrzV6O4DKkAT/4wXcSzcH0eSKydciTbkSqLu2hBijk4J5C4MQ8JXYfpPUCjFw3i
         5LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757377822; x=1757982622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6fW7oGf3zb1eeecGsPKV769v2AO60bkQFhnOqetMwQ=;
        b=dbW1zMLhD56BOIdD1oMPjHn7gBqHcfL2FKHVrCeVTL4kt0UBD2rp50BgyRZXp5i9Dh
         xVuNymQf0KMOi8McRiZpTTQBz2P87OIHaA//NzBBUCqq6lOwH0TbyQkpUox4VwES1weN
         STlP9TFX46QcZ8wlBkY3eNdYPvRL7l20BBxiMxDV8gT4msLVn+ooyRyXQbayDky7vJ8S
         q5VVjsFiEaT95zzsTyZ1UTrEiNZLpWRtkwNirDxtpkxwjNEBnu4mYIChOPI+9e6caD1+
         Xjr4Hdb/UoTCizZ5Dt8mnLhOIrKJmjNpjZTu6QjdVmamrIpsJOpd/sfeyI7sSfqYfvaj
         R7Pw==
X-Gm-Message-State: AOJu0Yzwmwr26KMJFwP4rQImiWQe4CWJSI/F4SN4byHIGHjfUNHA/+3O
	2qMFNTCf3G5azvIioqTkvD7/3wbJ946T5/11sas4aqlMkcJn8OuEsu0vCJbkog==
X-Gm-Gg: ASbGncswD6kuOUVUrrGq2KiE9wl89I2D+DUKC5uEy44E+U2M6WW1RKJODC2qDXvAaFe
	4fR5hcNbzAcZY6hqt6ZhyNl7569jYfsJw3WvAtR0eBTV/GGV9mVY8vFF9eloFm2zJBi8y8WLp67
	VXBuzN7iFfpO9m81tmCg+tNdI9jJRVuUzwxYCBbQI6nattHOsVX10CINVlV+eDC89bQOMPQHgFs
	HW1dRUsS7+VUhoHWCz3fgkP97kmH86uDl73Z9vNKW+LGuuekg+7Me/g7L/XczlQTGociWg2d0ka
	5EIDC5gUR5LFOtIbKFDP1UbqyvdQMUAnKA6ilIFlIbPZo9oWY+0J9OFExskfo/um8f15l0uOaMT
	PA5oWsj7TaIiF1KwWuLizD8tG/e2Y
X-Google-Smtp-Source: AGHT+IFenijuVnsVgBYB5AFG2Qszn1PPpvlzaHclrCZEKMvpVcI2/FaLPVA/TXJHR5cgn2lxptDXJA==
X-Received: by 2002:a05:690e:2550:b0:60a:23e9:5e8b with SMTP id 956f58d0204a3-61034fb910dmr6167174d50.32.1757377821342;
        Mon, 08 Sep 2025 17:30:21 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a82d58b8sm57815607b3.9.2025.09.08.17.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:30:21 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nmon: Upgrade 16m -> 16n
Date: Mon,  8 Sep 2025 20:30:02 -0400
Message-ID: <20250909003002.39929-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 00:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119339

refresh patches

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ror-format-security-errors-with-mvpr.patch | 71 ++++++++-----------
 ...0001-lmon16g.c-Adjust-system-headers.patch | 21 +++---
 .../nmon/{nmon_16m.bb => nmon_16n.bb}         |  2 +-
 3 files changed, 40 insertions(+), 54 deletions(-)
 rename meta-oe/recipes-support/nmon/{nmon_16m.bb => nmon_16n.bb} (91%)

diff --git a/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch b/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
index af79efed96..5c1f2de2b5 100644
--- a/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
+++ b/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
@@ -1,7 +1,8 @@
-From eba852316735daec27d4ff11483018ca596312d0 Mon Sep 17 00:00:00 2001
+From 9908274a3555fe2abb3596d917cecfafcb4fbf7a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Oct 2021 02:11:49 -0700
 Subject: [PATCH] Fix a lot of -Werror=format-security errors with
+
  mvprintw/mvwprintw
 
 In all these places a non-constant is used as a format string which
@@ -10,14 +11,14 @@ compiler complains about. Fix by using "%s" as format.
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- lmon16m.c | 86 +++++++++++++++++++++++++++----------------------------
- 1 file changed, 43 insertions(+), 43 deletions(-)
+ lmon16n.c | 88 +++++++++++++++++++++++++++----------------------------
+ 1 file changed, 44 insertions(+), 44 deletions(-)
 
-diff --git a/lmon16m.c b/lmon16m.c
-index 7e46642..1d53367 100644
---- a/lmon16m.c
-+++ b/lmon16m.c
-@@ -5475,20 +5475,20 @@ int main(int argc, char **argv)
+diff --git a/lmon16n.c b/lmon16n.c
+index 8a5d35c..cec409a 100644
+--- a/lmon16n.c
++++ b/lmon16n.c
+@@ -5489,20 +5489,20 @@ int main(int argc, char **argv)
  		    /*
  		     *mvwprintw(padsmp,2, 0, "CPU  User%%  Sys%% Wait%% Idle|0          |25         |50          |75       100|");
  		     */
@@ -45,7 +46,7 @@ index 7e46642..1d53367 100644
  		    }
  		    COLOUR wattrset(padsmp, COLOR_PAIR(0));
  		    mvwprintw(padsmp, 2, 27,
-@@ -5579,8 +5579,8 @@ int main(int argc, char **argv)
+@@ -5593,8 +5593,8 @@ int main(int argc, char **argv)
  			/* lparcfg gathered above */
  			if (lparcfg.smt_mode > 1
  			    && i % lparcfg.smt_mode == 0) {
@@ -56,7 +57,7 @@ index 7e46642..1d53367 100644
  			}
  #endif
  
-@@ -5597,7 +5597,7 @@ int main(int argc, char **argv)
+@@ -5611,7 +5611,7 @@ int main(int argc, char **argv)
  				    100.0);
  		    }
  		}		/* for (i = 0; i < cpus; i++) */
@@ -65,7 +66,7 @@ index 7e46642..1d53367 100644
  #ifdef POWER
  		/* proc_lparcfg called above in previous ifdef
  		 */
-@@ -5673,7 +5673,7 @@ int main(int argc, char **argv)
+@@ -5687,7 +5687,7 @@ int main(int argc, char **argv)
  				 100.0);
  		    }
  
@@ -74,10 +75,10 @@ index 7e46642..1d53367 100644
  		    i = i + 2;
  		}		/* if (cpus > 1 || !cursed) */
  		smp_first_time = 0;
-@@ -5704,16 +5704,16 @@ int main(int argc, char **argv)
- 		    char *wide10 =
- 			" 10%%-|                                                                |-10%%";
- 
+@@ -5697,17 +5697,17 @@ int main(int argc, char **argv)
+ 		if (cursed) {
+ 		    int rows = 0;
+ 		    BANNER(padwide, "CPU Utilisation Wide View");
 -		    mvwprintw(padwide, 1, 0, wide1);
 -		    mvwprintw(padwide, 2, 0, wide2);
 -		    mvwprintw(padwide, 3, 0, wide3);
@@ -88,6 +89,7 @@ index 7e46642..1d53367 100644
 -		    mvwprintw(padwide, 8, 0, wide8);
 -		    mvwprintw(padwide, 9, 0, wide9);
 -		    mvwprintw(padwide, 10, 0, wide10);
+-		    mvwprintw(padwide, 11, 0, wide_1_64);
 +		    mvwprintw(padwide, 1, 0, "%s", wide1);
 +		    mvwprintw(padwide, 2, 0, "%s", wide2);
 +		    mvwprintw(padwide, 3, 0, "%s", wide3);
@@ -98,10 +100,11 @@ index 7e46642..1d53367 100644
 +		    mvwprintw(padwide, 8, 0, "%s", wide8);
 +		    mvwprintw(padwide, 9, 0, "%s", wide9);
 +		    mvwprintw(padwide, 10, 0, "%s", wide10);
- 		    mvwprintw(padwide, 11, 0,
- 			      " CPU +1--------+10-------+20-------+30-------+40-------+50-------+60--+--0%%");
++		    mvwprintw(padwide, 11, 0, "%s", wide_1_64);
  		    mvwprintw(padwide, 1, 6, "CPU(s)=%d", cpus);
-@@ -5755,16 +5755,16 @@ int main(int argc, char **argv)
+ 		    if (wide_first_time) {
+ 			mvwprintw(padwide, 3, 7,
+@@ -5747,17 +5747,17 @@ int main(int argc, char **argv)
  			rows = 12;
  		    }
  		    if (cpus > 63) {
@@ -115,6 +118,7 @@ index 7e46642..1d53367 100644
 -			mvwprintw(padwide, rows + 7, 0, wide8);
 -			mvwprintw(padwide, rows + 8, 0, wide9);
 -			mvwprintw(padwide, rows + 9, 0, wide10);
+-			mvwprintw(padwide, rows + 10, 0, wide_65_128);
 +			mvwprintw(padwide, rows + 0, 0, "%s", wide1);
 +			mvwprintw(padwide, rows + 1, 0, "%s", wide2);
 +			mvwprintw(padwide, rows + 2, 0, "%s", wide3);
@@ -125,10 +129,11 @@ index 7e46642..1d53367 100644
 +			mvwprintw(padwide, rows + 7, 0, "%s", wide8);
 +			mvwprintw(padwide, rows + 8, 0, "%s", wide9);
 +			mvwprintw(padwide, rows + 9, 0, "%s", wide10);
- 			mvwprintw(padwide, rows + 10, 0,
- 				  " CPU +65---+70-------+80-------+90-------+100------+110------+120-----+--0%%");
++ 			mvwprintw(padwide, rows + 10, 0, "%s", wide_65_128);
  			if (wide_first_time) {
-@@ -5813,16 +5813,16 @@ int main(int argc, char **argv)
+ 			    mvwprintw(padwide, rows + 3, 7,
+ 				      " Please wait gathering CPU statistics");
+@@ -5804,17 +5804,17 @@ int main(int argc, char **argv)
  			rows = 23;
  		    }
  		    if (cpus > 127) {
@@ -142,6 +147,7 @@ index 7e46642..1d53367 100644
 -			mvwprintw(padwide, rows + 7, 0, wide8);
 -			mvwprintw(padwide, rows + 8, 0, wide9);
 -			mvwprintw(padwide, rows + 9, 0, wide10);
+-			mvwprintw(padwide, rows + 10, 0,wide_129_192);
 +			mvwprintw(padwide, rows + 0, 0, "%s", wide1);
 +			mvwprintw(padwide, rows + 1, 0, "%s", wide2);
 +			mvwprintw(padwide, rows + 2, 0, "%s", wide3);
@@ -152,24 +158,7 @@ index 7e46642..1d53367 100644
 +			mvwprintw(padwide, rows + 7, 0, "%s", wide8);
 +			mvwprintw(padwide, rows + 8, 0, "%s", wide9);
 +			mvwprintw(padwide, rows + 9, 0, "%s", wide10);
- 			mvwprintw(padwide, rows + 10, 0,
- 				  " CPU +129--------+140------+150------+160------+170------+180------+190--0%%");
++			mvwprintw(padwide, rows + 10, 0, "%s", wide_129_192);
  			if (wide_first_time) {
-@@ -8274,7 +8274,7 @@ I/F Name Recv=KB/s Trans=KB/s packin packout insize outsize Peak->Recv Trans
- 			    formatstring =
- 				"  PID    %%CPU  Size   Res   Res   Res   Res Shared   Faults  Command";
- 		    }
--		    CURSE mvwprintw(padtop, 1, y, formatstring);
-+		    CURSE mvwprintw(padtop, 1, y, "%s", formatstring);
- 
- 		    if (show_args == ARGS_ONLY) {
- 			formatstring =
-@@ -8294,7 +8294,7 @@ I/F Name Recv=KB/s Trans=KB/s packin packout insize outsize Peak->Recv Trans
- 			    formatstring =
- 				"         Used    KB   Set  Text  Data   Lib    KB  Min  Maj ";
- 		    }
--		    CURSE mvwprintw(padtop, 2, 1, formatstring);
-+		    CURSE mvwprintw(padtop, 2, 1, "%s", formatstring);
- 		    for (j = 0; j < max_sorted; j++) {
- 			i = topper[j].index;
- 			if (!show_all) {
+ 			    mvwprintw(padwide, rows + 3, 7,
+ 				      " Please wait gathering CPU statistics");
diff --git a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
index 6721d2b5e5..4a921f2921 100644
--- a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
+++ b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
@@ -1,4 +1,4 @@
-From d977b5170027926eb97ab9742ddc51d2a5555a34 Mon Sep 17 00:00:00 2001
+From e5e075af8b235360046eea9dd06e39ed9651b174 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 10:06:49 -0700
 Subject: [PATCH] lmon16g.c: Adjust system headers
@@ -11,14 +11,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
 
- lmon16m.c | 4 ++--
+ lmon16n.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/lmon16m.c b/lmon16m.c
-index cb27e09..d2a11c5 100644
---- a/lmon16m.c
-+++ b/lmon16m.c
-@@ -63,7 +63,7 @@ static char *SccsId = "nmon " VERSION;
+diff --git a/lmon16n.c b/lmon16n.c
+index 5efd8f8..8a5d35c 100644
+--- a/lmon16n.c
++++ b/lmon16n.c
+@@ -61,7 +61,7 @@ static char *SccsId = "nmon " VERSION;
  #include <fcntl.h>
  #include <math.h>
  #include <time.h>
@@ -27,7 +27,7 @@ index cb27e09..d2a11c5 100644
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/ioctl.h>
-@@ -71,6 +71,7 @@ static char *SccsId = "nmon " VERSION;
+@@ -69,6 +69,7 @@ static char *SccsId = "nmon " VERSION;
  #include <sys/time.h>
  #include <sys/socket.h>
  #include <sys/wait.h>
@@ -35,7 +35,7 @@ index cb27e09..d2a11c5 100644
  
  /* Windows moved here so they can be cleared when the screen mode changes */
  WINDOW *padwelcome = NULL;
-@@ -576,7 +577,6 @@ struct procsinfo {
+@@ -583,7 +584,6 @@ struct procsinfo {
  int isroot = 0;
  
  #include <mntent.h>
@@ -43,6 +43,3 @@ index cb27e09..d2a11c5 100644
  #include <sys/stat.h>
  #include <sys/statfs.h>
  #include <net/if.h>
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-support/nmon/nmon_16m.bb b/meta-oe/recipes-support/nmon/nmon_16n.bb
similarity index 91%
rename from meta-oe/recipes-support/nmon/nmon_16m.bb
rename to meta-oe/recipes-support/nmon/nmon_16n.bb
index 4e7abb2123..1cf1049259 100644
--- a/meta-oe/recipes-support/nmon/nmon_16m.bb
+++ b/meta-oe/recipes-support/nmon/nmon_16n.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon${PV}.c;name=lmon \
            file://0001-lmon16g.c-Adjust-system-headers.patch \
            file://0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch \
            "
-SRC_URI[lmon.sha256sum] = "2bed4d45fdfdf1d1387ec91e139c04975d5f838e3e0d53c0fe2d803a707e5fc1"
+SRC_URI[lmon.sha256sum] = "c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2"
 SRC_URI[doc.sha256sum] = "1f7f83afe62a7210be5e83cd24157adb854c14599efe0b377a7ecca933869278"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/nmon/files/"
-- 
2.43.0


