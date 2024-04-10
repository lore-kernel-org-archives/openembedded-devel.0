Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D886CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:49:10 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.1803.1712760541991094349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 07:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=05ogySXh;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.54, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e6646d78bso3613596a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712760540; x=1713365340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMk9ZBu/yvRc/OjW9QqpwvzT6omX1dkFbQx7nphstaw=;
        b=05ogySXh0QR1PPYDyGEZHLbj6y9eIg1T3UedhvlfbPen9/2bwR72Ue/LBiKo1H0uoA
         5IY8eP6Adahr5vQWeShhzCxmnO/f7uWc/LmS3T/C+iwFmNYCjCmPzQsl992P/Z7Zog+k
         7UCEXxSDWeE4HOE6OQKUlsGuZh6LD5oJKrQZ1CMiqd1wTkapFp7x6YZkrjkDklqXboEK
         xDLK8WPHTfD4ciuA/NBw+z1Gz+gXbEYviySL7pnyriRQLTvs9aA+goPhsgl6dfxiD5yY
         hdYhKRie0NOQT+2YOM0gOKlyzKt+batX67CoKGfNFfzLWqxUNlCDFejRKoYFSbPEO2pc
         CdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760540; x=1713365340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMk9ZBu/yvRc/OjW9QqpwvzT6omX1dkFbQx7nphstaw=;
        b=JV4q867dJnWecjITB0wiW6Az333KnNJv6zUq3jg8T14qtlC77/mmjoUySQXv4lJiuO
         UGYt7AeixeXrLBAYv+W+bBsdNi/+50yUJrs/8DngXUaPtPTmthxQODXY+u1Cs3yM1g/5
         2f8AQUSz+qbP+Br79/08pC3JdEXmEQ+dAhewQUeus6zj3/5HPwuyLWaBTYYWlUFMmNDU
         j+7k7xyvwVcWHngxtEFINiXiviD1UmKBes3Os0uKDR0+qrnAecFxppBX5a7thG0wNJzU
         0FusTmo5etaxW2pY4JIzpu7lQT/MFwVaO56Nmn3MhVvk+/FBpYFJTLegktx2d6HZAjCT
         fhxg==
X-Gm-Message-State: AOJu0Yz3KCYPVaaECwQsbRKu/saBuvJCvNCfzuKjxuP+d2lW/8V1PbW3
	Qvqu35nUsgCeqyPb4y26X/A5TDls+escc5/0rhaxBWF2LjMz8KvYeGYrOhnZJ1lWMZjdRuMphOy
	g
X-Google-Smtp-Source: AGHT+IHm9CXLB6gRjxXfAymaZQeKAQoxXZ0YCwoUIfGaxf6qhyy8sV7IcxkUlKr9f2wpMH4MkQHcuw==
X-Received: by 2002:a50:9fc1:0:b0:56d:f00c:2b13 with SMTP id c59-20020a509fc1000000b0056df00c2b13mr1600959edf.32.1712760540242;
        Wed, 10 Apr 2024 07:49:00 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id dd13-20020a056402312d00b0056dc0e21a7dsm6516977edb.4.2024.04.10.07.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:49:00 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] graphviz: Update CVE-2014-9157 status
Date: Wed, 10 Apr 2024 16:48:56 +0200
Message-ID: <20240410144856.90991-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410144856.90991-1-ninette@thehoodiefirm.com>
References: <20240410144856.90991-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 14:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109902

Current version 8.1.0 is not affected by this issue.
Affected versions: 8.0.*

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
index 4d40ee4de..5166b1fe3 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -30,6 +30,8 @@ SRC_URI:append:class-nativesdk = "\
 "
 SRC_URI[sha256sum] = "d593695fdaa8a19297523b679ad13d3ef2027b0b7f14cc2bc23e77969ed81565"
 
+CVE_STATUS[CVE-2014-9157] = "cpe-incorrect: Current version 8.1.0 is not affected by the issue."
+
 PACKAGECONFIG ??= "librsvg"
 PACKAGECONFIG[librsvg] = "--with-librsvg,--without-librsvg,librsvg"
 
-- 
2.44.0


