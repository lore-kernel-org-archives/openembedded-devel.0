Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36EBEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 00:21:54 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.787.1689639712731045413
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 17:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vbta8Yu0;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bfe6ea01ff5so5287120276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 17:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689639711; x=1692231711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUIqkhAgxFd2choa9C3yILoMCCm4pbeOQevVOjPxv4Q=;
        b=Vbta8Yu00hnm+Ri9c1Djpk2SLl/aa7heupaKnMxXxNR22RJx1PHkHi1r8c7V1E38+H
         nEzLwQfXJ/9c72Ue3ZFX8o4h+xP2TzECILjQW7sQWl0ZTMAjCbxVNs/dBFJzE4vP+6yW
         pYoFhQKF8ejhLJgURp5GOhODgddcj+e3+4q01VCVXEZBsnX/L/TWUHN4YwQfqjZNyr53
         WpUoDBZdQ/BwbRg7rScj1AUoyrzemOdVvKLquMm81SIcjRAQ91fJRYslk2G9DuNhP6F0
         /fW1TPHnei04+emKPAR44tz8Ro5GRoe7bxUeG7YXssPBYUo6Se4R/7BfZxnDGBfIwxEE
         zlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689639711; x=1692231711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUIqkhAgxFd2choa9C3yILoMCCm4pbeOQevVOjPxv4Q=;
        b=eq4LViqwhQPT/mbsHznnNtwl4nUMMfG5ul/+BTVm4yI7p4fAOktdUB/8uwpsGd40G9
         9Bir0tkKytBYe5Unc5aLyIWhM6XYsQtG1+a7anOCmUTUb9e+ZF9SXPWxhlwSpv0wR/CE
         IZu0TJma56db3W3E8ahXID1IA+blosKDOpjMaxT18ofAdkqtjDx3xbKhh6qqbnpiDFcd
         DsGp2TrEQ6XXdWPie8MRXILwMyXpT2WiD6b2u+Ib7XQdAwVwageDtOMHc/lHRvmFrAym
         QJ0T6B3jLBZyOjwp8/Qcnva+ZgWL56GLyqdS4aCpukoeYZnvtZiVB5ygKEqW5rmOZfed
         YxJw==
X-Gm-Message-State: ABy/qLZhr+VVbyQl2Hm8IJixfFtrJCKwt/gjmywsCYc67zHH2C8C1zMS
	sGlTPPZck8QTBqaXKwYKD1mzUJopuIg=
X-Google-Smtp-Source: APBJJlHgpEvJsn98Q1RZf2yYEqFL68kAw6KieSq0mD/7qIO/yV8dy1H25M0a6XX18Q0nhDItfrV8yA==
X-Received: by 2002:a25:f508:0:b0:c12:29ac:1d36 with SMTP id a8-20020a25f508000000b00c1229ac1d36mr13438233ybe.7.1689639711529;
        Mon, 17 Jul 2023 17:21:51 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:6e92:5d66:981a:9de1])
        by smtp.gmail.com with ESMTPSA id h132-20020a25218a000000b00caec634aaeasm188868ybh.50.2023.07.17.17.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 17:21:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/2] sysdig: Depend on system libb64
Date: Mon, 17 Jul 2023 20:21:48 -0400
Message-Id: <20230718002148.407319-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718002148.407319-1-akuster808@gmail.com>
References: <20230718002148.407319-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 00:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103891

From: Khem Raj <raj.khem@gmail.com>

avoid using vendored version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8053b7e2b21c651b34b48f025f47cb511c36e37)
[FIxes this error
 --- LOG END ---
 |          error: downloading 'http://download.draios.com/dependencies/libb64-1.2.src.zip' failed
 |          status_code: 22
 |          status_string: "HTTP response code said error"
 |          log:
 |          --- LOG BEGIN ---
 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index d15ecdb03f..b06340f82f 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -15,7 +15,7 @@ JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
 
-DEPENDS += "lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
+DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https \
@@ -32,7 +32,6 @@ S = "${WORKDIR}/git"
 EXTRA_OECMAKE = "\
                 -DBUILD_DRIVER=OFF \
                 -DUSE_BUNDLED_DEPS=OFF \
-                -DUSE_BUNDLED_B64=ON \
                 -DCREATE_TEST_TARGETS=OFF \
                 -DDIR_ETC=${sysconfdir} \
                 -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
-- 
2.34.1


