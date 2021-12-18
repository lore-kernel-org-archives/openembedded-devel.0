Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183D8C433F5
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 19:00:09 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.8364.1639854008738130238
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NfiLbc6r;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id g2so2832606pgo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3mbZdWdr5JC7SPgjlOEiZfN5Cx8KErQVuYW98qr2QZI=;
        b=NfiLbc6rYvkH9kq+kX65yuvzfuYDxEqFPLTQR1p1fkBeg3ROH03ClY3OKDnVwlqXki
         jIQZfrGyClAmGrqa9RPahueP1gv77m7peZTtcJFBlkarhLcm6Zv0ooHMHq87d+i46is8
         QjqXAFwc2BtyN1X4cq6rU3r+hOugVqllCVrcX9x1DUjGeXuTIaj4jkSdoaTNTFN090UP
         deVXyqrURVm6kQwcgbafs9ObwFXqRMxldsgnzb5sIdz8FqbCbXg+BUrkQQXlkh1h+v37
         csNbDyXXIdQ4pVKr8YNzD5nftTGI3zMdjC0lZCsmH3LzHTFWfaMVwcC7S0nYa/Q+9t5k
         fuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mbZdWdr5JC7SPgjlOEiZfN5Cx8KErQVuYW98qr2QZI=;
        b=lGNZwyN/Rg9d19krNr3h6brkuw0XHtc4tEGoJkx4zzKHyFs+LBlCpvn8anFuhZrD3Z
         +A2MjWESMrjikRo0AliSWxKXSQ2k24qrPiNhGqQ8jlSW/GMao606/7KuORYFahpixL2/
         YEHSbcG8qFfN0NZKN11UBxCNIMrtCRAEb1L8cp8T3xp6NykiaK6bQlLvL9TM+iuAao6p
         ixENRaCXMFhJW2v95n+AmpPbs3JwedYoTaKQSAMIV4s4borWnDwRroEbZY7AotmW379h
         16qZwUo8ZaWsNe4cL2a8wyJ0/rYhbaWNkmMGJRJE6TMk87z8DdwZKm57GgfVqOy33lMj
         Pr1Q==
X-Gm-Message-State: AOAM530bJIMOQmG18g1+3VkdykrXtRpPc55+16TsyJ+s/zabuHDGITYV
	sS0mGGiE2kLVzmzR+gxB3K0x2ArDTg0=
X-Google-Smtp-Source: 
 ABdhPJxT/e2rtiZZhDN9M/zosNdFO38V0mh2MnxET3p0Tg3Q7RRaPAH7gVe+3W/8yP3MY6DBsFa51Q==
X-Received: by 2002:a05:6a00:cc8:b0:49f:c4a9:b9f1 with SMTP id
 b8-20020a056a000cc800b0049fc4a9b9f1mr8766535pfv.32.1639854008094;
        Sat, 18 Dec 2021 11:00:08 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8259:344d:2281:ae46])
        by smtp.gmail.com with ESMTPSA id
 j6sm10371127pjv.35.2021.12.18.11.00.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 11:00:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 3/9] Use old override syntax
Date: Sat, 18 Dec 2021 10:59:56 -0800
Message-Id: 
 <93befa6cf5599979ebe14ded6e1829963faa367c.1639853918.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639853918.git.akuster808@gmail.com>
References: <cover.1639853918.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 19:00:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94430

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


