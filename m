Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.9879.1613844198455454106
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 10:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XKmc1Fj6;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id z68so7475288pgz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 10:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=a2QCrKPXK52I80UvZp+yFXFAT7ktp04JEFCcvuHIw9A=;
        b=XKmc1Fj60WY41nVVj78ISr8wdvk9K59xMT1hokcypW3W3XO7v2cyWq8DLc3iFlT4W+
         oAd/5c63T7tublv3pq8rRO06z9jA7bi8CyU7E0wZgKE4wpLoqc5W5bf6iIfpFXbPp+so
         gJp+0rZodHaF2wZFDZ2bcfqy6qNp1z1vmHHXiMsw+EhpAxYNPfrOIPdtntozLpi2eJ58
         RogO/PTaoODfFq/mNGg45LIcBTTQ0/wUWMC9RE9jE4R9uky4f2692AW4RsESEkdJanPF
         5ozsI/2XA74WYLW9/OJBb+y5bG2+51L8MbOYQik18deVDrZ+6hw+p3fkGwD6EnNCdQZA
         hG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=a2QCrKPXK52I80UvZp+yFXFAT7ktp04JEFCcvuHIw9A=;
        b=IFffsbHWDl01n59QlYpVQL3Q+yn/HDQr6APp24jwr7nJprt5ii6AX7SwYgVc5ik9+V
         nXK7fCVb7Rp/gYeRCMetVrrduOvDDC5w9F2rpevhAca8f41wnQYNdEU6ySjS4Z/La7P2
         JKuXgfwCXkftZ1tHmD1hOsobRGNBbcdmo+LmR3Aj1p1oEmWLCrLEueKjPR4UDtLFVUfO
         6uQQDH8XzwWBYJKUozvwRewxYA9pwwmSV/0ef1U8+oV+0k62zqLDcVReh//EUsS5MSsb
         QKXXJNtpGQvgbqcBK2joVzbKWK1CVnelrio3pZgKhWiBUrnK8gs4hMjFLilS/0ldlcr5
         8uAg==
X-Gm-Message-State: AOAM530xvp2l1l131Ux5Fz+xGv9owjfrWFrciNR/JJ9PR8vtVQ6AwwGo
	EXg6imjrr05Anqxy9P34f5zCCR5P9rB63g==
X-Google-Smtp-Source: ABdhPJzLFo5VLx/xlcsJ4lL9PnJW9vKBniQWODthR+MaXqln3mLzJNTlUE9VV+HHfZLe0UeQMFLeMQ==
X-Received: by 2002:a05:6a00:138f:b029:1b8:b9d5:3a2c with SMTP id t15-20020a056a00138fb02901b8b9d53a2cmr15060940pfg.10.1613844197834;
        Sat, 20 Feb 2021 10:03:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id c17sm12106267pjq.17.2021.02.20.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 10:03:17 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/5] gedit: Inherit python3targetconfig
Date: Sat, 20 Feb 2021 10:03:12 -0800
Message-Id: <20210220180316.17789-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Khem Raj <raj.khem@gmail.com>

This is needed to find _PYTHON_SYSCONFIGDATA_NAME

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a06cdf5a4cd3769982ca861aa9aaff312277df51)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 4a5719ffb1fee9ee7657d93994e3ac880396c048)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
index 850ba4df98..d6c8957dc1 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.34.1.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     gtksourceview4 \
 "
 
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg python3targetconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.17.1

