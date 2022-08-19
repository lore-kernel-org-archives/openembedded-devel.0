Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A6BC32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 14:02:10 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.3375.1660917725221071703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 07:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QSVBPQjf;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: jandryuk@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id b9so3307235qka.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zdih8GWhJFiDwy3mUda6TUJXqpjvPnfJx+FsJCPOiuo=;
        b=QSVBPQjfIbwHPmQzlyf6qMUWZ5e5ZyFfUdrpYLJIU+v6GkmTpKi6qQFxLzQ3DacsGZ
         k+U5NiRPtU2OGRMy1QC0vZVXn/CMKw2qyVQfULORqSUzyFbMU8D0FoB36/95nSCtsB/M
         6mULDEar8JM6xMNqXLXay4TexDf0sjGEqP0VnqxbCjw99YsdowixTslyLLaGYwitMTIg
         In0iWRDZPlKrB1xaFhjZ4MLBUBWPJ8xNPhja+ttEHGt6UDAe0ePuQnob7CDG2jiuwW5b
         wsWewRd1ULd4fo0yzPytLUVvMdBy955cRrLZWbNGjkt6T0VByLZCnQ1eSpKJZCmGDPjN
         RqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zdih8GWhJFiDwy3mUda6TUJXqpjvPnfJx+FsJCPOiuo=;
        b=7O1OSF3ELydy7gi+va3xtJtOOq91EL+tkNqBXM20jEeI3x0F2sBshDoEB1CwI/bK00
         ZXN1rTQJbedJQe7tYSMNTU0toS0WWR6D1EiPp78pRPnxrMG28hFw7mxM2MCr1QrM0Jyv
         0L5PgDFwr9aq5IF9SBLuklVNoxaEhLi8IR8Nr4FyFeLnmDi3PcmSi8zaJOeNfln9IX/F
         f/E0jZKN/JYHaSrc3hPp1dDweHIQYn+e8JtKUnezJtBxXQqv+bXsijB70k44UFDKwYns
         XlMb/2x7IeBPqVn/k0fqSvpMJZETMBVdlwnvZt5ZWnrLBYbiwu/i3PZn7aN6plxfLCYw
         XPJg==
X-Gm-Message-State: ACgBeo2suzApdhp425rC9Av9zdJvNbuS8gfXk73kf1MBtqf3tMKceQO/
	UtYxybNoZg0sBjnR7WZUVrzuzxS4NLk=
X-Google-Smtp-Source: 
 AA6agR5RDar6rrG0pxaoBsO2eCh3i0nugP7cpuqPcMffdo0cO4vft7+/khYqI9vTsHzPWo4Bi/RQlg==
X-Received: by 2002:a05:620a:1986:b0:6b8:6cef:6cc with SMTP id
 bm6-20020a05620a198600b006b86cef06ccmr5399339qkb.482.1660917723427;
        Fri, 19 Aug 2022 07:02:03 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6bf2:79dc:5907:e1fe])
        by smtp.gmail.com with ESMTPSA id
 t1-20020a37ea01000000b006bb4494ebd9sm3850187qkj.62.2022.08.19.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:02:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Armin Kuster <akuster808@gmail.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [meta-oe][dunfell][PATCH] cryptsetup: upgrade 2.3.2 -> 2.3.7
Date: Fri, 19 Aug 2022 10:00:57 -0400
Message-Id: <20220819140057.12010-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 14:02:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98331

From: Yi Zhao <yi.zhao@windriver.com>

Stable security bug-fix release that fixes CVE-2021-4122.

ReleaseNotes:
https://kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.7-ReleaseNotes

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 5dca16b451abf80b1bfacfc533daf447ff4dad7c)
This is just the rename and SRC_URI hash updates made to apply
to dunfell.
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
index 3c1c8b0be..d303f27eb 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "6e4ffb6d35a73f7539a5d0c1354654cd"
-SRC_URI[sha256sum] = "a89e13dff0798fd0280e801d5f0cc8cfdb2aa5b1929bec1b7322e13d3eca95fb"
+SRC_URI[md5sum] = "9c5952cebb836ee783b0b76c5380a964"
+SRC_URI[sha256sum] = "61835132a5986217af17b8943013aa3fe6d47bdc1a07386343526765e2ce27a9"
 
 inherit autotools gettext pkgconfig
 
-- 
2.20.1


