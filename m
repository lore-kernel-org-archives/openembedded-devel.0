Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DDDE7719B
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.48494.1736119453207984823
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsthncFV;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e46ac799015so16768584276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119452; x=1736724252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gQ7xe3W1hIe+rOwhTmmNrbSCdfLU9knbVM7Mieogx8=;
        b=GsthncFVKhqBzJ0DJtF2Pzqg18y3/Je4eA5AdKwvShuwbYMT8qiNN6YF9keebYIRNK
         vSlHcxomQM8nUJC0OEkOV2hNsXm7sBpaNFGuMDHNeTXcwlWHqlshpkDCuANfZpeOHZdY
         gsX5pC2qTA9YV8rcd74ZOjfPzjbFPtpYFm0w44XZowJ+blIEG5O+DxGsdGA4mtfs6zHD
         rqXRpVLjzgKdsb+dIZvtzocCRMDJa/7AIjYv8Q8HrDnv9m+BUn0MsKtbsfWKEHlp1Nrv
         mO3yuMhBFRICoX9DmsWfjTUP3Ge/regGhoTNZZCMK8jzRAk7143t9GiWiestTowAN/8c
         jCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119452; x=1736724252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gQ7xe3W1hIe+rOwhTmmNrbSCdfLU9knbVM7Mieogx8=;
        b=SQJIOTE9IPXnHP3F1uBCsv8ugy3nrwuOLWIgxoQmyT5zFGoBxi1qKoWD/JQqptCxS/
         6bLEpN+6392b50e9WusOvR6W2lMkYIORSvqsvchy8tU1swEBBuWv+WZT9By3qkQJk8my
         PO2SAykV45JwQI4IyX7gnUclTper4JTZ6xBBpvU71GvdfoHGeKf+MviWf6/Bmx61L85f
         aFyrHNI2smjM7V5UPXFjT5/nTbFBBufZ3sz39GDpG1/UNKiPJKNe6RPxPKjRfcKeDovM
         ZTr48uQEahW7gad8NMDKgjACFLHyuTAXZmqwCi4GgfYV0HttdThVoG46WuJcGJFSiYVh
         bP2A==
X-Gm-Message-State: AOJu0YyyRe6EmT7s/Ipb/pjC7WpYWyoQASwDiSqiT4QOgPtFHFvJdu86
	5LYARURTIRdyqB6js7+ulzhwz+6+TmZNpoEPAUvy5wbhUTlhfuda6rnr+25J
X-Gm-Gg: ASbGnctEiQ278QZMLBjplMZORGPqPSxYcTqetxDOTuYTnN2L+U0rQ4lsiAhJOMaxh4F
	OaeGkUsvjJ16N9LNCfnR+OE3uh/CBM7lPkLtyju3pYg9VjKrT5+i8FMM7lxdiHA0f4F6ETLuu3P
	7KZ57BpcIvTWSk0El/aYZCn0X072MOzny4IvmOMYjOoZxikzY9cmU4gpAh1BsFZHWtvQlwF9MJQ
	OWoC3d7Vu8mmiDQq67M+tuX5F0iMEMllNnRuErN5Kz/7ifcDJl1OO0A5ygV7aNFVPACLw==
X-Google-Smtp-Source: AGHT+IHVDvGYtBja8Tt9YH/MzGhNSdhERLryg0H0nxUTxpIyzNWvx2KeBezOOrF0OQ0CPTItu4u01Q==
X-Received: by 2002:a05:6902:2845:b0:e4d:25c6:c398 with SMTP id 3f1490d57ef6-e538c20824amr32316744276.1.1736119452267;
        Sun, 05 Jan 2025 15:24:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 20/24] memcached: ignore disputed CVE-2022-26635
Date: Sun,  5 Jan 2025 18:23:53 -0500
Message-ID: <20250105232358.1502946-20-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114650

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is a problem of applications using memcached inproperly.

This should not be a CVE against php-memcached, but for whatever
software the issue was actually found in. php-memcached and
libmemcached provide a VERIFY_KEY flag if they're too lazy to
filter untrusted user input.

[1] https://github.com/php-memcached-dev/php-memcached/issues/519

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 889ccce6848276fa68b3736b345552a533bc6bd2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 270ad5486d..7234f02a13 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 
+CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
-- 
2.43.0


