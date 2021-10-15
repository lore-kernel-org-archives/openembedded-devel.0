Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD387C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:20 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.4398.1634339060259821604
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=IBm8qA2x;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id j21so48280157lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ll0IK2UxdQjnQBis80myX8JYf0OfO/yRBcdXLPThdho=;
        b=IBm8qA2xYLW9C6Z7plX5sYuiK114jXciTBGZihH3BsfNqPtMEokljwc1D6WHdXqBJH
         Hz4q45sf6qt7970Wo3PB0Hw07psn9sAdQ7ltSttSAOoFj8ibcZYCS1vUxGIe0GUiV2Jw
         tQxHARz2IOv8Cxw83nHDE3NLFPod5GXK3vuYxDYBCal5eumaajjhgJu+6BV45QBeuOqi
         3gagYgZPunqCR+1LsJeHsaXxg0p+6FSdfzjtUo+lPeSigqtMcaOYhYOlQbwe4aPqPn6G
         Dgg4+wSzovMGKpN4DqUmzrCziJzINmau2EI9Pw59LUHgDpLYHRKwt9quIoA+oMZ0UoUE
         q3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ll0IK2UxdQjnQBis80myX8JYf0OfO/yRBcdXLPThdho=;
        b=vtDeNP+dF5lbxzkYEskcB+IXi2pbugitjjQr44tYzLjwf+63OHqR6uIgMO9bQw/h+m
         ozuej/HpXB1dk8JQw+fyAOC/CstEGAldaNdJxgsjnIr/DvsSRkB2M8Ey9tS3AAHskzBX
         LW6ZWEXoybGNUBBlcn691a1DTR9SLx64ZSB9KkL8OayaT3twaieOLku4ePj9RQL+kPD8
         TiXfmduMjq5ef3TIMVEID/DAezRRHxkFFXO2nW989HHrh8FmuiGR5B4cUzs0Z4yk0+Bx
         ZatgITEHIn8dDGyVjCmwZTjyt94bHRBYMTxR0kbrWq6qhaBqWR2qhfzyUS4LU7+VUPp4
         FS5Q==
X-Gm-Message-State: AOAM532a6cQVIUaTJ+e+h9gtNLe+lbJbQYufbMfwPzeoy+8KUQLvT7pr
	RZKS1gT1FP2UvkWpMYTWV8IANAKfsIJ2Zw==
X-Google-Smtp-Source: 
 ABdhPJwpkqw8n0wCmgIvg8MDrDIYXaNi4yCErVv4mqUpGy0YYM7nnEZ8aeuC2cH3P9Ml0Ls7hcStbQ==
X-Received: by 2002:a05:6512:68b:: with SMTP id
 t11mr6133367lfe.586.1634339058191;
        Fri, 15 Oct 2021 16:04:18 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p7sm657536lfr.203.2021.10.15.16.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-alembic: update to 1.7.4
Date: Sat, 16 Oct 2021 01:04:16 +0200
Message-Id: <20211015230416.4166848-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93387

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-alembic_1.6.5.bb => python3-alembic_1.7.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.6.5.bb => python3-alembic_1.7.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.7.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.7.4.bb
index e1f29cad2..17e9e533c 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.7.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a21fedebb3fb8f6bbbba51a11114f08c78709377051384c9c5ead5705ee93a51"
+SRC_URI[sha256sum] = "9d33f3ff1488c4bfab1e1a6dfebbf085e8a8e1a3e047a43ad29ad1f67f012a1d"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


