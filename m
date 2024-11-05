Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820E7D2B92E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.19581.1730817401683576245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SECOEkog;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso5911965276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817401; x=1731422201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70d0LBXyTJlMlBUj6ex+zm6b2OPhweRECPseF6aaynk=;
        b=SECOEkogd9vsXJ2jGhymk2Njfsp2QMR8ymy185cZr2nr5A3J4DDbgRSbNNLC4VNyLk
         QCBCFsXNomwORuTVhNpvewlvkowCSS7nraEVVShSRVkbBPN3YChTir2fBQyRI/cJ53/G
         Ytk9Ot2jxgdsgbCvQyrLJWCE6dbYfracpZtAaWKrU9ISz6aigbVi5NmdhvWQXm0Nq9jw
         mFwTUUU+6FtfNMToqJattRKWUeC/NytscqGqWRqd3YJ11BM7jmvA33Hdxl0s/2n0/a/8
         6f9pS+Gg318ZnQriG5aF0vze2FntzV9CfAlFwcOsAvrHcC4CgXlFvCNmoxKgvr2VLEUY
         bp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817401; x=1731422201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70d0LBXyTJlMlBUj6ex+zm6b2OPhweRECPseF6aaynk=;
        b=u7Rut863bF1PibT+LojG6/hyVFntnzsEb1vVCRNmSt4n9mMVUHKbQn/pqtArriT8fT
         mmiAFkEGc9MQ1hBLegLHlixX38jXmzjQxQlVFxJPoFXA2g3OL6fZkHNlgA8ouZZi5/pY
         GZe3q9Tx7Fe1T2CIT0VYEpNWt5GlMM3EX+QIqzr1j3vHFg/cSMDH+yUYBOWEQnitVlz2
         FFB1j/RPlikegxc8zZMSASuYqAd4YyVr02SCTadWXOo19wsK3pGa/1ERHc5/fwjxWnGe
         nt7itQ8ii0oouC6NBafMK4HYyTE9/iL1ZoHMv8lA0wzQJLYztO4wwpLY1bMHHrM1S/Mh
         fdag==
X-Gm-Message-State: AOJu0YwJXxtWCxbri3yAeB89U11sYLkQZusQPRtbeNJaW6eQ8mAaRS3w
	JgP8UDYJ4YcV9/SzPOvf9G1VBz2pDCzoNBwvUETmz0CHFk4NZsolVGUMbg==
X-Google-Smtp-Source: AGHT+IFK0v56eVEC2yEpvTsQeyUueK7NRCa39/DaAoAj7C75oR3Uvuu56Dhj8fE1W23s9aGwnLCUVg==
X-Received: by 2002:a05:690c:9b10:b0:6db:e280:a3ae with SMTP id 00721157ae682-6ea64b10af2mr169370267b3.23.1730817400679;
        Tue, 05 Nov 2024 06:36:40 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 02/90] ctags: upgrade 6.1.20240908.0 -> 6.1.20240915.0
Date: Tue,  5 Nov 2024 09:34:27 -0500
Message-ID: <20241105143638.2301245-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113420

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ctags/{ctags_6.1.20240908.0.bb => ctags_6.1.20240915.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb => ctags_6.1.20240915.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
index 01e7e5e3f1..247e1a8446 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0a2ad188848b75f56bb2af33bcf556bd7cf422ed"
+SRCREV = "40b58618f9f0dc4123a205cbd50b73c6ab2e6f5c"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


