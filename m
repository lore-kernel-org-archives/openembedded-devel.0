Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4E2C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24373.1786747587272933474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BfYSFsek;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1400982a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747587; x=1787352387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZyAlNyQDHjHjmHtglW9aMMKt8UIZJe8fTW7wf3T+uNE=;
        b=BfYSFsekybh3jZtiwE6ELdXatoEMkMObipnEB1xk0AGW06YZp/CHpG4pKl+ygWsciw
         AfjrOHVtfFY5Hvim2Tm6oOfQ138EmQs8hgaXobUmQdEU8kaRDXnW5ZyjmeEFKPFxcf0v
         EHy2KG7SkyYg/AY6YbrRtkGcxxn4Xzgz5yZnxoAUI961OYYCEEAR9k1oww0I8iEziZru
         rRil4LPnDB8yxwsQFBDgZLfMLwQjMikqweqzDnBslqE5mfrfO9XUrdS3dpvjz0v7m6Al
         +uNEU6ZLojgh7W3WqkVltWEooGzYBw/P378vLKHrpdzgGN2McsxvHVSS0WTUHaIUbq20
         gsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747587; x=1787352387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZyAlNyQDHjHjmHtglW9aMMKt8UIZJe8fTW7wf3T+uNE=;
        b=mKAA0t+9W6Aaqy4h8ccYxE4scIHTkU241GCTETeyx8B/h6lYvPPqhOMFSkIhEaYJ5k
         IVptN+X16evn/Rx4znX5iyLXb8jhZNsg0sgwhD8mjWMlxb70tIR8zChDT75nDas+DpMm
         dn6h94Pp0VLHOGakn4gj1fe2qAxNWlKN7VH+ZCUf5AzEHn8+DSvNMeTvnTuu1t4668/A
         t9vPAXhy7EdJ9hYhDNQt2VnPDzU2Y4bc0wgFWTglmG3hyvftiArlAabK5cmPDc9/ZPg3
         zWNBYNAQEmfp4lCtQP8Ne9RxKlvT0JKTZu5KnpKikTD/CA8/lx9yR059BCyHgUJIeDVr
         swgg==
X-Gm-Message-State: AOJu0YxPGX74z7U/n6tQi+RuyIoGZPrlYhgmP9/oc8itssQoAlEPsSWj
	CcJxf6XYirr3/o8tYZ+0pYwdGjZU/QkUBKFflThpRRJRMyGoSmN20IGxHAIQN72C
X-Gm-Gg: AR+sD121xfnVLMdQ3VWckAKt2VT3buTCMSjOB+8Caf+eUOPkFSEn3YLOnuVP7DGUFS/
	LFjNfUY2iIswz98bI2Wtl3LTO9yCS6iauirUGEsWzLidpINbL2bNE7xbpykl4WE1keOX0XFy7oR
	wXrsRPQQifjhJ6NmnEcjiUeemM61EQQw7F57VntMMJqhGNAz7DUcODZJ5A77pKDXhv8jFh9vo9a
	9oGIWdh/qd+MOZGk3ZuCeQX9H1dKRKJIxi0IyApUGuA3Ja78nCdt0pm+X91M7GnyTeHKyGROoUR
	Gou+FboITvnwqhc/6Wt/G1s6w2T8ylinzKwdCYzDSx86QMiEM1ZEg7YLpNUgK++nzXYKjVUJJiW
	tUUF5N8lwOFYCIvax5NnoF7d31DViidVbLh1waXa9H6SfhyIkEK3tbE/mkJUxQjAhfrqlGVjScs
	sg4yCv4AmOzXGrIH3VlriYrsAiuH+39LqG5NijXqU/cqVlGsgej5SeEurwsSYkb0pQ9AKb6YO+x
	2AIc+hjHAddBqGByQx7iO10izEbF8Dozqvlj8TLDZJfmbdzCcSbvQAhAV0YVywsBDFgolSmWLw7
	RRiP4XjC04nSE429hgTeJi/79p88vJIYaslmYxoSUTNWsXvKNXVlZz3zegkJpm+npdhdZGxQw12
	ueOYlgrKm/BroGe3Ak8DCjyvePbSmZHNwQJouDhTtjfbbrg==
X-Received: by 2002:a05:6a21:998c:b0:3c3:75ff:95b6 with SMTP id adf61e73a8af0-3cc71d3b98dmr10293180637.31.1786747586570;
        Fri, 14 Aug 2026 15:46:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 040/109] libsdl3-image: upgrade 3.4.2 -> 3.4.4
Date: Fri, 14 Aug 2026 15:44:26 -0700
Message-ID: <20260814224539.1523174-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129104

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsdl3/{libsdl3-image_3.4.2.bb => libsdl3-image_3.4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.4.2.bb => libsdl3-image_3.4.4.bb} (90%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
similarity index 90%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
index 0f7ce92efd..3953c6314f 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
 DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.4.x;tag=release-${PV}"
-SRCREV = "96a73a551a857b7c8d0ca3cc553a266eabbab6a7"
+SRCREV = "bec9134a26c7d0f31b36d6083c25296e04cabff5"
 
 EXTRA_OECMAKE += "-DSDLIMAGE_JXL=ON"
 

