Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F47C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:10 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5276.1785589923074533443
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W6t3ykyp;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1062430a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589922; x=1786194722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw30LgIRi6OsV6y/0yU0E8qlRTef2e3Px4egvPnTKY8=;
        b=W6t3ykyp61ILVzQ3WYzPbCz27buRs+j3O74o0sHqID8tA5UKaeQQcDNbaMf8FO6uZO
         Af1RPXNVJzy00IMkHX0HsO0mzvF9YgYyyLwMvSzKZ+7qOO4Ka3fj4BuRNdUKzCgEXWMu
         8YAreNVa4+cBpA0hK4lPKr/caMqJxa//ITnilhCB8MzTUFF9HvzSHvSjOFj+VGtlpMZw
         kR9c2k0AYwOqopOUPPKJy1tmAXSI0r56mYwmSR1ZTr80mBLBOsJfOo4roDdv2CY+zml1
         c9Ye81mCT5CH2NsKYF60y6PLwcAMpdRKOfKoYXXZyA1DrP+5HkPELAjh3edll324SjTx
         J2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589922; x=1786194722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw30LgIRi6OsV6y/0yU0E8qlRTef2e3Px4egvPnTKY8=;
        b=b+HCVsJIFo58vWSp7FhwVsTtLu9YfUL1T21w81/71xhQ/Y+oWcYJsA3mwCQToGTOAN
         C9qv14zsPxvK92kHb5aQGa5sYR2/RbpSe35/pQRxDws3/xwtVqO/2N0vYcnIiPcjcQns
         mCPdlDCKRhwd/YCM1fCOffRQjBCDS/hP8tYQ/339G0VyFrn2taV5KR37i4nsV2AhLCUh
         hyviCoe2idgS8Nnu5tLzR0Fnke2ygEQlKqEXZmAlKKwxjEX1S3Ikd1L/IIHPATbDRZR3
         iffVO3czTmFAvEs6zTpRQCGx3XGTcOPLbmJTgDz87mVR9u6xh9dOhJmzfz3kR7oYe4oz
         Tkqw==
X-Gm-Message-State: AOJu0YxkmaI9a3T683g2EBvjeHX+xAQ9I8oRAxQdLfX2BbYWExsTvknE
	L4GuNLHKXGUh+xlgAmwbvpcpty4R8ZfETE3/ArZ36qu1bjdQwbMICmzg4Q2flnHk
X-Gm-Gg: AR+sD12C6OEC3tczRo4mWMxnJl2Q7JDMQn0iwqeCeJBVTAjsUdgK/cRA8lZ1hgLaAXt
	yWHhd75gqnWt/GQPbvqNq61DreSvW0DpvaVQkSZwgOkg2RZC+EWACQbgklSqS7cNXl6eGIgtHi8
	O1YPpN9BbXoFQPqBQ00U1xFHVC7EIfMOTYmJOEv1EZqu3Z/GnQQg3480wEMhBnZPQO8DjMwrQd2
	xe00wJrswqKXd+TS3zmK3dSvxVipUJnbp7aoYUL7byTkfHeOB8jgIzHtZkhequQiNS1BLx4uq3P
	BOFdVTYIpdcnjAu2jmCzcNMo4bhpLwZ1UBaBZxknraXIomqtrw+vMkOPFVt1hNjAmFoemRhPqrE
	wATj8nkbC2AvryygTtEEJRE7nyvrhHA0sKHbaVC0Pmsjo1eg81FpFUd4tlMXMUPQ41lcuBfqGNX
	esRjg9bW9UFMItZ1fSlYJ3RxVLxyUV1yRjIb3dh8jxQWmuFrs7SKi3Y49WR5N1IclF9Mho53jST
	OI=
X-Received: by 2002:a05:6a00:2d0c:b0:848:6235:ea12 with SMTP id d2e1a72fcca58-84ee4970e4amr2903339b3a.57.1785589922386;
        Sat, 01 Aug 2026 06:12:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 6/20] gnome-panel: upgrade 3.47.1 -> 3.58.1
Date: Sun,  2 Aug 2026 01:11:24 +1200
Message-ID: <20260801131138.3299410-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128600

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://gitlab.gnome.org/GNOME/gnome-panel/-/blob/3.58.1/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gnome-panel_3.47.1.bb => gnome-panel_3.58.1.bb}          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-panel/{gnome-panel_3.47.1.bb => gnome-panel_3.58.1.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.58.1.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
rename to meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.58.1.bb
index 02a8b01b26..285b23aae2 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.58.1.bb
@@ -18,8 +18,10 @@ DEPENDS += " \
     gdm \
 "
 
-SRC_URI[archive.sha256sum] = "d8f6e2c659668c77df82c3dd95ba04fcef8c40c228e2c22605f9a17a9161ec83"
+SRC_URI[archive.sha256sum] = "7e8bca43a81a134c666b3a78baf2affb0c5d30efb1bca653887fc41b31dd5e64"
 
 PACKAGECONFIG[eds] = "--enable-eds,--disable-eds,evolution-data-server"
 
 RDEPENDS:${PN} += "gdm-base"
+
+FILES:${PN} += " ${systemd_user_unitdir}"

