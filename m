Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705EEE7FDF2
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1568.1770066852206554754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LyFxstMR;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2872139f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066850; x=1770671650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TndT6eysvtRg/EF2RNhGNQC/5+ewhT0sqlCoGo7/WeY=;
        b=LyFxstMRsSYGVpToMIWy6veF5ZaRK+RXTHVouS+rHNF3vxiQPEYnSThgm9+hVZJSsy
         qgayjOnnIiIB6bmJuZPzK8zEux4N3YuhD5ScBrePtRRSCRT8xmabA57wESqoBmh07dz4
         qrGHACUpfcscUSqbdp8S6jefo17Y3fvBGF4W0v0+SzrqcjwF+o2NopY5NWh8w2PI7A5C
         0VieDZoN90h604A4dkBI4ROYlTRE9/xI4BSLP19z9mbDfnEhwRq07YIkbo1ZtmNzeuTh
         FPiwDX2eirLYTW0nRVkfo9qGqBWBXH0QSZCNgAPBEy824zE1JRNdL0WQqlRUBMuLz4l1
         sopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066850; x=1770671650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TndT6eysvtRg/EF2RNhGNQC/5+ewhT0sqlCoGo7/WeY=;
        b=lY0SO/fB+OXPoGcy1o6PNlL8dSx9lXklAn6hUVd4HlzTbbzbJpKEgKsU0ayd9/eBwk
         Ei+TwBPcV/ybbfYArbv4egrR3cx+iCGavVqAFVlTGvHM0VeUhxLysImM8nDYg0R9fs3B
         jxl41mlQMMLgIG8S4LCSjyf848ngXjGRFG6aI0ZNwP1z/nHuDMCpi2fEIIWqJn2LPkLa
         8BVYPZP1tzd5rwuROUen1FlbDiyp5y5WMB/N4sKaCgMICXM5DSQaI2wMkWz770gMiJgy
         ALQasJdsqHPeiXl3J3bPqK5KojISin0XUO6tjAE8D24/4r1PkfFPmDFSXCbPG1ZLDwIz
         gFgQ==
X-Gm-Message-State: AOJu0Yyq9FTqY0QwWaNK53xxEribuiuihaHft8cYP6MHr2BeC55DxgU1
	+E6lP4HzhhtRmA/fW5vlJzPMZ8WjNZaXaRwgu8UzB4QAPoA2FMQsM4AHoZM1Ag==
X-Gm-Gg: AZuq6aINfvZOGT8U7UcAmU3pKj14iyv7WTtF+j5HdSL29nxaZj52G2i7NsAilOrwK+b
	UibcwL7v74PUNAiVb+o5qZzabq+mt2Ct/OGG1c4MS8rlGMXQijCu6K0O6DU6Yd7zVhwJGGanQ38
	uCxgfI0lnOqAXFyOKDM15hMEWnfEkR04NFsWrgFfkVFqKo5QvY2fZHZ9qAqlit8RpWnKRliIcnX
	UrbLskVJelodDboptjwyQW/e2o6jXquvsoQQ9XWT9BRXou0zczbsS6jv1INGYZVRtfAOW2ldY3X
	yuYFsA0rzKwfIhoPWnI/HrzeErPMUmNCLxq3xwr/7WV6Tnymv+1LzDlpp+ozsjYzgxMKqzM23tO
	ceEEJGMJWmK0gNcgdmLA5c0GvYio6SsEVRw4bBlVZoVNUSu4YnfWPI4DjY9F99ugzWUNCha/CR9
	sLob2CSO/udUCirlhjBfw=
X-Received: by 2002:a05:6000:2404:b0:430:fc63:8d3 with SMTP id ffacd0b85a97d-435f3aaa5bamr17118388f8f.30.1770066850483;
        Mon, 02 Feb 2026 13:14:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 12/15] ndpi: ignore CVE-2025-25066
Date: Mon,  2 Feb 2026 22:13:58 +0100
Message-ID: <20260202211401.1287664-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124085

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-25066

The vulnerable code was introduced in version 4.12[1], and
the recipe version is not vulnerable yet. Due to this,
ignore this CVE.

[1]: https://github.com/ntop/nDPI/commit/b9348e9d6e0e754c4b17661c643ca258f1540ca1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index f0175167a4..ae6efa802e 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.2-stable;protocol=https \
            file://0001-autogen.sh-not-generate-configure.patch \
            "
 
-
 inherit autotools-brokensep pkgconfig
 
 CPPFLAGS += "${SELECTED_OPTIMIZATION}"
@@ -25,3 +24,5 @@ do_configure:prepend() {
 EXTRA_OEMAKE = " \
     libdir=${libdir} \
 "
+
+CVE_STATUS[CVE-2025-25066] = "cpe-incorrect: Version 4.2 is not vulnerable yet"

