Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BF6C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:46:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.38210.1634572017157926520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZM9DbelN;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id b14so1750783plg.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nM3m4rvyIalVepbCrjBTp8AdOOl1XbOZeNKm1KCkbJo=;
        b=ZM9DbelNyrhAviv1tMH4Iv56IadTXLYrgdceb5qHnOJTPQIKX2MADolF7LanAV0iyW
         RqEq9mqNEjl0LWdJvo/ODuHIYnjJJJufpgo9vzMXf0iqmSJrgIGa7jxx5CxhgVizQfN5
         5+kbZGfRnqFGWBRM48ZZ+GUuGFGwc210sGvJ4NPX/icYqlIcR3qWTb4dH++4TqYaDPdM
         NNof8eBdR5rHlm0P2boIAi15v+GJrqjn+rs3bneInbn1jasfGpnzKF+Ql9OabtIspSvp
         OpszxOCyoZPHqj7GWloWFlHVRLOLYlN80v+kosNNLXnpfhcBlxODt44Wll9flMxPGDfm
         jxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nM3m4rvyIalVepbCrjBTp8AdOOl1XbOZeNKm1KCkbJo=;
        b=FuPfj4+EuDeP8M/45RLnaSbJ+0jgm0oJgRkUBkA6XWw3zkUFQ9N7D0THi7CkoaUGtf
         D4o/MuhIqmMqutpatYYfsmSqZuJwPmFigUEQK0TEp7PXz76yxmCQ54wZbOiApULK7Uey
         QIjcKJR16iiQQ/0nfvHTAvhAxVi9TUlKL3vdl5z09lSx57SvrZ6SKm5FkA7VckYI87eo
         yi0e8QKa6HoY8W+ouGCvci2vHzBtDNa9Ea8zO+d1ILi65Dmx6qPEKoDe/T5EdPwiXa4t
         TDU/iQtFTBranqnsU9ayWtCfIQZ2gFyb/ozhhbd4sYjYxFuy9wGto3tSwpOxEad2lZ6v
         C2iQ==
X-Gm-Message-State: AOAM533zTQzvN+BRc/GS0XkBjuJyfZR5cxxGbXv7sNDxwl+ek87OXvkE
	sl0EGE/guHSnufzK8b42jjFL5Ryz3KLaUQ==
X-Google-Smtp-Source: 
 ABdhPJxITDqYl181cE+jpb6kBa08mSq3U32IBTOBaCw52TzrepRpu/TKxKvLUTda46cmYEM/sbdcYA==
X-Received: by 2002:a17:90a:8a0a:: with SMTP id
 w10mr26209713pjn.60.1634572016250;
        Mon, 18 Oct 2021 08:46:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 j126sm13936208pfd.113.2021.10.18.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:46:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xorgxrdp: Add to exclusion list for now
Date: Mon, 18 Oct 2021 08:46:53 -0700
Message-Id: <20211018154653.1503521-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 15:46:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93428

it needs xrdp which needs to be ported to openssl 3+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 188677f5f5..3bc1e459f7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -908,7 +908,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     nano \
     xdg-user-dirs \
     xmlsec1 \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp", "", d)} \
     usb-modeswitch-data \
     usb-modeswitch \
     liburing \
diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
index fd22defb24..25dbe1379c 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -21,3 +21,5 @@ S = "${WORKDIR}/git"
 FILES:${PN} += "${libdir}/xorg/modules/*"
 
 INSANE_SKIP:${PN} += "xorg-driver-abi"
+
+PNBLACKLIST[xorgxrdp] ?= "Depends on xrdp which needs porting to openssl 3.x"
-- 
2.33.1


