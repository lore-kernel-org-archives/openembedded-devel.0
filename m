Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78072C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:55:42 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.2486.1667361341527593755
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=evuP4nwN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id i3so15280693pfc.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 20:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfXbAwqIQ8ooyl6fDnavRJiIU9CuxautppqTGRWSV90=;
        b=evuP4nwNPtaoJGU+8Aea/5YXRQAeNWQm2vBt4GX5OiFzMmg1xezyJygJWxVfA/krHp
         +mx7g1vwcmL4FTYrJa4bfnVy6vmXq20p4LPzAHTaW1t1YLwBJzmECRlVk2xGdNxZ4EGs
         XSNDhzygXkX6PwYjZr36wqoXsiwXr8VPw5PawWNPG310b+jQqMfoWfWiq++gLJrQYcRV
         j7CLsXKgy2609EJ3crBkyg6DhnDH8rDWptcZDdT5WCFm9zuW1BDQEO8a0fDZUxvmGlZT
         hjxfYShOmZce2/zaWIr+MC0ovdR0HyS03TGN6rSzXfsl5B5/5PoH6E7mTovYTMSvsoH5
         sYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfXbAwqIQ8ooyl6fDnavRJiIU9CuxautppqTGRWSV90=;
        b=r/dKi9n3mjIzVGWDAah3CnrmAVBeX9Vphcf0R/MdBv3jQdwmzx1t3gVO3rPFYuwF/v
         BzKygbwi+bCnRQkVeZoq4pFArFrwonBlEv4ofnuxoVNxT25q7DYaqV8m4nJVLIJvNS4n
         SGrz8TZ0xY0kPJZvG2gXDI0uO6noKz04yyRQdsYcmSIaziVQyORl8b6jD4JifGNcU+h5
         fR2dr65lL0xY2qo8PvRu5PVtE9RR8n+EY1nCjWFatvkiy34MR4cEYk6MKndPt8uEL2BY
         8g9sw58KPtmjZlKVYvk03WkfYZ+MfPxX+eHykBqygabo+mQukdJsZtusygJ9WH9u8V77
         pmww==
X-Gm-Message-State: ACrzQf0GU6t0c95D/nMFKWUMugXuMsbhn4FHyRvXz29Oi8ArlM2paOa4
	VX8ApJHfrIcQ7RldAsDwkzVxwwW+1wW+CQ==
X-Google-Smtp-Source: AMsMyM4Po6Zv7PMtsyf5uNF6TMlT33TYh+hM1r/KeblskEdp95O9PCkILyt581wqCO/MxocjtB2Jcw==
X-Received: by 2002:a63:8741:0:b0:470:ef2:6f11 with SMTP id i62-20020a638741000000b004700ef26f11mr72300pge.455.1667361340451;
        Tue, 01 Nov 2022 20:55:40 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id c2-20020a63da02000000b00460a5c6304dsm3514585pgh.67.2022.11.01.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:55:40 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 2/5] libcompress-raw-lzma-perl: upgrade 2.096 -> 2.201
Date: Tue,  1 Nov 2022 20:55:25 -0700
Message-Id: <20221102035528.3967640-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102035528.3967640-1-tim.orling@konsulko.com>
References: <20221102035528.3967640-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 03:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99402

https://metacpan.org/dist/Compress-Raw-Lzma/changes

License-Update: Update copyright years.

* 2.201 25 June 2022

  * 2.201
    Sat Jun 25 09:50:04 2022 +0100
    367f6414d5eb54e5f0d1d07ceb1c909ce5ac84d8

  * 2.103 3 April 2022

    * No changes

  * 2.101 20 February 2021

    * fix version numbers in meta files

  * 2.100 7 January 2021

    * Expose liblzma's 'preset_dict' feature
      https://github.com/pmqs/Compress-Raw-Lzma/pull/6
      4d9d4e596c4f567c87626a827e39c4435e62472d fix typo
      dc394d53b0575edf8f72e28829a2ff9faea7e729 Add t/10preset_dict.t
      c5afb68e2a3a4b2fc4e548ffa61d2a3a383b5c96 Add cast to deRef
      32f9085aba510c4d99d4a374406e734b13b82eef fix minor typos
      55b8d6a6f65a1d6426c55f5b51aefdba6dabfbb3 fix merge issue
      9eb88de7abaaefe736d475260c73de525e7ae39f Merge branch 'master'
      of https://github.com/pmqs/Compress-Raw-Lzma
      3432a769b283ac5dc9fd757e973cc8aefc1e2345 Merge pull request #6
      from anall/wip/preset_dictionary
      68fe695c16b14a983f39c8c8567557148bbc43ca Expose the preset_dict
      feature from liblzma when creating a Lzma filter

    * trim whitespace
      4ca252f1e1d740489dbd3736ab1f74e1492dff6d

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...lzma-perl_2.096.bb => libcompress-raw-lzma-perl_2.201.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.096.bb => libcompress-raw-lzma-perl_2.201.bb} (76%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.201.bb
similarity index 76%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.201.bb
index 0cd876be45..a9a5570d39 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.201.bb
@@ -5,12 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2d411393b876fe63f9f1d546363f1a47"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8f4f1603d6e92a381ce2f595ab3cafd5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b5079bb43712fcd1e74b80777fa376ed"
-SRC_URI[sha256sum] = "f3afb267b1303b0f125976e9e4a70c6a4a205e35e7c99b408911f5e5c6578217"
+SRC_URI[sha256sum] = "ccefd0c0379fae599e2f24570d51cdd8135c161519f7931f0b6cfcf0366094f1"
 
 DEPENDS += "xz"
 
-- 
2.34.1


