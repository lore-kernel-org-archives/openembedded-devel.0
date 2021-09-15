Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.7960.1631714128848879592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fwgwOlwG;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id q22so2847310pfu.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4hb7g9SyV14ZDj2pko+DwZITL5IeV5KJGdLJyBnUP7I=;
        b=fwgwOlwGEwYwQlf8kvopbjGZkCQQuNFA5oSZwah2WGna5dgpeuYAvqYJoVf7uAjPEO
         JcvnxHfe0lW56Qs9tXoof+ApfrWot+CVVHfhSOYkLL/1wgLIq2dT2jLmd/fIHPBC91e+
         uselL0sAh3yqrWMgvjmrUaqxTaBy3TKvnN95aU0ChrRQLOuyrCg7cwuBuFDwhre21E61
         JicierdvLhNHAr1sOz3K2RS246Yi391uhO05Qq1wgUy4opmFktXTJv1lZYVxl+GTvITa
         WPTKd9NyxNZpPCeZypB+o+4B8snwD5Wj0qMh78eXb4S+H89Y48gOpmDQCQvN0IgXzreo
         qkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hb7g9SyV14ZDj2pko+DwZITL5IeV5KJGdLJyBnUP7I=;
        b=zN2jzGq5oGWlodZ99uasQt9FwrupZR5rDUWt/CoSpM30jCoMdivKmkx8ywxJLqhVPi
         YxCBwlOIc5xKkFHTDQCAwLKqxPOJIh2vsc/ZgITSXy6kXHFkrd1GVtR40lj58clsbbt3
         tQJJOEUES/ukdH32/p5PWkzEj7lK70kphh2A/q+R6zg13un1rHxxCLAOdlFnCNFvJAt4
         +7itYZgO3dD2wAUTpsuQnuCfIH8RRcJVGE23UKU4f7CBcuPgOhLPXIgA2a+jqTOS8sOr
         FjWUfU6R6z+Qm9wJaXBMSLrJL+AF1wZIDUojbqBraqdJ7Q6R5whzsl+fvH5FO/fFijr7
         mc9Q==
X-Gm-Message-State: AOAM533VCJTX1tj2Ug7F5LwdEjnZwD5gkJAKFOnBo/hb7J7OY3rSe/jQ
	v+gNf6bvyeXQsmw7B7U/fi9L4SziR/U=
X-Google-Smtp-Source: ABdhPJxvrLJk5icLxwqz7GlRwRtvA2flF45SPbSIASY01Lqk92wtrbt1r2BJHhThPjrL2eG99cl2/g==
X-Received: by 2002:a62:5c7:0:b029:3e0:dd9c:8fd2 with SMTP id 190-20020a6205c70000b02903e0dd9c8fd2mr10811703pff.28.1631714128148;
        Wed, 15 Sep 2021 06:55:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:27 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 4/9] cryptsetup: upgrade 2.3.5 -> 2.3.6
Date: Wed, 15 Sep 2021 06:55:15 -0700
Message-Id: <110b275c6dae189399184ab6c745818544857696.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 056d0892f0e2d1eb30029dbe9810b0800e87e634)
[Bugz fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
index 0da9a26e83..562ac83fb1 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "408620e0df577ec04108ec0bc2b91dee"
-SRC_URI[sha256sum] = "ced9946f444d132536daf92fc8aca4277638a3c2d96e20540b2bae4d36fd70c1"
+SRC_URI[md5sum] = "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
+SRC_URI[sha256sum] = "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1

