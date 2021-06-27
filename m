Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.2667.1624825351061207774
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oBslmS+0;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id e20so13519841pgg.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XfgLc5TSaa8L/U9sv+lvJAncjq/H85WB9L9VaMri510=;
        b=oBslmS+0WsqwjRdSSwlABU5Hr4+qcKw6MNxCYLGy8P/wkCV3XumKrGyuy4lAL5QeJO
         P0GxmGur3CYbjNK2pihBPfCAPEUxVY9rHZ2DKYI23y7gdXtMw5H6oqFakwztmpoHHC2g
         hsLY/T2jLZHxpJGWAkpd/O/AvcdcNa0YOWbHmoheixBheVe2OTQnNqNDAol1OytDoTCi
         SSHno1wuJf44geSMIgevL2w4rHJLstBBsTmssvmQ67rKeruidcUUPxEoYKAN560hsym6
         wNVFd8Rx0L9QqVb5LX6S8GZPceXP+avtBzOwtn16YdxG8M+DEPsdEUzo5OM55atp8u2U
         Snow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XfgLc5TSaa8L/U9sv+lvJAncjq/H85WB9L9VaMri510=;
        b=N5oeqLo8uUrtLHgtAX8e9dx9RQKEg7uQE11fKpcGSOmVAFgAnTeF4MUITBkFOMaGmM
         R7UZ5qd8g1+MlUrWjBtg2I+4fYfbm6uKR+63jA3ClhFC8WeeXMrk7HnNStT5IND3opJc
         eWiWrMCtVqMq2kPgYoBQcphrMr7xk51LG1eKszb0OjHGSDXrOzeAm8DfWbWVCLiKgdbt
         Ii31kI6UAC/Ub7r4UEuoF0drMClZQX0QbSgQDUfAdrjhQ31H8wW+wbSfY0y/48MSZbmX
         Y+okzNnU/ipdRRb0XYSuKWrBgW5BL/JoHpOdUfK7QUX5nRdkGlwwINJdHwuBiCF8rKew
         l5Fw==
X-Gm-Message-State: AOAM531q3NhnbSl+Au89Q2v9hLOZ+wb4Go7Bl0VQVYWqmsIGuiPXTdtq
	A1sEHrp2tZmQ6x5h9dACyKZG7tu3u57oqg==
X-Google-Smtp-Source: ABdhPJxba1bQ4l6Ol2zs3Mqnuf6PDEmlRSkcRer0Ks5AMgnOMdjvYK3YIA4C9RbVuNf1vzLeycpIHg==
X-Received: by 2002:a65:5603:: with SMTP id l3mr1625283pgs.7.1624825350514;
        Sun, 27 Jun 2021 13:22:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:30 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 13/20] dovecot: add CVE-2016-4983 to allowlist
Date: Sun, 27 Jun 2021 13:22:08 -0700
Message-Id: <d1fb027f894921ea02c984eb581ee1500c613470.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>

CVE-2016-4983 affects only postinstall script on specific distribution, so add it to allowlist.

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3613b50a84559ce771866cd1eef1141fa3e6d238)
[mkcert.sh does mask 077 first]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index c0f2863dbf..f767eb8430 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -71,3 +71,6 @@ FILES_${PN} += "${libdir}/dovecot/*plugin.so \
 FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES_${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
+
+# CVE-2016-4983 affects only postinstall script on specific distribution
+CVE_CHECK_WHITELIST += "CVE-2016-4983"
-- 
2.17.1

