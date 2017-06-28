Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E8D2678066
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:45 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id s66so25385529pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rc2XBCErXdi0LdUEPwe4TRQvXfXV9egout3Ite769As=;
	b=o6rDnv/99XBkAZ5F8mmm6lcmndQnbyuuAxqGeg+b8hZJ27/jjGUIjCR1WZyU4EUfEX
	1NFq67clivlBFzktJFi+sZpoRSDuR9XadDmRbLCKavF5H3fATsmCDS6kHmbv413XaXVy
	7LtxdM+BhaXdAqWsBNiGftsflMczE0rArIHSMvC8OUCywiHNe1FgTD5UkcgWx3K2ZjF3
	zch0AAnRmb1BSWBv74hpGBekeLsU6XgS6tGhK8qBtb5M9ipF8nmaQHA/PrFFSp7aWVkz
	hOw+gZyUQI9Pjl+zf7os2DpU9ArLaDyfNMQYfQTtnjXnf26LYhI39h4HfvkiyhxKIuk2
	Mvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rc2XBCErXdi0LdUEPwe4TRQvXfXV9egout3Ite769As=;
	b=tWdanr5fp/qjmGEImnzqvj6JMFwqhNoAUvIsVQPHJ9g1yKQhZa+uFyYHEoJtRQXOGg
	ZuBY4KJXHnE2S5D2SbbA5mrwa8O6NMW+paWwMBIU+epcsptrSbo9SIZLyWn6fAYABdjp
	sr7b6TNntB2jrIAXS+WOeKExaeQXMZze+AtaTLwT9k7ijt5jf2qAQRRRnsBdiYIzi+AR
	02qp6ArFi00flLL50kh6KHEb7UuyZ0pwpKjCD/K0efXmsyXcLSZ5yqJh6FgrJihguB3U
	d0AUtXyaUp5at5DnCotjkjhlBr6SxeSSjlsrj/7tJIlea3mEf7Uyl/GcfPxaAHMjs513
	Vswg==
X-Gm-Message-State: AKS2vOxWcTVTorSnjcEW6z3cvIxGCx4z3Tre9i8xkw/LJECfx3Nx0+xJ
	wzm5jI4gSLOqzseV
X-Received: by 10.99.129.200 with SMTP id t191mr8294809pgd.70.1498615726349;
	Tue, 27 Jun 2017 19:08:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:12 -0700
Message-Id: <20170628020819.17047-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/13] wmiconfig: Fix build with hardening flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Jun 2017 02:08:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-makefile-Pass-CFLAGS-to-compile.patch     |  26 +
 .../0002-fix-err-API-to-have-format-string.patch   | 656 +++++++++++++++++++++
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |   5 +-
 3 files changed, 686 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
 create mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch

diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch b/meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
new file mode 100644
index 000000000..90eff5bb0
--- /dev/null
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
@@ -0,0 +1,26 @@
+From 0378cbb323c662a565f7f3de2dee3d8a646e7bd1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 09:32:42 -0700
+Subject: [PATCH 1/2] makefile: Pass CFLAGS to compile
+
+Set CC if not already set
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ host/tools/wmiconfig/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/host/tools/wmiconfig/Makefile b/host/tools/wmiconfig/Makefile
+index c6738c5..3253a7e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,4 @@
+-CC :=$(ATH_CROSS_COMPILE_TYPE)gcc
++CC ?= $(ATH_CROSS_COMPILE_TYPE)gcc
+ 
+ all:
+-	$(CC) -Wall -DUSER_KEYS -g $(LDFLAGS) -I../../include -I../../../include -I../../wlan/include -I../../os/linux/include wmiconfig.c -o wmiconfig
++	$(CC) -Wall -DUSER_KEYS -g $(CFLAGS) $(LDFLAGS) -I../../include -I../../../include -I../../wlan/include -I../../os/linux/include wmiconfig.c -o wmiconfig
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch b/meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch
new file mode 100644
index 000000000..f67f784c1
--- /dev/null
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch
@@ -0,0 +1,656 @@
+From 909ebdde4ee2233d65de8fa01fde8e9a3bec12b7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 09:33:26 -0700
+Subject: [PATCH 2/2] fix err() API to have format string
+
+Fixes errors with hardening flags
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ host/tools/wmiconfig/wmiconfig.c | 148 +++++++++++++++++++--------------------
+ 1 file changed, 74 insertions(+), 74 deletions(-)
+
+diff --git a/host/tools/wmiconfig/wmiconfig.c b/host/tools/wmiconfig/wmiconfig.c
+index 21c9dcd..a6ec481 100644
+--- a/wmiconfig.c
++++ b/wmiconfig.c
+@@ -483,7 +483,7 @@ main (int argc, char **argv)
+     strcpy(ifname, ethIf);
+     s = socket(AF_INET, SOCK_DGRAM, 0);
+     if (s < 0) {
+-        err(1, "socket");
++        err(1, "%s", "socket");
+     }
+ 
+     while (1) {
+@@ -1506,28 +1506,28 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)filterCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SETBSSFILTER, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_POWER_MODE:
+         ifr.ifr_data = (void *)pwrCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SETPWR, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_PM_PARAMS:
+         ifr.ifr_data = (void *)pmParamCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_PMPARAMS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_IBSS_PM_CAPS:
+         ifr.ifr_data = (void *)adhocPmCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_IBSS_PM_CAPS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_ERROR_DETECTION:
+@@ -1535,7 +1535,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_HB_CHALLENGE_RESP:
+@@ -1543,7 +1543,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+ #ifdef USER_KEYS
+@@ -1554,7 +1554,7 @@ main (int argc, char **argv)
+ 
+             if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+             {
+-                err(1, ifr.ifr_name);
++                err(1, "%s", ifr.ifr_name);
+             }
+ 
+             break;
+@@ -1575,7 +1575,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)sParamCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SETSCAN, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_VERSION:
+@@ -1586,7 +1586,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)revinfo;
+         if (ioctl(s, AR6000_IOCTL_WMI_GETREV, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         printf("Host Rev = 0x%x(%u.%u.%u.%u), Target Rev = 0x%x(%u.%u.%u.%u)\n",
+               revinfo->host_ver,
+@@ -1606,14 +1606,14 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)listenCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SETLISTENINT, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_BMISS_TIME:
+         ifr.ifr_data = (void *)bmissCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_BMISS_TIME, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_RSSI_THRESHOLDS:
+@@ -1621,14 +1621,14 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_SNR_THRESHOLDS:
+         ifr.ifr_data = (void *)snrThresholdParam;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_SNRTHRESHOLD, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_CLR_RSSISNR:
+@@ -1636,7 +1636,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_LQ_THRESHOLDS:
+@@ -1644,7 +1644,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_CHANNEL:
+@@ -1693,18 +1693,18 @@ main (int argc, char **argv)
+  
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_CHANNELPARAMS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_SSID:
+         if (index > MAX_PROBED_SSID_INDEX) {
+             printf("num option for ssid command too large\n");
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+             break;
+         }
+         if (strlen((char *)ssid) > sizeof (ssidCmd->ssid)) {
+             printf("ssid name too large\n");
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+             break;
+         }
+         ssidCmd->entryIndex = index;
+@@ -1722,7 +1722,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)ssidCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_PROBEDSSID, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_BADAP:
+@@ -1735,7 +1735,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)badApCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_BADAP, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_CREATE_QOS:
+@@ -1794,7 +1794,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)crePStreamCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_CREATE_QOS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_TARGET_STATS:
+@@ -1807,7 +1807,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)&tgtStatsCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_GET_TARGET_STATS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         printTargetStats(&(tgtStatsCmd.targetStats));
+         break;
+@@ -1815,7 +1815,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)pBitMask;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_ERROR_REPORT_BITMASK, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_DELETE_QOS:
+@@ -1824,7 +1824,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)delPStreamCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_DELETE_QOS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_QOS_QUEUE:
+@@ -1840,7 +1840,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)getQosQueueCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_GET_QOS_QUEUE, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+ 
+         printf("Active TSIDs \n");
+@@ -1855,7 +1855,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)ieInfo;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_ASSOC_INFO, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_AC_PARAMS:
+@@ -1871,14 +1871,14 @@ main (int argc, char **argv)
+         ifr.ifr_data = (void *)acParamsCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_ACCESS_PARAMS, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_DISC_TIMEOUT:
+         ifr.ifr_data = (void *)discCmd;
+         if (ioctl(s, AR6000_IOCTL_WMI_SET_DISC_TIMEOUT, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+      case WMI_SET_ADHOC_BSSID:
+@@ -1887,7 +1887,7 @@ main (int argc, char **argv)
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+             printf("fail to set adhoc bssid \n");
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_OPT_MODE:
+@@ -1895,7 +1895,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_OPT_SEND_FRAME:
+@@ -1903,7 +1903,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_BEACON_INT:
+@@ -1911,7 +1911,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_VOICE_PKT_SIZE:
+@@ -1919,7 +1919,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_MAX_SP:
+@@ -1927,7 +1927,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_ROAM_TBL:
+@@ -1935,7 +1935,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_ROAM_CTRL:
+@@ -1943,7 +1943,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_POWERSAVE_TIMERS:
+@@ -1951,7 +1951,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_POWER_MODE:
+@@ -1959,7 +1959,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         printf("Power mode is %s\n",
+                (getPowerMode->powerMode == MAX_PERF_POWER) ? "maxperf" : "rec");
+@@ -1969,7 +1969,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_ROAM_DATA:
+@@ -1977,7 +1977,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_BT_STATUS:
+@@ -1985,7 +1985,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_BT_PARAMS:
+@@ -1993,7 +1993,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;   
+     case WMI_SET_RETRYLIMITS:
+@@ -2001,14 +2001,14 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_START_SCAN:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_STARTSCAN;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_FIX_RATES:
+@@ -2031,14 +2031,14 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_FIX_RATES:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GETFIXRATES;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         } else {
+             int i;
+             printf("Fix rate set index:");
+@@ -2057,7 +2057,7 @@ main (int argc, char **argv)
+         index--;
+         setAuthMode->mode = atoi(argv[index]);
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_REASSOC_MODE:
+@@ -2067,42 +2067,42 @@ main (int argc, char **argv)
+         index--;
+         setReassocMode->mode = atoi(argv[index]);
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_LPREAMBLE:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_LPREAMBLE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_RTS:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_RTS;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_WMM:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_WMM;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_TXOP:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_TXOP;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case DIAG_READ:
+         ((int *)buf)[0] = AR6000_XIOCTL_DIAG_READ;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         printf("diagdata: 0x%x\n", *diagdata);
+         break;
+@@ -2110,7 +2110,7 @@ main (int argc, char **argv)
+         ((int *)buf)[0] = AR6000_XIOCTL_DIAG_WRITE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_RD:
+@@ -2118,7 +2118,7 @@ main (int argc, char **argv)
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
+         {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         else
+         {
+@@ -2139,14 +2139,14 @@ main (int argc, char **argv)
+         index--;
+         setKeepAlive->keepaliveInterval = atoi(argv[index]);
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_KEEPALIVE:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GET_KEEPALIVE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         printf("Keepalive interval is %d secs and AP is %s\n",
+                getKeepAlive->keepaliveInterval, (getKeepAlive->configured ?
+@@ -2156,63 +2156,63 @@ main (int argc, char **argv)
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_APPIE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_MGMT_FRM_RX_FILTER:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_MGMT_FRM_RX_FILTER;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_DBGLOG_CFG_MODULE:
+         ((int *)buf)[0] = AR6000_XIOCTL_DBGLOG_CFG_MODULE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_DBGLOG_GET_DEBUG_LOGS:
+         ((int *)buf)[0] = AR6000_XIOCTL_DBGLOG_GET_DEBUG_LOGS;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_HOST_SLEEP_MODE:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_HOST_SLEEP_MODE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_WOW_MODE:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_WOW_MODE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_ADD_WOW_PATTERN:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_ADD_WOW_PATTERN;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_DEL_WOW_PATTERN:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_DEL_WOW_PATTERN;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_GET_WOW_LIST:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GET_WOW_LIST;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case DIAG_DUMP_CHIP_MEM:
+@@ -2225,7 +2225,7 @@ main (int argc, char **argv)
+                 ((int *)buf)[0] = AR6000_XIOCTL_DIAG_READ;
+                 ifr.ifr_data = buf;
+                 if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-                    err(1, ifr.ifr_name);
++                    err(1, "%s", ifr.ifr_name);
+                 }
+                 printf("0x%04x:0x%04x\n", *diagaddr, *diagdata);
+             }
+@@ -2237,21 +2237,21 @@ main (int argc, char **argv)
+         index = optind - 1;
+         *connectCtrlFlags = strtoul(argv[index], NULL, 0);
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case DUMP_HTC_CREDITS:        
+         ((int *)buf)[0] = AR6000_XIOCTL_DUMP_HTC_CREDIT_STATE;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_AKMP_INFO:
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_AKMP_PARAMS;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_PMKID_LIST:
+@@ -2259,7 +2259,7 @@ main (int argc, char **argv)
+             ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_PMKID_LIST;
+             ifr.ifr_data = buf;
+             if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-                err(1, ifr.ifr_name);
++                err(1, "%s", ifr.ifr_name);
+             }
+         } else {
+             printf("No PMKIDs entered\n");
+@@ -2269,7 +2269,7 @@ main (int argc, char **argv)
+         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GET_PMKID_LIST;
+         ifr.ifr_data = buf;
+         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     case WMI_SET_BSS_PMKID_INFO:
+@@ -2277,7 +2277,7 @@ main (int argc, char **argv)
+         iwr.u.data.length = sizeof(*pi_cmd);
+         if (ioctl(s, IEEE80211_IOCTL_ADDPMKID, &iwr) < 0) {
+             printf("ADDPMKID IOCTL Error\n");
+-            err(1, ifr.ifr_name);
++            err(1, "%s", ifr.ifr_name);
+         }
+         break;
+     default:
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
index 596a4e67e..c66572b1c 100644
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
@@ -6,7 +6,10 @@ SRCREV = "5394"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r2"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http \
+           file://0001-makefile-Pass-CFLAGS-to-compile.patch \
+           file://0002-fix-err-API-to-have-format-string.patch \
+           "
 S = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig"
 
 CLEANBROKEN = "1"
-- 
2.13.2


