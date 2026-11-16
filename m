Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22040.1794808943447639355
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VY5nNZ8X;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e795af1d4so2197826eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808943; x=1795413743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J04u40Fd/bWspeKDYb1NT/xNc3Olo0npCqotz1D6IUk=;
        b=VY5nNZ8X7SKiWIRGxeMQBxH9d2ADb+Hl4b9ONzss2AakuSj2krVhP5dnVS9mNXngs4
         h9khjfA66IQKnpmigXoIYu/OgGLrQ07yLC/K8czfDB/TBARHrJlcBjl4srWQadd/JFM8
         qeL0mmeDSJMWlfIM0kVJK+zxkJ3Y9geMvniWzozMnCON6oJ/oBXLXryR8LK50366v0Zv
         kTxuOMJIWMLASdKZTQCkV4qTFzuPoEdRFU8yp+PsdYAVcRBKrlTrh9EWQ/oXEyGIEdJn
         iAPimA8v8pFvcgPzCiK/n7hQXs1JIYmP/y/zoU1IDmTKvHBWnkfJ9ogoIE2/v16rxtc0
         t1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808943; x=1795413743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J04u40Fd/bWspeKDYb1NT/xNc3Olo0npCqotz1D6IUk=;
        b=wlKH2MKtyv585vyjB9SXSvbpKN/ng4MwDtCmQnyQlDFpWK+SqdJ30DwCmlSDSjlWDL
         jLuXTtIoC1THTHEU41gJGXrVBvya+awTbuJsLIaSRZQ7xWhCJ2FJW0n4OP0ILo6sPnzS
         RT2WDQk01PTkowh7J7LMRNpkBh9IdYe+NXLaYfm2Lu7otmc4nYkXW/PFk9RDk4m0Z0wT
         oi4m87Bi+e+HpiY0zvkzWTg4nsn/SBdGifVNqM7CBxMXWWVBPk38sqFhq9kTUSCPdIxn
         weEZK5Xh7NMfIT27Dl3B3sfkufC+cYLts1+C/uA2kC+jEMTC6PraCKfrS77jTW6FYLb3
         xmjg==
X-Gm-Message-State: APuU4Z/omxEdRstgGCud335amc/R5AD3TiSVdaQKHt2oWcRbJPTtSybO
	BXKrHy6vn89setKHzAOU1SmNZF9C+/TA0SGxtgRVMmhWOfDoGMuS2THaGRvzIAfp
X-Gm-Gg: AYBFou3uALzf35nwKDzfes6A68VxP8uqegcr8CIfpVGDTOYeLGaTDsIl0xvzHPtBwv2
	Ui6pkPZzk/tt3hC+QwOHHCrhNEoQdepnEKYJjTH3rg5iTDoQodi8/liNrtJmWSIbYjqBf0OVVGV
	RO3ZmCYc4ZRqUi2PDWY1n6UVKaX1KV7MwWrOlzrdJ+z7dkrv3djA2p8H5vDl/ypk+ECev1zzmtJ
	0ZfFzEwBTaPQiu96/p34yfzGLUS/Sm1xrSMtheoRxPoQGc1FXqf2wrfOgZrSYAk+WW4OqvZL0Bf
	9t/hHWzZuhaJ44f0C/qnMdMda0cseb9ATASGaLiRSF3RbgTvetsGDa4nPuRPhM7J7mTOGwVPiRA
	hemDkuDQyDjDmwiLZPMsDXuiDycGrNFdKTCYiM6wmb7leSbUammY6mFVgmjHyymrqxiqMNyI7t5
	qlBTOec+5P5TjcCmh0HNfMMcSlAV5q6+HMNSJicjW8dzzLxBf6UoQU5nJDmKLtz5k57IqLYTdsu
	VdYR7VBuQN9Oak+V1C6jEaD4TWFJmFfrhiUnGMBDLBQNWfqT+x1fegACQc/Ix59d2T02/9AunSX
	Y9WAv4RlT1gVKBT3qHDa95Ih0/uye2vXQAd9j6LnFGRw3RIotSJZOFYDltGGC+hIQxihYkBLJ1k
	kWq12GcH3XNZeVOxgEWD+y96D7qUopkzt+6o5to3cOPk13OcjT9JCgdXT+o95FICwtPNuYdif7T
	A0IX85Q6u7EcDkCtDKiWo2HSqojshvyczuFZuDTIZ24Mvz9quck7VU4ae3JPYH4lCRj/qz1JF5B
	4J5QMoyIWJGCbwT/knCQ7XeaKfW03im0GROcKqyx8RosuKwtKayMJ4rqEs1QMJCXV1vG8vvPQap
	GN8s
X-Received: by 2002:a05:7300:e9cc:20b0:36d:158c:e31d with SMTP id 5a478bee46e88-377e15f05e1mr14089940eec.18.1794808942726;
        Sun, 15 Nov 2026 22:02:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 10/30] libextutils-parsexs-perl: upgrade 3.63 -> 3.64
Date: Sun, 15 Nov 2026 22:01:48 -0800
Message-ID: <20261116060209.2916444-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132408
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ls-parsexs-perl_3.63.bb => libextutils-parsexs-perl_3.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-parsexs-perl_3.63.bb => libextutils-parsexs-perl_3.64.bb} (94%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.64.bb
similarity index 94%
rename from meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.64.bb
index a1066bc5c7..c81643b2f9 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.64.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee
 
 SRCNAME = "ExtUtils-ParseXS"
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d19a3f29288f0950ef8f1838db99270284ba475758246f0e5ab1113a9d9a7548"
+SRC_URI[sha256sum] = "014b7d1bac86616e0ad7c8476e0a6b6c21d98615ec10cb5bc400ba06ebc288ac"
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
