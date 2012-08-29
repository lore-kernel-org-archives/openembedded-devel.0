Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T6sK2-0000ez-Ju
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 02:09:22 +0200
Received: by bkcik5 with SMTP id ik5so555986bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 16:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=UPwWWTKHKkOCV9L+pIPkHTd9c9zRSqNaogda6pVMoCM=;
	b=ydFqKKZVnhf4m+l8sF6HBAaNwh4kIjp7aRkqbGkzHw92390ucCv8L7aOYjVM1eRZ4W
	ooIuc+26gRSIWN8AlvJH9yiwQ4fEr46NnPnY30Er/PQYh+X9tEf1qUCIUTi6h4tLLu8T
	LoO1bXBx0NAZds+nIapDvXj+d0xmYXLxCPx5KrX2TeI61GPatnHR9AIjHqbk5qp1ceHc
	YJBwj4hi3ObMRTjDeoPmRdZt2cMGto8gcJXXcQBd8MbyLqpIRadrNYW8NqGcvvII2PKZ
	BcjincUq40RJEVgvrrceTxY62AbQn6b17LRaN+GGqbILoMWmuULicjT3kldMDq3RsgZ4
	GBKg==
Received: by 10.204.130.10 with SMTP id q10mr1875214bks.90.1346284628189;
	Wed, 29 Aug 2012 16:57:08 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id he8sm27844bkc.3.2012.08.29.16.57.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 16:57:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 01:56:20 +0200
Message-Id: <1346284580-16194-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1346284580-16194-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346284580-16194-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 2/2] gtk-xfce-engine: fix staticdev warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 00:09:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
index 9900bd6..71310b3 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
@@ -15,4 +15,4 @@ SRC_URI[sha256sum] = "55604002526c800539f2a8a79e7df3bf23717f45e4bfab31c154c8d01c
 FILES_${PN} += "${libdir}/gtk-2.0/*/engines \
                 ${datadir}/themes/"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
-
+FILES_${PN}-staticdev += "${libdir}/gtk-2.0/*/engines/*.a"
-- 
1.7.6.5



