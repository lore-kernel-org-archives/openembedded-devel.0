Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3EF73BB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 21:31:52 +0000 (UTC)
Received: by wief7 with SMTP id f7so134888680wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lEhJ96mt746RQ0y7QE/mXq7rv8mEH8kUy2Anu8GHRfE=;
	b=LiPKJFEsZnQ/6gEbZWkDEBfCOp4NrM9sRY9znckIuCwZcjk7eIK2nvA+0MyU8BTBn1
	CXgWVbVwSPLgrzoLFlnzoWIfix9U0eL3brGfeoSDGiteNOMn4n5qMqZ8OtFKSujR+slq
	u0HYPSH6dr/OMoGO3FzeGM7bOTdSlpp5n0g7Snw+WVB11WtH6BnabWgdXbENfG48XDW8
	Ph/ZMCxPIk69VaTlzX5WxIVS0KkF1BQw92xTyqPFvn+WzbjqOmKjdI8Q4JUQ960fzioc
	Zg5Sm3JOVynST6IH051XR2XVksVQeFL7GEXhp1nUbqi91QBqwxNw+v0+ijRioTnHdTBf
	aVNg==
X-Received: by 10.180.160.169 with SMTP id xl9mr854722wib.42.1430947913921;
	Wed, 06 May 2015 14:31:53 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host2-44-dynamic.54-79-r.retail.telecomitalia.it. [79.54.44.2])
	by mx.google.com with ESMTPSA id gs7sm4026762wib.10.2015.05.06.14.31.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 14:31:53 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 23:31:46 +0200
Message-Id: <1430947906-17527-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] ipaq-boot-params: fix warning about S not existing
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
X-List-Received-Date: Wed, 06 May 2015 21:31:53 -0000

Default S = "${WORKDIR}/${BP}" leads to the warning.
Fix it by setting S = "${WORKDIR}"

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb b/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb
index 74ebe6e..5696e9b 100644
--- a/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb
+++ b/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb
@@ -6,6 +6,8 @@ COMPATIBLE_MACHINE = "h3600"
 
 SRC_URI = "file://params"
 
+S = "${WORKDIR}"
+
 do_install() {
         install -d ${D}/boot
         install -m 0644 ${WORKDIR}/params ${D}/boot/
-- 
1.9.1


