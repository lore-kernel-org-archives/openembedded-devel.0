Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3862.1794729009801741300
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yANtyaqW;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso1045390eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729009; x=1795333809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaQrpSpuQeNzcNMx3brpu0zUR3r0for11PusT3IEryA=;
        b=yANtyaqW881I4EMfrT/d58wZk3ixX3T9jVnT6I7IQo5jV27AACCQsneiDaLZfosa92
         UteDaKjSY1GQd3jRm0lU4U07CCIb9e8bsAqNG+67hOfnFbBk3GrNKo1G6ANaP5//daE0
         BUTPi7IS8xxv6JWRBF8gQIy8njXTVFOotWjrJvJxywc+LQVeVd8R2dWijJzG3owC0oXw
         Q4owIOfxOUtkjocqM9LZzAruEGe+/MJFKOYJ++K+KkRW/YYKSATx/oVLZEl/zpw3N5T2
         kjMf0YVNnrCfzgAffL5oig38xDwYk5d6pF+ATpP8QNMNu4yAEnyQ4U/7UePQlHRdU8Nr
         sTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729009; x=1795333809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CaQrpSpuQeNzcNMx3brpu0zUR3r0for11PusT3IEryA=;
        b=qSgQ79Y07j8AKat7rXVbMJfG2C2Q4RBkTXjZJKgp6kq/m69LVBQ64nRPhGzg3QTqZg
         NbwL1lQmhvJZcWoGkwpfQWyRJg+pKAwVHibkg+B73JLqYGWp3aOxECgJKjGeVFda6zkl
         rPPVe//S/d5y4K5yU+k07sfHewBFdrsEMvStNXkPzfFT7hr/uXTRFPB02pS3pmZyB6OG
         CxuNkcowa11kPwefDb6HF9zVEMfOdNzi+5ukDM0uEPHmlufs6M/d8MciFsu4G0117chA
         VYi+h4R9O/qMHC/hb/2pTCp0zjrIbdeLIpSOxxLopjnQZYi5cmm+aPj5OnhgongUlO+I
         PXOg==
X-Gm-Message-State: APuU4Z/lsFvdko66emQRpMDNvx3CjyUNy2HC2SK91+XcAGpEtwtooaVx
	7AqfNKzheXhc3Geg+yjcKqQSCOlny1DZcF05Nyp5gPRPKdPy5/FcrrwWQBPmPoAl
X-Gm-Gg: AYBFou0LnXms1EjXfEsq2BLvgTdl7iMuZYgQ7nUVDPjJHWlJuGm2K5XB7FaRZGwiYSM
	wWTnLBwLi0bI984bhZN6sLbSio6Cxe9VD15FQeKYjVZ+8gTGAsaC/Glw6g5oQPNEqAFPhOBTDRd
	2k6qGaoERqaX9y+X5R7HvDQMDBjkiD+cbkN4OZOgbO1HY/eKeXe0q2JmKGTIuIPUFaGUDfafC26
	zGS4mdEky3LfXXVMARLPrcJG0HNzFn9LvI4ALHvB0/6jgCXW3O6mfQVG5xgwvOzTtEpWF5x3q7b
	a+BUinLBblrpaegCpCoU/qEA5zyim2gY8r+uUQJrQec1J9v13RmceO4IJdwC0Ltnh1lX0+AdzMq
	UOVqxFEyzEnEASgYRqjFj7OZCjt3JUVRU1mfiIwekI6fG0DrNcIXeMOfoVxRvGzZuBxyMt/vSuC
	heJOlJroMLy+adSe6jjpOxc5al34kt2XG7YYENRr034dI2dD1DCeBU7ikkupOxBtROgTC5bEutP
	FJStZ9+ldTi/g16ZcDxk2FpdOv5TY1CHeOqt0jgM67LxJCV5gH/a6l0aIdaBA5rjUUeUqlsLv5H
	lTIwx61YCeKAblzLQvNTTjNlRP0Ee2U2Puj7TXreaGUBqxhIcQywIAW3mhtcDvSJSX4JkzR1xTu
	dPE36swPx8bptOny45OAKVZ3SzFjnwNm60rwT8vSJC8YFyaM+b75JcYE8HLHnhvssv9ikMIdKPs
	PF4PRmxsAbtp+OHWVJEBZW8VhokNdY+QturzRB7VCKBS3ipdhV2wqcABhVwZEeX4SwFWI3Cu9r6
	08HQtXalVHCh94bar9HdV0g7SxpFcFUy+IxCbFPqUJfKInFPKk180DJsy59MziAiewSLatOROio
	SydLEH9E1xKhTFkUoDlTCPq5ug==
X-Received: by 2002:a05:7300:b0aa:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-379655d449fmr7636390eec.12.1794729009073;
        Sat, 14 Nov 2026 23:50:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 30/96] libtorrent: upgrade 0.16.27 -> 0.16.28
Date: Sat, 14 Nov 2026 23:48:08 -0800
Message-ID: <20261115074918.2932593-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132300
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libtorrent/{libtorrent_0.16.27.bb => libtorrent_0.16.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.27.bb => libtorrent_0.16.28.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.27.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.28.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.27.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.28.bb
index b54f7ffa0a..2c171cf61a 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.27.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.28.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV} \
            "
-SRCREV = "47114f095b3476ed4ccd8dbee6f027f5905adce7"
+SRCREV = "392030e0fddbe4e423d059d9322382cf44aaaaf6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
