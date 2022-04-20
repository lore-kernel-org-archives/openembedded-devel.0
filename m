Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DD5C64E66
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.10571.1650474970558879332
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 10:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l1fXlE99;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id r13so4914118ejd.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RymliMD8+GAtfaGAx/R1OKSyu7oGTijB/NaE4BiMtAo=;
        b=l1fXlE99xnc3IBRZ0Lc3QVjc+1qkBv9muWFHH7b6U19iJ9/fxnnPuzgk0iJOXz0shI
         TE4R8H7SYZ/9lE42ryFcB2VQnxKBzS0qnYCiS9fx5P5jLzBLeOVarPgTtrWG0O+SFbLW
         b11Cof+fOYSXX9O4XrecL+xjTKNnbcg7CbFGoR3GaCK9v1Rw1nQzgE4x9niCsAerlB63
         hCaMi6i0472lyFX14UeehGUCRieALb0rPcLo57B6dlhyaoHIJDDJxT+cs/KhhW88/TLH
         JyjaI99QZYMsVvjrSy/mRySax1gSmjSAtdgeS4WFLZrdIKGnXyzldJfT4wjIQ1rP3GCj
         3AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RymliMD8+GAtfaGAx/R1OKSyu7oGTijB/NaE4BiMtAo=;
        b=myA/ssPVJ4FJp4qgnQ9dXAXLyCN9FIGkbvmVuheVJbcu7S8JfNco6IhLecElL6gGhe
         QslJlzgy83UnGLAIMTjxM246bOeN5YggnqVoPU4p864pAI1DCL9J9DuSFDg8wfRG+3XG
         zMjwvFCuQ8LeRYA0qpUzBcg0z+cIpw1GkB2rAsEZas3j3d3/3UrMgIcPV1Lh2tLolNPn
         9FnvbvDMVgAKP1K4hcERAd+3aVcH5LjIh3B0vagMOITfo3dTG8Lfa3NNzHq5Qt5N3jbr
         pO9AucY0HYQO739VaD1f/Nq5yTC12mUQbNUaSZ8cby7a7yOOiQn2E2Tarj6eJ2qYZbkq
         uZIQ==
X-Gm-Message-State: AOAM530cFnCQ78U5EF6EHX+ZDAxNU9LUMFucbexzPYuvGzlGul5It+va
	nnmwjR3xHV3n5meRQfPy2xcFf3kdSmTV0A==
X-Google-Smtp-Source: 
 ABdhPJxV7Dn3utI/4WJ01v/Znve7oWCCLqH1/fzMnLP84bC/sBd8J5e3LQit/qBcz/m/Rbt51s0yiA==
X-Received: by 2002:a17:906:4c93:b0:6f0:2de:f42d with SMTP id
 q19-20020a1709064c9300b006f002def42dmr3820416eju.648.1650474968807;
        Wed, 20 Apr 2022 10:16:08 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 s11-20020a170906284b00b006e108693850sm6839551ejc.28.2022.04.20.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 10:16:08 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: version bump 1.33.1 -> 1.34.1
Date: Wed, 20 Apr 2022 19:15:44 +0200
Message-Id: <20220420171544.1840507-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96715

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.33.1.bb => netdata_1.34.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.33.1.bb => netdata_1.34.1.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
index f575a4cba..71fb0783b 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 DEPENDS += "libuv util-linux zlib"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz"
-SRC_URI[sha256sum] = "20ba8695d87187787b27128ac3aab9b09aa29ca6b508c48542e0f7d50ec9322b"
+SRC_URI[sha256sum] = "8ea0786df0e952209c14efeb02e25339a0769aa3edc029e12816b8ead24a82d7"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


