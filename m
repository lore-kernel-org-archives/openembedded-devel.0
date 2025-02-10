Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC8EC0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:58:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.48185.1739185117812483780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNg7LMOZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38de1a5f039so370832f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739185116; x=1739789916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTCAU/MZkZq0z6ESwuKUlTxwjORi+34hKf3nD0tXdpo=;
        b=mNg7LMOZNmMKAF7Ut92L3qcg50A51sNiyWHcdkHdJYwlmLIGlPKSssDN2ZaVucOcL+
         5qWGD1HUmlGwA2Aw43M6DvaKB+JXoXSpZyt8L+N+6w2LvmPzlCScJo3z228a3HRRTfFR
         2mo8i/BJd5AfWxGc8dGqssZlmmtRP9ABdpOeNdmBUTIjvgXwUBRZkl7/sE6jPKoY9JV3
         71luhYxDU7uP91oYLn3l6v5u6Fp3WJeW3urae/st2jYYQrQT1LNBEJeXptvlOdHuBIdQ
         5rYWsqmAwnwWag6L8UhpqkoJMvaW4GFnB5Jn/0O/GDkrReiPakljP2GBvYPB3dKysI4X
         Dv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185116; x=1739789916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTCAU/MZkZq0z6ESwuKUlTxwjORi+34hKf3nD0tXdpo=;
        b=n9JbyVu8sAYN2BqOSo8aMXisn7eJJz+msTfjleUnJf4rd94ffN+ro8R1et3nshJrHk
         pPehcXwd/d3YUIvCI5PcBTka6FjPzBe4q1tV41ky9Tnd2Bp8UtG8JymqXmIwB2EnPXZ9
         Rhf04L3x196ihNOiRj61cX7TLuXSjhL3hE5eJEAeSkfafOzVTS0gMZPI1Sxy2SzkMlLQ
         fMLiPI1PR5EXPJ2X31mivMhcXEg7yI28xdvsPO/aj2yHsrwqA6xFAcdAWnk2JEmNIBn8
         sISHtB2N/JJz09NgJSs0dY3qdVqHyMxJnN/G2/CWXzqKA57Kv4oi7JM7Z24ZcKK1Za+n
         j1hA==
X-Gm-Message-State: AOJu0YziQ/ViBusq6nNx4g/Gf3Uke/CPwu4GNpWY2ejtEmeBcjRG5uih
	nDhGLwWV9KTh69E45iNtJ1mD5RmWul5fqhpItjlVm68ZOEcBYQkhYnqztV9g
X-Gm-Gg: ASbGncuBKGVzGmUkyvSO9pxtJNdW78d//GMSNUdiwEcbUPDH1Dnq48NYWMRNZI3yUeP
	lljr79rPYk0swde8NysNiQNYuOxsnWLmQ2cdoFZ3i5p6RdVyIXRbiIllrZYJhpY4vSJCWCsoU+O
	CCJO0KETqhRwZ15HR/3y4D+fhFExXwfpw5Thy4iPynj0kxL7zR4LSISub6gLfLeZoDXB+hsJP+0
	1Cf5LEP8uf7b3r814ZYuXUUPSTrmL8/NML7CVqsJ7CzlLh0RCOMfOhJNuDyoyPVdnKpqQkLw7rb
	L4wXzPpvNuK/S1MF2JS4W6PW11PjrSg=
X-Google-Smtp-Source: AGHT+IGCW9xvVD6lWXoKYXbyuSJeb9hfscyFDM5nQiK1GP2KMSgufAmFmmFJw/BdN8Fqivgc1ZtHVg==
X-Received: by 2002:a05:6000:1acb:b0:38d:d8fb:e91a with SMTP id ffacd0b85a97d-38dd8fbec35mr4706746f8f.27.1739185115416;
        Mon, 10 Feb 2025 02:58:35 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc933ff9fsm9731746f8f.96.2025.02.10.02.58.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:58:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] folks: add missing dependency
Date: Mon, 10 Feb 2025 11:58:34 +0100
Message-ID: <20250210105834.265914-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115401

"inspect_tool" PACKAGECONFIG failed to compile with the following
error message:

 ../folks-0.15.9/meson.build:132:9: ERROR: C shared or static library 'readline' not found

This change adds the missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
index 899b8da26..0c6a39d49 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
@@ -19,7 +19,7 @@ PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false,evolution-dat
 PACKAGECONFIG[ofono] = "-Deds_backend=true -Dofono_backend=true,-Dofono_backend=false,evolution-data-server"
 PACKAGECONFIG[telepathy] = "-Dtelepathy_backend=true,-Dtelepathy_backend=false,telepathy-glib dbus-glib"
 PACKAGECONFIG[import_tool] = "-Dimport_tool=true,-Dimport_tool=false,libxml2"
-PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false"
+PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false,readline"
 
 PACKAGECONFIG ??= ""
 

