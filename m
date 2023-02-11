Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E93DC636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 16:27:16 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.12522.1676132831776019417
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 08:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GkWWySf+;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id v15so6968491oie.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 08:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hL9rYlo5GHd8jvRDzo9Wia3qmWz3RdE/i1v11MUDdLc=;
        b=GkWWySf+vNqKifs1HSpZlHgUL0lX+vnUJM6bwx3j+Iiy/bHZVwv/zFDy0qVjPpwzGv
         rgNiAQIkQvbDy6Ann+kMfYjr7alaBeX6KVfQZsMgFNYQ+CNAg2t4FmPdfmL2y4pU6yCB
         FjbtDhCfjANoL1pvg1O+ikyDipQnkSl8xjXybPUZLJpFaGN2uoktlV6w4/D5o9wSFULA
         +Miayaul4fxKw8I4Ify1DqkNFjrW/LHCHJ3jxVSgzLbG5sVLThSbxc8Hw4pe4PRyNuP4
         Y4jAcLZ6zt4OmosmnBJsdVE0lf/sBGJn1iWg6bpg0QkP71FfRsVPAPrYuuviwfMPtxUP
         PA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hL9rYlo5GHd8jvRDzo9Wia3qmWz3RdE/i1v11MUDdLc=;
        b=L3YNQHltSVZC2Yv6+Hru2DSmNNuhzWfoR5joJcaUBUqBhYoh6tvaMPa+43rBKqKTZ9
         M7YBaF2HmlCc0O+NG580ao3MEj4F3QwY12lYEM81VHZnX6zsg/w57exS6UnhnxXlD/bP
         7OQ9ED1PU10ZE5BDEqkAtQmCzUKnsu6s2PW71d2jtYCNawaIFkMGGwsb5vqVceecV0Hm
         uCqk5vm2CBa+vuj0Ic1pq0t+Ae1wztI/Oh1iYRvCVWMGDl9r9saDR2ptI3L67LBhPXB6
         YIssp8beF0xinPdQOKkidqS97hrtz6PxfzHdH+ZOy/wZpYMqYcwsX9buiEQHw45dmxbW
         CeXw==
X-Gm-Message-State: AO0yUKUxPK/PAsZs/0jMBzp+5Oh16F4pQsxTLh4lgoPCaRD2WFki1LYl
	xUrn7AFOpeiJuZurZ/opF3e0We7uxuw=
X-Google-Smtp-Source: AK7set8XtQPr3n4N8Z4UFXRCAKIpnxgCeqz7bOC44AWYt8/JjcNBUFS/prDA1qly92Cy6JiSbzXpWA==
X-Received: by 2002:a54:451a:0:b0:37b:2252:b94c with SMTP id l26-20020a54451a000000b0037b2252b94cmr9889399oil.4.1676132830959;
        Sat, 11 Feb 2023 08:27:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id q203-20020acad9d4000000b0037adc5702d4sm3337950oig.38.2023.02.11.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 08:27:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][kirkstone][PATCH] apache2: upgrade 2.4.54 -> 2.4.55
Date: Sat, 11 Feb 2023 11:27:09 -0500
Message-Id: <20230211162709.3987001-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 16:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101035

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.55

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cba6df61c7cbc4446aab09eb11673bcb6c581307)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 02c53492ea4085ba13ff73063d6f9144dad5a627)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
index 37d498f52e..84bd0062e2 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
+SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


