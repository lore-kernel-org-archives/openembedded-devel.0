Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id DF84E73D97
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:22:31 +0000 (UTC)
Received: by lbbuc2 with SMTP id uc2so35999752lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=vV/X3JjL0xklDqpCGGLBCWIFs6fmzf3MW/6puNzAMZw=;
	b=fsuIMeMDgYzqpfwjwgW2l2n3LxMljQxdt+oXJj0qXwvJj2SPrj8nM44/lP6nFZrzvk
	WuBlVVf6566L/zejmZ0fvsF7kd34majQssrrvfNS77+5S6hqSWAWY7nPS3XJxM4RlPG0
	FfpOxw8PQjzRzD5ASgHQt0HQGmfEiIREYaoQHr1gNCMmECnD3RVygQhlo8L1Iycer4Ve
	vUKvdYK7VKiUiU9bv5P8kJbkiJ/eXl6qi5fU8lX7/a+DqBSmQvJ5gcOIbKS0zTe5/vBA
	yxqkqDIwymbpdCkG0ROQZUkts68/kuyxWHJ5HM4siu+lf2k1UJRIa8qmoWQRD16MvspO
	UzhA==
X-Received: by 10.112.137.99 with SMTP id qh3mr4587373lbb.108.1432844552638;
	Thu, 28 May 2015 13:22:32 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id q1sm817389lah.27.2015.05.28.13.22.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:22:31 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:22:20 +0300
Message-Id: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-opie][PATCH 1/4] opie-icon-reload: fix warning about nonexistant ${S} directory
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
X-List-Received-Date: Thu, 28 May 2015 20:22:32 -0000

Point ${S} to ${WORKDIR} to fix the warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-icon-reload/opie-icon-reload.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-opie/opie-icon-reload/opie-icon-reload.inc b/recipes-opie/opie-icon-reload/opie-icon-reload.inc
index 6eb628c..102c01d 100644
--- a/recipes-opie/opie-icon-reload/opie-icon-reload.inc
+++ b/recipes-opie/opie-icon-reload/opie-icon-reload.inc
@@ -10,6 +10,8 @@ SRC_URI = "file://icon-reload.desktop \
 	   file://icon-reload.sh \
 	   file://reload.png"
 
+S = "${WORKDIR}"
+
 inherit palmtop-defs
 
 FILES_${PN} += "${palmtopdir}"
-- 
2.1.4


