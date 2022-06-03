Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F05CCA47C
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.2441.1654283966112252072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VXxqdfHL;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y196so7841675pfb.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=425SiNCK5WjF39f61/vd7ybE54LQojrq7R2eKYw04Cw=;
        b=VXxqdfHLXedg6wa+ftTm8NMv8ZHWILw5/MEWJcMhJ+7nPVjHhHooSYmkhh3FIaVWOT
         cqjrS5S25n2ilWoA6dDnn07gyh+csR4kL36+JozfULW+mXoaEv6V9xgyGnANFxkMOLFS
         um41QADEr2CY6lHDDLSzbD4fXlhwZclfnIBUPVXruxs491qmjzNPEMGAA2cM8r2iILSE
         yWLC4cebxJeqy4znQZ72lturcqgqVSdXYJvXsPoMv0+y3p4Lvhs3Ps0t4II7aderjjca
         eRnRa46TQjDyf/JlYsQCmQpNqPwFt6lItNqtIa+xx3f07+Fqc69uzDOckbWB7bJ9kI6w
         5hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=425SiNCK5WjF39f61/vd7ybE54LQojrq7R2eKYw04Cw=;
        b=KMY5msoYuIJCf8tfz1WtqiSIRdkQ/rLaYiLjUidYhc0bqjYmmRxgjIRfxPBWsunpQE
         CuMZgEEZvImTsHdUxE+bqfDlYhBSG57mUzkrsyzrAZN59s3iniu4eTkBLfcEi3KU2qrZ
         +yZYL+cgEcObjM7HSuA8vWzDhJRvandkdbf6u5hj4ok5B+i5vPQsjtYliYjsWl4A364k
         Q4hf383mXCd0f/oCRqKtVqmY6W+lPsv2hwK3P4VSLKXYNiEW+u1kZVpG8gy/I+H6Ostl
         oW0YDlc3NrT7bD79wIq+wIGyDakiPUXKNVasgBa4ZXOrAXD7BmJv7TkGsM08F9THbTj/
         /UnA==
X-Gm-Message-State: AOAM532HN71mQgviuAW2D17uo8IW0QThvuIi/vT44wrzgALKBWc6BZWz
	d9E9Pub7G+U7DwOE7Yw8uhoEq3GupY4=
X-Google-Smtp-Source: 
 ABdhPJxLegx6H3fvg4DSRVE3pyqovBi/l7aUKkeYB0O77oy6m7EzCgllfqiHDdoot4w3mVcVaG+SvQ==
X-Received: by 2002:a63:ce58:0:b0:3fc:6966:b614 with SMTP id
 r24-20020a63ce58000000b003fc6966b614mr10353852pgi.234.1654283982211;
        Fri, 03 Jun 2022 12:19:42 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 14/20] conntrack-tools: fix postinst script
Date: Fri,  3 Jun 2022 12:17:13 -0700
Message-Id: 
 <16f08eb5aafc2851ab6a78fa72f2c2890a2d85d1.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97403

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Fix error caused by postinst script of conntrack-tools:

do_rootfs: Postinstall scriptlets of ['conntrack-tools'] have failed...

Configuring ... rootfs//var/lib/opkg/info/conntrack-tools.postinst:
  line 2: setcap: command not found

conntrack-tools.postinst returned 127, marking as unpacked only...

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55fd9844830bc835c2bf8def9406edc9e2df0e16)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
index 50f7ced88d..8f57e823b8 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
@@ -37,3 +37,4 @@ do_install:append() {
 pkg_postinst:${PN} () {
     setcap cap_net_admin+ep "$D/${sbindir}/conntrack"
 }
+PACKAGE_WRITE_DEPS += "libcap-native"
-- 
2.25.1


