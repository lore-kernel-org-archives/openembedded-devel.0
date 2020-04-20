Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.6625.1587402430886915937
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 10:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qUVrAf0M;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: andrea.adami@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id f13so13096332wrm.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lpbaoX8dWtZ3DL+sK9BhVwAFKulSaAkgad/qrWF8pI0=;
        b=qUVrAf0MDw/nz9szOBgqWiBsbTN+l/NK9yf6ye1dZpxwDjHwmo6tHw4P3Zlt6qa93x
         WOuYGukfnW6PiNSnaYeMQGIpqx8PYl0kIqA2bzVep9co2oJOjMA2D0845/mKM6qaPOzJ
         FnwDU2x78aF4b1btTygR6vDkp16DQI/RphPEPeAtVV+FLftRIWbmoiYu5NSIK9bJD1IM
         laH7Jaq/0OUlkKRPvf7g1nbmJVVrYcijxohXRHxTCej6WVbLX3us8nUsk9bt3hjfguHc
         oE+axri/x/9e7Qc7Jl6kMz7JU2FXs5d68aKoACsQS89l4RZsWrpI0expIiyZYpG9Tb5a
         5g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lpbaoX8dWtZ3DL+sK9BhVwAFKulSaAkgad/qrWF8pI0=;
        b=Qfke+FMB/AE8zkzhCzKcWmEqfUViRNDbxF/Igf88s/OCvlg8Cc59/Bwf4vA4dBuDhV
         +MPvXCY8KsQD22/hUYvmqWMNnsMgxVIH9o/N65VJzgx2Ttud80aOnF0sJbMa+GLDU/hT
         QyzvaBrpg7UoEzVdmfFOYHzjMNM24WjB/v723sDC6/H/SL2VjzurpMT90KUjq4oO7tPd
         O99ST67nISdD2nsejFFWngBrqIh0o7eGRnzgu6nqbvznErrTd8LU3F8+7+2WK40/A3J6
         Q1fjtGut0rCcqfrJoTwwdeM7iBT9FucyA3TeiTm7R7KUaYeJLN+Kd8aplzOCHZtAL3bm
         z/Lw==
X-Gm-Message-State: AGi0Pubt+78ByeB0ChSx6ostEWZF09o2RUO3NXtXIts+UOluo+Qwb/A1
	N0UC7fDeu3HTX0im1RBVD5bOgu1/
X-Google-Smtp-Source: APiQypL+b+7ZYUwhr/VwmpMS5Q9revJa0sM4bZH8BFU23S/CkUHkYJdLC/IpcKzuObPBhiV26zdy3Q==
X-Received: by 2002:adf:a15d:: with SMTP id r29mr18577441wrr.134.1587402429208;
        Mon, 20 Apr 2020 10:07:09 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id c10sm140366wru.48.2020.04.20.10.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:07:08 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/4] layer.conf: set compatibility for warrior
Date: Mon, 20 Apr 2020 19:06:54 +0200
Message-Id: <20200420170656.10895-2-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420170656.10895-1-andrea.adami@gmail.com>
References: <20200420170656.10895-1-andrea.adami@gmail.com>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 1e0069d..0702f69 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -18,5 +18,5 @@ BBFILE_PRIORITY_meta-handheld = "7"
 
 LAYERDEPENDS_meta-handheld = "core meta-initramfs openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-handheld = "sumo thud"
+LAYERSERIES_COMPAT_meta-handheld = "sumo thud warrior"
 
-- 
2.17.1

