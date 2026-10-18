Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF55CCF2D6
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:20 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9805.1792302979404530454
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HRm8lJ5o;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2777991eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302979; x=1792907779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzuNz7Ch8SjApscO6psCOLNN3SGMsuSMz9LC073SM9w=;
        b=HRm8lJ5oYxIN4yhduyghkn5XNpBjMXg5a69/RZI2CM+rDcnxr7kJOIssAXYSgNBJqp
         nUaubeJLRENXnb5ICocAWiDAJ24Aw1Ij5fD4amfhsyWnBYvVnCu01SY+/as0xkuTp6ip
         1yEb1r3j+znXf4+Gi4ERm7bvZfBVLlpRNb8XoAxmqSJ4rUUdREj/XI0aUs2ya7RxPcVk
         4iBzZaeuDRrBpwiY9k6vPuksdL8ccR/xEifIOJOvov7NOrzKIJG4KAJ4WRaWN+uc0b41
         eNAGEqnWo400pZw0WX0tgyfh5ZwtF3zycII5XTT+wd26Kf4xZcoGrYUjLZDYvqSugcmZ
         NxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302979; x=1792907779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzuNz7Ch8SjApscO6psCOLNN3SGMsuSMz9LC073SM9w=;
        b=WXit4oTxoHTLg4+lB9AZTKohkpDblNMgyUaYRkQNkOosFUD/q3ZdVsrsC34SY3g4uO
         +o7ggmm2UwVg7r+taor3oPMZR8Am26VNAUY18frzjoro91a15if++VtlkGe0WV5UZrOb
         nmrHI/1YCHlG6HRkj0xmiG/pLJIC4LmIoWEpNylLyv2e99sAyNq9zK5V/0uinN9G4HXI
         SMr7P4kEpSrnJoBurIm0yGTG6vVL7/yeaAbzSJFYYYn5EItltRJ46PQApB+Ws/pFy6LH
         ECfyD63eDUOo/7nlmTWjAHrnJOL0DHNgqOvaQZxzFGHbPSpW8L+K/eG8AOw537T/45iX
         nTeA==
X-Gm-Message-State: AFq9FYJWPYiECeupDym5Yt294zIppYvhajNZIHYZ8DB7gtZMGtUPsIfc
	LpD6gE2vrUs6YoLyLGqpdRhqruIsKmqRQ1CXaMv8/2TFScoT6I3UvnkVf4WKFizVJik=
X-Gm-Gg: AYBFou3iihOoaRvDA9L6BwXDiXxkpijuVVacvA0zVBh3PnYgRCNhFUw6haCguBSaEYe
	qxV8OU2sUhz5+R2SViK1pk60a44cl4XTmPuMYBKOUIUBiG3wVKA64n6r7ZLkhcoECSB+nkIgmld
	pa/IzPrNy+F3vKSNEOu+MAUJS44iXzpzOYMdj+vgABWLImxd7FQsvR6YIXHQ/paM91pkazfXbQs
	PqpiAGI0EKGOOcDI38iNDVliRajkvCy3atPjpT837miriFG4ZWwRNBnkhl3NJ/EyC+uWOhe1QHX
	kINAXVtzU/EpjfYeBkLfX0tmnLOf/i1iLmCVc39Y9Fa/PLMtXj+0C/LcEhUucUM5ONqhnw3SCmk
	Ke5G0E78RhaqGuZlG3G3lFvXd1rVeI/i/TqWtlyk/daRCJE/0OTVkin6eO6GypMQZuBcPCa7Cak
	y/PoEKAJvkM3iuyO+roE72DHOx0pDK/OyV3RjfuKdpUuFnK+p39vln4z6awF2dV61RUBCAJUdu1
	JLZlt5vZVe8I4ZdaT0OAWCM4itwA1MoCR6YMAnEhs3Izl4+YOwh3b/d269c9dWkPi6lzJKPjKsM
	E8KhcfoKJSEL2fDvxgZeI40MKefl9vs+XGrrt/K8M71tjJWC1Ws80zceR7d7tjS1UvpKMbETm/j
	Z58n2reyLairR6Xdp90BUX140rcSUttxH+YTo4ZZj2zI7z3DMgMWEWdOMErWb4Bqv9QWzSHAHoF
	ouV2pCeNBOYPWV3L/ZSNCzqDQjs3/mXUYx7+mbXNsGNB1Ampg=
X-Received: by 2002:a05:693c:20cc:10b0:360:b8b4:83f2 with SMTP id 5a478bee46e88-361a264ace6mr6489066eec.25.1792302978619;
        Sat, 17 Oct 2026 22:56:18 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 07/11] mutter: Drop glycin from DEPENDS
Date: Sat, 17 Oct 2026 22:55:34 -0700
Message-ID: <20261018055605.179605-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131089

mutter 51 no longer uses glycin; nothing in its build files or sources
references it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_51.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
index 6604865f67..66a4666c55 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
@@ -8,7 +8,6 @@ DEPENDS = " \
     colord \
     fribidi \
     gdk-pixbuf \
-    glycin \
     graphene \
     gsettings-desktop-schemas \
     gtk4 \

