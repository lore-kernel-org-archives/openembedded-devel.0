Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEE4D3E2D0
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.123.1730140103846692025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUKlj8mH;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea11b32ab4so7985347b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140103; x=1730744903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVclBNueEV2e5hZAmvAuvEc6YiY6hXGMdce3GZHOK+4=;
        b=RUKlj8mHwHZTpRD6Ysp2dQ0nWpJ25w7/quHf6VWTUbmp/m6ZjrFsRdkv9rBwQIF0W/
         K3fawpo5NwhQ3Q7/sQanxKh5xGztC7z8DGgQHSumngJVIUCTBKnoZtR4/Z+eXu/A2ZTr
         qXy8e1oU6bEzRh025t5ikBOiUXahPL8Jag/5VS2vSPDt7uPOFW1BIyZlF96uQf8HqDpR
         6LClrjMSSXQY0PGN8sBBRtxKtXpGR99zaMaOZU+69R62hSWDuZDilu7zlqgGzxR6zpf3
         ukY2vDPfafDpKod+/bKoCGrfM8SxBq56siOhrhio7CZzMdbf8H15DJA/RMAJnnDbrXM1
         3zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140103; x=1730744903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVclBNueEV2e5hZAmvAuvEc6YiY6hXGMdce3GZHOK+4=;
        b=v9ly/F3zpcqq0Z3slHGTjoMighuw+HJKCBEAS9EzvG2dblZNQCAKdPunZxuyj1PDwv
         5nODPC5ehzA9tHviNXs0XVlvMFHhtfoove2DwKF1Qsl9d7iuvx9Z+q/ePnbDN9fA7W+u
         J1su723v+U1h6RvkAuEKTdxyFvebY73gj3fjEh5srYpFdDKNROJUugqKQB5tgo18AvEr
         qyozE1MdrVK5kVSP390VPTkiAOBNOkASwPC9PCXpsRBh7COPpp13EpkK2CFXKI2LO381
         6Q+jEaNM+rcyhVfOETCoz40ysho4/1Y9SONkkbklktsZYFrxoQ9GMBX96KCf+vWVWlLC
         TbpQ==
X-Gm-Message-State: AOJu0YyZKv6lCX9apiqyJPDg8R4vshrzOt4ZikVsxHr905Q5MPu/ZPuf
	6XZlJRnxgeKA2yceKrY1+fE+bLOL/aPGfy6SwMTnCqvksSqxxw4xuCIssA==
X-Google-Smtp-Source: AGHT+IHolIvT/jcoD7ZU3uECfDEPefyaV95yWfHGAiDvN3sE4dIiCvqQPLAsIflOtNFtnk+PR7/Y/Q==
X-Received: by 2002:a05:690c:445:b0:6d6:5186:32b2 with SMTP id 00721157ae682-6ea22e5e846mr6614017b3.21.1730140102507;
        Mon, 28 Oct 2024 11:28:22 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:22 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 18/22] libproc-waitstat-perl: Use
Date: Mon, 28 Oct 2024 14:20:34 -0400
Message-ID: <20241028182749.5058-19-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113286

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index db7ca17ad..d9424ed4d 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "perl libipc-signal-perl"
 
 S = "${WORKDIR}/Proc-WaitStat-${PV}"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2ea1a41bd0bf4474bc"
 
-- 
2.43.0


