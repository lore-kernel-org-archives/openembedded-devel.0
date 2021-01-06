Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.9418.1609946275071995433
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kbe31cfa;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id d17so5454114ejy.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZuqumnXd8Qlizyu4QSkOlH9ocxbxRzubmre/r0M+4Fs=;
        b=Kbe31cfatcu/I8HgIjeP+cvMY3ZD+LettVOVeZn7qHLgfHN5JFAggYz3w1gAbKiUqv
         kuZtYYzDQmZGb1hkwdGLgEhbPNNi0jiKAu2WMjMQPXh2HKT3mfEtHbFpQhynpzYWRT/m
         2F02ZxvaOf6gZulklE1kY02+9D4y2HKof4e3wx9cWIuvwtGfd7uveEirN9sV5N6bqZx2
         Z7+MdxtsMF5TMIq8JPlGY9WO24fqKr4jLyQGnXmNMxF5Av5iuNpoBOygvx4b7Q+Xqq+7
         898mJGrqMTNcQks6W+p4m+ak6TnTYbbGR0j88Fp4/zIHQip6eANoHXAVXkJAZAxKCxo7
         Dwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZuqumnXd8Qlizyu4QSkOlH9ocxbxRzubmre/r0M+4Fs=;
        b=eqGNCSydZmFyQS3XJQaFHO6xLKInr9TCdXHrWTkpt4ebeXCCUGaCgK6HYmbB32urvZ
         zZxToLH0DsYgPo91EoolYF/I+r4L4cLTkfwM9cTwQhWt2QK9sYAO0034voCPZx2Z69t+
         ZSjTOM4GuVk74Mesx+4zr4x7kqR2VuHGVSoM6Ge2K4NRRyi3wjDgfjCST0moU/TylVIb
         dt9Ogi7nhQKUNboR7ZiXLq02gJYjapMv4pWqcdauEEt4ZP6yjd+X3cC5IHLI4/iHgSH4
         xtVZv6vP3Kjhhqitik+KhZ9hBKWbP4cZVMl6k8rSNThJWN/haOU0JOEwj3QAvaRlJZtB
         HuzQ==
X-Gm-Message-State: AOAM533z0aZNye9Jilv2IGPrp6sxX7tqvr9mjRmlqa1GSTk31mSEH02d
	PzTMTwZ2zywyPK3QR8zXbdyD+trAFvCZVg==
X-Google-Smtp-Source: ABdhPJwYTG0sQohf89N2fGk65WQo34eDALG5E6TexTu08uvoHhYVzcoGWCwViSLKdJcX4m586pGJyA==
X-Received: by 2002:a17:906:c7d9:: with SMTP id dc25mr3336246ejb.138.1609946273683;
        Wed, 06 Jan 2021 07:17:53 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:53 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/28] xfce4-taskmanager: remove exo-native from DEPENDS
Date: Wed,  6 Jan 2021 16:17:08 +0100
Message-Id: <20210106151717.1779543-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With xfce 4.16 exo-native is gone

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
index 1f84c2b01..d41ee894a 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-app
 
-DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native exo-native"
+DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native"
 
 SRC_URI[sha256sum] = "655684ddfc15fc09071f78f9fce5439d20bbd2d80ecfc5ba0a08fb38313e7d43"
-- 
2.26.2

