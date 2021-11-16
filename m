Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C71C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 13:35:54 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.9916.1637069754240541369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 05:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2mwXi8n;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id iq11so15787456pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3mbZdWdr5JC7SPgjlOEiZfN5Cx8KErQVuYW98qr2QZI=;
        b=J2mwXi8nEbjBf+kBQfBD9/pnjV/OKONwOEYb6MeeCk2mcinyQAVowsCNj8SBENB4F7
         ab0SIhoFG7xtAuI1034W+mK+KCyaWeTL7RvAFpk6l4wCokU2xE/C6R1GZuv/kJRWRRhz
         PxYFc4+31sbijc99LFWfrpX/+PU+YyTF6LAoIsNlZHx+VBxPamhuvP1KkMTcOHnHGt05
         gJaZBT3uosgYqoPXc3Rrmq/GtL+20lXZmR88EK7eQpFvYOsRtdyVXhDSY2YUn62eyB3h
         elAw450fFQrrEsj/Q0L8KipfmCy0n8BM35RbJLj00B2WbUE+8qZwu+XLfc1WhNddajYt
         T7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mbZdWdr5JC7SPgjlOEiZfN5Cx8KErQVuYW98qr2QZI=;
        b=RNaU0myhe1qDVoJcff8clyauDv9kCJgNZKei2CO/pZ2OGut7UKvBvzdJ+YHR0jwruZ
         jOea7Cgciz8BIBH6m2Ry4BywKrKCabuykjVLcxgvB1Zmfe0ccI6nrQGU9wR706bxLkqK
         9SkreOxTT+uNbs3tPV9g8bMVYWq4YKXBSCjEkj8eYujJmuFFTbBNBnY0IQrEY5TlaYGa
         BKT2rGZ9l5pEWnoM+SYXvurqLmE183plX0qHrW17ejt4ldDGcioZyUbBblGPU58egd0m
         zTyu3BMFVLHNGC1RIqb2jn181yrR0IpkznYuvculoAdYqQ5yZQWOURhwl+L6PutBu/Dt
         80Cg==
X-Gm-Message-State: AOAM533RmmhfdrS+cGiJR2NOroMZZs6vZX67dkgVEySjgVFQ5bBM1US4
	TmWSbWvToPwmdOxf7TS7IaIJu9sV4oI=
X-Google-Smtp-Source: 
 ABdhPJwj07MXuR6f6C1qkxWrzMOtSKxIJ9Gcl6bXDvz13Ay28VNwI3JcXkmT69vkOtYSvKeplOpAfA==
X-Received: by 2002:a17:90a:e297:: with SMTP id
 d23mr8754875pjz.131.1637069753585;
        Tue, 16 Nov 2021 05:35:53 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:e37e:104:3064:cd47])
        by smtp.gmail.com with ESMTPSA id
 f15sm21617277pfe.171.2021.11.16.05.35.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 05:35:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 3/3] Use old override syntax
Date: Tue, 16 Nov 2021 05:35:47 -0800
Message-Id: 
 <93befa6cf5599979ebe14ded6e1829963faa367c.1637069650.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637069650.git.akuster808@gmail.com>
References: <cover.1637069650.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 13:35:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93980

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


