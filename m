Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA72C77B7F
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:40:32 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.5063.1750502424892965916
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqf1xr2r;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70f862dbeaeso25262997b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750502424; x=1751107224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwoMW09ihndrav9Xqx5C8qfTfLQJRjhzaOspfoTnp6Y=;
        b=nqf1xr2re+c7bd861BnqnpTm9Ti35S7xQMC/HJQdRGkz/EQavI5K/VGYbfE79v8LCd
         SFsWpQ/HAjPoy5ljmCMWH7008s9Jx7Cb3zVKc5zWua7yWGBxOLUVoXV7EZlaAMOit6sj
         j5N8NI4J0Ij/MXdWtafIKmiknFjIyfUaQ+tK8HnlZMK0SzKfddlfFyC3QizkO0gSpEXt
         3HXe9e2+n0EKn49k44bcJPsUGI7L/NtIT/ag/uLJL6AKcFjGQl3j2vyt+ciISv3qaNNM
         /iyD62xVlWQjgi1hxUnR4QyPfRmp2ZGabttaed+w2Q1w83FRTcL3i8hYyho05thS5Dpk
         1q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750502424; x=1751107224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwoMW09ihndrav9Xqx5C8qfTfLQJRjhzaOspfoTnp6Y=;
        b=giPvB1ctqcWkbHQPWfoSDZB5u+CMkfy17Y1Xkor7eYGeSa+VzzjUDlBclzSCvuiALE
         ycK+p+AQt1LS/mJHlr2KbskeBNtRS9IbHs65XW83tALMe8N1I0+77+FAqVQg99AVwQep
         1DKtuSgLCt7UEPHChzn2D45I25wkD/PwjjCOA4/OHw10TJMwmTqCUt4/nLwfd9DtN8+N
         j+5+f10mTKL0RQ00tfNG+yW05SFRmpkHiPOpYWQIgjQhZZ9SbIa78HOStUQK/gpOwbbV
         Qn3CvdEi1iyhbEAp45ae0ftt1DIiLkHthaUSBiVPHKpHfiBdbrQ28eP4Ga2DSS2tbQxO
         OSlA==
X-Gm-Message-State: AOJu0YyjbYPmxGI4UHNXO0P7e4bdke9s/xMtZ5yktb8Yc8zM2N5KSv6Q
	NuxG263L8vXr4Wn5bbLxQgn/yvaNfknYwbsEEqi2Uz14uiF+2CpXhbf3b/KrmK85
X-Gm-Gg: ASbGncs1N25ivT1PsQTRdi0jYCaE81/evCcX09TLrhE+8a6PGGwJg9K5LN7cpO52qZ0
	rPit2nDBAb0Eu01uZj+D3ssMk0VxfAwclB8mvrltPSzNvIGTJnnzsY6QD1WooSdWN2cFJJgCHCq
	9o4j4YAfGVdZc5zW9hlHqd8/HoyO/dAdPBINTBZW/6Ed0jTq80TnbjappPGoyD63mnAL3AQFk7u
	i3jGAwojDcm3LEJuNWqTCXVCiQFUCGqXHR/lQVY4Wt2db5h9wKOZykoj9ohvNvk84hPL72ppGnh
	2kZuggtjBkpt/Fqnd5lZAmKfyloZpynwXM6fzY+9X2vJS4l9oob1uZK8BbTXNcpQ5M0QpVI25Xt
	+Ij3o3dSB2OPYqo1rY/Jx
X-Google-Smtp-Source: AGHT+IFERIQ5AmU18Zp+HRpHwTBB1dKVN0GmAv1a85Zk80YcLOgoMI7Q4fcW/zwqANoBVc+XSTVAuA==
X-Received: by 2002:a05:690c:ece:b0:70c:d256:e7fc with SMTP id 00721157ae682-712c64e5821mr86000077b3.21.1750502423407;
        Sat, 21 Jun 2025 03:40:23 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2c76sm7792147b3.102.2025.06.21.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:40:22 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/5] libxfce4util: upgrade 4.20.0 -> 4.20.1
Date: Sat, 21 Jun 2025 06:40:06 -0400
Message-ID: <20250621104010.766706-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621104010.766706-1-schonm@gmail.com>
References: <20250621104010.766706-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117998

Changelog: https://gitlab.xfce.org/xfce/libxfce4util/-/tags/libxfce4util-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{libxfce4util_4.20.0.bb => libxfce4util_4.20.1.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.20.0.bb => libxfce4util_4.20.1.bb} (65%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
similarity index 65%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.0.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
index 0b8356e0a2..22f1ec28c3 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Basic utility library for Xfce4"
+HOMEPAGE = "https://docs.xfce.org/xfce/libxfce4util/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
@@ -6,4 +7,4 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection vala
 
-SRC_URI[sha256sum] = "21493f9c9995a282823db93839f6b9f06ae31edb094191ba9acf04d932a2b592"
+SRC_URI[sha256sum] = "84bfc4daab9e466193540c3665eee42b2cf4d24e3f38fc3e8d1e0a2bebe3b8f1"
-- 
2.43.0


