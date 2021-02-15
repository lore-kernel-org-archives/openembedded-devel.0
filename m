Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.25704.1613351618300635156
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dvf0O8ky;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id a4so1747002pgc.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fXc3JL78WgbKbZ7pwF2nkBA8jFeTIHoSf1vuME/ALuo=;
        b=Dvf0O8kyEE2URSIZSxl3WwQ1knN6tZnnzXkFrfkEdN+Y3Q4HYA1RNWCGBIZUv4l0u+
         I74f6U9MWf24X1zrYDVb4tEcK5keMRS7QLAX5GUjtRPN5FKnLPJf3EchrP8i7GZ7mV31
         8mT9PGU0HT7yFtPL6kV3soqyGxsAeIU0fgGFCWbnbUmn/JAj09LfPlfI9xCecuz5FBxu
         2FeJDpB8Uxk6j0YBY1AMClBJ0fu4Gi+roIk1o8YxwMBP8hsfGIkwtouLl/+pZPPRNTkM
         ivVezjWTwNz5gQnRoKjmAaMZssv0EVPbe2s7GAbpDuM+HEa6Y8MnlO31u2SfHlw1ImVK
         Q8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fXc3JL78WgbKbZ7pwF2nkBA8jFeTIHoSf1vuME/ALuo=;
        b=ujWo+Mo16WEhrKkc/rnIBSxn/jqU6704nNkkrcNChXfN4R9AhZd2gf1O8BKq7Yi4Ut
         HQ7Qe+oNq3vfjQi1Kyz2ww+Txzit/4cwXFhc8DNi/Mi1LhzwEtCGsP9aJJzF+PcC0Tzz
         3KmjYoPAev6aguihUQPsR1UgBgrSfljlDpE1BXOGHdguOMTms5vjy91S7WK4v7VJwCYf
         kdkiMPoZnYjGK3X+FcrdSdMytd/ZfkrvuuRDGfYLEZKU+7voqo2Nw4B6plmm8eRF6icB
         UmmFLKpIidLtuPgXRFBpMVThXY16SAM5Pr2VuEYKRaLkDgOT5BOgCP3UEqEx+wEqFRQ+
         ZWVQ==
X-Gm-Message-State: AOAM533/qfML0TWyYrwpdhLwbZ0y5K37Wezi2Tj0x3lxVTyBQSnCroZp
	A0aibrZGlLjyeYJ/7uNJrc58YPFdiljhCA==
X-Google-Smtp-Source: ABdhPJzaoLb/wIt5+3ATd8rxCTxxX/JdaZSaVHKgCkvNjXjeuceRqHAHdcNSlWWjJNlOziYu7QkaTg==
X-Received: by 2002:a62:8342:0:b029:1eb:5024:6f1b with SMTP id h63-20020a6283420000b02901eb50246f1bmr7206707pfe.49.1613351617652;
        Sun, 14 Feb 2021 17:13:37 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:37 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 03/15] python3-sh: remove python3-tests from RDEPENDS
Date: Sun, 14 Feb 2021 17:13:17 -0800
Message-Id: <57d742a83b1062f99fe73b379e57949bb727a02d.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

python3-tests installs the unit tests of python
as well as stuff that no one should care about
in its rootfs. Thus, it is not a runtime dependency
of python3-sh.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2ed25eb4efecb23b47556e63cb9290945c3dea59)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sh_1.14.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
index c7b50c21a4..89d5008e98 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
@@ -18,7 +18,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-resource \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-tests \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
 "
-- 
2.17.1

