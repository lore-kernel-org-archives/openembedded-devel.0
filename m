Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07268C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:51 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.26010.1651346330166727739
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qXO3ASU3;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so9868347pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BNXvgiHE41gJEieXZoAG+liVH2t3YWEIpznmx2BN024=;
        b=qXO3ASU30Fy56elcxqnAMcCGkWqYJrtYG0X09oKuyoUmeHF6lgUp91rT5CNFXP2MZD
         1tz32+Qac8aAPYyBvvp+vrBFT2Kum6a4VXo2eymlTEulgM6StJ+rVqlXz8nk73krofPN
         pc4k2jwhwzAMjLwpPDS3QkxwLEKWFQkeWw8+jYWLOnujHYyHFzYQyPyg9XRkkZaiUXiJ
         Ev+A/A9ELNrT3gmbrjn8iLAl1fE3Kw4S8HmJ4VU3QOv+CpIqI8MlobATRpPak89mB5bk
         7xRiuEJ85BPRndgMeUnHPZH+eIXPk8Qauo0zAHPWbP2zY1Bc9BtVQ20u60G0kCHtPRvT
         hsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BNXvgiHE41gJEieXZoAG+liVH2t3YWEIpznmx2BN024=;
        b=vKlPprQzuDiLGiP0TduyQIn/Onzj51mO02yeZPixlU/8cU2m9pA6S+fSEqZP1V9elS
         0mTRHa2GrTeiULdV+iCaSWH1jdZznb5QumTeknxxOodTYCo64vzUvN3SWShT5O/mdmXI
         KsJmYvagCoYkD/+Uy1b952CCoI+i2dlJgZYYmP7Uhl6x3j1fMsvc/T1ty0yQVO/2GU+V
         7XPTHV4MdAjYCbD4FRbmVGdzGqJfngOKmZNed4OJRbW5jNB/QUTluKQrU51Z9/6zFuTU
         HFtQzWVMgG3j4BFZEDYRu5AruqAHhTb7JgG2h0ZaGfsCuhvjJ4RU7lBMJiXr5bExuMfU
         oc7w==
X-Gm-Message-State: AOAM5319zbHEbFkGq8+VFHHynAG5hSM9U9U/hWCy5POV8H5FKZPVS3vq
	YMTQ3fIcm/lbpL6QGFm605oWsJ+Olh+gYw==
X-Google-Smtp-Source: 
 ABdhPJysI5vruimmIDTXKpK3DzhesLUehZsk6DbDgl5QBl9z7QIrZ3C5mSZT/fTZmG6lO91aBr+AEg==
X-Received: by 2002:a17:902:bb92:b0:153:4eae:c77e with SMTP id
 m18-20020a170902bb9200b001534eaec77emr4670804pls.93.1651346329277;
        Sat, 30 Apr 2022 12:18:49 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 15/39] pam-ssh-agent-auth: Use specific versions of BSD
 licenses
Date: Sat, 30 Apr 2022 12:17:55 -0700
Message-Id: 
 <1727cbdd0e058913d528fa488734af6ffc4eae80.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96882

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 088e40179871c6528eff5c328c68f061acd77ccb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index f7cf4a03ff..7065529326 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "pam-ssh-agent-auth"
 DESCRIPTION = "A PAM module which permits authentication via ssh-agent."
 HOMEPAGE = "http://sourceforge.net/projects/pamsshagentauth/"
 SECTION = "libs"
-LICENSE = "OpenSSL & BSD"
+LICENSE = "OpenSSL & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.OpenSSL;md5=8ab01146141ded59b75f8ba7811ed05a \
                     file://OPENSSH_LICENSE;md5=7ae09218173be1643c998a4b71027f9b \
 "
-- 
2.25.1


