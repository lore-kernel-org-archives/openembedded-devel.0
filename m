Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B144E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 18:51:50 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.587.1734029501393188708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 10:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RnHDaezP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241212185139a9eea8fdb701b6bdbc-a2z5ew@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241212185139a9eea8fdb701b6bdbc
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Dec 2024 19:51:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JfeQAmO3a8c9gcCbN0oVks7vTAZRMe6XYQRRJ+t60uU=;
 b=RnHDaezPDGlZTl4D6grYzKcfuDTt+pUtdB5nebKLGiHhGx1X7F+Ij8ZUv71+7KVmRgKhyA
 men0PWel6UHmmHpeC3100Vb4+leJ43xAvFlQaLS8xjt7gq/daXaZ0iM13o/mALV1pAyjxGF0
 s4O8/bTdkK2sDJ+XFS1D0wK0PvMoU/LWy51TcrlQyyuUEQ5X9w83nqVRhhp1AmUuWQWoq9zg
 5lzKpK0st4frgKPBnS4wqicco4OmV/VMsvS0vWc5JgtDW+pJuFS5VBZpg1yqLWr3r3RFtor4
 r/wE8GYgVwI2FVFHjs537WCA4QCTVyyqebQiAPZ7FzWoyc/nGYQA7O3g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 1/2] ndisc: Remove buildpaths from binaries
Date: Thu, 12 Dec 2024 19:50:39 +0100
Message-Id: <20241212185040.2244548-2-peter.marko@siemens.com>
In-Reply-To: <20241212185040.2244548-1-peter.marko@siemens.com>
References: <20241212185040.2244548-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 18:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114293

From: Khem Raj <raj.khem@gmail.com>

configure emits its arguments into binaries via PACKAGE_CONFIGURE_INVOCATION
therefore edit the paths from this in generated config.h before it gets into
binaries.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index a827e7f42..fb00b8351 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -27,6 +27,10 @@ do_configure:prepend() {
     ${S}/autogen.sh
 }
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${B}/config.h
+}
+
 do_install:append () {
     rm -rf ${D}${localstatedir}
     # Enable SUID bit for applications that need it
-- 
2.30.2


