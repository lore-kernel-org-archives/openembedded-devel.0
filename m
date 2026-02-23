Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E94EC1133
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:04 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2739.1771874336564453155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UDPo6XTB;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43638a33157so4394645f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874335; x=1772479135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMTLlvOZ9LtaJm5V9E5V67JFsNU7O9iqXBsZJjvSWNM=;
        b=UDPo6XTBXqXWPMqSwmEptR5tlMK0BJV6kADXVl5UJj7e8Sza2a76w2iSB1UUm6/e0g
         sLvKvv+lLt5IlkSJqw9FdIOs3bgIB5dEIu6TTIRNTDdeP8b8adbwph9eyO6IHujjxJzv
         wgTJiAk5SCmTRehDqlpjB3FPVinTfith6iKVCaQLRIX9QnkY6IwYFckf+dMrkftwZnJJ
         x1nbw/liuWzfL0o0mFeWBtmfwJEk8DBFvQOD/hm/dXM+/MkidzQPdlXhzfWRtNem+ciY
         a0VLq0JJ0C+fUteZpamZ+dgktJksxz8eQMh5gyXQNFloIPhE/fhwLqWHh2WCIlivd+5s
         nApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874335; x=1772479135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BMTLlvOZ9LtaJm5V9E5V67JFsNU7O9iqXBsZJjvSWNM=;
        b=LMmSe33VNyFBF2uXwYwOxX/77sQoY9B2pT5qBk+1HO1dL9s53hxNaI8MlGrItdi5vk
         R0mEdjtRMsu6eKf0CCR51bH298qkyHuVbbb1kZnPmhxRDPrQlOJAWJRRGsV5n5mIM5Sq
         46gtdqbQ3OpMqIsBj2e3aJvIm1snTV1vzUPbCXHvPTrxJogwC+ZVvgPQVrL57d05lAy9
         F0r9cI6KYgVnroZiaWPXHhcI1iorcZiQx2SruLSHxYUIcGLnQbmIRItsKUdEsECgVl5f
         7uuQc8Pa/QkBjaxizxwP/FRw983v7RPmBL5IuZXj0hWaCHQM4BXX9HUckZRYwPty2kfh
         0XJg==
X-Gm-Message-State: AOJu0Yz9cDdiGQ/ouuWbl2wk4sg5On3N3ETNUeQm2COYnmHz8/NRnGTs
	1QAm7LYtIuJz8NgMANmmSYTZNSrknl0oPgFskCZpVrdsM4+x3b4YIIlVeMMokQ==
X-Gm-Gg: ATEYQzxBMQbtCvGH1qfS3QPwMmesnqubXcjMS+yxQ+e5i/zd7RbibiScgRhAxcxAh1Z
	OqihNwYOYHlMrrCrouE7BdVPCFqATHvLA1hPleuRPgIDld+0uRpj/qx8Fx71nCqk7kyaXaqbYxK
	j8k20AN7HzolYxRaS/B5uF2ERKzROqV3egub/uqqGzkPzbED1CQo+aTlu5fPZpA6hu5salW4Ovt
	x0qEf8WWq0hlftRj//ysdtC0KOd8oQmgvSYjM66ULmo6FMby3Dr57v9GBux8+f4Zp6vIT7bgD+I
	o4cSYB0ic1UeSDPjp7sK/HhFdK/+/NH9liyDfhPiaxU60IWjPpbm7Zr1hAvnVFAVfCcuIX/UJyL
	u38y9gl01Ksbmyxj52qeI7okVPz7K6ovXg4vPlzTKZFiCnBb1Eqq8ilT5SQT34rrIHOjQ/K4LnT
	0c8ClQyOwGA9aJlAgCjcUo
X-Received: by 2002:a05:6000:2408:b0:437:6b73:ffa9 with SMTP id ffacd0b85a97d-4396f14c9b4mr18101035f8f.5.1771874334783;
        Mon, 23 Feb 2026 11:18:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 05/13] libcdio: mark CVE-2024-36600 fixed
Date: Mon, 23 Feb 2026 20:18:42 +0100
Message-ID: <20260223191850.1049304-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124559

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36600

The vulnerability is fixed since 2.2.1.rc1[1], and officially
since v2.3.0. However NVD tracks it like v2.3.0 was still vulnerable.
Mark the CVE explicitly patched.

[1]: https://github.com/libcdio/libcdio/blob/master/NEWS.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
index 11e84c6505..20ffbffd98 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
@@ -29,3 +29,5 @@ python libcdio_split_packages() {
 }
 
 PACKAGESPLITFUNCS =+ "libcdio_split_packages"
+
+CVE_STATUS[CVE-2024-36600] = "fixed-version: fixed in v2.3.0"

