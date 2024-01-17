Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3016BC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.1297.1705454006387297380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=McL5gyli;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso107022677b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454005; x=1706058805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mJJR8sZUqQZRUFaZ6MqdwdNDdwZUv91jeZvyuHLNJ8=;
        b=McL5gylibCCnvoKAWozriHARb/q44TPUMU9M+dN3H2IBAIdovY923ALhOeNZsAz0sw
         QjdVNMGLglVUR1WXAlW67tJZIax37jNAvqznFLd6iI0oYuejp1t5DD7DBSuODGH80NqO
         w85HXr989XCW81uIJKFrWKnFD/Xt03jqM8vgaii2m7pe77NYa9rIkdiX9D5JAjJYqjFt
         EsdYPkTRVQVlx4IXtqbLCzD4mGG1q5mYLC+GKNITJkv1AbhRT3QE+qB6KxnUwKzx1dKl
         hMlyBQpkVb2AOO0O9MfRD2bI3NOk2q2z+sFuPxEVRDt0mKEIOaB+8IrDXIqFgPdokxc4
         k7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454005; x=1706058805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mJJR8sZUqQZRUFaZ6MqdwdNDdwZUv91jeZvyuHLNJ8=;
        b=ETNAxaA0HV/dTZFjvE6Y17aK/UE+DzpG6Iec8Mkoh/arVB90E2ZxExwNNaLkoSQCNr
         rAspe/KYxW5dtzL9dS4m7ep9F+20hGKqP6ApYrS8wpcHmB9S5IYW6+yqMBobx3+5Nd96
         t8WkjEo35BGJ+m3xdnzt4sh/NWaWA3bW83gcpYT+vY9PuOnlUUZMfQtvkTsSnLx2OE1z
         0uClWO4T5oNK5nBpgNyRhC5qmVE0GcKJ5gtyqV1f1E6Aq042DrrxCcLeYsxCibiurYqo
         cBa0otJpFo8xXZKaY4M0bJYlHVoGA+kwT86OfS4Y1xnO+EsFPum5kq43qKgwe3XlqY1u
         ma/g==
X-Gm-Message-State: AOJu0Yx9M3g34yN17dIe0B35NPiVt5BEtpZZicqrKRGAhMGef7HR0GVu
	QIK3BCA8zq2uqPvf8qJJxDnSAzS4rWtuAg==
X-Google-Smtp-Source: AGHT+IG9BVNeCK+1YXYQIIyrGSPyBefdSQF9gbpfVJVehw/yXIZJqvxoYpMeKglR6HdfYUFRb+m09Q==
X-Received: by 2002:a81:eb12:0:b0:5fb:9705:44a7 with SMTP id n18-20020a81eb12000000b005fb970544a7mr5971366ywm.52.1705454005393;
        Tue, 16 Jan 2024 17:13:25 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 07/11] webkitgtk3: upgrade 2.42.3 -> 2.42.4
Date: Tue, 16 Jan 2024 20:13:16 -0500
Message-Id: <20240117011320.1856392-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108317

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 466370a087534eded974a1eef2a4431dda6900b3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.42.3.bb => webkitgtk3_2.42.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.3.bb => webkitgtk3_2.42.4.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
index 6149a7ac49..3c6b7db811 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "0a1a4630045628b3a6fe95da72dc47852cff20d66be1ac6fd0d669c88c13d8e2"
+SRC_URI[sha256sum] = "52288b30bda22373442cecb86f9c9a569ad8d4769a1f97b352290ed92a67ed86"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


