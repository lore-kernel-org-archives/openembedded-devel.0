Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB3FE7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:45:23 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.32652.1735044319222209266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bxjZA0qM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241224124520bdfdf1e200733c1eed-7cqxig@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241224124520bdfdf1e200733c1eed
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=W7dLWwt83B42kjFz04pFpKycE9J2lbP0uD7YOmCUOuM=;
 b=bxjZA0qMW4shFVgCrPRpKJ6nFYd9agsMD74R/dYrbYX4TF6vFC7t20NuVaDbg0yUMNgLH7
 uF20OOV8FxZ98VsAA4szAHtLhmssfOllY3aTKvFf83ZbFgfnOjyp1K+FheJr5aROhPTOJsWa
 Ew2u/57hYTeDrQllepjaFTEWe0TEHImYZSUENeyGUeADyP6VNkYq31C2D/5TdWlmGxYmOS1e
 5HE8A7xgn9N0PXAtVpPrDvic6Pu5qYHRTHM2QcjVqt4nYhnCovOWDtX70jwyFT9lPUTC5RRB
 X4+9Uf15tbJv6lvPwRqpLJZAk+lP6tCO3t9oW5H9ajwMPJTGwKcYpYbQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 2/6] rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
Date: Tue, 24 Dec 2024 13:44:13 +0100
Message-Id: <20241224124417.2547005-3-peter.marko@siemens.com>
In-Reply-To: <20241224124417.2547005-1-peter.marko@siemens.com>
References: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114543

From: Peter Marko <peter.marko@siemens.com>

This CVE is marked as fixed by Debian.
Extracting Debian jessie Debian sources [1] shows 4 commits uses for
backports. All these commits are already included in current hash
([2]-[5]).

../tmp/work/core2-64-poky-linux/rtmpdump/2.4/git$ git log | grep 'commit \(10b580aabcec1621b25518271ba1ab2b018be88e\|...\|4312322107a94c81d3ec5b98f91bc6b923551dc5\)'
commit 530f9bb2a02a78c1198fb2bf0293a12d225e4691
commit 4312322107a94c81d3ec5b98f91bc6b923551dc5
commit 39ec7eda489717d503bc4cbfaa591c93205695b6
commit 10b580aabcec1621b25518271ba1ab2b018be88e

[1] https://snapshot.debian.org/archive/debian/20170704T094954Z/pool/main/r/rtmpdump/rtmpdump_2.4%2B20150115.gita107cef-1%2Bdeb8u1.debian.tar.xz
[2] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/10b580aabcec1621b25518271ba1ab2b018be88e
[3] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/39ec7eda489717d503bc4cbfaa591c93205695b6
[4] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/530f9bb2a02a78c1198fb2bf0293a12d225e4691
[5] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/4312322107a94c81d3ec5b98f91bc6b923551dc5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index aa92c58808..47d04af9c1 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -14,6 +14,10 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS_GROUPS += "CVES_2015"
+CVES_2015 = "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
+CVES_2015[status] = "fixed-version: patched in current git hash"
+
 inherit autotools-brokensep
 
 EXTRA_OEMAKE = " \
-- 
2.30.2


