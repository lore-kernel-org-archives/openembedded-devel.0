Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988A4D5B858
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.110.1730140095472901956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBot7D+Y;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28fd8cdfb8so4633848276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140094; x=1730744894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk7iHJtklacPxYSENFsGD8PU86mJOpmhoU86xiz5VXA=;
        b=MBot7D+YmxhNsQytl/NSym7wX83qJD2YDAtJsjNnRNUjvCb8369okzwGr8VP5PkvvU
         TBGiTtKcQNgpnIrbxgRTWj09aumF2qCESQ6fpcMBaQz68qkUmH0nFc+SQ+89oP8D6uhU
         iLjjF9RI+tsKRcUpc/tynk26i0WESQbmnENfBaGXnX3YRxf78oB6pVolJu8Tkb5Pbytt
         93ELVetJ7N3vVsP8UbyUiqJ3vmoToGu059BP1Q4hf+Th6c7ApniV3pyAoTLGHCs5GP1M
         tzr8R47Y7uBraEH+rxwMqrxxiMzStiWCJTGIDrobMerAox9NVjc7EQHAHYNRwTFGajpn
         7t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140094; x=1730744894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bk7iHJtklacPxYSENFsGD8PU86mJOpmhoU86xiz5VXA=;
        b=HfKLIlI51FKKCzruUdGrO/shFOZ6Wudg7/YreCY6aHkuzY0vQpEgZqzeVcVfQmTX6Z
         w0BcfIqRM3ApuC+3RQ8uDzFIfAosrVQp/Hen6Xf2gS0U7uzaeNFtmp4nzZ/JbAkZcoR5
         C1A8KAP8ALAAywU8/0nOGdzvX7XqjqpeNbtU7HZzur4nw2maiXcMqVLwkbUhDAYFTGwG
         6aaNqVmkHGVaxz9GiZPtUHpBhSMdf4F+SRUQfEWNOBkJudpeZ4Vf5Xw9D2ED+tkmfI7r
         AIXD0GqdxZ1QhuMC8LErNuCDJU6qiuogUzNTYc76ju/ASUY5hxamWjHGCf7kNeGnGz2j
         yoqg==
X-Gm-Message-State: AOJu0YyM68Rs+pYdVEjHJTUiWL114F9n5gqkPTvRTbK1/obwm4o5w1h6
	Qh4fIJhlI1s+Lmv6Tgdce35NSkmsM0g0X581Xi9xYyIAk5I6mrKmMMlvkw==
X-Google-Smtp-Source: AGHT+IFXSaXJDj4l8rqWd63J+o6ErVSnc5GQtMUn+dJRr0KyeonIlhUpHFWyXEDiaD0L23YFho7iCw==
X-Received: by 2002:a05:690c:93:b0:6e2:c962:75e with SMTP id 00721157ae682-6e9d8aa4138mr89977587b3.32.1730140093981;
        Mon, 28 Oct 2024 11:28:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 05/22] libdigest-hmac-perl: Use
Date: Mon, 28 Oct 2024 14:20:21 -0400
Message-ID: <20241028182749.5058-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113273

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
index 7b5980287..5bbabf24d 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=6;endline=9;md5=6321739e9ccbf74ee5dd
 
 RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/A/AR/ARODLAND/Digest-HMAC-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a"
-- 
2.43.0


