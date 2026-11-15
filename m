Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3820.1794729022898765006
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=a6MANuT6;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so7235858eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729022; x=1795333822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGGp6xzDJANOz7JpBql3ATKac034WN8+ZQ4RGD6BeHU=;
        b=a6MANuT61Z3vSySxdoBX+kWxfnbg1tquRdm1ODEwIUAEDEr/y6nrgOVvl/NdegmtsD
         3FzSeQgaoIeZWIgDEV5gnUUB5HiQVkl65OPIZhBv11bwzFI2LrLKDmE3X/0sIASTzkxy
         ZXHzRk7BxR/9UCCehrYQPPHcwaEy/lkNeY5iLmskTE/6YN5I+KgwpzXK/+6X6N/9aAMJ
         9INFGY5Xfgm3srMVP8LkJgeBO6tisS0tlHAs2eyqt5VOpl8135+rmPT7ojj7UWUordjk
         7C/YTXVMEFtsfuEd6Sjzg464YTsnd/RJwuzWlYjpfoe6nWhmGhVFOLCo18uv+sh4DsU5
         xSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729022; x=1795333822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGGp6xzDJANOz7JpBql3ATKac034WN8+ZQ4RGD6BeHU=;
        b=Tl3HrXsl2l9dR4pyqi6ViL6YzuCOmBit6Cl1DjnWjDLxc2RM+TSsry19ytyj0ykUc4
         eKIhGSkkLna2mj/fEsSfuAjBopNpImz72XX5O3thiKYT+7hW7V4RYNv0esCDQN190OOa
         hBoHtVtfG4V8J1Bugvn2jHQGDZUmafI+mpWEjgDLHRW9bfoYE9tapbJ130u01/eBTJdW
         kKwkOZ92gsI7nfU3RrqPKP1SyTMNUg8grSEMPK98jVMlF1JI849t9SU/JMCpFC7eKZZv
         /AUtbmmHmkAr4drukOfXeNWmsv+NE77e3GwHPjC1nbiZ7NlWVG9y9x0kAzh7GSicHiAG
         oJ6g==
X-Gm-Message-State: APuU4Z/gDP7ZN81n0ShVncbzdKcNpF2fp7BgAi0CRkaWRPlAWT+7vn22
	v6JaCaw78uvnBE58DlTSDoYFPt7BsqLhfGOyuEVPAabBBkWA5e1nRJAJBO3t8cuN
X-Gm-Gg: AYBFou01RPwxcA6n+Ghh1lw5QQ4DNnuCkul1WqsBtCl6BZtfbQaMlISA1Opc9vC/Mhz
	jbwUi/I5g29qdvBru28RW5M4QKp2IzlPonHjUeJTDVokoxbD4hw5JYeNxsgWvi6EQu5XOyt8qxO
	Ysc5Gtp0Pyki1M1YxpvU8Opj4iI1Ev3+cH25bm94I61AMCuw1xM43rBojMedSHSzsu2lKCscyrs
	WmJObpN9ZaJ9SNMUmdvwQOcbs7r+ewAhoEDydsPsLqVnG1mjDPfti9hJRNkVij3sb3lc1bnkNNi
	jS19IDOBEYBrjFoc/vNIXofYLEfH/9CiLFx5QL7iVm9HUddg15SHE1lPCrvJHb9cPufVZQJR4Dc
	ftThal5RQVYjTPePPA6yUdIijhdTas6DwoeLURVRdKt4XzZjebxuAugAYHG4HTSvKX/tykhbaD3
	yqHGgXt0E+O/sYv/f85+w1ilaE3EiLJ1b7nCjup1lMwDsB1kwUuUVAbokZHYeHRTM8llqYsq9jb
	L/MLNANIsW/Ujb8W4bqxTqON1jd1Wuluv4AgekJt299dbv0Ii3GvZIuRWTvs/9djdRGnKho0BVc
	WyOnXBS0oY6LukAuWLoTduPGXrH33wgf0O+JaqMjTWUx+W5EnWvrz/zVccv1j6x75pREl9cBKzo
	Xj1p9M7xEJljbN06BbXtoK1/EIYI2PiqOLcrAShu6mbj/V+zZiMwO8CWfdQUC7d19hYCPBtMNG1
	V68HK/LCgrdtqnwPXTBTRabBOoZqZajQ9p4fyMlcNkg3qwJOzdcVmIJ+wU9To3Vo/T7ZOe8fsHq
	eENn5c/vPbAEfgmRkt7/7jQc/RAV7/BnacOwDnKXGAuNt0G/M4q6F35F9Ci/HJ8zkgj67nkgKZR
	wxLe
X-Received: by 2002:a05:7301:d185:b0:370:1652:5ff4 with SMTP id 5a478bee46e88-37966387cb3mr7049391eec.6.1794729022005;
        Sat, 14 Nov 2026 23:50:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 38/96] nmon: upgrade 16n -> 16s
Date: Sat, 14 Nov 2026 23:48:16 -0800
Message-ID: <20261115074918.2932593-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132308
Content-Type: text/plain; charset="utf-8"

Rebase the patches onto lmon16s.c.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ror-format-security-errors-with-mvpr.patch | 126 +++++++++---------
 ...0001-lmon16g.c-Adjust-system-headers.patch |  15 +--
 .../nmon/{nmon_16n.bb => nmon_16s.bb}         |   2 +-
 3 files changed, 72 insertions(+), 71 deletions(-)
 rename meta-oe/recipes-support/nmon/{nmon_16n.bb => nmon_16s.bb} (91%)

diff --git a/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch b/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
index 5c1f2de2b5..163be2bb84 100644
--- a/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
+++ b/meta-oe/recipes-support/nmon/nmon/0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch
@@ -10,54 +10,26 @@ compiler complains about. Fix by using "%s" as format.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Regenerated for 16s: pass every non-literal format string through "%s".
 ---
- lmon16n.c | 88 +++++++++++++++++++++++++++----------------------------
+ lmon16s.c | 88 +++++++++++++++++++++++++++++++--------------------------------
  1 file changed, 44 insertions(+), 44 deletions(-)
 
-diff --git a/lmon16n.c b/lmon16n.c
-index 8a5d35c..cec409a 100644
---- a/lmon16n.c
-+++ b/lmon16n.c
-@@ -5489,20 +5489,20 @@ int main(int argc, char **argv)
- 		    /*
- 		     *mvwprintw(padsmp,2, 0, "CPU  User%%  Sys%% Wait%% Idle|0          |25         |50          |75       100|");
- 		     */
+diff --git a/lmon16s.c b/lmon16s.c
+index fa739c1..5db3169 100644
+--- a/lmon16s.c
++++ b/lmon16s.c
+@@ -5479,7 +5479,7 @@ int main(int argc, char **argv)
+ 		if (cursed) {
+ 		    BANNER(padsmp, "CPU Utilisation");
+ 
 -		    mvwprintw(padsmp, 1, 0, cpu_line);
--		    mvwprintw(padsmp, 2, 0, "CPU  ");
 +		    mvwprintw(padsmp, 1, 0, "%s", cpu_line);
-+		    mvwprintw(padsmp, 2, 0, "%s", "CPU  ");
+ 		    mvwprintw(padsmp, 2, 0, "CPU  ");
  		    COLOUR wattrset(padsmp, COLOR_PAIR(2));	/* Green */
--		    mvwprintw(padsmp, 2, 4, "User%%");
-+		    mvwprintw(padsmp, 2, 4, "%s", "User%%");
- 		    COLOUR wattrset(padsmp, COLOR_PAIR(1));	/* Red */
--		    mvwprintw(padsmp, 2, 9, "  Sys%%");
-+		    mvwprintw(padsmp, 2, 9, "%s", "  Sys%%");
- 		    COLOUR wattrset(padsmp, COLOR_PAIR(4));	/* Blue */
--		    mvwprintw(padsmp, 2, 15, " Wait%%");
-+		    mvwprintw(padsmp, 2, 15, "%s", " Wait%%");
- 		    if (p->cpu_total.steal != q->cpu_total.steal) {
- 			COLOUR wattrset(padsmp, COLOR_PAIR(5));
--			mvwprintw(padsmp, 2, 22, "Steal");
-+			mvwprintw(padsmp, 2, 22, "%s", "Steal");
- 		    } else {
- 			COLOUR wattrset(padsmp, COLOR_PAIR(0));
--			mvwprintw(padsmp, 2, 22, " Idle");
-+			mvwprintw(padsmp, 2, 22, "%s", " Idle");
- 		    }
- 		    COLOUR wattrset(padsmp, COLOR_PAIR(0));
- 		    mvwprintw(padsmp, 2, 27,
-@@ -5593,8 +5593,8 @@ int main(int argc, char **argv)
- 			/* lparcfg gathered above */
- 			if (lparcfg.smt_mode > 1
- 			    && i % lparcfg.smt_mode == 0) {
--			    mvwprintw(padsmp, 3 + i, 27, "*");
--			    mvwprintw(padsmp, 3 + i, 77, "*");
-+			    mvwprintw(padsmp, 3 + i, 27, "%s", "*");
-+			    mvwprintw(padsmp, 3 + i, 77, "%s", "*");
- 			}
- #endif
- 
-@@ -5611,7 +5611,7 @@ int main(int argc, char **argv)
+ 		    mvwprintw(padsmp, 2, 4, "User%%");
+@@ -5599,7 +5599,7 @@ int main(int argc, char **argv)
  				    100.0);
  		    }
  		}		/* for (i = 0; i < cpus; i++) */
@@ -66,8 +38,8 @@ index 8a5d35c..cec409a 100644
  #ifdef POWER
  		/* proc_lparcfg called above in previous ifdef
  		 */
-@@ -5687,7 +5687,7 @@ int main(int argc, char **argv)
- 				 100.0);
+@@ -5670,7 +5670,7 @@ int main(int argc, char **argv)
+ 				 (double) cpu_steal / (double) cpu_sum * 100.0);
  		    }
  
 -		    CURSE mvwprintw(padsmp, i + 5, 0, cpu_line);
@@ -75,10 +47,10 @@ index 8a5d35c..cec409a 100644
  		    i = i + 2;
  		}		/* if (cpus > 1 || !cursed) */
  		smp_first_time = 0;
-@@ -5697,17 +5697,17 @@ int main(int argc, char **argv)
- 		if (cursed) {
- 		    int rows = 0;
- 		    BANNER(padwide, "CPU Utilisation Wide View");
+@@ -5692,17 +5692,17 @@ int main(int argc, char **argv)
+ 		    const char wide10[] = " 10%%-|                                                                |-10%%";
+ 		    const char wide11[] = " CPU +1--------+10-------+20-------+30-------+40-------+50-------+60--+--0%%";
+ 
 -		    mvwprintw(padwide, 1, 0, wide1);
 -		    mvwprintw(padwide, 2, 0, wide2);
 -		    mvwprintw(padwide, 3, 0, wide3);
@@ -88,8 +60,8 @@ index 8a5d35c..cec409a 100644
 -		    mvwprintw(padwide, 7, 0, wide7);
 -		    mvwprintw(padwide, 8, 0, wide8);
 -		    mvwprintw(padwide, 9, 0, wide9);
--		    mvwprintw(padwide, 10, 0, wide10);
--		    mvwprintw(padwide, 11, 0, wide_1_64);
+-		    mvwprintw(padwide,10, 0, wide10);
+-		    mvwprintw(padwide,11, 0, wide11);
 +		    mvwprintw(padwide, 1, 0, "%s", wide1);
 +		    mvwprintw(padwide, 2, 0, "%s", wide2);
 +		    mvwprintw(padwide, 3, 0, "%s", wide3);
@@ -99,12 +71,12 @@ index 8a5d35c..cec409a 100644
 +		    mvwprintw(padwide, 7, 0, "%s", wide7);
 +		    mvwprintw(padwide, 8, 0, "%s", wide8);
 +		    mvwprintw(padwide, 9, 0, "%s", wide9);
-+		    mvwprintw(padwide, 10, 0, "%s", wide10);
-+		    mvwprintw(padwide, 11, 0, "%s", wide_1_64);
++		    mvwprintw(padwide,10, 0, "%s", wide10);
++		    mvwprintw(padwide,11, 0, "%s", wide11);
  		    mvwprintw(padwide, 1, 6, "CPU(s)=%d", cpus);
  		    if (wide_first_time) {
  			mvwprintw(padwide, 3, 7,
-@@ -5747,17 +5747,17 @@ int main(int argc, char **argv)
+@@ -5742,16 +5742,16 @@ int main(int argc, char **argv)
  			rows = 12;
  		    }
  		    if (cpus > 63) {
@@ -118,7 +90,6 @@ index 8a5d35c..cec409a 100644
 -			mvwprintw(padwide, rows + 7, 0, wide8);
 -			mvwprintw(padwide, rows + 8, 0, wide9);
 -			mvwprintw(padwide, rows + 9, 0, wide10);
--			mvwprintw(padwide, rows + 10, 0, wide_65_128);
 +			mvwprintw(padwide, rows + 0, 0, "%s", wide1);
 +			mvwprintw(padwide, rows + 1, 0, "%s", wide2);
 +			mvwprintw(padwide, rows + 2, 0, "%s", wide3);
@@ -129,11 +100,10 @@ index 8a5d35c..cec409a 100644
 +			mvwprintw(padwide, rows + 7, 0, "%s", wide8);
 +			mvwprintw(padwide, rows + 8, 0, "%s", wide9);
 +			mvwprintw(padwide, rows + 9, 0, "%s", wide10);
-+ 			mvwprintw(padwide, rows + 10, 0, "%s", wide_65_128);
+ 			mvwprintw(padwide, rows + 10, 0,
+ 				  " CPU +65---+70-------+80-------+90-------+100------+110------+120-----+--0%%");
  			if (wide_first_time) {
- 			    mvwprintw(padwide, rows + 3, 7,
- 				      " Please wait gathering CPU statistics");
-@@ -5804,17 +5804,17 @@ int main(int argc, char **argv)
+@@ -5800,16 +5800,16 @@ int main(int argc, char **argv)
  			rows = 23;
  		    }
  		    if (cpus > 127) {
@@ -147,7 +117,6 @@ index 8a5d35c..cec409a 100644
 -			mvwprintw(padwide, rows + 7, 0, wide8);
 -			mvwprintw(padwide, rows + 8, 0, wide9);
 -			mvwprintw(padwide, rows + 9, 0, wide10);
--			mvwprintw(padwide, rows + 10, 0,wide_129_192);
 +			mvwprintw(padwide, rows + 0, 0, "%s", wide1);
 +			mvwprintw(padwide, rows + 1, 0, "%s", wide2);
 +			mvwprintw(padwide, rows + 2, 0, "%s", wide3);
@@ -158,7 +127,40 @@ index 8a5d35c..cec409a 100644
 +			mvwprintw(padwide, rows + 7, 0, "%s", wide8);
 +			mvwprintw(padwide, rows + 8, 0, "%s", wide9);
 +			mvwprintw(padwide, rows + 9, 0, "%s", wide10);
-+			mvwprintw(padwide, rows + 10, 0, "%s", wide_129_192);
+ 			mvwprintw(padwide, rows + 10, 0,
+ 				  " CPU +129--------+140------+150------+160------+170------+180------+190--0%%");
  			if (wide_first_time) {
- 			    mvwprintw(padwide, rows + 3, 7,
- 				      " Please wait gathering CPU statistics");
+@@ -8253,23 +8253,23 @@ I/F Name Recv=KB/s Trans=KB/s packin packout insize outsize Peak->Recv Trans
+ 		case 5:
+ 		    if(cursed) {
+ 		        if (show_args == ARGS_ONLY) {
+-			    mvwprintw(padtop, 1, y, head1_top_argonly);
+-			    mvwprintw(padtop, 2, y, head2_top_argonly);
++			    mvwprintw(padtop, 1, y, "%s", head1_top_argonly);
++			    mvwprintw(padtop, 2, y, "%s", head2_top_argonly);
+ 		        } else if (COLS > 119) {
+ 			    if (show_topmode == 5) {
+-			        mvwprintw(padtop, 1, y, head1_top_wide_mode5);
+-			        mvwprintw(padtop, 2, y, head2_top_wide_mode5);
++			        mvwprintw(padtop, 1, y, "%s", head1_top_wide_mode5);
++			        mvwprintw(padtop, 2, y, "%s", head2_top_wide_mode5);
+ 			    } else{
+-			        mvwprintw(padtop, 1, y, head1_top_wide_modex);
+-			        mvwprintw(padtop, 2, y, head2_top_wide_modex);
++			        mvwprintw(padtop, 1, y, "%s", head1_top_wide_modex);
++			        mvwprintw(padtop, 2, y, "%s", head2_top_wide_modex);
+ 			    }
+ 		        } else {
+ 			    if (show_topmode == 5) {
+-			        mvwprintw(padtop, 1, y, head1_top_thin_mode5);
+-			        mvwprintw(padtop, 2, y, head2_top_thin_mode5);
++			        mvwprintw(padtop, 1, y, "%s", head1_top_thin_mode5);
++			        mvwprintw(padtop, 2, y, "%s", head2_top_thin_mode5);
+ 			    } else {
+-			        mvwprintw(padtop, 1, y, head1_top_thin_modex);
+-			        mvwprintw(padtop, 2, y, head2_top_thin_modex);
++			        mvwprintw(padtop, 1, y, "%s", head1_top_thin_modex);
++			        mvwprintw(padtop, 2, y, "%s", head2_top_thin_modex);
+ 		            }
+ 		        }
+                     } /* cursed */
diff --git a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
index 4a921f2921..a7efb5e631 100644
--- a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
+++ b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
@@ -8,16 +8,15 @@ errno.h is in /usr/include
 defines from sys/cdefs.h is used
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
-
- lmon16n.c | 4 ++--
+---
+ lmon16s.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/lmon16n.c b/lmon16n.c
-index 5efd8f8..8a5d35c 100644
---- a/lmon16n.c
-+++ b/lmon16n.c
+diff --git a/lmon16s.c b/lmon16s.c
+index b9f1fa7..fa739c1 100644
+--- a/lmon16s.c
++++ b/lmon16s.c
 @@ -61,7 +61,7 @@ static char *SccsId = "nmon " VERSION;
  #include <fcntl.h>
  #include <math.h>
@@ -35,7 +34,7 @@ index 5efd8f8..8a5d35c 100644
  
  /* Windows moved here so they can be cleared when the screen mode changes */
  WINDOW *padwelcome = NULL;
-@@ -583,7 +584,6 @@ struct procsinfo {
+@@ -585,7 +586,6 @@ struct procsinfo {
  int isroot = 0;
  
  #include <mntent.h>
diff --git a/meta-oe/recipes-support/nmon/nmon_16n.bb b/meta-oe/recipes-support/nmon/nmon_16s.bb
similarity index 91%
rename from meta-oe/recipes-support/nmon/nmon_16n.bb
rename to meta-oe/recipes-support/nmon/nmon_16s.bb
index 1cf1049259..a875f40e3e 100644
--- a/meta-oe/recipes-support/nmon/nmon_16n.bb
+++ b/meta-oe/recipes-support/nmon/nmon_16s.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon${PV}.c;name=lmon \
            file://0001-lmon16g.c-Adjust-system-headers.patch \
            file://0001-Fix-a-lot-of-Werror-format-security-errors-with-mvpr.patch \
            "
-SRC_URI[lmon.sha256sum] = "c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2"
+SRC_URI[lmon.sha256sum] = "0736ce0f729e48c124a7ba566c069c5a234511cc9c6ac9277da92f8bb44f2b11"
 SRC_URI[doc.sha256sum] = "1f7f83afe62a7210be5e83cd24157adb854c14599efe0b377a7ecca933869278"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/nmon/files/"
