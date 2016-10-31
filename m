Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5983871AE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 68so13535308wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hBxkJ+LytXrBq8EwH0QGBMt6+fNs60lOQrhoCm+gB7k=;
	b=UmE78I/o1tEcBOxpx+rDHJHuuKJc2+X6qjXU4/DQ2wcV9IjAPPO+ixL9GaB4xQqR60
	n72/76maueFnJO2w4WCl8xkHC+rjjfdKqWqtMGPxIwiMyvBRGfQ7l8sn9FzbLnHWNWjl
	nRGSzxh499AtJ86n2Ib+88VTVr2V4+MgQQnZ2TS1kfx4dufXpwFl1vjnBYvKoit1zOHo
	30pqPOPnA3iRXM1EhyPyUzayeARwNZVbrqgEbFWO18HHgYH6z0MtFrQbRpFLj6re0IF1
	F+rKtKm/e/uoloR1ckwfnlPwXamP/mhtyDMd1cEuw+QaaW5uj0f+Ds+Iv8s/odxOqs/a
	kzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hBxkJ+LytXrBq8EwH0QGBMt6+fNs60lOQrhoCm+gB7k=;
	b=DM/mV/2I/spfcsg+bsGULxUYGaCTDnLO53NfY5xZw0+CpOVJ1LXSu6ehlCYR9TFlHV
	1OdcnkcOJ19jOrUgMZ2Ym4D7DEKpkJlPf5PINRwfRGH7nbGpo2Qo4jmhDfmlXuXwJzDJ
	XbJuRkYQskEixs9HdVsxANd6bw5vhPFjQJw/UAym6IyeCbtsoYeiPHjXbjfyx2CPl8u/
	05ZdIReSEetCzgE//1VNin/tboz/+OrBg2Ug5opS5AUUHpDjXQLV3rjrlVOrRcaRJT45
	Z221ER4Q+8HLr8LSQFRVySRKkczLSkHgbclcncgwzC1UQfW/MJiVl+TkcxClpLNuXefF
	2ZVA==
X-Gm-Message-State: ABUngvcRdyvB3zbkBOG5RawxEi+sWShRv1wJ6h8kg4ymLZXVqXG/mpCvfnDQU4W9DIfPMw==
X-Received: by 10.194.106.169 with SMTP id gv9mr23906232wjb.129.1477951876073; 
	Mon, 31 Oct 2016 15:11:16 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:49 +0100
Message-Id: <1477951849-32149-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] xfce4-panel: update to 4.12.1
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch was a
  backport and is now included upstream

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...r-warning-in-clock-plugin-about-shadowed-.patch | 606 ---------------------
 ...ake-change-of-system-s-timezone-change-t.patch} |   0
 ...o-not-display-desktop-icon-when-no-windo.patch} |   0
 ...xfce4-panel_4.12.0.bb => xfce4-panel_4.12.1.bb} |   9 +-
 4 files changed, 4 insertions(+), 611 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/files/{0002-clock-time-make-change-of-system-s-timezone-change-t.patch => 0001-clock-time-make-change-of-system-s-timezone-change-t.patch} (100%)
 rename meta-xfce/recipes-xfce/xfce4-panel/files/{0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch => 0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch} (100%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.0.bb => xfce4-panel_4.12.1.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch
deleted file mode 100644
index d971fca..0000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch
+++ /dev/null
@@ -1,606 +0,0 @@
-From 5a9e94ab7bd628f5bf6b46ea7ea91cf40b4aee98 Mon Sep 17 00:00:00 2001
-From: Matt Thirtytwo <matt.59491@gmail.com>
-Date: Mon, 2 Mar 2015 21:18:41 +0100
-Subject: [PATCH] Fix compiler warning in clock plugin about shadowed 'time'
- variable
-
-Upstream-Status: Backport [1]
-
-[1] http://git.xfce.org/xfce/xfce4-panel/commit/?id=5a9e94ab7bd628f5bf6b46ea7ea91cf40b4aee98
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-
----
- plugins/clock/clock-analog.c  | 20 ++++++-------
- plugins/clock/clock-binary.c  | 28 +++++++++---------
- plugins/clock/clock-digital.c |  8 ++---
- plugins/clock/clock-fuzzy.c   |  6 ++--
- plugins/clock/clock-lcd.c     | 34 +++++++++++-----------
- plugins/clock/clock-time.c    | 68 +++++++++++++++++++++----------------------
- plugins/clock/clock.c         | 12 ++++----
- 7 files changed, 88 insertions(+), 88 deletions(-)
-
-diff --git a/plugins/clock/clock-analog.c b/plugins/clock/clock-analog.c
-index 2e96a09..910450d 100644
---- a/plugins/clock/clock-analog.c
-+++ b/plugins/clock/clock-analog.c
-@@ -216,7 +216,7 @@ xfce_clock_analog_expose_event (GtkWidget      *widget,
-   gdouble          xc, yc;
-   gdouble          angle, radius;
-   cairo_t         *cr;
--  GDateTime       *time;
-+  GDateTime       *date_time;
- 
-   panel_return_val_if_fail (XFCE_CLOCK_IS_ANALOG (analog), FALSE);
- 
-@@ -239,7 +239,7 @@ xfce_clock_analog_expose_event (GtkWidget      *widget,
-       cairo_clip (cr);
- 
-       /* get the local time */
--      time = clock_time_get_time (analog->time);
-+      date_time = clock_time_get_time (analog->time);
- 
-       /* set the line properties */
-       cairo_set_line_width (cr, 1);
-@@ -251,20 +251,20 @@ xfce_clock_analog_expose_event (GtkWidget      *widget,
-       if (analog->show_seconds)
-         {
-           /* second pointer */
--          angle = TICKS_TO_RADIANS (g_date_time_get_second (time));
-+          angle = TICKS_TO_RADIANS (g_date_time_get_second (date_time));
-           xfce_clock_analog_draw_pointer (cr, xc, yc, radius, angle, 0.7, TRUE);
-         }
- 
-       /* minute pointer */
--      angle = TICKS_TO_RADIANS (g_date_time_get_minute (time));
-+      angle = TICKS_TO_RADIANS (g_date_time_get_minute (date_time));
-       xfce_clock_analog_draw_pointer (cr, xc, yc, radius, angle, 0.8, FALSE);
- 
-       /* hour pointer */
--      angle = HOURS_TO_RADIANS (g_date_time_get_hour (time), g_date_time_get_minute (time));
-+      angle = HOURS_TO_RADIANS (g_date_time_get_hour (date_time), g_date_time_get_minute (date_time));
-       xfce_clock_analog_draw_pointer (cr, xc, yc, radius, angle, 0.5, FALSE);
- 
-       /* cleanup */
--      g_date_time_unref (time);
-+      g_date_time_unref (date_time);
-       cairo_destroy (cr);
-     }
- 
-@@ -347,12 +347,12 @@ xfce_clock_analog_draw_pointer (cairo_t *cr,
- 
- static gboolean
- xfce_clock_analog_update (XfceClockAnalog *analog,
--                          ClockTime       *time)
-+                          ClockTime       *clock_time)
- {
-   GtkWidget *widget = GTK_WIDGET (analog);
- 
-   panel_return_val_if_fail (XFCE_CLOCK_IS_ANALOG (analog), FALSE);
--  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (time), FALSE);
-+  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (clock_time), FALSE);
- 
-   /* update if the widget if visible */
-   if (G_LIKELY (GTK_WIDGET_VISIBLE (widget)))
-@@ -364,11 +364,11 @@ xfce_clock_analog_update (XfceClockAnalog *analog,
- 
- 
- GtkWidget *
--xfce_clock_analog_new (ClockTime *time)
-+xfce_clock_analog_new (ClockTime *clock_time)
- {
-   XfceClockAnalog *analog = g_object_new (XFCE_CLOCK_TYPE_ANALOG, NULL);
- 
--  analog->time = time;
-+  analog->time = clock_time;
-   analog->timeout = clock_time_timeout_new (CLOCK_INTERVAL_MINUTE,
-                                             analog->time,
-                                             G_CALLBACK (xfce_clock_analog_update), analog);
-diff --git a/plugins/clock/clock-binary.c b/plugins/clock/clock-binary.c
-index 4751c51..46b852c 100644
---- a/plugins/clock/clock-binary.c
-+++ b/plugins/clock/clock-binary.c
-@@ -262,7 +262,7 @@ xfce_clock_binary_expose_event_true_binary (XfceClockBinary *binary,
-                                             GtkAllocation   *alloc)
- {
-   GdkColor    *active, *inactive;
--  GDateTime   *time;
-+  GDateTime   *date_time;
-   gint         row, rows;
-   static gint  binary_table[] = { 32, 16, 8, 4, 2, 1 };
-   gint         col, cols = G_N_ELEMENTS (binary_table);
-@@ -282,7 +282,7 @@ xfce_clock_binary_expose_event_true_binary (XfceClockBinary *binary,
-       active = &(GTK_WIDGET (binary)->style->dark[GTK_STATE_SELECTED]);
-     }
- 
--  time = clock_time_get_time (binary->time);
-+  date_time = clock_time_get_time (binary->time);
- 
-   /* init sizes */
-   remain_h = alloc->height;
-@@ -293,11 +293,11 @@ xfce_clock_binary_expose_event_true_binary (XfceClockBinary *binary,
-     {
-       /* get the time this row represents */
-       if (row == 0)
--        ticks = g_date_time_get_hour (time);
-+        ticks = g_date_time_get_hour (date_time);
-       else if (row == 1)
--        ticks = g_date_time_get_minute (time);
-+        ticks = g_date_time_get_minute (date_time);
-       else
--        ticks = g_date_time_get_second (time);
-+        ticks = g_date_time_get_second (date_time);
- 
-       /* reset sizes */
-       remain_w = alloc->width;
-@@ -336,7 +336,7 @@ xfce_clock_binary_expose_event_true_binary (XfceClockBinary *binary,
-       offset_y += h;
-     }
- 
--  g_date_time_unref (time);
-+  g_date_time_unref (date_time);
- }
- 
- 
-@@ -348,7 +348,7 @@ xfce_clock_binary_expose_event_binary (XfceClockBinary *binary,
- {
-   GdkColor    *active, *inactive;
-   static gint  binary_table[] = { 80, 40, 20, 10, 8, 4, 2, 1 };
--  GDateTime   *time;
-+  GDateTime   *date_time;
-   gint         row, rows = G_N_ELEMENTS (binary_table) / 2;
-   gint         col, cols;
-   gint         digit;
-@@ -368,7 +368,7 @@ xfce_clock_binary_expose_event_binary (XfceClockBinary *binary,
-       active = &(GTK_WIDGET (binary)->style->dark[GTK_STATE_SELECTED]);
-     }
- 
--  time = clock_time_get_time (binary->time);
-+  date_time = clock_time_get_time (binary->time);
- 
-   remain_w = alloc->width;
-   offset_x = alloc->x;
-@@ -379,11 +379,11 @@ xfce_clock_binary_expose_event_binary (XfceClockBinary *binary,
-     {
-       /* get the time this row represents */
-       if (col == 0)
--        ticks = g_date_time_get_hour (time);
-+        ticks = g_date_time_get_hour (date_time);
-       else if (col == 2)
--        ticks = g_date_time_get_minute (time);
-+        ticks = g_date_time_get_minute (date_time);
-       else if (col == 4)
--        ticks = g_date_time_get_second (time);
-+        ticks = g_date_time_get_second (date_time);
- 
-       /* reset sizes */
-       remain_h = alloc->height;
-@@ -520,7 +520,7 @@ xfce_clock_binary_expose_event (GtkWidget      *widget,
- 
- static gboolean
- xfce_clock_binary_update (XfceClockBinary     *binary,
--                          ClockTime           *time)
-+                          ClockTime           *clock_time)
- {
-   GtkWidget *widget = GTK_WIDGET (binary);
- 
-@@ -536,11 +536,11 @@ xfce_clock_binary_update (XfceClockBinary     *binary,
- 
- 
- GtkWidget *
--xfce_clock_binary_new (ClockTime *time)
-+xfce_clock_binary_new (ClockTime *clock_time)
- {
-   XfceClockBinary *binary = g_object_new (XFCE_CLOCK_TYPE_BINARY, NULL);
- 
--  binary->time = time;
-+  binary->time = clock_time;
-   binary->timeout = clock_time_timeout_new (CLOCK_INTERVAL_MINUTE,
-                                             binary->time,
-                                             G_CALLBACK (xfce_clock_binary_update), binary);
-diff --git a/plugins/clock/clock-digital.c b/plugins/clock/clock-digital.c
-index c293ed2..34e7019 100644
---- a/plugins/clock/clock-digital.c
-+++ b/plugins/clock/clock-digital.c
-@@ -194,12 +194,12 @@ xfce_clock_digital_finalize (GObject *object)
- 
- static gboolean
- xfce_clock_digital_update (XfceClockDigital *digital,
--                           ClockTime        *time)
-+                           ClockTime        *clock_time)
- {
-   gchar            *string;
- 
-   panel_return_val_if_fail (XFCE_CLOCK_IS_DIGITAL (digital), FALSE);
--  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (time), FALSE);
-+  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (clock_time), FALSE);
- 
-   /* set time string */
-   string = clock_time_strdup_strftime (digital->time, digital->format);
-@@ -212,11 +212,11 @@ xfce_clock_digital_update (XfceClockDigital *digital,
- 
- 
- GtkWidget *
--xfce_clock_digital_new (ClockTime *time)
-+xfce_clock_digital_new (ClockTime *clock_time)
- {
-   XfceClockDigital *digital = g_object_new (XFCE_CLOCK_TYPE_DIGITAL, NULL);
- 
--  digital->time = time;
-+  digital->time = clock_time;
-   digital->timeout = clock_time_timeout_new (clock_time_interval_from_format (digital->format),
-                                              digital->time,
-                                              G_CALLBACK (xfce_clock_digital_update), digital);
-diff --git a/plugins/clock/clock-fuzzy.c b/plugins/clock/clock-fuzzy.c
-index 7b0aa41..4b361dd 100644
---- a/plugins/clock/clock-fuzzy.c
-+++ b/plugins/clock/clock-fuzzy.c
-@@ -275,7 +275,7 @@ xfce_clock_fuzzy_finalize (GObject *object)
- 
- static gboolean
- xfce_clock_fuzzy_update (XfceClockFuzzy *fuzzy,
--                         ClockTime      *time)
-+                         ClockTime      *clock_time)
- {
-   GDateTime      *date_time;
-   gint            sector;
-@@ -353,11 +353,11 @@ xfce_clock_fuzzy_update (XfceClockFuzzy *fuzzy,
- 
- 
- GtkWidget *
--xfce_clock_fuzzy_new (ClockTime *time)
-+xfce_clock_fuzzy_new (ClockTime *clock_time)
- {
-   XfceClockFuzzy *fuzzy = g_object_new (XFCE_CLOCK_TYPE_FUZZY, NULL);
- 
--  fuzzy->time = time;
-+  fuzzy->time = clock_time;
-   fuzzy->timeout = clock_time_timeout_new (CLOCK_INTERVAL_MINUTE,
-                                            fuzzy->time,
-                                            G_CALLBACK (xfce_clock_fuzzy_update), fuzzy);
-diff --git a/plugins/clock/clock-lcd.c b/plugins/clock/clock-lcd.c
-index 84e74e6..b180d30 100644
---- a/plugins/clock/clock-lcd.c
-+++ b/plugins/clock/clock-lcd.c
-@@ -285,7 +285,7 @@ xfce_clock_lcd_expose_event (GtkWidget      *widget,
-   gint          ticks, i;
-   gdouble       size;
-   gdouble       ratio;
--  GDateTime    *time;
-+  GDateTime    *date_time;
- 
-   panel_return_val_if_fail (XFCE_CLOCK_IS_LCD (lcd), FALSE);
- 
-@@ -317,10 +317,10 @@ xfce_clock_lcd_expose_event (GtkWidget      *widget,
-       cairo_set_line_width (cr, MAX (size * 0.05, 1.5));
- 
-       /* get the local time */
--      time = clock_time_get_time (lcd->time);
-+      date_time = clock_time_get_time (lcd->time);
- 
-       /* draw the hours */
--      ticks = g_date_time_get_hour (time);
-+      ticks = g_date_time_get_hour (date_time);
- 
-       /* convert 24h clock to 12h clock */
-       if (!lcd->show_military && ticks > 12)
-@@ -333,8 +333,8 @@ xfce_clock_lcd_expose_event (GtkWidget      *widget,
-        * because we might miss the exact second (due to slightly delayed
-        * timeout) we queue a resize the first 3 seconds or anything in
-        * the first minute */
--      if ((ticks == 10 || ticks == 0) && g_date_time_get_minute (time) == 0
--          && (!lcd->show_seconds || g_date_time_get_second (time) < 3))
-+      if ((ticks == 10 || ticks == 0) && g_date_time_get_minute (date_time) == 0
-+          && (!lcd->show_seconds || g_date_time_get_second (date_time) < 3))
-         g_object_notify (G_OBJECT (lcd), "size-ratio");
- 
-       if (ticks >= 10)
-@@ -352,7 +352,7 @@ xfce_clock_lcd_expose_event (GtkWidget      *widget,
-           if (i == 0)
-             {
-               /* get the minutes */
--              ticks = g_date_time_get_minute (time);
-+              ticks = g_date_time_get_minute (date_time);
-             }
-           else
-             {
-@@ -361,11 +361,11 @@ xfce_clock_lcd_expose_event (GtkWidget      *widget,
-                 break;
- 
-               /* get the seconds */
--              ticks = g_date_time_get_second (time);
-+              ticks = g_date_time_get_second (date_time);
-             }
- 
-           /* draw the dots */
--          if (lcd->flash_separators && (g_date_time_get_second (time) % 2) == 1)
-+          if (lcd->flash_separators && (g_date_time_get_second (date_time) % 2) == 1)
-             offset_x += size * RELATIVE_SPACE * 2;
-           else
-             offset_x = xfce_clock_lcd_draw_dots (cr, size, offset_x, offset_y);
-@@ -380,14 +380,14 @@ xfce_clock_lcd_expose_event (GtkWidget      *widget,
-       if (lcd->show_meridiem)
-         {
-           /* am or pm? */
--          ticks = g_date_time_get_hour (time) >= 12 ? 11 : 10;
-+          ticks = g_date_time_get_hour (date_time) >= 12 ? 11 : 10;
- 
-           /* draw the digit */
-           offset_x = xfce_clock_lcd_draw_digit (cr, ticks, size, offset_x, offset_y);
-         }
- 
-       /* drop the pushed group */
--      g_date_time_unref (time);
-+      g_date_time_unref (date_time);
-       cairo_pop_group_to_source (cr);
-       cairo_paint (cr);
-       cairo_destroy (cr);
-@@ -403,16 +403,16 @@ xfce_clock_lcd_get_ratio (XfceClockLcd *lcd)
- {
-   gdouble    ratio;
-   gint       ticks;
--  GDateTime *time;
-+  GDateTime *date_time;
- 
-   /* get the local time */
--  time = clock_time_get_time (lcd->time);
-+  date_time = clock_time_get_time (lcd->time);
- 
-   /* 8:8(space)8 */
-   ratio = (3 * RELATIVE_DIGIT) + RELATIVE_DOTS + RELATIVE_SPACE;
- 
--  ticks = g_date_time_get_hour (time);
--  g_date_time_unref (time);
-+  ticks = g_date_time_get_hour (date_time);
-+  g_date_time_unref (date_time);
- 
-   if (!lcd->show_military && ticks > 12)
-     ticks -= 12;
-@@ -584,7 +584,7 @@ xfce_clock_lcd_draw_digit (cairo_t *cr,
- 
- static gboolean
- xfce_clock_lcd_update (XfceClockLcd *lcd,
--                       ClockTime    *time)
-+                       ClockTime    *clock_time)
- {
-   GtkWidget *widget = GTK_WIDGET (lcd);
- 
-@@ -600,11 +600,11 @@ xfce_clock_lcd_update (XfceClockLcd *lcd,
- 
- 
- GtkWidget *
--xfce_clock_lcd_new (ClockTime *time)
-+xfce_clock_lcd_new (ClockTime *clock_time)
- {
-   XfceClockLcd *lcd = g_object_new (XFCE_CLOCK_TYPE_LCD, NULL);
- 
--  lcd->time = time;
-+  lcd->time = clock_time;
-   lcd->timeout = clock_time_timeout_new (CLOCK_INTERVAL_MINUTE,
-                                          lcd->time,
-                                          G_CALLBACK (xfce_clock_lcd_update), lcd);
-diff --git a/plugins/clock/clock-time.c b/plugins/clock/clock-time.c
-index 16b0f89..b015b13 100644
---- a/plugins/clock/clock-time.c
-+++ b/plugins/clock/clock-time.c
-@@ -107,10 +107,10 @@ clock_time_class_init (ClockTimeClass *klass)
- 
- 
- static void
--clock_time_init (ClockTime *time)
-+clock_time_init (ClockTime *clock_time)
- {
--  time->timezone_name = g_strdup (DEFAULT_TIMEZONE);
--  time->timezone = g_time_zone_new_local ();
-+  clock_time->timezone_name = g_strdup (DEFAULT_TIMEZONE);
-+  clock_time->timezone = g_time_zone_new_local ();
- }
- 
- 
-@@ -118,11 +118,11 @@ clock_time_init (ClockTime *time)
- static void
- clock_time_finalize (GObject *object)
- {
--  ClockTime *time = XFCE_CLOCK_TIME (object);
-+  ClockTime *clock_time = XFCE_CLOCK_TIME (object);
- 
--  g_free (time->timezone_name);
-+  g_free (clock_time->timezone_name);
- 
--  g_time_zone_unref (time->timezone);
-+  g_time_zone_unref (clock_time->timezone);
- 
-   G_OBJECT_CLASS (clock_time_parent_class)->finalize (object);
- }
-@@ -135,12 +135,12 @@ clock_time_get_property (GObject    *object,
-                          GValue     *value,
-                          GParamSpec *pspec)
- {
--  ClockTime *time = XFCE_CLOCK_TIME (object);
-+  ClockTime *clock_time = XFCE_CLOCK_TIME (object);
- 
-   switch (prop_id)
-     {
-     case PROP_TIMEZONE:
--      g_value_set_string (value, time->timezone_name);
-+      g_value_set_string (value, clock_time->timezone_name);
-       break;
- 
-     default:
-@@ -157,29 +157,29 @@ clock_time_set_property (GObject      *object,
-                          const GValue *value,
-                          GParamSpec   *pspec)
- {
--  ClockTime     *time = XFCE_CLOCK_TIME (object);
-+  ClockTime     *clock_time = XFCE_CLOCK_TIME (object);
-   const gchar   *str_value;
- 
-   switch (prop_id)
-     {
-     case PROP_TIMEZONE:
-       str_value = g_value_get_string (value);
--      if (g_strcmp0 (time->timezone_name, str_value) != 0)
-+      if (g_strcmp0 (clock_time->timezone_name, str_value) != 0)
-         {
--          g_free (time->timezone_name);
--          g_time_zone_unref (time->timezone);
-+          g_free (clock_time->timezone_name);
-+          g_time_zone_unref (clock_time->timezone);
-           if (str_value == NULL || g_strcmp0 (str_value, "") == 0)
-             {
--              time->timezone_name = g_strdup (DEFAULT_TIMEZONE);
--              time->timezone = g_time_zone_new_local ();
-+              clock_time->timezone_name = g_strdup (DEFAULT_TIMEZONE);
-+              clock_time->timezone = g_time_zone_new_local ();
-             }
-           else
-             {
--              time->timezone_name = g_strdup (str_value);
--              time->timezone = g_time_zone_new (str_value);
-+              clock_time->timezone_name = g_strdup (str_value);
-+              clock_time->timezone = g_time_zone_new (str_value);
-             }
- 
--          g_signal_emit (G_OBJECT (time), clock_time_signals[TIME_CHANGED], 0);
-+          g_signal_emit (G_OBJECT (clock_time), clock_time_signals[TIME_CHANGED], 0);
-         }
-       break;
- 
-@@ -192,14 +192,14 @@ clock_time_set_property (GObject      *object,
- 
- 
- GDateTime *
--clock_time_get_time (ClockTime *time)
-+clock_time_get_time (ClockTime *clock_time)
- {
-   GDateTime *date_time;
- 
--  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (time), NULL);
-+  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (clock_time), NULL);
- 
--  if (time->timezone != NULL)
--    date_time = g_date_time_new_now (time->timezone);
-+  if (clock_time->timezone != NULL)
-+    date_time = g_date_time_new_now (clock_time->timezone);
-   else
-     date_time = g_date_time_new_now_local ();
- 
-@@ -209,15 +209,15 @@ clock_time_get_time (ClockTime *time)
- 
- 
- gchar *
--clock_time_strdup_strftime (ClockTime       *time,
-+clock_time_strdup_strftime (ClockTime       *clock_time,
-                             const gchar     *format)
- {
-   GDateTime *date_time;
-   gchar     *str;
- 
--  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (time), NULL);
-+  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (clock_time), NULL);
- 
--  date_time = clock_time_get_time (time);
-+  date_time = clock_time_get_time (clock_time);
-   str = g_date_time_format (date_time, format);
- 
-   g_date_time_unref (date_time);
-@@ -262,7 +262,7 @@ static gboolean
- clock_time_timeout_running (gpointer user_data)
- {
-   ClockTimeTimeout *timeout = user_data;
--  GDateTime        *time;
-+  GDateTime        *date_time;
- 
-   g_signal_emit (G_OBJECT (timeout->time), clock_time_signals[TIME_CHANGED], 0);
- 
-@@ -270,8 +270,8 @@ clock_time_timeout_running (gpointer user_data)
-   if (timeout->interval == CLOCK_INTERVAL_MINUTE)
-     {
-       /* sync again when we don't run on time */
--      time = clock_time_get_time (timeout->time);
--      timeout->restart = (g_date_time_get_second (time) != 0);
-+      date_time = clock_time_get_time (timeout->time);
-+      timeout->restart = (g_date_time_get_second (date_time) != 0);
-     }
- 
-   return !timeout->restart;
-@@ -312,13 +312,13 @@ clock_time_timeout_sync (gpointer user_data)
- 
- ClockTimeTimeout *
- clock_time_timeout_new (guint       interval,
--                        ClockTime  *time,
-+                        ClockTime  *clock_time,
-                         GCallback   c_handler,
-                         gpointer    gobject)
- {
-   ClockTimeTimeout *timeout;
- 
--  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (time), NULL);
-+  panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (clock_time), NULL);
- 
-   panel_return_val_if_fail (interval > 0, NULL);
- 
-@@ -326,10 +326,10 @@ clock_time_timeout_new (guint       interval,
-   timeout->interval = 0;
-   timeout->timeout_id = 0;
-   timeout->restart = FALSE;
--  timeout->time = time;
-+  timeout->time = clock_time;
- 
-   timeout->time_changed_id =
--    g_signal_connect_swapped (G_OBJECT (time), "time-changed",
-+    g_signal_connect_swapped (G_OBJECT (clock_time), "time-changed",
-                               c_handler, gobject);
- 
-   g_object_ref (G_OBJECT (timeout->time));
-@@ -345,7 +345,7 @@ void
- clock_time_timeout_set_interval (ClockTimeTimeout *timeout,
-                                  guint             interval)
- {
--  GDateTime *time;
-+  GDateTime *date_time;
-   guint      next_interval;
-   gboolean   restart;
- 
-@@ -372,8 +372,8 @@ clock_time_timeout_set_interval (ClockTimeTimeout *timeout,
-   /* get the seconds to the next internal */
-   if (interval == CLOCK_INTERVAL_MINUTE)
-     {
--      time = clock_time_get_time (timeout->time);
--      next_interval = 60 - g_date_time_get_second (time);
-+      date_time = clock_time_get_time (timeout->time);
-+      next_interval = 60 - g_date_time_get_second (date_time);
-     }
-   else
-     {
-diff --git a/plugins/clock/clock.c b/plugins/clock/clock.c
-index 6c80978..e07c17b 100644
---- a/plugins/clock/clock.c
-+++ b/plugins/clock/clock.c
-@@ -1113,17 +1113,17 @@ static void
- clock_plugin_calendar_show_event (GtkWidget   *calendar_window,
-                                   ClockPlugin *plugin)
- {
--  GDateTime *time;
-+  GDateTime *date_time;
- 
-   panel_return_if_fail (XFCE_IS_PANEL_PLUGIN (plugin));
- 
-   clock_plugin_reposition_calendar (plugin);
- 
--  time = clock_time_get_time (plugin->time);
--  gtk_calendar_select_month (GTK_CALENDAR (plugin->calendar), g_date_time_get_month (time) - 1,
--                             g_date_time_get_year (time));
--  gtk_calendar_select_day (GTK_CALENDAR (plugin->calendar), g_date_time_get_day_of_month (time));
--  g_date_time_unref (time);
-+  date_time = clock_time_get_time (plugin->time);
-+  gtk_calendar_select_month (GTK_CALENDAR (plugin->calendar), g_date_time_get_month (date_time) - 1,
-+                             g_date_time_get_year (date_time));
-+  gtk_calendar_select_day (GTK_CALENDAR (plugin->calendar), g_date_time_get_day_of_month (date_time));
-+  g_date_time_unref (date_time);
- }
- 
- 
--- 
-2.5.0
-
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-clock-time-make-change-of-system-s-timezone-change-t.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-panel/files/0002-clock-time-make-change-of-system-s-timezone-change-t.patch
rename to meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-panel/files/0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
rename to meta-xfce/recipes-xfce/xfce4-panel/files/0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.1.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.1.bb
index 4148d9a..8cbd76b 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.1.bb
@@ -6,12 +6,11 @@ DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtu
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "5a333af704e386c90ad829b6baf1a758"
-SRC_URI[sha256sum] = "30920fc2e2fc26279a82b5261a155c2cc15ab2aa1ced2275684a6ff8261b97b0"
+SRC_URI[md5sum] = "0b943f2e72a3693dddb1af559826cb62"
+SRC_URI[sha256sum] = "93d58b80cca9c9eb58adb281bc75404df7cf6cae89f7f98bb9f38690009aa2e8"
 SRC_URI += " \
-    file://0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch \
-    file://0002-clock-time-make-change-of-system-s-timezone-change-t.patch \
-    file://0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
+    file://0001-clock-time-make-change-of-system-s-timezone-change-t.patch \
+    file://0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
 "
 
 EXTRA_OECONF += "--enable-gtk3"
-- 
2.5.5


