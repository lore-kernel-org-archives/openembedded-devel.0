Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D905AC433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 22:35:23 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.20404.1646606123211627678
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BcDH4pc4;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id o8so12061711pgf.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oQjczUzdHRASeDkuyc1iUp92+iUe58zz60AHKiChiNQ=;
        b=BcDH4pc4sSH2yjz6Pkbg+sW6OpxyCYqNjl6io4toX8D9u6aivPYfLUTrB0xx1J5BqZ
         U+6+cLGaJFI2Ge/ObgTJTz9A4W/9fXSOKXwOhYVXbl2xQksREjCf9rivafWPcdmUeEcc
         WyP8dd+2VJBm0s1K4CIr9jfn+rBka9CM0De9gv9ac9o92cbV1pKgIvNmomYK7gzLQw6u
         D9U47h14/QVuyYIuQ1+kef3a94eJT9eYpihgCtDDYbtQFeKOWXloD9gByL44HAwtlRWl
         LHGyZGQhIaZdRrccjbUp8tvqEDNjtkMLqdNwA/KYgbVOcvJPpYRQ+t9V38ij3sOKWfFf
         rTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQjczUzdHRASeDkuyc1iUp92+iUe58zz60AHKiChiNQ=;
        b=ZF+e/ZW2W7Y2kQSZgWOJmUERHTZI+Xe6hWjsKTHtwXUslx9cr5unKSDEgchWp0bX54
         A4bi7/YT+mvJvKDYva1xTrIN4OLMm916IMc2TVFUedTHQKnAwGzhr4kleNBNl9cX0TZ3
         ceHOpNQJXImhAyYFsOK2W8JJwknwvkYBvTmiEpQdtiDiyr+RbqAmm1j93f9nYmCxhHq0
         iwtLqcX9YkbS4vieVAp0jgrIF43Wj+cBoYy5ZTSw6bwk2s00w3/zZ25HMlkF2fhW3VJP
         Iej7qVtf4ZcD8x8b37O9CDbNTdcoqGkYvzNdR7yE+VtKh2K0+A9bRQNJIOFxFPKYV9vv
         1zwQ==
X-Gm-Message-State: AOAM5302OTRoOiIuY7K5O267B7oITOe+2FZPiKEBERmSa+JL1OnOnYSO
	5QcF/9jIJhwqyVYTjFG5LZJpBzrbmiET6Q==
X-Google-Smtp-Source: 
 ABdhPJzeI0PKeRtybr7LJqNkiXuAB6xHodVoFchFBn5Wq81poL0gKbEg3q2KW6vj5QjEXlo81e0eTg==
X-Received: by 2002:aa7:8882:0:b0:4df:7b9e:1ccb with SMTP id
 z2-20020aa78882000000b004df7b9e1ccbmr9941969pfe.41.1646606122421;
        Sun, 06 Mar 2022 14:35:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm13502369pfh.83.2022.03.06.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 14:35:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/6] geary: Check for x11 in distro features
Date: Sun,  6 Mar 2022 14:35:15 -0800
Message-Id: <20220306223516.504947-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306223516.504947-1-raj.khem@gmail.com>
References: <20220306223516.504947-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 22:35:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95826

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/geary/geary_40.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index 5821122759..92f9e3cbba 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -30,7 +30,9 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = "gnome-keyring"
 
-inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala
+inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala features_check
+# for gnome-online-accounts
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
 	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
-- 
2.35.1


