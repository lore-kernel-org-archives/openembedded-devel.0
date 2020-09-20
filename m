Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.20563.1600613454580730071
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QUw4unvo;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id i1so10489158edv.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mQkViWsPAdqhcLqTVDLQPKp6q2KORR5lqQlDpdZeevE=;
        b=QUw4unvoKIYQaTvR0jFgCEWywmjt7k7pHw3QMSwN1nnWwPskj9835kW8+XYYkXmaB6
         SPbUhzvCyyFfAugZ1niKXrLK01++gbvi1FP//saHlutErwXZNkxo2CpD9hQ/VXNGfqrk
         Jx8VjQTY7mDb8kbM3wy9ISvabetPGKobCNGKxz/npGP7KwNRJAuUvwsoG6Z0FoMWyzZf
         bKVIhHR4L3Vaev24DB73hsBOFQasPMSLB/Dwzd/tj/rQbjqiJjMCAwWaHLVwbsd7L3SO
         Mu09y+ET0nHS0EPtXRjGMkjXKMt2rdWV1eqo4fhcNGBD7EYNerC53e5XRZ5Tb3QSi5q/
         hEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mQkViWsPAdqhcLqTVDLQPKp6q2KORR5lqQlDpdZeevE=;
        b=HMWsEJVuYn9glQzTsj0Tau650vpFc92TrVWcRDhRcErvqjjdMW9omH/xr6UIBwHL4K
         wLWmPOvhF36bQtQ3gDe58sPoSwvDSuluF5Hmbr3SKB0mt9dObxW3RdlXFgaPPQzSTAoa
         7S9fJ7kZ3xUNrUiNGXNZWJiW7Sg7H97shjvhkRMYAD+poKfUtck0Vb/9v1sN4O6nJpgr
         6ThMZpuZQRg+xDOilEhKy3UYAPCVmYDoYVH4PxOn04/EIKYjOBTLovT9g/am+0W3KV7K
         prgXUb86YiDKAsfzVye4oPKnTBlsCTEb+1Jh45amoQzALxBPs6LafbdfPsWz7Qg9SOCt
         wjvQ==
X-Gm-Message-State: AOAM533b7Y37ExEV9pPeZw9m0yaT2AaRHQRifdaiQ8TNy2w+PwmZTx3D
	NdHJH2b3p2v4F7oNJkSDQYj/xJkBHkY=
X-Google-Smtp-Source: ABdhPJx+s7nLdVfo01N9Bq+0O14cGQa3t0Ucf2mFnv+tkaMsZB7aWCPlCqPqk2LY4Y9IUHJ6Nuo+tQ==
X-Received: by 2002:a50:d54b:: with SMTP id f11mr47969188edj.329.1600613452774;
        Sun, 20 Sep 2020 07:50:52 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:52 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/11] libgdata: upgrade 0.17.12 -> 0.17.13
Date: Sun, 20 Sep 2020 16:50:33 +0200
Message-Id: <20200920145039.2240-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of changes from libgdata 0.17.12 to libgdata 0.17.13
=============================================================

* Default to not installing installed-tests (see !24)

* Default to not building documentation (see !23) (thanks Debarshi Ray)

* Bugs fixed:
 - !23 build: Disable the gtk-doc documentation by default
 - !24 Various minor fixes to meson_options.txt
 - !25 all: Fix various typos and incorrect terminology
 - !26 core: Add g_autoptr() support for GDataUploadStream

* Translation updates:
 - Chinese (China)
 - English (United Kingdom)
 - Latvian
 - Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgdata/{libgdata_0.17.12.bb => libgdata_0.17.13.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.17.12.bb => libgdata_0.17.13.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.13.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
rename to meta-gnome/recipes-gnome/libgdata/libgdata_0.17.13.bb
index 9ce8bb8e9..de33fd829 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.13.bb
@@ -30,5 +30,4 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 
 EXTRA_OEMESON = "-Dalways_build_tests=false"
 
-SRC_URI[archive.md5sum] = "9d5692a2308bb949af801be66989e164"
-SRC_URI[archive.sha256sum] = "a0fd6f8820e8bae019c1f6ffab5af7fcd6d7f147915bb968b56df3ad61b42318"
+SRC_URI[archive.sha256sum] = "eab9ef792c3c2b9ece19d45aea15225aba8df2521bc12785b1b2d3318d8c472e"
-- 
2.26.2

