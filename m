Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 599B9724B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 17:50:44 +0000 (UTC)
Received: by qcay5 with SMTP id y5so20265994qca.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 10:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=lTJ2wEcLd9Kaq9rBgYuMeY32Vf6Us+0p10XyS75+HXU=;
	b=f2RCxtY8BlWJbADyOcrAt+7s3kT2CxRNd/tq3lUyaYz72l7ciwUEr2ztE7ewjaFp+4
	Vwc1K58HggejHY1VJo5JBtKwtvfVV6FyKxUNa2jmipfa85+Va0SW9Xe86POPrlCu+Oli
	MNnXTddhtl7LeF6m48GQewKRKknPs8od1bQ1Et8qdjz8PW/B8t8GG88JL67/OkVvb6eA
	kw5+/qASVpO/8iOtmh+zE+dk6jIpRRAsYX5FFwZoAEMmsLOfh00YusPBKJ252F5uBh3h
	sop8bvJDDCK0leEoFZ41MJ2mU3oDijvPFP9kuNBjJ+tTNcoyBM3sdUBTibvDOG16Czqz
	iobQ==
X-Received: by 10.55.55.75 with SMTP id e72mr31247646qka.30.1427824245947;
	Tue, 31 Mar 2015 10:50:45 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id 91sm10331785qkw.13.2015.03.31.10.50.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 10:50:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 7081D1CDDE022; Tue, 31 Mar 2015 14:50:41 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Mar 2015 14:50:36 -0300
Message-Id: <1427824236-14469-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] evtest: Update to 1.32-based release
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
X-List-Received-Date: Tue, 31 Mar 2015 17:50:46 -0000

This updates to revision b8343ec1 which is based on 1.32 release and
includes some fixes on top of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/evtest/evtest_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/evtest/evtest_git.bb b/meta-oe/recipes-support/evtest/evtest_git.bb
index 6fbb77d..96feab7 100644
--- a/meta-oe/recipes-support/evtest/evtest_git.bb
+++ b/meta-oe/recipes-support/evtest/evtest_git.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "0e14da978ea906c7fdaf90f54f798a542e79ce8f"
+SRCREV = "b8343ec1124da18bdabcc04809a8731b9e39295d"
 SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
 
-PV = "1.31+${SRCPV}"
+PV = "1.32+${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


