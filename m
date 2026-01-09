Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319ACD1A617
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:04:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9467.1767963890816016123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIkAJj/r;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47a8195e515so30843615e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 05:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963889; x=1768568689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAhoa8ABIMFKL3CR7MwJSNAJyakSeq3qxY6jrsNLoKA=;
        b=fIkAJj/r6ARSIRVtEC3EJ0n6HpfdEjPGXfoFRVwFwGhVxaoWVbUQSIKEk/aV2c1oqv
         NZChE+tpQqNHPI1h2R0HQB8TYPVytUOn2dThOGnybrJQ+rSrg6Oy6hnTukyK2p6d9qV5
         ME0VnJCv09WcfSrLvtg9xlfl/JuCO6Ei7ARS17pyP6cJz2BrZAP6vHfBy/ojCzd9wRPO
         eiwLfpahfkP69VqbosaiQRcDIcCqXNpc7GkFN8AS/yEEqv2Seo4G2NUg7AO+69Vf38zG
         HzkMFp5J1yoOvD8IYO52wY2S2YwqVAtTzJMA10oVt3sU3oJWHlkwNN4R7eqoqRfMmgVm
         +J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963889; x=1768568689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAhoa8ABIMFKL3CR7MwJSNAJyakSeq3qxY6jrsNLoKA=;
        b=q/dW0uqGw7+uhUfzKTGAq2epDVCIG0nHB/BH8pG4gLFmiNB/fnTMvD3/xVQrYiDNzW
         jWEZGggndw2kgjW0GctvIdoB5ASuoueGGQDkADKKyvCfO9tHjyjhdvRIMgS3e7Dq1s5f
         utX7lIevC8/rRyGa5D8QB+Sx3w7PlSV0D65hyuD5+aj3Ut3k4vp5UNgZF1sfgzbQ6/tU
         FBMmZUSlaZU4tUjhOvqk24fN6BAARA2CRG9s4MXjUVzLiT/q90p/5MnW14nAXIBEEbB0
         T71EgqhyGZETQGVtaNYZtlR5RAHXqmK7ERBtj8Rp65+u5o3R4VYyqyV/I4JcXyDg3vhp
         ATuw==
X-Gm-Message-State: AOJu0YzIPr0yQBEpbBPqas6OZPGb7lTazDFsqPPVcbrDWYgxSdCuo7AK
	aVngR380PRfB7obQqtkFR/+PpaLlrh0+C1YR+xuYtHD+n9f0ao9b4RhMiZZD2A==
X-Gm-Gg: AY/fxX5S0Gx+DdUNqUOFTd60BlNm/BfurHyAaCZdxbg0ggTT9lJArde3ZBFCGwOZHmG
	TD0a0Z6Uy2wvKSjDZYKTgUuVDPMuUZzhOQFYApHoT16jnKbolzrP6N7W2hn1eN6epWENn/RQ65F
	az7xjpfkQv16BSefqNarZlm8jXEoey8+LztqPk+JU3HYyEeM391GfQNcDrHCsNPI2hp8FMYqW1/
	oUvqtUbKd/WaXhkBwiS0bfJ8DVzTehKBiXY8Sxe6Gy2FhklB8kh/0oIpqabBrUpV5mI5NXdSZIG
	TCCi+wk64wak4ubbX1/lVbSCEDefpf42vW0eRWqovr9CLWcodaTJHBtDWagfLNWTNNAcZE7Rnvs
	WZwp7jSiJoXAAM40WtoKJNkJQ71D98zYRA7hPFH1pkTmmnGmBYOWSsph1q9D2zzvT6dlYDOe2aW
	VMuGnOF5o+
X-Google-Smtp-Source: AGHT+IFoEjFwraVRDYMrnXigdz7k+9NtigjJc1yZIt4hXx2BZdEFu1PfbLRzlJ5EcbFYUrECff+1mw==
X-Received: by 2002:a05:600c:3556:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-47d84b0a23cmr111954715e9.3.1767963888758;
        Fri, 09 Jan 2026 05:04:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8718c610sm62000315e9.15.2026.01.09.05.04.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:04:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcereal: set CVE_PRODUCT
Date: Fri,  9 Jan 2026 14:03:54 +0100
Message-ID: <20260109130354.1591041-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 13:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123299

The relevant CVEs are associated with usc:cereal CPE.

See CVE db query:

sqlite> select * from PRODUCTS  where PRODUCT like '%cereal%';
CVE-2020-11104|usc|cereal|||1.3.0|<=
CVE-2020-11105|usc|cereal|||1.3.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 7d4a352a31..914058b5d0 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "\
     file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
 "
 
+CVE_PRODUCT = "cereal"
+
 DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} "
 
 PROVIDES += "${PN}-dev"

