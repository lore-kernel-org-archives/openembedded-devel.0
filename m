Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B48E75741
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:22:37 +0000 (UTC)
Received: by lbbuc2 with SMTP id uc2so36001233lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2O19PlGUVorjxe1qsnMQjBiqd8lDLDzhC46qJJYbknY=;
	b=hp4Jvixh+YcMBui2S4hvS9jeXaDuHz08z0x8pbl0yTeoBbfW5/FV8Iez2Ua0j7mheu
	jHF42bBOkPz5jVBV/JU/Qncd/2OGHckI4w6M0rCf6fmC/FmC6M3uY4soXxm71J6w/h+h
	h4lFRywx2fTzZiAWI4wKOpiRUUNsgELk3NoEdDBtwfLNq9Gt7mdfA2bPxiygTI+WWqMi
	3i4OTVF32kdUOjniZ9KTw3zHxJ2NfhN+HKm/Wx2V7V2sO/ZsxX/w5vuDmclmVjh0zJC7
	OMfleAiQ2oex0lLQusrVVlOCgWyMyIDYKqBhxckEarWfE6bFCjNP11Xq7dO/KQXaXpJ9
	Ae8Q==
X-Received: by 10.152.184.101 with SMTP id et5mr4537643lac.43.1432844558302;
	Thu, 28 May 2015 13:22:38 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id q1sm817389lah.27.2015.05.28.13.22.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:22:37 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:22:23 +0300
Message-Id: <1432844543-4452-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
References: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie][PATCH 4/4] opie-sysinfo-images: fix warning about nonexistant ${S} directory
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
X-List-Received-Date: Thu, 28 May 2015 20:22:43 -0000

Point ${S} to ${WORKDIR}/pics to fix the warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-sysinfo/opie-sysinfo-images.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-opie/opie-sysinfo/opie-sysinfo-images.inc b/recipes-opie/opie-sysinfo/opie-sysinfo-images.inc
index ba40030..d82a3ac 100644
--- a/recipes-opie/opie-sysinfo/opie-sysinfo-images.inc
+++ b/recipes-opie/opie-sysinfo/opie-sysinfo-images.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "sysinfo"
 
-S = "${WORKDIR}/${APPNAME}"
+S = "${WORKDIR}/pics"
 
 inherit opie
 
-- 
2.1.4


