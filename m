Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00116C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 08:45:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.82106.1657010724727393419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I9JHRHEa;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id k30so6231772edk.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GfY64Cxxok2MOtfO1asaopIgsPCVhtWwwZKF+XOe3sk=;
        b=I9JHRHEaV9RcxmSMjvyxOoj6GP6C27IFDKJ9jnt3fKwfYh5TBMqZGmO32ndmB+lNZh
         kRJ7QxhMJqdw6qmmjA+dgnsaPA4dsn0bUm5QEny4ZDHmA+zqP57HmaTfEv5GQZWu+Ze1
         9jfOHXWDr04u2idpoE4vmzwlvqm4qAmbmDJQS+LuZqUoIv2vlL2z71O+UXpbBzv+tNKW
         mHGH2vD9mVDr2N9AgshiJJxTR1NQRa4IXnuZY2y6DB6RZWH4rneQrcn7kjGwBB/iyeik
         yftjxMTatTyNayXHA6FHB0GSouwwpX9ZdFeT4tuUntMpTAPCHItOazJJP/2kn0d2nnyX
         Nr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GfY64Cxxok2MOtfO1asaopIgsPCVhtWwwZKF+XOe3sk=;
        b=ApAot+xGebCK7hn00yNbgwbIvWxt7VC8kFD/rgsdeIISjq4u0xg0ggdYnKWeBfhIUX
         nlrP+AAQLncSyrvqLlYXqrL8BtDoLbag59qTXuqvIEQ3n/iUCxis9/d8Lhp1COsVcFOE
         o3uDbCdBQA9E1I1Sf8RvF7nZYKV6yDYmyRrR1oLWRTpj+65Z1JOsQBZrUwKVZTW28cjn
         OGdtFhwvhHVtyyvVWaYPOBIL+cuIsn/m3msO069Ix9iaQ/4b+N2qq5TqaSt2MyBPc6ke
         GwYs+/qQWIU3/Ouhj0UvmRg2EYV48ETk+CKWDD2+Zk+HShP1HFzJ1K/uPchnqidh5BuG
         fePg==
X-Gm-Message-State: AJIora8HQoXiapHdlBBXpiw0Rn95SiJCzJ6xp9gTN7BeVmp+czIn07fk
	3+RfW+7dbpRpG2bDA8FQoMS36pG2gT8=
X-Google-Smtp-Source: 
 AGRyM1sHR0ajRNejfugACOo5AMxZpT0l/fb/bqBIrz6J6aD4otX/rDeBbPfbPLFhOAq5QewXyDNMqQ==
X-Received: by 2002:aa7:c2d1:0:b0:43a:997:c6d8 with SMTP id
 m17-20020aa7c2d1000000b0043a0997c6d8mr19685643edp.161.1657010722897;
        Tue, 05 Jul 2022 01:45:22 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 ml22-20020a170906cc1600b006febce7081bsm15483485ejb.163.2022.07.05.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 01:45:22 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] imagemagick: upgrade 7.0.10-25 ->
 7.0.10-62
Date: Tue,  5 Jul 2022 10:45:14 +0200
Message-Id: <20220705084514.202324-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 08:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97714

This upgrade includes patches for the following CVEs:
- CVE-2020-13902
- CVE-2020-27829
- CVE-2020-29599
- CVE-2021-20176
- CVE-2021-20241
- CVE-2021-20243
- CVE-2021-20244
- CVE-2021-20245
- CVE-2021-20246
- CVE-2021-3596

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 008a83f46..b8167f5a7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a \
-                    file://NOTICE;md5=a2aa6e41f8a40700196a9ce301693e34"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b97c12a9213df1499565d69b92c73dd7 \
+                    file://NOTICE;md5=d8b9d2ccf273687ad12ebd06e5d8478f"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "_25"
+PV .= "-62"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
-SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
+SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


