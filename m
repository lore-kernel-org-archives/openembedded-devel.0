Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62738C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 18:46:35 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.534.1646937994489577461
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DeBlYxzn;
 spf=pass (domain: mvista.com, ip: 209.85.216.45,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id e3so5923679pjm.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jKpdbx7yb4/BOATces+NcjobbpzlFUALiwHSRZrMM0=;
        b=DeBlYxznX3PhMxOu2hV+PFV6Nw67vYq+l3wI8IfWnJ8yoQNdID5dcaT3o1F/gpo6Zd
         utpiNtLFvHz8/yTT//6lrzfaGqSpWbsVJW+AffdNbOcQZkDlpREIdQCdVS3KYrSO/NYP
         aFxSjH8br/eLmKNnhlHYe8Xcneh5ijlYbAtYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jKpdbx7yb4/BOATces+NcjobbpzlFUALiwHSRZrMM0=;
        b=5/HDoJoJjXsSZlGIsCBo6rKoonPsB3o2OmrVFGW5rTj7DCIFHVKVrJrsnvABIoIZVS
         s4sOEaV2N11sifpyVX+3vz7XEjOBpUs45/WG9AUewgNqYvtcwXJ1t2T1P3o4AUv9PlYw
         1e/RDYvv5zkXKMQ/LRJmo84TccM0UAZxVbze6Wio8CQLsXaxfrgU3UjvMMjUqULQDg+u
         YTW4pHVFcbO92VkgnsLtX9zOY6OJbYRfk+HVmv61ewLkZiKJTqVwVX+qxOp8r9JeOFAh
         AmvRQPyfRYuDooUzgF3luOLaxjmXURTC5gkepBrzDQAJ0cDVVBn5ZuOhAJcbg8rx2mmW
         Umlw==
X-Gm-Message-State: AOAM533cqrC/wepmFtueED2Z2iT+bHrOFOtAMPKVumYDRrxrp9B3rcCG
	KgvqfE2rJBnrfneBzwjBkKegnkCv+CS8yg==
X-Google-Smtp-Source: 
 ABdhPJzKHw3ApUTkaZ9pIeSY/DXmvGMIWHBhAdzjfmDoLzJvQ4PQNuOGE6yqWQMTucRBJl8XZiTKOQ==
X-Received: by 2002:a17:90b:4f4e:b0:1bf:88f6:e5b5 with SMTP id
 pj14-20020a17090b4f4e00b001bf88f6e5b5mr16768098pjb.47.1646937993715;
        Thu, 10 Mar 2022 10:46:33 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 u15-20020a63470f000000b00372d063da1fsm6214668pga.29.2022.03.10.10.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:46:33 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 10 Mar 2022 13:46:31 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-oe][PATCH] nspr-native: fix ubuntu 18.04 builds using system
 gcc.
Date: Thu, 10 Mar 2022 13:46:28 -0500
Message-Id: <20220310184628.304309-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 18:46:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95939

gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib
-lnspr4 -lpthread -lrt -o abstract
../../dist/lib/libnspr4.so: undefined reference to `dlopen'
../../dist/lib/libnspr4.so: undefined reference to `dlclose'
../../dist/lib/libnspr4.so: undefined reference to `dlerror'
../../dist/lib/libnspr4.so: undefined reference to `dlsym'
../../dist/lib/libnspr4.so: undefined reference to `dladdr'
collect2: error: ld returned 1 exit status

Pulling in -lrt, does not automatically pull in libdl.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
index 2717f37bc..b60de08d2 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -160,7 +160,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # preferred path upstream.
 EXTRA_OECONF += "--includedir=${includedir}/nspr"
 
-EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
+EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt -ldl'"
 
 do_compile:prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
-- 
2.31.1


