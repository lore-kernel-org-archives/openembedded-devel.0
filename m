Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854F1C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 10:46:00 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.71006.1656931555917571463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 03:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7rWYidd;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id q6so15943802eji.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9B5Ss9tv4iHGoWz/sRT491VsXweaMvHcBaPtWe75yVE=;
        b=i7rWYidddXXTD6Nbdid5M8xTK6wiNOQCfD3nY2LojrLelyzxIm31QKTEc9JyflH7CL
         0tszx0S4SXJZAwHnxeCIUrIzu6XMH1VuvzWn5NtwHYxAHB8yaz4ZJbxT2V+9qB25LJH3
         +MVmpfGchrBHBXXec27AtL7M8XC07ZZtVImleX5dwFQgR8QYnhDwMyO4hoo4Ct8RhfrU
         5VEGQt1lsS0XoxkGAkO7JjMxprUDUeuBSzzEAfCm1RwEJwWPNR30+miaH6WE4sLwZGVv
         jlpejOzfVA1JPyeiHlM9P9yNKYMxq1NqOlJoM/uqJqAUW9p3bhQnP4nk9cxVX0xAOTIT
         SrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9B5Ss9tv4iHGoWz/sRT491VsXweaMvHcBaPtWe75yVE=;
        b=owfG5JFhLMdmfKdeln1RcmXhdL0kZfWhfdR0QbnJbkDIs0pcFXAi5Uj4wP2716cL3e
         k4u9vt64n+Iik6/oesOD39Re2i3RoLBLXAQutsSSVnExETXMhunGQsV/x7BD0PiT1cLA
         lYrtmli+LXebNb5TEZvT4ZFelLjxuUN6A1N4e1RkfKNIrHG7/eMVxuxhYVpH6xwFQb4h
         v7Z1Vhy9ixnPYS8+RIuhN3K3mRmy9rv/41f8coXiZtg6Xkc6pMNxOxHxnLrfzaTS/jjx
         BtIERtTOLYinNH+GKHoa0ATpyltrBfIIj1/9zQPQCs/vdbZONIN+e7lnPGHZOreJS7wn
         H+9A==
X-Gm-Message-State: AJIora+1v9QuQfE9z8o+1WgNVrnAYZIGLiRB3+ins7HGufcxPsA6jX7Z
	oSuYotU2f8422uTIGeqiP7kr0W9NUhA=
X-Google-Smtp-Source: 
 AGRyM1svBoGcaS3K/E2UqZ74H5EcvtyJmse2T0zs1snFseD9kC77WYQCaLvCcd1hWBX1XhEdBdYPMg==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id
 l4-20020a170906794400b006dab8342f3emr27895928ejo.353.1656931554112;
        Mon, 04 Jul 2022 03:45:54 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a1709064d8c00b00722e50e259asm13918377eju.102.2022.07.04.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 03:45:53 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-networking][master][kirkstone][PATCH] openflow: ignore
 CVE-2018-1078
Date: Mon,  4 Jul 2022 12:45:48 +0200
Message-Id: <20220704104548.71523-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 10:46:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97689

CVE-2018-1078 is not for openflow but in the NVD database the
CVE is for a specific implementation that we don't have so we
can ignore it.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-networking/recipes-protocols/openflow/openflow.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 15eb65ad3..ccafaf0de 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -53,3 +53,7 @@ do_install:append() {
 }
 
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
+
+# This CVE is not for this product but cve-check assumes it is
+# because two CPE collides when checking the NVD database
+CVE_CHECK_IGNORE = "CVE-2018-1078"
-- 
2.34.1


