Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.26902.1601867967384975827
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oTC4iW6L;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id g18so2954895pgd.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GJRT6foUV5iCg5AwMmD/VxTtpQQ60Jk+cNhXNzWvp5Y=;
        b=oTC4iW6LYwgZeYP8zR3Vz+cOZzDAYN+4fvilz16iV3Ite32SRWnZBOZVfg1kfAl0AR
         bmm6hnSbDJijrHVzY0zk4taoDG8iY1mhAIV5qkPgzVAuuOnUueIlMxmxTcOIRz8SJ585
         MgJ4ltrDUiZK0BBWOR1gyuJJdIjFnmxUc6hUaLDfg932H4AAUiEF24dRmN8ErxvglX5j
         s9mM/eYPw4Xx6V8LyjTjQdWYuaX/KcFn6PgDG59BYSbjLfwBN88lfu7Cl7+RIHJmUip/
         bAj9UYQHtxzougwXaG5WDZA9SXNM4KfOJp7lqvAvHcnW4UaEkW1pG3QtIOnUoy3FRJUO
         I9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJRT6foUV5iCg5AwMmD/VxTtpQQ60Jk+cNhXNzWvp5Y=;
        b=OPXv5c0Oq1Y3yby0G8C1S8bmVpLvusRyNEHdhgex6hc9QyFru2gXsiWAvde3w6oMiu
         OaHWY47tG90qFYAw0+qZX3bOD/L/NUWLeULfbFUWSaF+2AFJMTG2sBivaq63aZlCI0ai
         c5xgWReMepofoLCiabg7xxX6q4pusFJxr9DMlawKxVlD8mCUMRN8eBnElYoC7M5zkHyH
         v6wIfdYtFXSdJ6ItJhxH3KHOmsjZkit+/JNDaNzP8wujw0Xt4Zp4NBEzJV1OpdDC/4IE
         m2YPeCD2GaumoSYqCLqD+6sBTQeZHY5Z/wsdRqFqMJhSbGj7XasiMJ7dAnwCMBiYrBIO
         1+Rw==
X-Gm-Message-State: AOAM533SItR1Rpu0sHCNVYBk+AaMOwKhqZBIl1hptwH2NKR0ulJFZTv8
	qFEHyQ7LO8VA7uGchRYiQ31A03YbHSg=
X-Google-Smtp-Source: ABdhPJw9o/VHKEzE1LLQ8ehq35RtRtC2yBeFPjitqg8WzFy0d9cGJHvU9UEGcKBggoMIFVZdxhkNLQ==
X-Received: by 2002:aa7:8ad8:0:b029:150:7d36:cddf with SMTP id b24-20020aa78ad80000b02901507d36cddfmr5387180pfd.55.1601867966798;
        Sun, 04 Oct 2020 20:19:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 5/9] gnome-settings-daemon: Remove wrong RDEPEND
Date: Sun,  4 Oct 2020 20:19:15 -0700
Message-Id: <01cb872fefdf6ee0afea8e6df67172a2fc84a6fe.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

* Since variable was misspelled it was a no-op
* There is no gdbus package (gdbus is in glib-2.0-utils)
* Did not find any pointer in the source that gdbus has to be installed on
  target

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4c97b581f3edc7eae683bb651843d7e4c4ddda01)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
index 1b77582433..cc801d189f 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
@@ -54,5 +54,3 @@ FILES_${PN} += " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-3.0/libgsd.so \
 "
-
-RDEPEND_${PN} += "gdbus"
-- 
2.17.1

