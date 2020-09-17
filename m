Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.4417.1600302266641398623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 17:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bWT5F1qp;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id a9so334922pjg.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2020 17:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bfva9t19zd28htxPitKbR2roRifA2PpoVmc7VnVkE+E=;
        b=bWT5F1qp0nS/uKi7mM/zBAIdYySpbwzg5VycUrkietBOJ6PsQBkL/1VF0RTUugH9wz
         uIwLVkYZ2glQUNj+nYctMJ53YbA6E7nMV6gTPzmdg6+UWZGBif5cywv1pckE9EQJuMIp
         +KIA45qdTmjNOAjtqUGI111GDJZrtryw9QAXK8tRFHIiEWAlE9wheDP+97toLiEKZrEa
         nMRUyDgUA7OhVLkY3AoTV0Xb55b5t21uZrCKWTk77PSJzr+Zu4FJSd69yZvYm1LqE9qy
         Xa09c5cju0eMcNQjBmMlt/krJEHvz/lVVl0dZRp8D3EbI6WMiMo5PF8flYQb0lDB1BLX
         unnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bfva9t19zd28htxPitKbR2roRifA2PpoVmc7VnVkE+E=;
        b=gCRy95GufP6A/eAZyE3D1rHdaLeLz37YPIsnjRC72+GxoMHdJKakpBfL+xdfBNhhNz
         9iIUyftfe5umCc0cBF7XqGvY7vbvSdqru1pSDgb5AgfSanyY/xVQKofVMWNXIziFxeqe
         an5cUoeyW2JEvK1UpRN8wUFjrygzqLDDs0wueqT3zgXpwde/VjRFbcKIphapuaY1hQ+M
         4RD8G+/v2q/TRvn33MvDoyhSkpm/irTFG7dkJfRJaXDEBqzPVKCln7zLVwrlYMYo5+c4
         vmsQS5e7I04U5J/Nl5Zh7mvO7WD/CAnOqP6sbIbhRdQk9BS873PIZhXzyrpUDVxXfsUG
         /pwg==
X-Gm-Message-State: AOAM5321dK5308c4jhTcaXRijiHZl57Suly0yxxUp5ZmwaNCXBR8dWqM
	Any/6pl+ZzClFbgpar/U+uCWi15T7NaVJA==
X-Google-Smtp-Source: ABdhPJxgL0oXoVlQUyrWJ+KI/JZCJmSmHXBhpWCI4FSlItdkMVXxi85qmEeAAgnG4C1UzFwnc9952g==
X-Received: by 2002:a17:90a:df0b:: with SMTP id gp11mr6049934pjb.64.1600302265915;
        Wed, 16 Sep 2020 17:24:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id w6sm16621472pgf.72.2020.09.16.17.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 17:24:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] st: Use update alternatives
Date: Wed, 16 Sep 2020 17:24:23 -0700
Message-Id: <20200917002423.220851-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files are also provided by ncurses so learn to co-habit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
index 906179501b..1f0f2f7f2c 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
@@ -23,3 +23,13 @@ do_install() {
 FILES_${PN} += " \
     ${datadir}/terminfo \
 "
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "50"
+
+ALTERNATIVE_${PN} = "st st-256color"
+
+ALTERNATIVE_LINK_NAME[st] = "${datadir}/terminfo/s/st"
+
+ALTERNATIVE_LINK_NAME[st-256color] = "${datadir}/terminfo/s/st-256color"
-- 
2.28.0

