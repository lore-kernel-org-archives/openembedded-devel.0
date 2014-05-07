Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 10D96609BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 19:39:38 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c13so1062061eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=YKfixBCCuG7TTIOiKaI3egWQlpsUNCzwPCsqJvKmHmw=;
	b=dxqjxUM1i33ncEwYyXzG02cUeDK+MDdLxuM8AQgpgAphRJhn+4oRGieBkXbs41oBCn
	TarKMpUJAtIazu/YpcxO8r42vlz7pQQ8XLseFDVrTZ6iGQvauuULHx3WQKodkT0mlk7a
	MISQiQ55/S66mtnxAo+2dj889iU+xmWo03a6RY0gTUNlAp6nLsCyjdlsaWsrj5wc26mL
	05R7LZbC1AvETDJ/p3tNjbjO0CcMuenPIoBHFajxL4tx5cbDK29+PHn8+DxKhdsarOBV
	g6nl12tksmFJKSkiLNMu1jbLNYKKEFGcGwIPQdy+EsW7ms+kw78rhLXMT2FMrNuSaq7F
	yrlg==
X-Received: by 10.14.100.69 with SMTP id y45mr17565889eef.108.1399491579427;
	Wed, 07 May 2014 12:39:39 -0700 (PDT)
Received: from localhost.localdomain (p5B0A08BA.dip0.t-ipconnect.de.
	[91.10.8.186])
	by mx.google.com with ESMTPSA id m8sm48389547eeg.11.2014.05.07.12.39.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 12:39:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 21:39:14 +0200
Message-Id: <1399491557-3073-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] xfce4-settings: fix crash when no pointer device is connected
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 19:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* reported by Cristian Prigoana
* updated [1]

[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...tect-a-change-of-pointer-device-used-and-.patch | 27 ++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
index f4c2839..3c9b3da 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
@@ -1,4 +1,4 @@
-From 37f5e33511499d320c3035c5377425004657faa5 Mon Sep 17 00:00:00 2001
+From 78353322ce1070ee1fd7bb5367e2c4dd43928f42 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 20 Dec 2012 16:58:19 +0100
 Subject: [PATCH 5/5] pointers: detect a change of pointer-device used and set
@@ -17,11 +17,11 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 Upstream-Status: Submitted [1]
 [1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
 ---
- xfsettingsd/pointers.c |  337 +++++++++++++++++++++++++++++++----------------
- 1 files changed, 222 insertions(+), 115 deletions(-)
+ xfsettingsd/pointers.c | 342 ++++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 225 insertions(+), 117 deletions(-)
 
 diff --git a/xfsettingsd/pointers.c b/xfsettingsd/pointers.c
-index 62ebc60..32662cc 100644
+index cfa56e2..41c8bba 100644
 --- a/xfsettingsd/pointers.c
 +++ b/xfsettingsd/pointers.c
 @@ -66,11 +66,9 @@ static void             xfce_pointers_helper_channel_property_changed (XfconfCha
@@ -166,7 +166,7 @@ index 62ebc60..32662cc 100644
  
      /* only stop a running daemon */
      if (!xfconf_channel_get_bool (helper->channel, "/DisableTouchpadWhileTyping", FALSE))
-@@ -297,17 +325,16 @@ xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
+@@ -299,17 +327,16 @@ xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
          if (device_list[n].type != touchpad_type)
              continue;
  
@@ -188,7 +188,7 @@ index 62ebc60..32662cc 100644
          if (gdk_error_trap_pop () == 0
              && props != NULL)
          {
-@@ -317,8 +344,6 @@ xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
+@@ -319,8 +346,6 @@ xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
              XFree (props);
          }
  
@@ -197,7 +197,7 @@ index 62ebc60..32662cc 100644
          if (have_synaptics)
              break;
      }
-@@ -844,24 +869,56 @@ xfce_pointers_helper_change_properties (gpointer key,
+@@ -847,24 +872,56 @@ xfce_pointers_helper_change_properties (gpointer key,
  
  
  static void
@@ -267,8 +267,11 @@ index 62ebc60..32662cc 100644
  
      gdk_error_trap_push ();
      device_list = XListInputDevices (xdisplay, &ndevices);
-@@ -873,84 +930,107 @@ xfce_pointers_helper_restore_devices (XfcePointersHelper *helper,
+@@ -874,86 +931,110 @@ xfce_pointers_helper_restore_devices (XfcePointersHelper *helper,
+         return;
+     }
  
++    device_data = NULL;
      for (n = 0; n < ndevices; n++)
      {
 -        /* filter the pointer devices */
@@ -426,7 +429,7 @@ index 62ebc60..32662cc 100644
  }
  
  
-@@ -961,12 +1041,12 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
+@@ -964,12 +1045,12 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
                                                 const GValue       *value,
                                                 XfcePointersHelper *helper)
  {
@@ -445,7 +448,7 @@ index 62ebc60..32662cc 100644
  
      if (G_UNLIKELY (property_name == NULL))
           return;
-@@ -996,63 +1076,72 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
+@@ -1000,63 +1081,72 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
              /* filter the pointer devices */
              device_info = &device_list[n];
              if (device_info->use != IsXExtensionPointer
@@ -532,7 +535,7 @@ index 62ebc60..32662cc 100644
                  /* stop searching */
                  n = ndevices;
              }
-@@ -1068,26 +1157,44 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
+@@ -1072,26 +1162,44 @@ xfce_pointers_helper_channel_property_changed (XfconfChannel      *channel,
  
  
  
@@ -582,5 +585,5 @@ index 62ebc60..32662cc 100644
  }
 -#endif
 -- 
-1.7.6.5
+1.8.3.1
 
-- 
1.8.3.1


