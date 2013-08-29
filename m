Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 473306BDC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:33 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so340704eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=56sFVye7MKoEaVLWFYkCM5UCtIPSSMwC2doFfgDPiUc=;
	b=htnwvpEP/Zqa8btvetxdH55UI9fnlWIMNEYguuAfkP7GpalAO5wH8w8xw/IuZKxeJz
	iy1SJJUlQV9Xg5pRuaNTbeTaT4pq7ardzXAmDRSJIpNIJbAlhAqJpB5YhpF+KRXjqPVg
	qOrZmq1CBqhOJrzA7LOgWezyhvyOOAcwiKNo4+kA7QMoLYeuGpqHjQP+JINhBtQ0xmst
	3uxYVqibmS8yvAc9Ie/gPe9ZA4lIZblU9E1xMdnEtjYTR1FlLlr0TD8QKTXT+IfpG2Qd
	ie4aF4NscUBILryN/ZwNlDaMv+6vy99dpBYPCkC9QfR0ZmvWyt8eQwe+yBPKmDDmJihT
	f30g==
X-Received: by 10.14.126.73 with SMTP id a49mr5379925eei.48.1377791493729;
	Thu, 29 Aug 2013 08:51:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm47164981eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:26 +0200
Message-Id: <0d9ca94f21e9fc850c705ab6b6dfc4cc74b924bd.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 33/66] udisks: Add PACKAGECONFIG for parted
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index fc5d95b..32f0c11 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -19,6 +19,9 @@ PR = "r9"
 
 inherit autotools systemd
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
+
 EXTRA_OECONF = "--disable-man-pages"
 
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
-- 
1.8.3.2


