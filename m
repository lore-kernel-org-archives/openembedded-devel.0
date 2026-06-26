Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A66C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 19:03:19 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42067.1782500598985824501
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 12:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n7xCL6Dr;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c8b23420bso2224658eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782500598; x=1783105398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gt3HkWgY2iM1CqZHHFdqVu+kWrvavfIebBwnPmm45Yg=;
        b=n7xCL6DrXG1n5cip6FlUKldJSvI8OLKOH4shcI94KaGUy0eQFV402gHsO5hy3Hzedp
         1uLzz/6GY/CxPerVuyh9g+rvospZPzV28ysVV+TH9ULQR/UaEjnucH7L5U8t3wCGo+mr
         Rrb2QWaZwrcB6btOJOIYcWrHuHTaEgWnedygH5ce/BJ7iri9QAuMktet6qJLyjnamyjO
         WkN3h5vX5r/qGw/bxjBoHXQYZ0r+vB9ohsTSaU8BrrMh/KIaKyK50QSwtgWR53+mQBbP
         f8lizKzUUd6zT6+5l+BwNjntaS5LqmKNTobiwcKBoouuxfJpzXeM7d02xlzp5W4BFlDQ
         8fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782500598; x=1783105398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt3HkWgY2iM1CqZHHFdqVu+kWrvavfIebBwnPmm45Yg=;
        b=KvWpXAI1dpLtyWiViZJYDkDUzpRLr+zAAvLx+Ob+mQtotNYuQ+DrQ2r9mLBeksYIQw
         GsRi11q6YcrFNDwFRJSGlL/Mdfn79X+Zrm04rBn8c8iWphKAvBEOgwTms/OXEpwZl8yv
         Ji+nacGNaAtwpZoJ3AXCAVDvYLD7PyHbUbFFQa1mLncQkAxAmAB96gH4vDzazY4tnUOS
         o00ayJdMEJZCd4OA9KNer5+4LrMsmKdhvIafbAfoxmYydteZkuUwtkypv28GduHNC2Pg
         /DW8R1RBhZeEIWU/1ROy8sAW/4+30hPHHi6IWUp5ZeJK6AnKq9ZVbajegmM4QtFI0y4y
         owDQ==
X-Gm-Message-State: AOJu0Ywn8GLrY13ifhHhorCnAJM+s9DdWcfXeYxL3qH6iuew8/Wbidi9
	P8S32rWHZSz6als6k0PxsbFPq9N4QUVcKGJvU8EEEtZOk7ECJnlQrzDN04nr6tB3Zcg=
X-Gm-Gg: AfdE7clxEmjhflgA9ONCekA3uD2donD7fepZeo6BnNg/bXyW7/PQVIqkaBk5s8lPHH+
	D6XD5vo+klKuVzN8aSZt/Au8dUUK9oZhQ6Zg5Zp62hK5LWvGj7eD2wxxvrEnhQE3BJGeq6da37M
	VaSEP2Wu3Z25uDhmRN174Lv371zTYLPCvkwZ7oasdDhTVD5F2OnsUQ+ky+wIbpT4+iMz9ndpNU7
	hnB+6Cu8kDGzQj/Tv+lev/1iw/1YvQnlS3yUYuFFVDXtOT0u8uydwuOHk3WcMKqS1GfzAy27Vgz
	PGy89LRM9qkRhgiye9ahJVl3u7gEzgBYulTgL0F5d5N3uAaLmvaSYxnE+0UNMf8jCHLEc9mh9CE
	Nt2lcJ644GXQHWrtjnlcchsWNEegMab8ybF0yN46OgfWGIOM9c2rfq7c3fq9eCle+ENKXd+pTDY
	TgrfH4r62eKK2i8oLbSLVS6JVpym1NaS7JdZ1V6N3ukhCebCO10m1XkWVQuKRxmOXO6WVxK6P0z
	PqieLumYdaUebupdk1gN2POs2rXEwBm/AhbvyXHKG0lksHyEc9Cp6REkMRzXhWBK2mhDhOon9Ns
	xOGA8o1A9d60tN6+iW2SZK2RCOO0gQ==
X-Received: by 2002:a05:7301:1930:b0:30c:639f:ff8f with SMTP id 5a478bee46e88-30c84d75564mr7946490eec.8.1782500598027;
        Fri, 26 Jun 2026 12:03:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm27311270eec.7.2026.06.26.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 12:03:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] lftp: upgrade 4.9.2 -> 4.9.3
Date: Fri, 26 Jun 2026 12:03:15 -0700
Message-ID: <20260626190315.2303392-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 19:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127809

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../lftp/{lftp_4.9.2.bb => lftp_4.9.3.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.9.2.bb => lftp_4.9.3.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
index 927916f985..38bfa86751 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
@@ -7,8 +7,8 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
-SRC_URI[md5sum] = "42ec1793c386702bc2734ffbc8a5cff1"
-SRC_URI[sha256sum] = "8a07cbf4df09b107fe3fc41d133ee2f6cea6ef4c33ccf06c8448ad058cd96b7e"
+SRC_URI[md5sum] = "c32e15b96c08f7f0b2d17efbceb00db8"
+SRC_URI[sha256sum] = "adceaef1bd21a38d07c973233fab603813c431f0a8dcbd23239fa9a41ae17b6e"

 inherit autotools gettext pkgconfig


