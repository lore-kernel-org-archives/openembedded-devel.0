Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.5167.1611820061199407646
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FLYlLM4E;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id rv9so6280497ejb.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 23:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m4OmA+snVsvC39RjyKROthvh1+kkO8mm2ZJXqrSdW+4=;
        b=FLYlLM4EFg14YSEYDzbLc1PiAJxByKhaVEVDYfdnWQjz0THVvsl+mhnHqTdje3XZgo
         8ZR5SxUkUc1kWcz9ivTTqXbx7balvVlgP6awNmzTr+7/OfSzZLrotRDyICBbDvUewD2e
         9Hnny3leOghn1tkQFnHFUl/LgGa6JYw9Nw0xky/s3hhego18lGzOttBFhHXHKavhAIVE
         XKM4yCguaal/xplwesQmgQZRKBP+ThZH57UnLvl4P9bWQE8lXupNa0eJvKDjIafDUQfv
         SSRT641kiDyb7ZOc075XTmsMV9m7TuHWnAtg2v59oEsFiO8iN/2kkZt2sqJ8n8SXknmX
         geQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4OmA+snVsvC39RjyKROthvh1+kkO8mm2ZJXqrSdW+4=;
        b=hxd3Poz3AcE3QMrKk+S+m/SSuxmM+IPEM4ljhR6WW6OO3LloEpbQtYVoy/SooS5mZ3
         MJOogud8R6BuI3qv8cts/tBDmy92XXyCvPSd5RsM88hw1TLhOZcFx4rY3bjxNVx9WOAS
         0H92ZP67cWYnkFwPrm1c/U6HvcQfQl3IPfQjE2uQ1ZrczSofyBUNSq86FZtjsA23pBzZ
         lxayWTm5kp7ThYz1FIolWAV4NMs9LtaW5weZbk8dqIgHACJnCoE3GKTPHvZ5OTZd3acU
         a7WN37Qu8PpxmCAc1Xh5uAtFytz7KCOZkBv6vdaUH7FV6j/o8ZZnQ1q2G9vVIMM0iFt/
         qIkA==
X-Gm-Message-State: AOAM53127/mM7RimUO4IXCltTfSyM85OkeMBr9zS16RhPnjHb2yztt0/
	4VOOMCyFYJ+jO22xguBfnhjzqnBo10yKvw==
X-Google-Smtp-Source: ABdhPJzQzC5uqDLUTKb6E7FkZ1rkg/LbmWz7ZrX2DkzP5F6/Ca9DN3ERo4XS1vcMUxJoW213L/NJTg==
X-Received: by 2002:a17:907:9687:: with SMTP id hd7mr9821278ejc.303.1611820059790;
        Wed, 27 Jan 2021 23:47:39 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07f659ecbde7b17c1a812c.dip0.t-ipconnect.de. [2003:f0:7f07:f659:ecbd:e7b1:7c1a:812c])
        by smtp.gmail.com with ESMTPSA id b17sm2570850edv.56.2021.01.27.23.47.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 23:47:39 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] xfce4-whiskermenu-plugin: upgrade 2.5.2 -> 2.5.3
Date: Thu, 28 Jan 2021 08:47:25 +0100
Message-Id: <20210128074728.1631219-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128074728.1631219-1-schnitzeltony@gmail.com>
References: <20210128074728.1631219-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.5.3
=======================
- Fix invalid command expansion with Xfce 4.14 (Issue #39)
- Translation updates: Basque, Portuguese (Brazil).

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ermenu-plugin_2.5.2.bb => xfce4-whiskermenu-plugin_2.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.5.2.bb => xfce4-whiskermenu-plugin_2.5.3.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.3.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.3.bb
index 366597731..5c48101d1 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.3.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[sha256sum] = "a6f7070afd1c9020257d8ed7483872643a6cddd76d5d73de107c7fbd981fc515"
+SRC_URI[sha256sum] = "39cc34c8a83381997c6faaacb6bf792339234303438a1fccd15c9a1770b87daf"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.26.2

