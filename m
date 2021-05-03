Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.1709.1620069142615135018
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T36uLi3G;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso6044735otb.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OZc4j3DnBMzg9MMu16IRAbSomi3xbmQTRx4gS10B1qc=;
        b=T36uLi3GtlF6hTDOA6LCNOlffgsZx5UvLcf5wygElYi/IhkMtgaMKJ5os0sidLZZAW
         7VAyeiJkNO0naVg+b+wonAlzarLt3NmBRQiofTnbWik0wS5mw1LawmJMhSQyAtCrW58R
         RUxXUA4sw4HYFFDs9zTN7yKZg+VPJ2Qh6ctxCr+3hS17tmGMjJuKvEuDfiMuno3fYcLq
         apCoju96jzclsbmG3pFLycbZWP77j74GkmmkuwdCs82mfpbAdecKkAhx69uOJ22ZTCME
         v0iGf537z1mSXmIL34P5tUnq51qoD14Mp5GGtim/zPUwlMHsNEa5yuzLYL3kxaXSqWzA
         jJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OZc4j3DnBMzg9MMu16IRAbSomi3xbmQTRx4gS10B1qc=;
        b=PwYqdRJO1otQk33aWheGn2QqhoYtpvtUjuvBB9Mkalsi1b/SDx5ioQsB4uSSXZLHDg
         ibIVoJdw+lWJOOmUmpCXx/QXG4ekU1fbbpBmhGMNja7s9zufCmLgbsv/sjS2xdjSQM82
         N1BI3+DAr45KCOmx4x1bVx3IhgtJeEEx9OUoTv04IsaHXGVVMLu4mBm5pzWmEHkPSIk7
         rtSzVOIsVnoVytyjKlqsPUwnDod7feQMPcPLYDTc5NOW3w6WhBZJx2mUv5Fl6tQlcJKO
         AVrUsPUq4YF0SESkCRUOmiT8oT12cq1BHA9R88w8nvBQSlGQWRcDmMedgoarAgHdYclm
         VU2Q==
X-Gm-Message-State: AOAM530RqB9j4qwrfQiVx6LNGP6hTI9lC0+1WZulbQlo/aLq2cmh71ky
	a2UCsAE0aOuf6eIe5BmAP7V9TGI11GSVWg==
X-Google-Smtp-Source: ABdhPJxVsfoeZBUQNZ11GG9lDWtNmqNtlSWCpZzEURA7arnFCKUGFcszVRjQInZTLAmdSFXn1xmg4Q==
X-Received: by 2002:a9d:5a1a:: with SMTP id v26mr16343916oth.50.1620069141856;
        Mon, 03 May 2021 12:12:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:21 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 14/14] packagegroup-meta-webserver: remove nostromo from pkg grp
Date: Mon,  3 May 2021 12:12:07 -0700
Message-Id: <c3a36263f91e42302ad7c347e051cf1cd83e39f6.1620069042.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index 2fa5bc4a93..ec3334d8f0 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -26,7 +26,6 @@ RDEPENDS_packagegroup-meta-webserver-http = "\
     monkey \
     nginx \
     nginx \
-    nostromo \
     sthttpd \
 "
 
-- 
2.17.1

