Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3855.1794728988304620444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=E7nBAHCl;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2503668eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728988; x=1795333788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd9CnfCZh/wpjzOLVR7YGQo6STV1i0NXLRYyaGHR1zQ=;
        b=E7nBAHClW5g9K9MsFNajpwe2LsdsAjbm3aGU+mDjEdHo8d3sVvjiykma9GiZ1xL2WY
         Zg66Ju9B65X16Elod+KAC1sfsKOwtXcGqSbuMaofm743uthpRuCECWGtsQhz80iSsn6j
         2WwkNsssou1tEUM1Bgrkl/3HoX2NnWaqmGI03TZ1+n3tX3TeUuTwI7lTIARrrkUeif1h
         7Gao032fA76Uy2ivHrqEEgtZRA/16gB3C8krrYQibvZx3zHTaJOetV3B+IHoyERsRWG1
         hOubtnb6gmeoS7qC73J6OoW53e1otbRC+HpBODa0KtmUgPWahyf22UgOZVH5Ndt8OJJB
         t5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728988; x=1795333788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd9CnfCZh/wpjzOLVR7YGQo6STV1i0NXLRYyaGHR1zQ=;
        b=TPRJMWxeQiL+WyRzbMKN6dxO7XCJH5o6RB42PgRZGi4oSd7GY5lMnSrNYxOeHwX42O
         KvQkedvWt3uEer5Cvcb9mXBwGYUSvRTCE6vsHR5ZHpx9ObqsnrxvKrdSgpB/SKxeBVqA
         mUfCKOs9lJdy6gkiNkMsb7a6bXeEyMTIlc18VAwVfJzo3O79rdX1nFhR6kMnmagTJlgo
         QlT317ZmfNpuizduv8ByauDdwtc0ZQYHRdGy1VBLtxp5XkvH093BWEhl7k3fefaOuE9R
         5MLt0xRp5pLqPjPcAxAie2zWC7c8RSLbvrhuD7AIciRL+lovez9onJRrqV2pTblQPpQM
         rH3w==
X-Gm-Message-State: APuU4Z+8xSQviKuwI1ZqoIYvKHg1oMWt+0CftZjkmcYMj1GFtURuA2pK
	qLdxkWnrshp8jOm7bRMPAoLPBk4XOR5NjsMNtudbsIFqyc4yENGn+1mfXsEO4msq
X-Gm-Gg: AYBFou2EGwh+3KLBAwC0ch3Lf8hMo/t5uJJTqK18lQ6Tojz/U4NUc5tsxRoSGIUmhXK
	R+9SWYxwzTd0FNN0Z0Y3KN8GpTPQ0eakmoMIicTmsls2Gv9LfpfDC0+rRpO3B6FpIRSCy+8AJIb
	mIjCBEoRRpHvxmbmb8hx8s7njGBFf7ZEElJ5EJpwm3zAP9nsAJZXmjD0dtEccDTaMGlSY1dwR7O
	XyUM7brtDU1kK4r5SBdkJfMZQEIkFOTMiNVas5gMMXLNsRanSF5Vh5gsVOFDbLFIdQG+t4crq8n
	4iNb33V5i+rZIOa9L0pA5qeDXnUg3SFMBWBYxn62rcR7Mgz9r1bOHn9rgqTnjLt6QByulFQ15jN
	Oq7OhTyC+ddXTec81ylnviEgS73KfrNSC1ogVsrk6UuJ2HHy4nkKc1xzUPaIDou1ws284fBCTBg
	Uc7Pl/tqIQlVwrw0wtyIdvJJC85MuSTCcv58KAtNDdJMhnq4faQTgwV8xh6N6Dk+XnJu1bkRjJz
	XlH+B8PrvzfpcgbciISqVj2TP+RDSVF4pCPkGZLUItb0oaa1tU3ByOFDHG5ydhJxI8RHV+XlYOj
	W//XvubzO1xGu5kGMiZI2asFElAwAaFBgDGcpsFCTDGJ7MwQs4asxvtiNGGrsf/uEnAjHLpB7i+
	Ra6lD+EJWcmZEVGzoaSkjPP01js5oGcZ9rNyXIt35s8DHmVbaiL7uRSY0znzV3WJXNgBBJTIYuV
	telucRkr5ZpYbPSytt98LJ0g2A09jwKhT6+LNS3kXzZjbYpKOIiMQ7nUljE01gN0Ng25XhyUdxe
	6TSdYVFpnV9/kw63mJw234kVMKXCj+SW9dEbe17D7tvpMklAr9yMwp2X7UBXi95ZSF9ZKFNUK3p
	cbTPFcFl/I+BZjkU5z9XEiigzA==
X-Received: by 2002:a05:7300:72cc:b0:376:98e7:eeae with SMTP id 5a478bee46e88-37965da98bamr10741581eec.6.1794728987584;
        Sat, 14 Nov 2026 23:49:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/96] libabigail: upgrade 2.10 -> 3.0
Date: Sat, 14 Nov 2026 23:47:54 -0800
Message-ID: <20261115074918.2932593-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132286
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libabigail/{libabigail_2.10.bb => libabigail_3.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/libabigail/{libabigail_2.10.bb => libabigail_3.0.bb} (84%)

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb b/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
similarity index 84%
rename from meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
rename to meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
index 4db379818f..4bff1209d6 100644
--- a/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 
 SRC_URI = "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "0cc10e6471398330e001b9fe37f1e8c5108a9ab632b08ca9634d6c64bc380b78"
+SRC_URI[sha256sum] = "d34ea7c4b150f61e22edb1d16157e12c43fd18f8e8f09abce053d82ccaf92e06"
 
 DEPENDS = "elfutils libxml2 xxhash"
 DEPENDS:append:libc-musl = " fts"
