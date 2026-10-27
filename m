Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19433.1793108993327917022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J4bM4h29;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so6189255e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108991; x=1793713791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZEChmybU22P91msyjOjuoGemse+DD1GNR9GjnRHM3I=;
        b=J4bM4h29LAKDsMyKGAcvAQW9rfEIRGdvA/occ8MkePSr6O0yFOhHbvxNcHv0uEdNSW
         qcRcDslOdF/Us3ivO/22kuFyjIaAKMCvuOQwEzcKfPSKsyp/kNNIY+T6cHgGTEe3q/jb
         BZeD4gYokItGalcoR4TvUS/nclh4MwaG2QS0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108991; x=1793713791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZEChmybU22P91msyjOjuoGemse+DD1GNR9GjnRHM3I=;
        b=JXW5luvkSB2Z6ApehgwUuHONlsGRAFSInT61aPWnRZy5KwMDtX2w15ciUc3YvtKAIR
         SLy9yO9g+x5u/uL9NeJ4d60G0kUX8J1JNPU1XgnFQszFSAqAGZyPjyn+qFInOFEvVFOc
         +Sd+J8XX7r0o01VH7XdAlPoUqa/5EOae6sDTATdAXuXzrE/H2kN5wk4t1PN/uSEzlrKm
         LObBPJcuZjh0nTkkiwu7SOUIEIcfUcPRBf5JLNobTl5cU096CUj8vi/UabZngcoOIUkq
         SyibzEKfOtXxUi4r8MXleGR0FL8yM1U3N0XF0BLCA/knD0ObNyHxayZDIMlQc20xy662
         HfHg==
X-Gm-Message-State: AFq9FYIOgBRGAgMlgzi4vI4GLeAajbkeIj7NmDZC0znQWn2e5W6GVZLi
	wLgMVDPig5t6KNUscB2SrxVo2oSjQzCr8Kfle27iQDMINwOVkXETmTP6kU/CmcNEaICq4ELgmbx
	1a8ci
X-Gm-Gg: AYBFou0mZtsMpsZt6ySnWGws4mU9FThjnppw20YnreMzhfPSJ7hAE1rqWGpaFaSaJu/
	BmtthjgSHTR9VcstVaLHjxWgQOOE02m13nNZl9tQUskTT4drFyrEo3ydD2LFYIcBpmMR4eJdJRR
	KwXADwwl1ZMWVjynQ611+raCnOmnkKshEHnjnFg9eVIVBu83VP9zyVNbNSWTfg77ETTrz12A/fD
	wILUw5dmHOtIbZ3Wf07AY14IhStO4NFRDEq1D6CBA1pshUOCAkwkQp3zWDsChz0rKt+p9oNFZ2M
	WfBGwFwe6pD8GhrS2heLAlU+Dt+Sb8H5LLAYGTkCL/gfFWPLef0eWzwTx397MhrCJGcqewm3R7I
	PWeKjLivp40l5//iHOsEbS1x2Zhol16qJ6zwqNFsUZpx87KbCyyr1LaPXqgFOWFT6iNw9itOpwN
	v7XV3ZSgc3tp8eE0XO7tPbtCjPiluvHvfPb5ygdF11CU2daGcQH+ax6MP+96pjbGkOPCkdXl2Jx
	NUtjGi4FYEzvxhGx8WKtLldFy96VfBDmlEjHyLiKm7MEsGG7ffSLniSOLMzJlBeTy3cm9KAspwR
	GbCZQPzoWLUAmxGo6CMvzMjgaonMnezhIVK8maYZYll9Y7rTnFTr2xqBLFo3oUPqZozw7riTtJk
	UV81z
X-Received: by 2002:a05:600c:a318:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a7c0b3f6c2mr43259285e9.8.1793108991622;
        Tue, 27 Oct 2026 06:49:51 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 6/7] uftp: Upgrade 5.0.3 -> 5.0.4
Date: Tue, 27 Oct 2026 15:49:42 +0200
Message-ID: <20261027134943.1011404-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027134943.1011404-1-leon.anavi@konsulko.com>
References: <20261027134943.1011404-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131535
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.0.4:

- Fixed crash with large jumbo block sizes with encryption enabled
- Fixed NAK counting when checking for excess NAKs
- Fixed invalid read of server -a option
- Fixed fragmentation for block sizes close to 1500 and 9000 byte
  MTUs
- Removed unnecessary PROXY_KEY messages during unencrypted
  sessions
- Disabled deprecation warnings for OpenSSL
- Cache name lookups for incoming packets to decrease load
- Minor fixes for Apple builds
- Fixed Windows header file inclusions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/uftp/{uftp_5.0.3.bb => uftp_5.0.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.3.bb => uftp_5.0.4.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.3.bb b/meta-networking/recipes-support/uftp/uftp_5.0.4.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.3.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.4.bb
index 6f0858cc95..ef792ce616 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.3.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "cb8668c19b1f10bc63a16ffa893e205dc3ec86361037d477d8003260ebc40080"
+SRC_URI[sha256sum] = "50df3f0e59ebd59ed1b9bc8af991a0187df14d928188ff5f62c3d65adcd113ab"
 
 DEPENDS = "openssl"
 
-- 
2.47.3

