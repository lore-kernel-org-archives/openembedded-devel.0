Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 723E37ED48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 21:35:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l21so20051002pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cszV2ohuTFEG7yUYK1PmAe+r7ffLpIMcDUC4HEns6ZA=;
	b=UjOGkVfXXCqwvCw9cORtUQ18WrF1Pnl2neCZRWu9KEUWp7c2CX3///jKSC5i720h9G
	lr361JdfUqIeET4Gv7D14rxxywaSfA/MkvK0cbDsh9wdgLHueOVyO+SA5mkuuM86Dunf
	tQBE0NNfozAP4NNoWIacD80KuKG57Jz/PSIrAEFPA1oe4TUZCzMBhcunaXsbFTvwoPK8
	78R7lcDKlPjEWS4+fQsw4kHdcUwa8sBCkEr1k41dP07TEyuNXgpPnkBskhNCYWWDyZhN
	bLOrVZfE3/LduxOc7T5MogGjByuEDm5Tv3UnUc0fnP4nJo2tgiLOjfuq+c7yOEkC3LeF
	aa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cszV2ohuTFEG7yUYK1PmAe+r7ffLpIMcDUC4HEns6ZA=;
	b=igcKiSavRmhCr9siPR/U8dHJt7L6qal8XyhTZs4IJEeYt9zHcljlLjbrzOtjbCh/EP
	MvVcAjcKCFcMCf2OZS+PuY4wVJZ8DYn8trClsVGpOXw6DQ0cTD6Pre6lKqqRU/5ZTFWp
	j2TeeXBIhPh/vPe/duOQn0GAt+P8k7U2W92jsZ5crmzdCxB3N2lF8qKKA2YQESzoff1r
	yfgIV+nw4J5KZQzZ59zPesh7s8UdA/yiQkfv5rkp6YT6Ha6kOT1mW+qGFYlmbL9LmutC
	KLFEEt7S3k+ksgZTVU6NFabo9MNfwiOwE4EgsQ7mzfGBtsRitGx+TeXBO8qj2AeFaDyF
	M5oA==
X-Gm-Message-State: APjAAAV52pCgAWXB58ZAG84N/VuNuxFmGmiK+TzyoBPAbT/3rZzMddf4
	ifleZc5pFXYo9pi3UC0jRj4VFEUnNH4=
X-Google-Smtp-Source: APXvYqxC8rl3dg7r7p0LOshlimDVKESHclD1qHCcgQPmvhELsooDNoR7LmNkMNKj9RLjxVkSml4ZwQ==
X-Received: by 2002:a17:90a:d791:: with SMTP id
	z17mr80030580pju.40.1563917704608; 
	Tue, 23 Jul 2019 14:35:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	196sm46955548pfy.167.2019.07.23.14.35.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 14:35:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jul 2019 14:34:56 -0700
Message-Id: <20190723213456.1594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] orage: Fix build with libical3
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
X-List-Received-Date: Tue, 23 Jul 2019 21:35:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...etting-is_utc-member-of-icaltimetype.patch | 77 +++++++++++++++++++
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb  |  2 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/orage/orage/0001-drop-setting-is_utc-member-of-icaltimetype.patch

diff --git a/meta-xfce/recipes-apps/orage/orage/0001-drop-setting-is_utc-member-of-icaltimetype.patch b/meta-xfce/recipes-apps/orage/orage/0001-drop-setting-is_utc-member-of-icaltimetype.patch
new file mode 100644
index 0000000000..517de5f922
--- /dev/null
+++ b/meta-xfce/recipes-apps/orage/orage/0001-drop-setting-is_utc-member-of-icaltimetype.patch
@@ -0,0 +1,77 @@
+From 5bdf11fe3638d279edcad911906f801751e024da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Jul 2019 14:22:08 -0700
+Subject: [PATCH] drop setting is_utc member of icaltimetype
+
+This seems to be gone in libical3
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ical-code.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/ical-code.c b/src/ical-code.c
+index d583140..d8e5543 100644
+--- a/src/ical-code.c
++++ b/src/ical-code.c
+@@ -129,7 +129,6 @@ static struct icaltimetype ical_get_current_local_time()
+         &&   (strcmp(g_par.local_timezone, "floating") != 0))
+         ctime = icaltime_current_time_with_zone(local_icaltimezone);
+     else { / * use floating time * /
+-        ctime.is_utc      = 0;
+         ctime.is_date     = 0;
+         ctime.is_daylight = 0;
+         ctime.zone        = NULL;
+@@ -2579,7 +2578,6 @@ static struct icaltimetype count_first_alarm_time(xfical_period per
+  * when counting alarm time. */
+         if (rel == ICAL_RELATED_START) {
+             per.stime.is_date       = 0;
+-            per.stime.is_utc        = 1;
+             per.stime.is_daylight   = 0;
+             per.stime.zone          = utc_icaltimezone;
+             per.stime.hour          = 0;
+@@ -2588,7 +2586,6 @@ static struct icaltimetype count_first_alarm_time(xfical_period per
+         }
+         else {
+             per.etime.is_date       = 0;
+-            per.etime.is_utc        = 1;
+             per.etime.is_daylight   = 0;
+             per.etime.zone          = utc_icaltimezone;
+             per.etime.hour          = 0;
+@@ -2613,7 +2610,6 @@ static struct icaltimetype count_next_alarm_time(struct icaltimetype start_time
+ /* HACK: convert to UTC time so that we can use time arithmetic
+  * when counting alarm time. */
+         start_time.is_date       = 0;
+-        start_time.is_utc        = 1;
+         start_time.is_daylight   = 0;
+         start_time.zone          = utc_icaltimezone;
+         start_time.hour          = 0;
+@@ -2768,7 +2764,6 @@ static alarm_struct *process_alarm_trigger(icalcomponent *c
+      */
+     if (icaltime_is_date(per.stime)) {
+         if (local_icaltimezone != utc_icaltimezone) {
+-            next_alarm_time.is_utc        = 0;
+             next_alarm_time.is_daylight   = 0;
+             next_alarm_time.zone          = local_icaltimezone;
+         }
+@@ -2850,7 +2845,6 @@ orage_message(120, P_N "Alarm rec loop next_start:%s next_alarm:%s per.stime:%s"
+          */
+         if (icaltime_is_date(per.stime)) {
+             if (local_icaltimezone != utc_icaltimezone) {
+-                next_alarm_time.is_utc        = 0;
+                 next_alarm_time.is_daylight   = 0;
+                 next_alarm_time.zone          = local_icaltimezone;
+             }
+@@ -2944,7 +2938,6 @@ orage_message(120, P_N "*****After loop Alarm %s %s", icaltime_as_ical_string(ne
+          */
+         if (icaltime_is_date(per.stime)) {
+             if (local_icaltimezone != utc_icaltimezone) {
+-                next_alarm_time.is_utc        = 0;
+                 next_alarm_time.is_daylight   = 0;
+                 next_alarm_time.zone          = local_icaltimezone;
+             }
+-- 
+2.22.0
+
diff --git a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
index eb9da2dffa..9662b614f8 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
@@ -6,6 +6,8 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app
 
+SRC_URI += "file://0001-drop-setting-is_utc-member-of-icaltimetype.patch"
+
 SRC_URI[md5sum] = "2b7f5d38cb5c6edbcc65d0f52a742e46"
 SRC_URI[sha256sum] = "3cf9aa441ae83c8688865f82217025cdf3ebaa152cce4571777b8c2aa8dd9062"
 
-- 
2.22.0


