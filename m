Return-Path: <rfried@codeaurora.org>
X-Greylist: delayed 534 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Dec 2017 15:06:07 UTC
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by mail.openembedded.org (Postfix) with ESMTP id A2F157804A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 15:06:07 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id BA76D60858; Thu, 28 Dec 2017 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1514473035;
	bh=q/xT5oev35IORlyBLRB5SgdLW/ZDiFQrnCCX+5StTXQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l6D7yEI73cgEg+6U7iaxNjlb6unlsi5jKy9JgkJmChMqn/zIuYdLc1ZEIa5ctNRkg
	o9Z2lyIE8LBloM0zEz9TPbB7CuIFLPcH8LN2VnUGIAFuH5jrCPEkKhfQJGNzOLfto1
	b+mT2L1RArC7xIEq3Qy4QjW+uRnQq/KO9SmF/i4Q=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,
	T_DKIM_INVALID autolearn=no autolearn_force=no version=3.4.0
Received: from lx-rfried.mea.qualcomm.com (unknown [185.23.60.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: rfried@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BD126079C;
	Thu, 28 Dec 2017 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1514473034;
	bh=q/xT5oev35IORlyBLRB5SgdLW/ZDiFQrnCCX+5StTXQ=;
	h=From:To:Cc:Subject:Date:From;
	b=csWRlQjiDFzowkAe44/mv/8zph0ywWjqqtLEbD5tQkWlXVsrJO3TdXipFzRKaG263
	DE+42479F4qO8RNxLeRhK1hcaHw/33eQVS/QdlHPnJrwpJ4Ks3yajJ6yiR2JL/3lEL
	qlo/PL+1TwtY4oHWX3CwE+QS+M4a+QkoFHC81+sU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BD126079C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=rfried@codeaurora.org
From: Ramon Fried <rfried@codeaurora.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 16:56:58 +0200
Message-Id: <20171228145658.24259-1-rfried@codeaurora.org>
X-Mailer: git-send-email 2.15.0
Subject: [meta-oe][rocko][PATCH] gpsd: fix /etc/default/gpsd ALTERNATIVES logic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Dec 2017 15:06:07 -0000

From: Martin Kelly <mkelly@xevo.com>

The ALTERNATIVES logic for the /etc/default/gpsd file is broken,
specifying ALTERNATIVE_LINK without brackets. In addition, it refers to
ALTERNATIVE_PATH, which update-alternatives.bbclass doesn't use.

With this patch, /etc/default/gpsd correctly gets a default link
pointing to /etc/default/gpsd.default. Currently, no such link gets
created, and gpsd starts off disabled by default since it's missing this
config file.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 194f855b44319c7834ba11e6e0a77ef279970a04)
Signed-off-by: Ramon Fried <rfried@codeaurora.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index f8e6a2b13..47fed2d97 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -129,6 +129,5 @@ SYSTEMD_SERVICE_${PN} = "${PN}.socket"
 
 
 ALTERNATIVE_${PN} = "gpsd-defaults"
-ALTERNATIVE_PATH = "${sysconfdir}/default/gpsd.default"
-ALTERNATIVE_LINK = "${sysconfdir}/default/gpsd"
-ALTERNATIVE_TARGET = "${sysconfdir}/default/gpsd.default"
+ALTERNATIVE_LINK_NAME[gpsd-defaults] = "${sysconfdir}/default/gpsd"
+ALTERNATIVE_TARGET[gpsd-defaults] = "${sysconfdir}/default/gpsd.default"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


