Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.25703.1613351624596436403
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YASXDROD;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 189so3227764pfy.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=edgAXQKoLsUAS1iPCW5Hf6YltSrVLrJIxU+nPkqyB+U=;
        b=YASXDRODn6dUFzE8HbR3+FWNwhxIt0TCvXKfl7hQPfM6JobfojDU3nIgR1iejNoOMB
         nv6JsaLD5Xemb+rW49tOQmKNlMpsPfwQxwaiPk58ZwUWkz6k+Gd+SXUbZHOJOvBQggR2
         rK8GTNrX8Oc99PlwbJ6fdX1fAJKyxx4/cauppC1B+00al3huAuvs9LPycDZ9PM86E+7A
         YuafD01EfCB0pJ1tgcX233cZ5e+Y6TxTAwWUFQapGEpsSIoVQ/BZpnAD7Kjfdjc2zSOY
         GDSFbZs+P/r4axvhuwfP/qmG570QXS89NUVXGBGuVW5GJ/OOXuBVBqABD/+I0zHrslfM
         NYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=edgAXQKoLsUAS1iPCW5Hf6YltSrVLrJIxU+nPkqyB+U=;
        b=CRni5ua5txMehIdVuMTr0pPMqfxrFNiJuSQFk2/piH6R842jg5zIP76yktnGldM2ZY
         Zdvua8/6nsaKIJ3eIFZW86Twi8jAVbmpZcBZu2JAHpRc/OsTVxxtbkVF7Y8V5nZBiEah
         CPcsCrji6/olbNN5mKl1OTVY4nG1VYbjDR8jHTWrbhuiD/TWB0+EY8ySVrihvHgMtHY3
         V0mgG32BrbBmLO8UqkkOMmjY/9BznbTkxIe5H/3zHGzv0JGD4wc3D2eLeLPlU3/RZD+f
         lBccUqJsLQx6XbOGf0nL6pElH91TuXvp89ZvnJkdqiRJj9MrLlzk504ZXqokVUZ/L84x
         7vfQ==
X-Gm-Message-State: AOAM533Qi/wu3rdnhyh2RLnPYj7EtNrRAT/JxTBSd57nRs5PaREZ1mFm
	qMe6nK+REgofn2zX1WdTJxE6wRgb5SbNSw==
X-Google-Smtp-Source: ABdhPJw58ZAfx+etYKgOkrqOIbMyzqDLMTMLY8XibAHP2Sg1xRF6dqlUPkLLowUjTkQRAbrOTRTnSA==
X-Received: by 2002:a65:6a4b:: with SMTP id o11mr13028908pgu.138.1613351624058;
        Sun, 14 Feb 2021 17:13:44 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:43 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 12/15] gedit: Inherit python3targetconfig
Date: Sun, 14 Feb 2021 17:13:26 -0800
Message-Id: <4a5719ffb1fee9ee7657d93994e3ac880396c048.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This is needed to find _PYTHON_SYSCONFIGDATA_NAME

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a06cdf5a4cd3769982ca861aa9aaff312277df51)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
index 506bd11c78..b20f20449f 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     tepl \
 "
 
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg python3targetconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.17.1

