Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 06BAB70C96
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:24:46 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so9840223wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=odmjT02DZuJgsrxScAZWiS/eY+/fyv0GuxCS4l0JHxo=;
	b=SceARbMFMODQIZ6AFINS+jbdvTSoGZUVM+BSKA1vfAo43Veyn8ASQh30x283QFCTOF
	arx6Xiz5b8HtZXdCo1X0oeXKUU19COXNWy0CHZyuOaEesBd8G+m6NbvfTb29PVrHTD3Y
	gy8nCWc912toHpFXMIYsH+AMPjfN6zCHD9+Nic+dJ8OCDp8uBp2CowDOmfD+gIJmn/oN
	KxNRhAMhy8vF1Zu+YwTLjaZp6ckHlYS5Llp6VGs/iukeEyxT5XlvqMM7s/Oc/USiogdf
	oGeDLi/VVwPUjjgzx4TpRu8qxf8URLpPeg6+TYNCL7ixqqA2sTkaywbVqKOgsQ3We/4V
	pbJA==
X-Received: by 10.180.74.240 with SMTP id x16mr32409761wiv.13.1407846287380;
	Tue, 12 Aug 2014 05:24:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i8sm55732858wib.6.2014.08.12.05.24.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:24:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:25:11 +0200
Message-Id: <e518b047648a45092441e341368000ce3a61a079.1407846175.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy][PATCH 1/5] sethdlc: Set MACHINE_ARCH, because of virtual/kernel dependency
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
X-List-Received-Date: Tue, 12 Aug 2014 12:24:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
index 3a9692f..cf74827 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -12,7 +12,8 @@ SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6a
 
 S = "${WORKDIR}/${BPN}-1.18"
 
-DEPENDS="virtual/kernel"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+DEPENDS = "virtual/kernel"
 
 EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
               KERNEL_DIR=${STAGING_KERNEL_DIR} "
-- 
2.0.4


