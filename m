Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA07E92724
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 12:11:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23594.1766923880195210783
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 04:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nC55T5Cq;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso65973245e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923878; x=1767528678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43VgsrPCdW21XMoAXzHIlXKEj8ceflUBfQHbI51cAoM=;
        b=nC55T5Cq71tOle7mepo/j0JbhZPkombnYf9yQW4w9/ay+tRfoEzC83Tf+senkZyUb1
         gIXqU76Crj2jAibNhGcvNbM0U42aHcuytHzZ+mMI8lOHVKwhrjUwCAvoEXfMJdnhf5ML
         OOVaXcdADajdsU2euXJnRQ/jaz9wPXFEhczqCFDoR7U5CFtWcaMKezkz/t1eWF5elVQo
         VMTHlYE1whyIi8zXTrbHXgOco4CSqdDUMgsIJuPGTv63Bpupa93YNpkdMSzx8ScQuH53
         Ofp2eJama1r8dtnaEAJqqZ0rAX411U3hRdrO8n6nilRTx81CyS5tG6xFcKGK5P/Bbh0H
         NLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923878; x=1767528678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43VgsrPCdW21XMoAXzHIlXKEj8ceflUBfQHbI51cAoM=;
        b=FGB3681W/R0opgNk5HOygS5zi4vpSmn6CFHAZq87kbI3f1llhmoucge1nA9DtZljxi
         ZZCzjLV8YuJu8CHdfT59Pq9oMQb36WyGmyFji6YoiVZamZOtPFaka/4a1FkA76MrJAkk
         TeZ8/TsXXMJywDRoTNT9lTWyQpsXgyjGRsxey1wWe3tLfX4OwZ3D66z9Xpav4DsYN48m
         Fe+i4Gjn3B7fTdghFLzkRNvIb1KlsGCcxXL0O4idLhp+LHtEn1wAAHdE4sXrwZdQkCBn
         AueZTeRK+RlwF3im2WUr/BYy0IzH2H8cihKoR4MBDyAVZaRyOktJyEkiM332tM2ygiQA
         53Aw==
X-Gm-Message-State: AOJu0Yw1ya7o8Ww1336f3bZBBuEw43ZOAzfEY9ZeFlC/MWKm9il22Zyd
	mCjsI8obgDRhCl/Z8VUkg3ZOb41SrIOGwunWSMe77u8jdMjaHVYQmURqv1heyg==
X-Gm-Gg: AY/fxX5UWJD7lhzpe+tMw/ASLrM+h8SxSOoOA+b0bJ5jkDXJb1mVAn4ul1SInJHCj0W
	Ec1VLpSNsKaJjjZZL+a/cw2GHRDbVKX8V3AgCCCBCXJZZlnI+4Q9bvD+5i/SDI5mtG2WtQ7KB/w
	h1rMNpzIcSH71MVREIpIDYotZIXD6e1wKxQpL8IWfnLOkoH/v5SF04l4xuZqSMHCeFjjcHU+Bt7
	L+yLm7nRUIsnNUpl1q2Cfcj7uRiDexQ5FzIHOht40YVdCo1I5TnQ3CNxRw5q5H9KeXDT8KxaCvN
	V5VqwclmEd2dBMw7tPzaCteIC7sBK3g+TINgnrxssbgdA5o1wci98HVlhGb9Dd6JjrWdKSDVgO3
	Uaj8WNDKJSOi/AfQiFAx765yVzfv/RrJIYqH6AaEnWk7wR9lsSMgE/3cET4wfgDtfBUKNSV329u
	5/h8A/0Tk0
X-Google-Smtp-Source: AGHT+IGhyL0fnHfZbRPJDZdu3FK37AZSeni+UXoLCwwE2hewr2plHQfTwI0m99GZ0tnDB8CxSUbUsA==
X-Received: by 2002:a05:600c:8718:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47d18b0ad6fmr302024725e9.0.1766923878473;
        Sun, 28 Dec 2025 04:11:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm546859805e9.6.2025.12.28.04.11.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:11:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/6] xmlsec1: update SRC_URI
Date: Sun, 28 Dec 2025 13:10:59 +0100
Message-ID: <20251228121059.1810946-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228121059.1810946-1-skandigraun@gmail.com>
References: <20251228121059.1810946-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 12:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122961

The tarball was moved to a subfolder. Adapt the SRC_URI.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
index 0cca2fe774..4408f79f78 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
+SRC_URI = "http://www.aleksey.com/xmlsec/download/older-releases/${BP}.tar.gz \
     file://fix-ltmain.sh.patch \
     file://change-finding-path-of-nss.patch \
     file://makefile-ptest.patch \

