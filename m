Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616EEC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 15:35:53 +0000 (UTC)
Received: from avasout-peh-004.plus.net (avasout-peh-004.plus.net
 [212.159.14.20])
 by mx.groups.io with SMTP id smtpd.web09.12438.1661355347648933873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=FuqCVhEc;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.20, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id QsPvoe0n8XHiPQsPwomT0S; Wed, 24 Aug 2022 16:35:45 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=CbUbWZnl c=1 sm=1 tr=0 ts=63064551
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=biHskzXt2R4A:10 a=-An2I_7KAAAA:8 a=sPDzs_vtAAAA:8 a=HcizHbmhIziwnAJZ-1sA:9
 a=Sq34B_EcNBM9_nrAYB9S:22 a=LSvf8S0AY-pVNIMtYwJW:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=Dp+oX9z+s+T0FzKqJnTYiVmup7wS0pVIOYGf8w6XHwE=; b=Fu
	qCVhEcvol5nLyil8oOi6/3J1pfPoIryWFRggMaH2gjfwEkh8SSSkNp4VSIB2PBS1tJONLurzAWtvp
	uaZfGA0RLfaD8LB6vE2dreDgzFg2f6Dw84FXgoBJzbUi1meCNkhOFpJBAjoJF0jrG8KVwjDN9ncO5
	zNUbQdjkD4iY3eZYcA+eT9RI+esOQBMldfrYGAur3JVeNU1LxumgFyylw4roM+pPr+rDRaPh/FscX
	rmMCJiaTxo+xKJxSxV3ysYABu0Agq6fN187fXceo/gL/gmq4wQlyQieC8ozV8lCv6skkfEyz577yV
	1bAIbwIBsVNuZSNfe8zd5i+jgz7THXtg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1oQsPt-00Bipx-LU; Wed, 24 Aug 2022 16:35:41 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-oe][PATCH] yasm: Only depend on xmlto when docs are enabled
Date: Wed, 24 Aug 2022 16:35:39 +0100
Message-Id: <20220824153539.423878-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4xfCZb7CBnMB/o4e0CQldC2SKt0CtoD5Ba+kDkdUXXcH9JzcPWFycDGoGAGnsI7YLFO5EDrQTwN243Wf/IOrC7SGSguGjATCh6I8bU+hrt10CiOPXcR2o/
 Omq5zg33X25c2r6ZwN7/vZfAHxnaT2IldAh4caasz0Fmz5rLC7nWUrkE9WbwMhIL7RQFNMpJ2MlIZxKv5jzaHMDi/OpZ/uMNyJ0=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 15:35:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98418

The yasm build system only requires xmlto when building its
documentation. It automatically detects whether it is present at
configure time.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 044fcbea7..3dd382be1 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.tortall.net/projects/yasm/"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
 
-DEPENDS += "flex-native bison-native xmlto-native"
+DEPENDS += "flex-native bison-native"
+PACKAGECONFIG[docs] = ",,xmlto-native,"
 
 PV = "1.3.0+git${SRCPV}"
 # v1.3.0
-- 
2.30.2


