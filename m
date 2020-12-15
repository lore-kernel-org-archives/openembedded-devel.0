Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web08.12190.1608041813459038832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 06:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wittra.se header.s=google header.b=O5oB3uGj;
 spf=pass (domain: wittra.se, ip: 209.85.167.68, mailfrom: chencheng@wittra.se)
Received: by mail-lf1-f68.google.com with SMTP id m12so39749314lfo.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wittra.se; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGRRyNeSqUJdM6bm1xv+a9of2iy6D5yrkEvXU//y0kk=;
        b=O5oB3uGjMjtQz5u2riJb203acRDFQlqk+RC8T2Oa+EqrBk1b3HE6fVN9Y6HeJZSNT7
         CAq9VvMtveLSJFN1CUrzbdWTykGD8zNASuSHG1dkKS8pHph1H3aMk1ZOiKBfan/92xJw
         ZR8n2TKm0YQIl+LALCfhpklXa3+Mn0PNSyLQXwxJSCw0jnM8YFtKWsyS7A3TcGawpIgM
         arIeX8AfFwaQfavBgyBxtj0YmnfsCNCI+AapE0c+SLxAl27VQ4I/8PDy4+vamqAXFY3n
         IyGRhpXRGtjluc0/ZfhkweebhAHZYfgs74KdMjQUvfhIPRSWlA5AoGC0qgBmLYM2Jek3
         Jd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGRRyNeSqUJdM6bm1xv+a9of2iy6D5yrkEvXU//y0kk=;
        b=gDQKKwiP8RQArgjWveFaC0hvR9jWA2cxkN0M4kdfsDsrX3QpHuCgEiiwodtum1ZiOY
         XdA5BVchOS3Qqf2Q+hjj8G9hAVWvvoiKEMXLP15sQIVUBoj/lMnBFvBQlv3zHI9aL0ps
         Ig4sQ2CTOyTcUDdO3TWNmRqvB5mObNib9Z0J+/qAvTAeVLUWAsuaKCFQIg5hFIKr1Al+
         whaNrIRIYBAICYCM0LohRmIRKmbh2VFssUf1r0lLv7Uutt1zLGPcxzjWIBgTg9M8x4gk
         9WnfmLC/NUU+PEHrC58LW2tYYIkCbXe0sZPIYHZNS6AtD5gXoDPG9GkmHwcRSrIOJdg5
         URAw==
X-Gm-Message-State: AOAM531hQGk2U25ibKpX03M7FJCR1xPtM/JT8ZllnXxt2cAvtVSTPC9I
	30OxqLrv+TEzIKA03vRFIfdjY1gffDGm9w==
X-Google-Smtp-Source: ABdhPJxF7EhVAOxU8ftNqaLwcIU/j/GzmTzmcaNCVFR/4OUnoKCH8guVCjle2TYsgfhoVfLCL5bqgA==
X-Received: by 2002:a2e:58f:: with SMTP id 137mr12546741ljf.469.1608041811163;
        Tue, 15 Dec 2020 06:16:51 -0800 (PST)
Return-Path: <chencheng@wittra.se>
Received: from localhost.localdomain (h-241-136.A1223.priv.bahnhof.se. [178.174.241.136])
        by smtp.gmail.com with ESMTPSA id g13sm221462lfb.43.2020.12.15.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:16:50 -0800 (PST)
From: "Chencheng Zhang" <chencheng@wittra.se>
To: openembedded-devel@lists.openembedded.org
Cc: Chencheng Zhang <chencheng@wittra.se>
Subject: [meta-oe][PATCH] tclap: align version to tag v1.2.2
Date: Tue, 15 Dec 2020 15:16:33 +0100
Message-Id: <20201215141633.704712-1-chencheng@wittra.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to update the tclap v1.2.2 with several bug fixes.
See:
https://sourceforge.net/p/tclap/bugs/23/

Signed-off-by: Chencheng Zhang <chencheng@wittra.se>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
index 46a940803..47ab2fd7b 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tclap.sourceforge.net/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
 
-SRCREV = "75f440bcac1276c847f5351e14216f6e91def44d"
+SRCREV = "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
 SRC_URI = "git://git.code.sf.net/p/tclap/code \
     file://Makefile.am-disable-docs.patch \
 "
-- 
2.25.1

