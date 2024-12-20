Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB00E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:38:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.154135.1734709076512902505
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YVBc0zIq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2024122015375437482cc290493d17e6-70ewom@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024122015375437482cc290493d17e6
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7m/rUMcV/IUwyLRMY5BkycRKdRQrL5QN5MlrottYjtI=;
 b=YVBc0zIqxQXBfA1UKkRmQYVFguu6Wr1bdGN5ZB9wzo8UnqLEfuUSMI/uO0qsjJ46vHHFBe
 kVjm1VKOU8lAMx+Syee0f2GoH+qQOxnY+ErVjAKm0a8SPq4hdA/DQ1PAmetdeudy2o4fctfp
 lMAR4i6/vfPjq6xEEpR6z3ojgdVj0jZ0MpWblQdD6gXXQXIUa2ZNp1XrMcI1KXMw/tfO0I5P
 I/MVfnXLDHaigLSyk/DL9dN17u0y8LDLgcTL8xd3c+yFZJkzzt4j1i12NJQck1q9hekrI981
 hK+fdpoTGkd7mfISNREfz8gtL8iVGbcqa+HjagHeqKpzUcky0sdLgHaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 09/11] sassc: ignore CVE-2022-43357
Date: Fri, 20 Dec 2024 16:36:27 +0100
Message-Id: <20241220153629.2499631-10-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114445

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in current libsass recipe version.
So wrapper around it will also not show this problem.
It's usual usecase is to be statically linked with libsass which is
probably the reason why this is listed as vulnerable component.

[1] links [2] as issue tracker which points to [3] as fix.
[4] as base repository for the recipe is not involved and files from [3]
    are not present in this repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-43357
[2] https://github.com/sass/libsass/issues/3177
[3] https://github.com/sass/libsass/pull/3184
[4] https://github.com/sass/sassc/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/sass/sassc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
index 9bb8c76e87..94d69642a7 100644
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ b/meta-oe/recipes-support/sass/sassc_git.bb
@@ -11,4 +11,6 @@ SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
 
+CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
+
 BBCLASSEXTEND = "native"
-- 
2.30.2


