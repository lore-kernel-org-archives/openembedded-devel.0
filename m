Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A468C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13738.1785620744792069400
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iZRV7mb7;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacb8416a1so21458055ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620744; x=1786225544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lexG//izTf/QQZeaTCdL2s++pqAmpWTvDDjTL3Unpc=;
        b=iZRV7mb7m0E8lDgdBZQVn9A0v5BN+WeIdlIyxroVdM+N6nDazReWR8yKFIQ8x3v91T
         SZg7Vsqu6bpk26alOuBVc1hsNFD5nluINpkimqGVPkUXmf2XM26rOm9EGvzibQWGhnCD
         hWXPKS6A1kT9nBUzsGOQbT6hG+woTuOYlJZaGsAIIo38aU11Epkp5v7mgYC7EE8kQKf9
         PX2VXgeQSHxXGfKE8BhLJrOvf9AssU/m1k8y1gLZg5MJmDiiBL/PNswokUh/Pdq3kmc4
         2joEtVZS1bJulUYThvygislvdHJbchD11uQ8WXC2a2UOIK1Dj0dKr7NoLGhOdFB785v8
         MfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620744; x=1786225544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4lexG//izTf/QQZeaTCdL2s++pqAmpWTvDDjTL3Unpc=;
        b=GQoFyibEBTY03G85WK41C7V2jZ5pqQUR06kg0YSkhbqOeiVIYKE29k6j02fBiX2EWG
         uLf95Ly9lgrCTjgQ3M8lhz5HqcY1SE5Ls6msSZOkzutF2o28hSDkUU/HjAmqfAx+YzEg
         UdPp4r8gbZ2KiEFV5N9JuyCzTaO7ArgeMtQUfyD20n9Rk0InLD9FhUKzZJPTBXwBdvKE
         rbuXbD7i/WDxY0enREuUqf9HxlsXaIHdzaYZ2OwZuqz/LBJ9xU97dIhB1t24F1ihq4+0
         LM+1o7B/cc4/Yz2lqG+8dpQwOZm+vzbUfGJxP9u+kgdnRb9Mq5aslE28YJ/xNsZrt/t/
         14+Q==
X-Gm-Message-State: AOJu0YyaUuzTGCFoyLbAzaIg94HOuDsyO00nSKVNS7EKk6+rhbklsGik
	Tm1+ouUTLtWaZUkQQ6plfdPiXc+6Lu1KOq6CpS6uAxj7hvKvTODOxmtnfTJrKOf9
X-Gm-Gg: AR+sD10gm+g8ExyJ0KKy3qZZCNqeIMwtVMv7S//aW9RyKnhQ8z2sxje9WykgwocB/At
	zrhBFSkHJWJ3wo0zApngFZ1SogoKryMkOqqBbs8sl3kkx9+Ko2jV9HRNrmC0es/VGmphAjDv2qw
	mTC8h8hX1dtr4gYleoszazoA282fVhY8gUXr/JofMKjTdri+2ICdBvbFI3DdqwdDj2zykdVsjv6
	fm7rOvWrZcx0UEZ8Rqmjfj/xq811b7kthJRoyHeX0YY2OaxsKKg1eJc8bq1f+N7BSY9YxrAo57R
	L1s9rEaLeVLqEZwpWnl9lQy+9axN4bOg4trbwfJv0lRG9DuOBWtT4AVEAdZQcmZ+2R3xhWeTx29
	0xdEbmWzwspuGyFxQP1wIKgCS0ncpjAP0H9zAH1oQKf+VAznnw3e917bZ1q85zvgjunNDwb7/Oy
	YXpVhNuWwUAkANGXdpwCKxPAGzPvYzc6mcmzefjdr+qUEsWGT/RxS/8AUjBQdnzerMN/mBg+2ep
	QCPoVf1i6U/p/tNDHP3TZNZBTLxu3oIx214g+UO+1xNthzMd1DnrwVt+Dzz8Qa0w4Vkgq3H/712
	w95WGmYhgRMyV1/80z0dOvbpP/uK94l6E4Za1rXIE2lwAy6Id6ByvNUtQGBljvbxFYy1CY00Kmm
	MwA==
X-Received: by 2002:a17:903:184d:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2d052188f34mr48649685ad.10.1785620743982;
        Sat, 01 Aug 2026 14:45:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 16/31] gupnp-tools: upgrade 0.12.2 -> 0.12.4
Date: Sat,  1 Aug 2026 14:45:11 -0700
Message-ID: <20260801214526.788343-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128633

Upstream changes (NEWS):
 * 0.12.3: translation updates.
 * 0.12.4: bug fixes (GNOME/gupnp-tools#29) and merged MRs !7 and !8.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb} (84%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
similarity index 84%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
index 739e3885c2..c6ba2a7ed4 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
@@ -8,7 +8,7 @@ inherit gnomebase features_check pkgconfig gettext gtk-icon-cache
 
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
-SRC_URI[archive.sha256sum] = "4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c"
+SRC_URI[archive.sha256sum] = "2c7f6f538fb36a15322be532217e5de161182c943c0a8b0da4458cf970b4092f"
 
 PACKAGECONFIG ??= "av-tools"
 PACKAGECONFIG[av-tools] = "-Dav-tools=true,-Dav-tools=false,gupnp-av"

