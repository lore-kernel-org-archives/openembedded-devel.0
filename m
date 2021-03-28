Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.4272.1616909938884863438
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Mar 2021 22:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IKV6njLN;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id v10so7303179pgs.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Mar 2021 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+CyKJxESlwKDjja6lDzo2bUm6joXdi+c/hUekVIS1GQ=;
        b=IKV6njLNVWUoNcAhJLKU3zAWGHLj1LVhvbYEVCrmnDmqjQa7Z7gqy0WLn6SfRrr//o
         1USE6hZz1J0cY/Zo05RFmEbYZ+XctROBdOa3v1S4sYkO2xx9xU7WSyXMfmQRjFrSG7rO
         16yIl54ceQn7eAkF6scUXPHQnqT582z71UZIqxd6RMWm09dssDb+R43qH7LdO3OAtXop
         ODD1BEGVeeZBQX8onqPC8xIIUagYsjcl/RXpqeqyo4+OjBAe66Cn3nPdO7iw9JZUEBye
         qiXowrVvwdV475wFmP43e+rwuSZIkAlxrC73KDfTxhJxav7gFA04SOYETn+MC2WVKKkn
         yF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+CyKJxESlwKDjja6lDzo2bUm6joXdi+c/hUekVIS1GQ=;
        b=azx517j6YVtI/6HQp6drsZ5I9CcNZCtCXQyk5Ey0zPm7n2/VlGO65dQlUD/UPB/UhT
         NAMSg7whzs3I35QUoPIVhoHxWWG1C7e4hxpxJWMjopSrbfNkNepeBWCCLzGuhv4YQbRS
         AXH0LHrGI66EPN37/pMVU9QglwBdDUkYq0pYDCDlqDWFGoQq8Fv0kfMH/Om6fKA536pi
         VKnO6X+pX+a4A4TR4QNf+7m3hnYfvAZ/bXQ0iEttRBC7oKy1vgMaEtzbAETxv6BmUVdd
         Br7yIpDmDTQVbp1WRihdwTgz4o1bt1mzSPBzYxiowiRfuVr9p05VYi19Y+0mO/4CeEmv
         5p3w==
X-Gm-Message-State: AOAM533qwXmV908kD2KDBncQ7wGe8jPP4WqnYIJD4fM2JlLWB2rYL4gv
	qTn5KeVCOvjwqFMAlGeXd2Kl8eF9XWGwzg==
X-Google-Smtp-Source: ABdhPJzZomzRVJOeTYrJ7PkGpw4z4AN/Go1/Ag3WNP+hDT7IEaP4c03UaQiMnWEvWyCF6P0Wp3VAwg==
X-Received: by 2002:a62:7ed2:0:b029:21d:1806:fe30 with SMTP id z201-20020a627ed20000b029021d1806fe30mr19992487pfc.5.1616909938261;
        Sat, 27 Mar 2021 22:38:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id s28sm13982212pfd.155.2021.03.27.22.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 22:38:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] sysdig: Depend on system libb64
Date: Sat, 27 Mar 2021 22:38:53 -0700
Message-Id: <20210328053853.1287969-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210328053853.1287969-1-raj.khem@gmail.com>
References: <20210328053853.1287969-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avoid using vendored version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index bb9f2da7c3..d9da190578 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -15,7 +15,7 @@ JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
 
-DEPENDS += "lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
+DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev \
@@ -30,7 +30,6 @@ S = "${WORKDIR}/git"
 EXTRA_OECMAKE = "\
                 -DBUILD_DRIVER=OFF \
                 -DUSE_BUNDLED_DEPS=OFF \
-                -DUSE_BUNDLED_B64=ON \
                 -DCREATE_TEST_TARGETS=OFF \
                 -DDIR_ETC=${sysconfdir} \
                 -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
-- 
2.31.0

