Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.8590.1612035472104935660
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lAeEOKWT;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id x11so313209pjr.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DxvhcCpVh+1Sa3SMKLqMBAixaOspctX4e3UFguInriU=;
        b=lAeEOKWTPUon9BoaodNOHlo+KIHQ94djJotf+DjCKxace4a81P48qacueWvD1sOaW6
         6T0SFQDQrBD8Y9WzaBZ/c1T8M+tchOk73F6QWfWns+rSNlPZXj8V6U6i53FbO1qfxfvX
         CjHaotfMkD3769qjRiYmnnh6ZOFxV4kLDm2bebBPO69OC3MYXAwsvJlWBvkBN4fxgiZ4
         gAV+5xCUaZk7wSSRIf2+CUmPN2F7SpFZ702qd5+o4n1IoDiE1e9yQeVcSIgC1/b8mnu3
         QczdWCLHuxR0eThahoqInQihmwSo/6lBuamgrlLx934klwiTCUu2VRMn6sZmbHkmnJuV
         PezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DxvhcCpVh+1Sa3SMKLqMBAixaOspctX4e3UFguInriU=;
        b=BOTNXp1Ftxpw1VyD4k6R7PIHzaJTkxLDaLvsZtUZi9RUgClanSPjehT/ODvMrya8Wm
         K4OGBz5iyzR6qFnVftQg6r00Fts8bJZNW3Fu2RVzce7GaAQoB6OAvF+vZIeAg5aobi2v
         cjPdqOjNcPdIPeZY7Ssx+d3EMcVbAvJXvQ1w9zSZGAj6K/pmV3PjyM4kRXDfq68hvKUA
         aTIEKbuYumXm1D45rXsmkZCXB9wUIkaHdK1h+pWNQZU5EpuTHEjmtpUpbdizgfyxtxtK
         lQt82sanop6TADS8CiOg8Jo9zP/VfTeSDUI8O2a1XYs8v8E67ZLXKuosboy5aK0UxFKU
         VJvw==
X-Gm-Message-State: AOAM533RqOUD3LITpkgyqA9gxj+fANJEEHs4sAAJcHgc5+pCCmXxzXpN
	d3BYTJbp2JK/MDpJrZ9D5dviALiDpAggpw==
X-Google-Smtp-Source: ABdhPJzN/Dnb40vOLF30T4B2Ay0y1udlLonLfMjCZaZEBT0A867UsO464Vh1OsV9MwQjGfIwuyiEew==
X-Received: by 2002:a17:902:223:b029:da:af1e:b112 with SMTP id 32-20020a1709020223b02900daaf1eb112mr11204366plc.83.1612035471538;
        Sat, 30 Jan 2021 11:37:51 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:51 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/13] flatbuffers: whitelist CVE-2020-35864
Date: Sat, 30 Jan 2021 11:37:31 -0800
Message-Id: <4964a5a46361d9ff404662b2cdef48434536bfaf.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

CVE-2020-35864 is for the rust crate for flatbuffers, not
flatbuffers itself.

https://security-tracker.debian.org/tracker/CVE-2020-35864

"NOT-FOR-US: flatbuffers rust crate"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index c31cef63cf..7b8d47d8df 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -14,6 +14,9 @@ SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
 
 SRC_URI = "git://github.com/google/flatbuffers.git"
 
+# affects only flatbuffers rust crate
+CVE_CHECK_WHITELIST += "CVE-2020-35864"
+
 # Make sure C++11 is used, required for example for GCC 4.9
 CXXFLAGS += "-std=c++11 -fPIC"
 BUILD_CXXFLAGS += "-std=c++11 -fPIC"
-- 
2.17.1

