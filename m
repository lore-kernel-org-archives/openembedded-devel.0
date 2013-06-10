Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF376204F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 17:06:34 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id 10so6020334lbf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 10:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6/NLthAP5iHtNr6wRcvuCQXDjDIkTbAR9+FHi392UDM=;
	b=GjEQguDDzD8tUlvSOSqdwMwvOroCKvDG0Rc6LevEJfYLEguB7Tvzyxs/b7HkHsLUiJ
	/IJg3iGbQESqmfvKgsSFbGcECnH7omrGY0270Hu7/pA1SufMAwrZTTMiF7FkqQM4Yj00
	Pl/XvH25iReKCbh9znRd3eQleuagdnYCuNtRw69fHARS4zc/80HINyRSt+4GuzUgIB3C
	oOU5eJI+I5nPsuybYKITKUecaj4TKwXW/Tk08tLSrsHG+rzRsY6XmX8LinXZe23id6gt
	y3M90RKKxUGrO13LZWCn/CfFBLC08/3Sp8A+p4TsgKra9wGRAaanVE5Dp/xTU7NI+Jaj
	baiA==
X-Received: by 10.152.7.103 with SMTP id i7mr5462076laa.39.1370883994704;
	Mon, 10 Jun 2013 10:06:34 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id w9sm4235858lbk.7.2013.06.10.10.06.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 10:06:33 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Um5Y7-0001SU-V8; Mon, 10 Jun 2013 20:06:32 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jun 2013 20:06:30 +0300
Message-Id: <1370883990-5569-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] libungif: add native build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2013 17:06:35 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-extended/libungif/libungif_4.1.3.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
index 0e9bf9b..3e4b78b 100644
--- a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
+++ b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
@@ -12,3 +12,5 @@ inherit autotools lib_package
 PACKAGES =+ "${PN}-utils"
 
 FILES_${PN}-utils = "${bindir}/*"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4


