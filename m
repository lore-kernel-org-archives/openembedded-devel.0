Return-Path: <radovan.scasny@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF80C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:10:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net
 (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web09.502.1646673018521616521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=radovan.scasny@siemens.com header.s=fm1 header.b=GAjiGFUf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227,
 mailfrom: fm-118190-20220307171014d75cb934d4d6f87729-y7_0ws@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id
 20220307171014d75cb934d4d6f87729
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 07 Mar 2022 18:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=radovan.scasny@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kVgRLN5Bi5BELc0kw0hs87Ce7tarL/eGHminSn4naVg=;
 b=GAjiGFUflC+m20g+aHJUpwsQljz/Quoiv1YEegOiNbR4tezu/hM+3o5xlTHdMb1Pr1m1Uz
 O+hk3lLjUbV1HOePGLFpm7H+qo8XAjmbVUA+W8q8tcb8ojW4/iQFNkQOeY4sfy0es+JuwVrL
 66oI3Attk1/UC1q/9Yx7f/CY8CAaw=;
From: Radovan Scasny <radovan.scasny@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Radovan Scasny <radovan.scasny@siemens.com>
Subject: [meta-networking][PATCH] proftpd: update to 1.3.7c
Date: Mon,  7 Mar 2022 18:10:05 +0100
Message-Id: <20220307171005.5185-1-radovan.scasny@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-118190:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 17:10:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95871

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 .../proftpd/{proftpd_1.3.7a.bb => proftpd_1.3.7c.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.7a.bb => proftpd_1.3.7c.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index 32faeab4d..686f1e5cd 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "715eadc1aa4f6b07d69f9d09558e9cb471e51d87"
+SRCREV = "75aa739805a6e05eeb31189934a3d324e7862962"
 BRANCH = "1.3.7"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https \
-- 
2.20.1


