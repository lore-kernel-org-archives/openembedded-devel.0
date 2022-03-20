Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D2C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:21 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16038.1647763701121486507
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gFIedEpg;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id p17so10287221plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oism5oxKh471U4bYfD5jpCqouUKQRD5bOa7pwj3nBxA=;
        b=gFIedEpggSPzsfKuXqD0+vKOpDuqOnKCG+xIyl16E7niwV2idEBFPViX9IpmDTaahn
         AW1pfGwbNx6TUweFhZJoGWL+ClHxPWNFBbHQd5Ugwdasr8IIoKglWYruj5EHCcY6m66W
         uSrN/zSXq7LyDgHEdZkjMhvceEaQdsvp2K1DywgLuV4L+67a3IOztXMGS2n9lypWwfVp
         KIlPhqsbzUahqt/KoPzEnEOdEV+KSdcP67DhQdc+BLVD0DuM9s+I3wUKgFyfZm29XBp4
         km8jVRjSk/Wolb5fYXEzemvaac2KKzQgCm168XY06SrcepIznlcisHRvcS4C50k7+teo
         S+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oism5oxKh471U4bYfD5jpCqouUKQRD5bOa7pwj3nBxA=;
        b=3GrWyeQd2R2M6XFzGBXFItQnSmglxPwZIHTjAdjpQluN1CPWr/d7H7xJ9rqlSqQGRF
         8pCh2htg+BoleBYW3q20wjajk06CzG094cwdrgj6cvhoev53cv8OWLWzOE80bWvIQLwi
         ukTXtfIJkZ/N4X3BdEhiJLjQl4RoFCp+0kuxSJEyH2tFeTzgsVWiDkQoazsQ8MaiiTT4
         l0uwZxc/58OrmzjVllRKnnFNkF3BZt0jHkPspfHHefEyRVL6X3EAcRI2nYGwweHq+pHN
         auk0t7OUgi5x6UrywkXDdEXrGsTf9T9Fn+YzB5YLwIJTEQatkbcCIQnKgDSKN0SdjxMY
         z/5A==
X-Gm-Message-State: AOAM532PSaABdypI54dNLIPtX0OTStvOswDUzoe99vyCglxelnz0qmLI
	PCy09qZS9pHPz248TNUrJuaniI86Hq4vhw==
X-Google-Smtp-Source: 
 ABdhPJzhDVofi0oJiMfsWD1d6v7W4xIXqBaCdGOFJCfCZn3KHXt8us7Oxsym4vaDpAs/lrIZ0MrUWQ==
X-Received: by 2002:a17:90b:1e4b:b0:1c6:edfe:70ad with SMTP id
 pi11-20020a17090b1e4b00b001c6edfe70admr4403238pjb.198.1647763700390;
        Sun, 20 Mar 2022 01:08:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/17] msgpack-cpp: Upgrade to 4.1.1 release
Date: Sun, 20 Mar 2022 01:08:03 -0700
Message-Id: <20220320080815.825928-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96069

Use tarball from release artifacts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{msgpack-cpp_4.0.2.bb => msgpack-cpp_4.1.1.bb}       | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-cpp_4.0.2.bb => msgpack-cpp_4.1.1.bb} (72%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.1.1.bb
similarity index 72%
rename from meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.1.1.bb
index 25b199f572..fd08bf85cc 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.1.1.bb
@@ -7,16 +7,13 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                     file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
                    "
 
-PV .= "+git${SRCPV}"
+SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-cxx-${PV}.tar.gz"
+SRC_URI[sha256sum] = "8115c5edcf20bc1408c798a6bdaec16c1e52b1c34859d4982a0fb03300438f0b"
 
-SRC_URI = "git://github.com/msgpack/msgpack-c;branch=cpp_master;protocol=https \
-           "
-SRCREV = "3bdbf0d2ee75d46d71afa691a594777d89a22cf7"
+S = "${WORKDIR}/msgpack-cxx-${PV}"
 
 DEPENDS += "boost"
 
-S = "${WORKDIR}/git"
-
 inherit cmake pkgconfig
 
 RDEPENDS:${PN}-dev = ""
-- 
2.35.1


