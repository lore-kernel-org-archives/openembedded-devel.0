Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22045.1794808951299373237
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T2TASw9C;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so5121495eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808951; x=1795413751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFjTP3Ho7V7GsrV2zQxmC7yjUPMXIzXnvCO0mIY1mkk=;
        b=T2TASw9CP36cxEsOdObQKhrFMiH92EcMhJrVkcmNKb4G9B5TVur83LBAq5L6ygCFWO
         RQEYfSJe4GTv47OjpjykrZgh1A/ZsldRMk1g9pObKJx1Ugvtb77cNKNAN8v/H7HHzJCw
         4Bd1pM7WtwNP7Waos2htmOcUlfYtnuSoIjK/AIUPm73lKKWqZr6SncmfwgW/htW6BXf0
         6JvHMbf90g6J7qRYv7lGF8SnrmT+OU4D5jsV//lyxHfIPFi4MnUoDVM4Wboq6LtnK/qF
         CL5X/F9pk8RIKJeD223X12KELA/mkSp0YVtMpIOwEIcVEbzFSnTrPRrvzFURu/hUwGtq
         gnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808951; x=1795413751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFjTP3Ho7V7GsrV2zQxmC7yjUPMXIzXnvCO0mIY1mkk=;
        b=BIXIvvyhJoBBijrmnoYhawqYd5RMwmMBSoN1KORiXWB3ETXd3InBu5Oj0UKu4jGm+I
         qKYx3DXI7aJaDx7W2dHOba+FxKEPBfN4DrxWVZI2ihzt57D13PXVn01C09QOa6y/YOS1
         AeZVPjaAHV9WKc7B6zNB/ISzCKyaMfoxOCko6TFFAkQfSowjwZOcCfUgPzCJ3hpQ+XY1
         eGMSCFztiBZGeeaR4Y7tRGJvSer6ggxAz7ThYAZzgjNooVJKGa2OHvn9ZmwENSa59UmI
         400fMYrOVgU3JMKzzP2TnxY5dXwKO3TKMrCkR0476gthJtiQ8VFuUEXhCVVdNogqTf5w
         RCZA==
X-Gm-Message-State: APuU4Z9nUWBp72I51VF3FUHxBC2YergouEzYN+l2zivn8cWQ5dgrH03N
	JPi5z/6GO8EEIVmo5isUl9iyNLTG/qGhHvnkmXH4WunEIKwNgwc1xn4mEOUo6SU5
X-Gm-Gg: AYBFou1+jJUOhLyVTtR0y5h9/jQo2FXF6llOk5SwxRZTnjz3AC9rB8MmzR+x4dPzhZ3
	eNxsQklSF5uANoAEJW1GIuPVmtqMuljJ9x/FzzZlt7oI+EQqq89k4UG7yA1Ei9mko+u9/+gesG9
	ID1K20SbGv7I54JiYJaRH2uc3BiFq3jSOYAqfkTuNxvu8wXzlRyqTVcpVkuVvhnjOfbElVaRzwX
	Dy8Zk9eP5hy94dRpqdKRjLdOTKNVEPdEaFxNmFO1O01p/0vm8QXA+YPYePUwbgrT8mzW7emx5tZ
	Go4JrpGvHtpws1bO0WG3qmjPb5ngYWv6Dc841mkEgL/SfA2Cc6+28rkn0XQ3y/KN/MHgpFSRg8A
	azW90cgXqRnnaNUCc6mEWZ5zRe7tHkVM+G8fU4bkmlq0VjzKDAJDpHIoHSk/Ah7DPgIhZ2awA4r
	lAVv1z4bMnjg+H/mhmJzH1QZKnbhK7SMaLowRv3NpfF93yUEjkPXSk8slpNJA7sXiDPGnXfd9AA
	plIgowF5r6wBO9MM6vsTgzSFSk5G9qeJnFnCzmhiZHt5zgKb/6SykouCSp45G1G/yVh5LC8zQmE
	W0I1x8TSwSZhVCPg7a9iIr+uvoaklysFKpUyeN8QEVaoH6Z+ec706AIcxn0dJ4lQS4/8sAYXYM2
	0bIXFvNYego9I/TKub8LXVkXEt+3zn8hVJmSwbv3hp3Zy7fGzq+VAz+5fT+Ob/xzwWry5orsfk7
	pIFXIAPzz+WzTvduPSZQleT71qJHNLLajeKQnuy7cW866xfn93yhQQJz+evForcoDvAD+l4WJdj
	JIOeUA3Kv+KLpuVj3hcnbtU4P7clclQqmtFbwdUAGAfNgTXj5TQtDvSDSLm/sdM4bNaah/QxGj1
	x4dl
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr8568558eec.15.1794808950567;
        Sun, 15 Nov 2026 22:02:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 17/30] libnet-dns-perl: upgrade 1.56 -> 1.57
Date: Sun, 15 Nov 2026 22:01:55 -0800
Message-ID: <20261116060209.2916444-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132415
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libnet/{libnet-dns-perl_1.56.bb => libnet-dns-perl_1.57.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.56.bb => libnet-dns-perl_1.57.bb} (96%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.56.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.57.bb
similarity index 96%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.56.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.57.bb
index 4e4850234e..f472758535 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.56.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.57.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5930e39f76895b380c7ca11fc08352d15ad71c41fe84c12dfb6a322d17f66946"
+SRC_URI[sha256sum] = "7c98de329cb5d6a99abbb03aaad2866cb041092ed9936a7246908e170005b058"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
