Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.19975.1596206592440610518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 07:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QZkABqRS;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id o10so12837810edh.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PLfvmu/GfKZfcvbF8fVMK3xkLTKOyWjKu6UF2WzlALA=;
        b=QZkABqRSP5FH4QUPk0aM4Lobg2V7TROgKZNusyt4FMWrzwAXw+5t5L95sMfUiBoiN/
         aZlbK2RWi/u2mqDEZnEwzUKaTFAk9rGvTyncBG2cbTBIGd0zIYPorXLGcibcoH6MYWXC
         2O+IqlbEMt91cTRNbV/cmBl1iuxIydpkbtt7yNJjtXqxH6Hf2fuRuzuDUaKy1etV6/ym
         iy7urds9gKFxuuFfNYzvkN/06I/DVA9qxijzZJhqFMmpYlr5p7ZPLmBoAslZN8BYdK00
         vu5LC/0H58sefmIQXwDBaob3ZQ35lHuJ6UFcTb+e8pmkx4WqVc2MNkzYbmbYW7neD68H
         /BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PLfvmu/GfKZfcvbF8fVMK3xkLTKOyWjKu6UF2WzlALA=;
        b=TuKEo296JwX4PUDBWB/rO0kVz+HHrYeEBZe6L3bhD7vfWV/QElQG7TILhHfNSuDKQu
         7u39QyNCBqjLxcxlXoixk6RPgpd6NbGBMMXV7AuSc13cihvMeQbV+ZPenKjvxi7fvEpp
         hLQO6Zb6VUm7aDjqrdDsZQy8azrX1e+akFtzb5uc6AiviYInsI7+NxqPUtcoBVVhF+i6
         kKxTZprSTqv4oR+ll2EzlKroj6rEZvzVJkkx3tJNMZomvoS1Jup2qEI9+xN2FtXF68dB
         ZzuxAVQGSkrxql1lYzXI62D8EqgdKcOatfOWFG010+jL0Dyy4kzQnOXJMc8wXyKws4OR
         PETA==
X-Gm-Message-State: AOAM5334miaNjPYwunYDMHj6qLW4EGQEZXThseHFur1gHP11VA2fiY+F
	nWKHfK1d6jViQaV50CnjznHy1QA1
X-Google-Smtp-Source: ABdhPJzzQ5l5c4TbU3Dc9ntSENz+qPd1+wBaTn6SXJycTkp3XhLQw6hh83wOKSJ8GI7LL1oeD4aIHQ==
X-Received: by 2002:a50:d655:: with SMTP id c21mr4082933edj.49.1596206590676;
        Fri, 31 Jul 2020 07:43:10 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:3f:a5ba:1524:a0bb])
        by smtp.gmail.com with ESMTPSA id h18sm9711747edw.56.2020.07.31.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:43:10 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 3/4] dlt-daemon: fix build failure when dlt-dbus is enabled, due to missing service file.
Date: Fri, 31 Jul 2020 16:43:01 +0200
Message-Id: <20200731144302.7074-3-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 74270b579..2bb210791 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -47,7 +47,8 @@ EXTRA_OECMAKE += "-DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)}"
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)} \
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
 SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 SYSTEMD_SERVICE_${PN}-systemd = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor', 'dlt-adaptor-udp.service', '', d)} \
-- 
2.17.1

