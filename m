Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 281B07264D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:33 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id fp1so14467081pdb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zvdhHiqsLdLN0uvK1Dxu6MDcVGRZHq1JkNBwqBcYSg0=;
	b=mzgtoh+SGsFqFlt53CsqmMsmEvtdNjNqCHpe5sy9Gjxk2RIFyNfJVdaTTvLukyQCwE
	4ymr86Nr+RzYjhsFYQ1Cl7JszB9gFH7giq72PoLIjQnkEgOLsJxWa4KvJfsgO7HvquLb
	lBF/JikOjUuZgFF9dfam8GaZv9rbjwSy2KGehwdCUX/Xz3/XFd3WPIjTt7NydkAiAh9W
	a1Ra6W326E2v0frV0E50vTcx5gW+muNB2nODpX0rnDScTOGvqtR4i+YyqX0w6MWFFMI2
	AhyyQ2E4q41WkSas7yFCHP8iQTFOBvnbNDD2Pof2E2eodfkaomlwQkovbHgGysveb+oO
	fY5w==
X-Received: by 10.66.184.175 with SMTP id ev15mr43981101pac.78.1419700954478; 
	Sat, 27 Dec 2014 09:22:34 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:58 -0800
Message-Id: <c46d487b35f71ff4a9ecbc02ab17fde4ddd0a506.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 11/27] lvm2: add lvm.con to CONFFILES
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:36 -0000

From: Liu Jian <jian.liu@windriver.com>

* Files will be over written when updating using rpm.

* If there is no %config micro before the file in the spec file,
  this file will be over-written after updating this package
  using rpm. This will make our settings lost.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 1bbb158..42f6e3a 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -48,3 +48,5 @@ FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
 RDEPENDS_${PN} = "bash"
+
+CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
-- 
1.9.1


