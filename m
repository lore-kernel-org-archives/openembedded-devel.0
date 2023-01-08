Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1092AC54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:22 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.46796.1673191271117305859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GKgKRCkA;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so3834280otk.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PitTdAaxqTGnxaNy2iGR4LAoCPp8N2zCij1qChCVWsE=;
        b=GKgKRCkAgy67laLR7rCeoZpO8UWhUNhuJSIvb5wD0eoMtmlYbUh3g/0XTlbwF0796o
         xoQ83KdYH8KrVPqM6f8aUrlrCfKACortA+v+bdZKbE0I1sDeJvx6TbP09bgmKU+xJEae
         nWROcMRXNbWvxHFSyK1lOrnZpZFGKKZ1lH7rV5QO7wMWVIelRJSnMoIFVilosO7k7Z7Z
         K42yF0xqdf5P8XyYow+Bq620i5FWEf5BpeXQbmzeirQiJq1O0lQvOTGfFZyCEw17cmHX
         VVTOEOtyt9JrUwtQIM0zOoQ9MQxPXFjGkqPute5rdzYeqpeb02V8/jT6ReO/6Mbec5fc
         3b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PitTdAaxqTGnxaNy2iGR4LAoCPp8N2zCij1qChCVWsE=;
        b=0G9pSFdClYWw4UGpL5wtu7ieDuxltK2th06Gf+vEeGteol06mjF8IzJtXYZGfYL60b
         mNQ5XlOlT58FdIzVFsyfdszJzLSttWps3p5pHe7Lc8cc+O1mNg4RfF47pThwwGsHMT9E
         4LaZm4OaWunIrOEX0HAE7CX/liMZLFjKkqd629hPjwUY2TjCZC/9CqTvUpnhpVb3HQML
         NQO5RNJBJHiqxkIH2BWvbRlp8L6VdLoeS2I7Pa/CyxDAdKvyahPd1B9sQUPTivC9w5T9
         aDBvlzz0jzOqBF7lehPefV4VzKB15AR41G3D+5tSlGfFSC26OuRpOb05f3ky9sqJp2Z7
         0jhQ==
X-Gm-Message-State: AFqh2kp1uady4WemeoDouLzMkov0Dcw9U7g93G4xesrfbsM8KKbZbjp2
	aOUCbMWKz5vzXgSLln1SpGzMgWcRv0w=
X-Google-Smtp-Source: AMrXdXsnIkcyhQv8d/Rka2vBxcVh5P2DCXqpX+u61E/+a0Nw8hiZbCQMBKhNXcSiigThX2XmmL1snQ==
X-Received: by 2002:a05:6830:e:b0:66e:c863:ea94 with SMTP id c14-20020a056830000e00b0066ec863ea94mr30735958otp.27.1673191272253;
        Sun, 08 Jan 2023 07:21:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 03/26] xfce4-verve-plugin: fix do_configure faiure about missing libpcre
Date: Sun,  8 Jan 2023 10:20:38 -0500
Message-Id: <cfb543bdc1df619e16f07ed3ed8f7eec2802f853.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100448

From: Chen Qi <Qi.Chen@windriver.com>

libpcre is needed. Previously, it's available because glib-2.0 depends
on it. Now glib-2.0 has been upgraded and it now depends on libpcre2.
So add this explicit dependency to fix the do_configure failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03708a875fc3bdaa30310dd2d62030e9b1f1b002)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 21bbda331a..eefe3322b3 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -6,3 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit xfce-panel-plugin
 
 SRC_URI[sha256sum] = "ebda5e5eb62d6e42afdc6f121d2f1cbd4d9d3c2b16a5e3ed8192b1b224b8f825"
+DEPENDS += "libpcre"
-- 
2.25.1


