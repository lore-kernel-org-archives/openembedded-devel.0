Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22010C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.396.1636825570644731669
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRXT0ZvD;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id y7so11122578plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PG3AA2WZYS48xQ6mS1nmMOHxqTK5FccBibs92Qlt9Q0=;
        b=gRXT0ZvDJuEQBsmZ+2vluptqBDLP83xyhq3P0WFUYd5p5o81CUpZt3T0U+VG2F3fZC
         cmRXKcmNONHMbgKCYbSNEE/ldCL7DBmZaQh1QsQo6xv7EsT10fYSELQgo+qwweu7Gpf0
         r5ZxilD3T81bgb2VeFoyk27CPBN6GtM4944PIe8kA+/nqy/ouZ4vrt+1UUBveVuIUTpz
         oS93TaFfc0mL195rZmTBNw20vjGeM5+kdO2ZnWXe6hC0VRjZImrOFfWcQiZnqJAyA8uZ
         iH7pZhAR0+EKmFv+QOf0422JhX7QHnKXpcOXAUHYqxnSq+WA1Qy6olDNm/cRDEG5k+rL
         Krjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PG3AA2WZYS48xQ6mS1nmMOHxqTK5FccBibs92Qlt9Q0=;
        b=HPxqWfAXj3xnQ0g+nZ+nWeT9HdZEseH4N4Fg9Z8MDReUe5/YVfU0oTfASAimQn29z+
         Q9zbhix9myRbjFLxQcrvDBP5rqNDwckBHtks3kkizJhr70ax3zAs50iKIMiweYQA+2Zn
         PAamepXBFSEXAegRKLZ3iRDMojXgc1lYH8pLuRJIgwKUYUSf83oVp+hm3DUw4cTr/gBc
         tHTeijvaANemcm09XBL5O4d+qEC5B+vpzUKIZClQkrqsPbnu8TUiY5h2QGiivv2IKAIg
         sI2jBVLT+MXNRRGhtUdOWGd38VMu6bbz9WNLDK8ucWJiVf88Vs0Eht73pkp2tIvXpy7p
         RtUA==
X-Gm-Message-State: AOAM530xNohknwbGS+Z4PNm2l8mPCO36Lk7VfrNzSKEDdwwzr9vgxhve
	ZNE7HBYfPsHWqECApZ1JpIZaFnzTbFE=
X-Google-Smtp-Source: 
 ABdhPJzfygEcikMHtWLoOrd61d24x5Zi48/gbdgZW9NPA2rVAycPxEvPU1f0zk+0t/7M4zN1MQ1AYg==
X-Received: by 2002:a17:902:e890:b0:142:f3:7bf7 with SMTP id
 w16-20020a170902e89000b0014200f37bf7mr18629527plg.87.1636825570026;
        Sat, 13 Nov 2021 09:46:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/9] libmediaart: introspection is not valid
 meson option
Date: Sat, 13 Nov 2021 09:46:00 -0800
Message-Id: <20211113174606.2044137-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93932

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
index 31fe43bfa7..ffedb2625e 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
@@ -18,6 +18,6 @@ S = "${WORKDIR}/libmediaart-${PV}"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+GIR_MESON_OPTION = ""
 
 EXTRA_OEMESON = "-Dimage_library=gdk-pixbuf"
-- 
2.33.1


