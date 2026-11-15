Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3880.1794729047374980645
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lQvn7Hx3;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so7236347eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729047; x=1795333847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zs/kEIrWvdava2J+zAJ/RJ7OCwlHEYfZYUOEENNOulQ=;
        b=lQvn7Hx3JUhtB49pOuRt9VDbTmCpPogMNijpYdVBFuzGhCvi1yn4azOCeV41SHStTo
         eC58HGEcZ/BRyuNd820spGcil0m/AkjTs6BhrhPZuGFuCUZKCrnEgonmxv0iRLtqtvLK
         C0URDAnHg2XkvJFwlfma8GEb04XnadlefZR2EnJiXH4UyxGpTJ4coqFegeRBgO5w986U
         Slc3TzUJu5JiuH4yDdka1+RS3rDCLgYntO9zzQZhSVRHp2qwkjK5iV6NGjj16QGZZpqs
         NvEvHP917h0Qqf7+vTtNWzaaQBJARyAmvskbd2GwLQFR0PHbWWHI+Cp9SqOe8zW7KUT3
         9RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729047; x=1795333847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zs/kEIrWvdava2J+zAJ/RJ7OCwlHEYfZYUOEENNOulQ=;
        b=SHx/y98nxCKKDZHa2Fn9loaJHe7ptZeNrQukq1AAcqywDCYp79ntu37RaoETw2223h
         6aaNfgpatOpZBlSBo4YDWD4SLBfDULaq3MOCwwJo7Cif+OZCtyRmxshAx+Fk1t/d6hsP
         gRQ/bD9fqQTnpJqFTSyg5bZSiYqjVEzqjAjSTD6xAd+h74XWEsUwFJS0uvYy/zNgkVVm
         lUQCPym5XbRmN0VHjxOaCgOWL7lpkch1Z/zhIJp8pt3fRqs8OTXgcqnDQSdqIiICavlb
         0mUy26/m8Q2ITqi09toOD77T/TavOxkcvYHBmhg6q0lPLSzy5LO8rww1Ot77PJLXlP7h
         SRlg==
X-Gm-Message-State: APuU4Z9KhG6FeeKxg0IQRQWrKRAmdvvfSM0KO7BrwofFQZstovyBJGRV
	4rjUF7LNl8QQXxTOY8BfW5cd2z7jZHNjPd5tsQNezsKkp74MI6LC942g31d1158r
X-Gm-Gg: AYBFou2YV9P+A5DtDh/a4bL5HKExJHk8u9QxEKdFZoN/NFWdnBMokrxDl0+cvZJQswp
	OK+EzniG0c2th2tIf1PswBA53rn+1ainEI+B3QLx3SRlWub8VERtvfDrryxE61W1foygCblIIs5
	25NXbUP1fDUxCb/mey5yi2ZyGqIirEGjgeExjmF3lVH601bok+u3r1XFK3En3ORkrEsjpOtD79h
	vWbgomPoKTWGzrvCEv3VxnSpmWPNjP7zGRV5wNdmxllshdZHdxxsflN3Bc7kYC6/7AWmvsWhsVk
	AifnjQvoN1OsaBhuiOOA7XjSgnXZUOwW7D8Oh9/KZobrt8s4qihCHs1YimsibLDbWLzedlASiCi
	4HzvdA3OZkywe+BJb42CcOFqpsL2FkTYUuFv+fWX2MrqY52fGjL97V6wePRcJCO93IdMGdggFwi
	iQPZ7mSXVI4sYptT76XO3L7iHAI9SE9rEWoK+VRr8GfmIu6b8ofWwgvuxyVzPynJrVTKjfw4hVn
	zfTfwBCDiMAECPyFPTDqHk5zzTXk9/payWWiEMLgMiWvn/ErWlG6z4Eb638bXLz9MZf9mT751/y
	RBOteAyRo4cehjWo7/fF5dMgyxTY/RHJxiLTQBzGefLyUFv14WteZJCxD6CsSJazsSoVybUQH34
	DXjvMiNYZJRvqtWv9AgYX5ZUSgNgwkVOgJQ+yZcpaF89CUnGitymzxaDg8I7e37B2wUMv/SpMLg
	diJ+9nrBQ2dRYEs3+A0yYFSsBTgajQGM/weIl1+P6xKmLkr3nD4e9QyL6r+77Ey/TYohVj9ndmt
	8Io/a78j0MVDc5I0nF6b7yMSsE26sA1YsQMDgKS/AxsEj4iK49EgYvIFd9f9RBAWQCqwR6LhI3B
	5RwL
X-Received: by 2002:a05:693c:69c9:b0:368:2548:c08b with SMTP id 5a478bee46e88-37966e3a0fcmr7448213eec.21.1794729046675;
        Sat, 14 Nov 2026 23:50:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 54/96] fwupd-efi: upgrade 1.8 -> 1.9
Date: Sat, 14 Nov 2026 23:48:32 -0800
Message-ID: <20261115074918.2932593-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132324
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-bsp/fwupd/{fwupd-efi_1.8.bb => fwupd-efi_1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.8.bb => fwupd-efi_1.9.bb} (96%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.9.bb
similarity index 96%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.9.bb
index 44d1f1807b..8ba6e8c99e 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.9.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "8572a93e81e7110b88445d1907fdd73982557347"
+SRCREV = "ffeaa10aed8e91f5b8feaefc51faf71b3d034fd3"
 
 DEPENDS = "gnu-efi python3-pefile-native"
 
