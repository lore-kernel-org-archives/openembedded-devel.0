Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA58C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:57:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.84606.1638313021658846513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hwG0Sszm;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id x5so22230563pfr.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3mbZdWdr5JC7SPgjlOEiZfN5Cx8KErQVuYW98qr2QZI=;
        b=hwG0SszmWt6oivTf0TqYhtcLk/FcEI6Dfda4pvKr4+gr+b+dlLKYSvT1MB3qSsb25l
         h1XrwobRsU/WnXXyorBTOhNIi1cDFTbq92UulyqqVL91ourXd+g9dTNpj5o0Ro82qHB7
         ne/zpQmbh+yCGcy3xuZir+BMbLIbLZrJXwfl+7Ve5CFdr87ySiQmNQdxBcz85sVkOi4B
         GKd38Ac0tGYXTe/IsdEvS0M5YJ2xkQdmoJsiGgV3x5OS/x5OfwoWi1AqPsPBorWcTKNa
         XkPx4JQ0qKdcr+NwLUEMsywmUBYBG2aUN3YeXcpHu6Pj+2hzqDB4QBgk/21pAl32onl3
         pRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mbZdWdr5JC7SPgjlOEiZfN5Cx8KErQVuYW98qr2QZI=;
        b=h6lh8pGn/qO3AIKBhxGnmUHUjwG+4AeEHKaZeK63rwI3D6AA05m9bIu8ItG+ulVioz
         7bRtvBC2dkgjjMpgckeZmZCIuNHPjkv9EKj5MiknWFYob+NSuNHpxqlSl0a747vUE9sV
         miLNfbXu4Ogf06ysiOVnUHGnJW5Zq78ug/HqxjICR9uzGsnpjGaCj4x4bg6RSNt3myXm
         QkSVZJKVSEAGIYrmewmWseF+95skSuXMkKp9CNai5vDAvjD42BrFDXzHQNgtV6gxOTns
         wFQD/DtUwXQIpu65ak1mqHFLAn/VsvpuSJkhvH4t9vQyRYQebdbLbh0+oY1t2TH2RCDQ
         YPIQ==
X-Gm-Message-State: AOAM533frm61MqMi/D5WQKz0c5XOXIcuF4/gnJ4ZUIa9vJn/QYC+l7lI
	EY3HATZOzag1t+nDAfuzsGquTwUAoP4=
X-Google-Smtp-Source: 
 ABdhPJxbiVHnNsf1lUHw0GsSUh/FvgNZZxWYwkd4R7AG7u778x7pNpXaPUKM3X7df4csrB6lzGEkvQ==
X-Received: by 2002:a05:6a00:22c2:b0:4a0:2526:e728 with SMTP id
 f2-20020a056a0022c200b004a02526e728mr1992497pfj.1.1638313021029;
        Tue, 30 Nov 2021 14:57:01 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7839:c9c5:3df1:81ad])
        by smtp.gmail.com with ESMTPSA id
 p16sm23373028pfh.97.2021.11.30.14.57.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:57:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 3/6] Use old override syntax
Date: Tue, 30 Nov 2021 14:56:52 -0800
Message-Id: 
 <93befa6cf5599979ebe14ded6e1829963faa367c.1638312940.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638312940.git.akuster808@gmail.com>
References: <cover.1638312940.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 22:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94156

From: Otto Esko <otto.esko@gmail.com>

- can-utils and dstat recipes were using the colon override syntax
  introduced in honister
- revert back to underline override notation

Signed-off-by: Otto Esko <otto.esko@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 2 +-
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 95086ad211..06c3182dba 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -48,5 +48,5 @@ ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
 
 # busybox ip fails to configure can interfaces, so we need iproute2 to do so.
 # See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
-RRECOMMENDS:${PN} += "iproute2"
+RRECOMMENDS_${PN} += "iproute2"
 
diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
index bc73f639bd..18c3cdf82c 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -21,4 +21,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
-RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
+RDEPENDS_${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
-- 
2.25.1


