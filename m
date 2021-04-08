Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.259.1617899811839699007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OT6cLvV0;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id n140so2774215oig.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gcnRNL2dczbXi4/5Z/umAa8kIixW6aaP1BvkmfMusOU=;
        b=OT6cLvV07TjMCRAGDFCejM/Jcf318ODXFDwAEVYTpLIFLutXPeN/i7Knii0+3RDPW9
         +Bt422NWjwYf2CTrnhyqVlxPbB2sLsv/QsuX5QGD8YQkS4IqczTansqpQf+yW90hI4OT
         IIdCTvySnUlcwgdpflLcJ1AcliziJa+IJ+Dgg8MhSXvh6XNRJR7TLuUYNdxGEorSK48B
         g+osuY143L3GtwGHexEE5BXjSxtuUkXWq/n9IZOFf8XcF7J2JNBWU4iZJZ3q+Fehj0pH
         bv2J9zhDM1y9bkcTO6Q48Pz/uMk6lcFdCTB0d0qqz2veMjZGKsSi5WOq8KRPytHtn0dx
         D+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gcnRNL2dczbXi4/5Z/umAa8kIixW6aaP1BvkmfMusOU=;
        b=W3xiSJ77OHNy95kQoWnbudsZdcosyTp7KkTX8vv/j+iHtDBzQ8wuqxr2moMHE1EdXj
         JB9aWthMbqNnWt6h9QxGpsd9xtnqc9xkEjHroJLv0mSQLxT15HBqwivQk5lzfWu5jBbi
         t+w3CLzDm8hWnzv1CxQ+GsEwLW9c8XOvf6ptS/dqkmhBVdfbV4DXp/93dQWP5DOc/ywF
         QOora6uBtqXul9LbI8WXgV8W1WwBmXE638AcS4Q8At5p7tYE7amZeyq8YF2M4WroS7qA
         lOfy81NwjDR8wie6wR/p1tVd2ghb0db65orpp9FevpHoYaKbNHtUtueUqD4MpZ8gvsfv
         AM8w==
X-Gm-Message-State: AOAM533QrWaMLTmEXaWG7Ww6ZDz91iIVzg2muO60dkdCDjSLrh1yqvaX
	Q5HG3EptCn1BEikRcAcFlwfMQLMPjkU=
X-Google-Smtp-Source: ABdhPJwpVfkJPDu3fbPWxGwk08woMixV3fWtl+im5rZMAh7VyY5eE0pudRMfzT53VYRuoRJr6NGr7g==
X-Received: by 2002:aca:534d:: with SMTP id h74mr6844309oib.152.1617899811030;
        Thu, 08 Apr 2021 09:36:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:50 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 41/64] python3-typeguard: Upgrade 2.11.1 -> 2.12.0
Date: Thu,  8 Apr 2021 09:35:48 -0700
Message-Id: <3dd68690df05fc32500c84a8c60a420f7ad389ea.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.12.0:

- Added @typeguard_ignore decorator to exclude specific functions
  and classes from runtime type checking

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 8507a0dda68d17874d6e5768683657914c88d3e5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-typeguard_2.11.1.bb => python3-typeguard_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.11.1.bb => python3-typeguard_2.12.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
index 640adf83b7f..148806e101c 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "33243c1cbfcb9736a06c6db22dd08876b5f297e6344aa272a2862c0f8e669f64"
+SRC_URI[sha256sum] = "fca77fd4ccba63465b421cdbbab5a1a8e3994e6d6f18b45da2bb475c09f147ef"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

