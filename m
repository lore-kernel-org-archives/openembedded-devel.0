Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2524.1794961615293886926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VwUzAgca;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so1807767eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961615; x=1795566415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFiZvjPc5+I6gGlyY0PgJa7GJmQCmSp97ZULtA/mJ/A=;
        b=VwUzAgcaKmJmq6sHeIa7QDaINK3vlYMZJWWnK8s5unCzGXiV0s8TjPm5w1YkOkGzJy
         eqa2q+F8rsyPZWlwYzdNfdyDM4KRzKlzLH0vEdlkrOsd6iJ9vgJA1+lVzlGWyaYH9itH
         RJzYLOWpSYVXUq9ElYP+p1hapV01m/XxRL7ZEeVVLcU5fE+OTpShT9G7H+sy6kagOlgB
         wbe2WO3YnY96uLz40azrn0ikLhX9Q/7TT7PfkCV1ZQ3yqA0NHfJUGAb+NRcEHkuWX3aQ
         HRJthSa15EjBL8ilE48Vsut7GL/zExrz2WLcSKKPvbrI9wuujGiUEIYGwHSsYLm5Sgnh
         LywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961615; x=1795566415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFiZvjPc5+I6gGlyY0PgJa7GJmQCmSp97ZULtA/mJ/A=;
        b=dJ1i49PIY0z2m6YsirbIHFkOSx180YxFOL8NqRB6duJHJ/XAUxxQbBWwUW6D3JO9TV
         lhgw6dPltta2ss8/HiSwKR6d2JwvT+MSWUa+vqR9qwvdmItzzZ64U5K0nuBPUMEXS/IW
         ++HGB7XCj4UD30wLVFzJfzlPFh6GnREmlOOkXF9dITsXpwA4kO35xPAfJrnrzqw7fqJT
         Tk1xX95r/GMTeWnH0Y2wYz5RlWxERysCiZ6y5tu6xUz0reTl6LCtku/VzLPPHsNyLQ6W
         BQLJf8h+PZ/bbdOibCOdEqswZYwRRHtPb/rkkQnb6eEif8LdpJhdDREseUCTx6FziDAT
         6OJQ==
X-Gm-Message-State: APuU4Z+qEvFQEs0I8T4MuAPxSmCEgw0vkv64DoQjzMpAhbiRoR7/gwr8
	jSRe1sDMzgFcN7sWr+RkyRsCqmhC75LLeMBFw2ksa8+TsF8JEloYcLTBbv7d9r71
X-Gm-Gg: AYBFou2/f40nS8gzV7K8HcSbEzxdgCWt1sDjdZiGepmBdGwqxwXJpEh77wfaPT4t4Ed
	d8MljJ9jHEkAF0qrSXT8WNC1FZzjS47j/jZV7CV6k1bfgqjHCZrp5E+5ASb5Ht9u6rh2s5Jljkt
	PCRE3NdwoW5CvJHBz1EoGe/eBLB2pwBKe54mQapdZxuWvn0GUdhz7EpRaV5ii3vRYOlmbTw2W5P
	CSi7CMagLbVyXxhxJOx6PE//CTjR+OLaYBVhcFVIg6iiQX2XlW0sHXlX8BqstCK9k9dE4Y52dW4
	vIHV2KhPhTsk3AeXbKxxSBC+oUyelmgBYbrBS0UvgE2LeUlhFeZeKjQFplnuAFUEugUvJfb3dRq
	AZ+Kco4hw7ohq22uMVodAbSjKZ6dGK8e7xjvLN1P9d86zuYTRmcfK6ITrddmDdkMnftmI/01pof
	1dbZP1hBt4msEsvRdIhBzmY0SnaNypJD7r+R92KrDnqIh5FS51LvgT3gAGnv8kzHiBMfi6X6fiO
	4EAhneVzKP2EHprT9qHXedFdOThJDqDIoL2iWc42R74xqTTf5RAmbkRoh1m4tl8WGiCZTfMC4qq
	Qd1Y0TpRKBQagrkftmQOvr81oNowsIwQLKlcZ6bQTvruTGmciO7gjICZqTXeqMqK/O7OFzkIyDP
	6UxyZYPDp2dzqXF1eVpNeoYBy6lvK2xrMaPv/uWxlQ6rRzklBgRpvy0HcUefcDzcKoItHETH7Cf
	//zxN1cuzrWlGfhr1jOabzPV5vegoU84lh9L1uS7o8ExkRmEyen9OclW6C14/ubYC9CXjzHIPZP
	IASfB8eXh2oddYK2YFb0xiEVg2qw4QYzOFe1QN/VYjhkKcIn3JR0yxohcK3GzP1G+boY9sTgSns
	DFrNBBByVJ3BB4oBGwFYBeCGRw==
X-Received: by 2002:a05:7300:d193:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-382812189a9mr862684eec.10.1794961614546;
        Tue, 17 Nov 2026 16:26:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/14] log4c: Fix LICENSE to LGPL-2.1-only
Date: Tue, 17 Nov 2026 16:26:36 -0800
Message-ID: <20261118002643.29829-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132609
Content-Type: text/plain; charset="utf-8"

README states the libraries are under the GNU LGPL and COPYING is the
LGPL-2.1 text, without an 'or later' grant.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index 3689824583..aa65d740af 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Log4c is a C library for flexible logging to files, syslog and other destinations"
 HOMEPAGE = "http://log4c.sourceforge.net"
-LICENSE = "LGPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
