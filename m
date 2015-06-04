Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8862B7570D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:10:09 +0000 (UTC)
Received: by padjw17 with SMTP id jw17so19906323pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=137oFDwgu58Co+MDeS6ku++5YdeTzhoS1hKFxB/7zr8=;
	b=0lJyMp77vksSRIolujZ/WubxVBbU0aRFmYgk2r+oSNWhIx9qvYZRDSrmTFzm9wuR/J
	KrR/VhMc4MoamsCNbXQrmIKMakDqKoL2/1hJ+adFfjukyiyEwvAcB1oc1mdUiA5Z6VDR
	aXNNfKPHfDvBptYeiR1zkwCso36KyMQdqOgikZi3RfE4Opj7xdrFV3q/A9MxOa+5N33I
	umiumYT/hWnlfCqgv5TvEe6UcpuN388kpSv6s5MHmFAlpkpcp8OjJwDwCZCaGC2iluha
	dFQjwD9eNS+3VltNL/pl/R7xsVz1zzhJbsL1q05HFD7gjWJlQT50DvUC7b1DF59BPcIG
	8BMg==
X-Received: by 10.70.48.68 with SMTP id j4mr21636236pdn.111.1433387410946;
	Wed, 03 Jun 2015 20:10:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id k13sm2018242pbq.79.2015.06.03.20.10.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:10:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:09:45 -0700
Message-Id: <1433387388-7660-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/5] webkit-efl.inc: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:10:10 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl.inc b/meta-efl/recipes-efl/webkit/webkit-efl.inc
index cf919ec..95a3069 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl.inc
+++ b/meta-efl/recipes-efl/webkit/webkit-efl.inc
@@ -53,6 +53,7 @@ do_configure_prepend_armv5() {
 # and disabled LLINT currently isn't supported, so restrict to armv7a and x86*
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_i686 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-- 
1.9.1


