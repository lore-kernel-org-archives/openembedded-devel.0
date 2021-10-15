Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9429DC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:40 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.4271.1634338599373019354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=PyZDJuIb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id p16so47916616lfa.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQu1elHHVDe28XvxicLEiCUlMIfdOt/JI2+VDmSd5vU=;
        b=PyZDJuIbRE1pHSMIdBuaMJUugeV5KEfoIDui/yhvR0skDj9njljla6LHb++WOzw1sl
         MtYWZkSUZk/buXhEN/EYr/f1OB2j/IaNYvJtUoCbi6qMYDcAVTV8gkSeqkZKnQCbDR4+
         DBLj/y03s6S6zk9yCTFwGifFGO45XQ8/vkBi63rMBuv/plCXq2N2YMdADYTF9T+ilYBk
         Ust13I2v6zbS3KWOchUkBl+SudqRAj0t3fs0xtqetVVvurQXr1Ggh+VwFCcLmPCZNMdm
         GOJWWKwkRjl0dAy2WwwzAAGVpBdLQoznfEdy09KkHWp02ADcHroGJnBGrU4Qc4TdS0Np
         5dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQu1elHHVDe28XvxicLEiCUlMIfdOt/JI2+VDmSd5vU=;
        b=GkHui+TQb1slTU99kkrJ5pOduvtwtSnhobBhKTbL/wAM2tU9pdlyXkyIfXfyIQeygO
         Rx1u9dS+cZm1grSqkHqATg1s1xQvTsyGI1hfqF2jj0WQO2RKc6i/g3/G9z0wMXvAyAm0
         a3QELlTyEHNVAfUPzOCt2lD/LvLT7DE/0oBmjBdXnssK0rpAoyJ58CYGubV4kFQr9Poa
         nXyArcbxDDmyhFhqmnIku67QSfyCcuN5umCwM5OESQ9kpwRP9U81hkN1fxdAVlPDbQyD
         YnBWfD/aWN8yFVgkC2XwIocCs4Wdd71/tXhptWUrkWONfgQF7HilKR9Tb5/ZLY9l0bHt
         5qSQ==
X-Gm-Message-State: AOAM532wPMlfLnyFyNT9B30o9LDhD+X64Ku6ip+AhjFErQb4q+tdbovR
	JCLqcFuhwRZEt7e6WlF6YH9S0ShThnZB4AQe
X-Google-Smtp-Source: 
 ABdhPJywY91xCC6laKq7dC3pD8vN53s5iQGyJvIdFuevEvnsQO85x7ewUDq+c9MqAYAVqzaus80gDg==
X-Received: by 2002:a2e:8756:: with SMTP id
 q22mr15359619ljj.271.1634338597475;
        Fri, 15 Oct 2021 15:56:37 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 r14sm655722lfe.13.2021.10.15.15.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:37 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-jsonrpcserver: update to 5.0.3
Date: Sat, 16 Oct 2021 00:56:35 +0200
Message-Id: <20211015225635.4163153-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93363

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...jsonrpcserver_4.2.0.bb => python3-jsonrpcserver_5.0.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.2.0.bb => python3-jsonrpcserver_5.0.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.3.bb
index 492ed658e..c2500300f 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.3.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Library to process JSON-RPC requests"
 HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
-SRC_URI[sha256sum] = "0c9e5b9445621138521e912016ae39b3badadd2607140dcbb0c8062934ab4854"
+SRC_URI[sha256sum] = "0cc514559596fa380bf188e31b0cdf3d9e6d9cc162fdca8a49ed511b291a9ae1"
 
 inherit pypi setuptools3
 
@@ -19,4 +19,3 @@ RDEPENDS:${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.25.1


