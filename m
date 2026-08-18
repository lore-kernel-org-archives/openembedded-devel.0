Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4598AC5DF7F
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:19 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2333.1787029335253114974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JvVgL4Kw;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso2597152a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029335; x=1787634135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=holNI403yoeKJWw7mRlEKrTOopPjNKU7b2OfCRIuc2g=;
        b=JvVgL4Kww0ggL19FnFxQctmel1DKETjsJK9+8m6zyB4eY9o6oTNdC/B8QH0qTHT11O
         GDtQiwTTg5rrwyZxDoLhZUYKOlFMCkMPK91EtNrQvyzfNlAP5d4s66FIvR29XcP1x5vl
         A06E3mb+d57NTh+lBl9m7liiEP2IncXIBNGrkByw1RsFGZOwvf2rnnLOkK4OyBQdJDlL
         BM7aUNdqmKcR+GNnkB4jDqGuX+xrhWy8sQwyz7wBN25if8QmfqKa4gh53MfuGIaUScoi
         KLwBUKSxa6jp4Mkp8GuirodpjcULVPWb2J33O2fPep6r5P9P8RMUkSt/dk4K/YlSi5RI
         gIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029335; x=1787634135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=holNI403yoeKJWw7mRlEKrTOopPjNKU7b2OfCRIuc2g=;
        b=DGnRU0pc5xaUvbl2TXjiE3bcJHyQeU9233BaWADBYWHTnXxrpkuGdWA1IstkGwLyxD
         PuU8XnzEzTg6yw2n3ELbT1ki0Ao5WlJvBuIFNxSMJmvroF1u0ptbJnZNib7P6ulb5vfR
         mbmQ6ufClFRX5uwaQVvaMRkpIbP40D/qFUICrMwxivT+Xn5CaTmxjxaOr7MiskaGRIMp
         ye2mRftQXGPgjkwDSfy/bso4ZSdDnh1Bha1Qgdho1Od3+LRrlsWkYMJm7VBbU/hRiOr4
         w+AzCrM335edA5rFnozkIdEjDCgHR+W2C+QY6ZcfueTsQ94J1p9F7/syywGM6Bab7PsV
         +EwA==
X-Gm-Message-State: AOJu0YzNfErVvPz9uZdfSjTffAIb1TQLlp8RIYFV3AxWRpHEGe16+0aZ
	VGkl6QbHT4SSJlIXkqfFrngMm5/sGiGDVESwk1xOI8XkI9WwCyRoJbmW0SQ+zeVq
X-Gm-Gg: AR+sD1219/1IYtGYLtkwyFCxvoyUaLGvvvkYvKpiyZQprudt41GgV6NkS+2fJl66l+l
	Hxdo3Z8/dtY4AD1hO5wlNfShn+h9Q8lFfcqZmgOGzGT3Bfrcc9mlntnJcPRZHObcZEkKaXm2gff
	Vqt//G0zZ2TmKER4+7pd+dMcgjH8d2Q3eu7hm7IP7P+GhjBbAg326K1N/GVakhwORnehXSHK3WB
	366GqM+HjMgo5QTFTXMTqN3qd/57G9Ej1dPJivAmk0cVKJDY6v7nr8QPxbb++Leo1SY8MVXtqKj
	JH2VOoqXeWIwQKJ7tQyoKdOhbr5RX/VoCiq3xJEWhOc4YQJldAa42iIoQt3wdTEvsJcudfAG4jY
	n6pm8VMERGF1+Guwpl9/xGpAaBBtj8B7FOtCJZ7n7ZWsy4sVZjFKld0HDI+zpL/K42xQe4P3FOA
	jdWehbBpbN7V5BfMepHAKh42gY2pMWmWuEgxRBk69Z54nOy18OahLHXtEO2sTY0fpCxynga6NfB
	A==
X-Received: by 2002:a05:6a20:a126:b0:3c4:3112:3b with SMTP id adf61e73a8af0-3ccda66defemr5927098637.18.1787029334423;
        Mon, 17 Aug 2026 22:02:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 14/27] keepalived: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:09 +1200
Message-ID: <20260818050123.2901739-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129213

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version keepalived
...
INFO: Current version: 2.4.3
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-daemons/keepalived/keepalived_2.4.3.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb
index 2d9802eba6..07ddcc392f 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
            "
 SRC_URI[sha256sum] = "a0faef8e401c143487b131b526df7541c1e33d9b8814642fa9dfe8bb250a9632"
-UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
+
+UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "libnfnetlink openssl"
 

