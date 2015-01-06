Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC9D72916
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:59:34 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so30796004pab.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 07:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lFdWF6KpRKvbK8yQRCeb9vstdver4ZsUco1Zgg82g04=;
	b=c3G0Uexg/I78tHvll/LH59cquXUnoGuCOSuL2VuZbkf1JFw2FFWOnKVxqw28bpq0il
	HBsisHR3fcuh70w5x9v1lLD0TvvAE+F7KOOu81dMVNDvgLYL0dZrEzIWkr6Xx3rczrP4
	I1MC6OlFHuTsmTkZ42d6/SJ+tiEjoGT5dZ5W5gpZwMFsiNFYudy9nLqUImhLJHCvi6Wc
	Q6CaCS+/9iR/Caaynq/NR6JwLgnSfXQGflB24c4eYVMCLZc7EZpx6/BEQBPHGOh9ZVSw
	/xqI8nAOER9ylFA5fNldumGLGPI+ch+SFE2zi9H9pFVLNYblzGpnR5rAyFhT1fHMlr8e
	QXtg==
X-Received: by 10.67.7.225 with SMTP id df1mr46932546pad.48.1420559975102;
	Tue, 06 Jan 2015 07:59:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	kr10sm36866390pdb.42.2015.01.06.07.59.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 07:59:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:59:20 -0800
Message-Id: <1420559960-8518-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
References: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][PATCH 2/2] netkit-rwho: fix rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 15:59:37 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
index 4433dc1..9072629 100644
--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
@@ -81,3 +81,5 @@ FILES_${PN}-server = "${sbindir}/* ${localstatedir} ${sysconfdir}/default/* ${sy
 FILES_${PN}-doc = "${mandir}"
 FILES_${PN}-dbg = "${prefix}/src/debug \
             ${bindir}/.debug ${sbindir}/.debug"
+
+RDEPENDS_${PN} += "initscripts-functions"
-- 
1.9.1


