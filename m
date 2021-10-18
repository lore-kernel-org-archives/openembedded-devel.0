Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF848C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:37:55 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web12.40169.1634578674686345770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AQcfX56Z;
 spf=pass (domain: gmail.com, ip: 209.85.161.52,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id
 k11-20020a4aa5cb000000b002b73749f3cdso199923oom.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXldgjiXS2adgUZK0uoHaBRI6yfycXA6IMdUl0/5KuQ=;
        b=AQcfX56ZyuNzqiVKQvMDMM36YGc8hYLYXkrEOhu8j5a2988CegdocyWHOaeyi1zVdn
         8NYeRV0WveMjniXj3ROWUM+ZYkw+PUufno5PAjDHa4AU6mEiWqXqF6Mkvs3VvWm747CW
         OGLSA6o/Sn6q6GsiwlNrJRbZAyo5Yt70UMG0aidZr2UxV08AKo0F3DgZx4IhMrL0Aqxo
         ZOefu4XZEQ85UQZhY3JG0cEiuxT/GaW4uF6gAfDWGFiz1UjFEBPQTMDtYbAB1w1TNDEc
         N/+OHIVPO0rXKJqd83pixA0rC3zYthqaF7ygUpR9Lmrg1d8nyRzy2iDiEZUeyea5IlwX
         uveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXldgjiXS2adgUZK0uoHaBRI6yfycXA6IMdUl0/5KuQ=;
        b=gtiPpzYa9LzHpMgtRBbHgI/T8BZD/T8TIRrzqlFAtfnK3Hom1kAQZiQTpAoFb7Y1Z8
         TQeqXB/Dsa8wwzAm4t9VOsFCO7Tt6slmBfDGY84uqwOTLgtHP30vqndwnuwUSp5QPmyh
         RP6bCvByuMoWChWpZ6D4bjQ1uos6YCVbfD8EwOvUjVIrEsj5WK8Bg6iIRNMYdHGvYO1T
         4QgSndBOEwZH3Rpba88a2L34FdF9hRMKpEmU3xfmQ5zdIidKlLIozwKBIqv0SSlXXPii
         JWeV0ZBxW0VG22NJdBh1i8iI3jWgSUowxDG0olectJxL95AvrlkJXYyIUMk/Js3ML7Gm
         x6ig==
X-Gm-Message-State: AOAM531/7rhx8qHTsZdetk/DoQpVhQefrXHnb82SqwhiH4TGX8yUqsKs
	UtRG4WoV3VdaqW94LEIoUElPlHaAIIU=
X-Google-Smtp-Source: 
 ABdhPJwnwY/So+aHSIEjEc/+BlTXfQUd2kQrxcCc7zMCVE04GK/BNRZ3vdqT2RIE/I4h7Tb6qVNvyA==
X-Received: by 2002:a05:6820:16a2:: with SMTP id
 bc34mr937303oob.66.1634578673739;
        Mon, 18 Oct 2021 10:37:53 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 187sm3137274oig.19.2021.10.18.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 10:37:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] mutter: Move gsettings to a separate package
Date: Mon, 18 Oct 2021 12:37:50 -0500
Message-Id: <20211018173750.3739908-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 17:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93437

Move the mutter gsettings to their own package. Some other compositors
(specifically, phoc) want to use the mutter provided gsettings to remain
compatible. This allows those recipes to pick up the runtime settings
without having to pull in all of mutter

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
index 72e776719..1a81745f4 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
@@ -73,7 +73,9 @@ do_install:append() {
     done
 }
 
-PACKAGES =+ "${PN}-tests"
+GSETTINGS_PACKAGE = "${PN}-gsettings"
+
+PACKAGES =+ "${PN}-tests ${PN}-gsettings"
 
 FILES:${PN} += " \
     ${datadir}/gnome-control-center \
-- 
2.33.0


