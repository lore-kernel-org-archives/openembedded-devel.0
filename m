Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.20576.1600613453617142679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rFBtBnmc;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id a12so10350361eds.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AmI4NbOL6nDDDe16hEAO8opU6+Todpgh7aL0CgZCDEI=;
        b=rFBtBnmc2kiVvnTV2RJq/Wed/jW9sB1C/SrxnFZGEvC11+5JTkaiKVGB2ocVYz3BYo
         QntmsCjJ9NLBDt2hIZBYrNFgc6tZlkIm6NKUufDFotg0D6YY1ftFkSNZrztON6N4JSVX
         TPNKk0iCsot2JoeRLBYVbIZe6QnTFUDl1WvbS5eByzIQCCJ7p0cozLiXBu/3n6LKnPgd
         o5pSm4JliWVGh6qJTu72dbmAXvqWAlYhMWLwIQrbsT/maIp3IwddsSZ6xYOwxV82zwGj
         5ZIh8nkQGNgXxFI842xFgVH+79Cws88tJV0SXzE5338OqsJ2+saU2DpatvOH8YqNzzLq
         xUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmI4NbOL6nDDDe16hEAO8opU6+Todpgh7aL0CgZCDEI=;
        b=UZ8/LcdsEB/9q6auvYCxunR6lRpI5i48/MuoBfCo0ap7TLu7lv4TC5aRAWEpqPqIKI
         sWjkfbYHXMb6JGCI12bsR4TD0Toc3CxJwAcgSrc7pBl2+a1F1lOMD0RShEECLn1VoIMY
         qi/c3vwFO62uN+VucIagu68lcfEUclXkR8cscmJTufH+6NxhRGwt8qt+DyGNxg5wRWf7
         oH+jKJhdMrkMnwfBro+62jjbNjyWDF38s/P91ckuxVQWD9YYMj8RgRO2/kkO/pGYci/p
         H9b7jAhcO6Ipj321S0KOc65Si92cr8Kv0vwvuzWyVgTj+VCZFM0W1xXMEBiCmn1JnN+3
         c06g==
X-Gm-Message-State: AOAM5330PnBaFOAP27DMO+sB2+41xFNPOrQLCNdZ4gfKJv//xrJgUizg
	CooH7OZABgwrXFCkm9VtoT+yAxghcfU=
X-Google-Smtp-Source: ABdhPJyoIyGwLp5nsV6zsOg35wTUu7uPTfsbjtMfnUcAKwNcBtR8SzMCryvODa7c3aesMCw6987/yg==
X-Received: by 2002:a05:6402:156:: with SMTP id s22mr47028901edu.372.1600613451797;
        Sun, 20 Sep 2020 07:50:51 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:50 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/11] gspell: upgrade 1.8.3 -> 1.8.4
Date: Sun, 20 Sep 2020 16:50:32 +0200
Message-Id: <20200920145039.2240-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

News in 1.8.4, 2020-09-04
-------------------------
* Translation updates.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gspell/{gspell_1.8.3.bb => gspell_1.8.4.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.8.3.bb => gspell_1.8.4.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.8.3.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.8.4.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.8.3.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.8.4.bb
index 44cdefc33..f7f493dc3 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.8.3.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.8.4.bb
@@ -7,5 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection
 
-SRC_URI[archive.md5sum] = "d0892000d944e87fd74e8611ef400cdb"
-SRC_URI[archive.sha256sum] = "5ae514dd0216be069176accf6d0049d6a01cfa6a50df4bc06be85f7080b62de8"
+SRC_URI[archive.sha256sum] = "cf4d16a716e813449bd631405dc1001ea89537b8cdae2b8abfb3999212bd43b4"
-- 
2.26.2

