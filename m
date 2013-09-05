Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 437F560F77
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 21:04:13 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id y10so2329692pdj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jWFC2AL0g2Wn04O+zdrYGbsiSIk/NdQBfx1TCaM+tgk=;
	b=SUTWslUDmNVRtpnDtyK4268Hg4pk9qyZFdZQICfDFoN5ItQIr+LSl+1ErIRaCbewuk
	hA6Uspc4CIORQXiI+P94FwxiAoujW4bTV2LssBdrlBuBdmXMrGPKZcdmosZPtYZj/f4S
	hga8AlprbLRBtJTJniSk0Sd/nYr5SzbUrhxyUgR8D20nME3Rp3bOlFWbc77UusxaiqwK
	WfBXhk27IfTkYLedRBGmT2ZLdCSc+Slr+B2JRO4rLMA9MAmeyYgOZk9H/fzPU/K4tpZ3
	92t6fxDv6QMWfOp6NBMhTKW32of6iXLAL/nw7x6IlEvv+Q+uayJ1lEBrKXdSMPYPaPCw
	7Phg==
X-Received: by 10.66.158.196 with SMTP id ww4mr46153pab.57.1378415055119;
	Thu, 05 Sep 2013 14:04:15 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	py4sm37682573pbb.33.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 14:04:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 14:02:55 -0700
Message-Id: <1378414975-13587-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-networking][PATCH] inetutils: Remove empty usr/lib
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
X-List-Received-Date: Thu, 05 Sep 2013 21:04:13 -0000

This directory is empty and is flagged by QA checker

ERROR: QA Issue: inetutils: Files/directories were installed but not
shipped
  /usr/lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 7c7343e..e371ae5 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -70,6 +70,8 @@ do_install_append () {
     cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
     cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
     rm -rf ${D}${libexecdir}/
+    # remove usr/lib if empty
+    rmdir ${D}${libdir}
 }
 
 PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
-- 
1.8.4


