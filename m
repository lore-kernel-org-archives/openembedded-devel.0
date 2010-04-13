Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eKu-0005zh-BW
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:31:20 +0200
Received: by ewy3 with SMTP id 3so223119ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9yypZLv8OlcTi7wEupGWaFpztvLzWpoB95CTmzpIQhc=;
	b=WLFut9skcid7BZwTHQkelX6Qd5dOCR/7GPKDO96pFlwxhXRcWRgHQ8CkuxFi5VShZE
	ES0NTfzuWCTAoGKFT/8PuUgjZkSAfPI5t2qJMZGzKgURjC+DFNlFCO83G9pK9mW+G1Ct
	mddBN5LsvPk2vLKotYWLDU4kXtHRQGnBTrIQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KaDvmVQOMHC+jj5yXyFshHyS1vUn6lcCfqwV4EPp0CP8FBj/f5otl7Ohd5DBkpf31f
	TwVtSO4nJnofRKPzR9860l3bn33bEeOQJDZzReShf9JFW7Qt7xg7sETCDTCnO2JdSmxd
	DQzCW52yp1p3efuVAH3f0SQ75wh2l8s+qpPwE=
Received: by 10.103.7.26 with SMTP id k26mr2992626mui.15.1271158072808;
	Tue, 13 Apr 2010 04:27:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b9sm22368040mug.43.2010.04.13.04.27.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:27:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:50 +0200
Message-Id: <1271157835-27308-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/6] bitbake.conf: enable BB_LOCALCOUNT_OVERRIDE by default, please disable if you're using AUTOREV
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
X-List-Received-Date: Tue, 13 Apr 2010 11:31:21 -0000

* For now disable autoincrement of revision counter in SRCPV, whoever
  wants it, should enable it in local.conf or distro config.
  (Set it empty BB_LOCALCOUNT_OVERRIDE = "")
* Revision counter is incremented only locally (bad for multiple
  builders filling shared feeds), LOCALCOUNT can be used to maintain
  counter globally in OE metadata (LOCALCOUNT value set in recipe).
* Make sure you disable it, if you want always upgradable paths for git
  recipes without bumping LOCALCOUNT with every SRCREV change
  or if you're using AUTOREV feature.

* LOCALCOUNT == value for revision counter in GIT recipes (NNNN in
  PV="1.0+gitrNNNN+a7401084a72285c8d3485bacf4eed593f303b1b7-r4.4")

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/bitbake.conf |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 25b8782..7533518 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -579,6 +579,16 @@ SRCREV = "1"
 SRCPV = "${@bb.fetch.get_srcrev(d)}"
 AUTOREV = "${SRCPV}"
 
+# For now disable autoincrement of revision counter in SRCPV, whoever wants it, should enable it in local.conf or distro config
+# Revision counter is incremented only locally (bad for multiple builders filling shared feeds), LOCALCOUNT can be used to maintain
+# counter globally in OE metadata (LOCALCOUNT value set in recipe).
+# Make sure you disable it, if you want always upgradable paths for git recipes without bumping LOCALCOUNT with every SRCREV change
+# or if you're using AUTOREV feature.
+BB_LOCALCOUNT_OVERRIDE = "1"
+
+# Value for revision counter in GIT recipes (NNNN in PV="1.0+gitrNNNN+a7401084a72285c8d3485bacf4eed593f303b1b7-r4.4")
+LOCALCOUNT = "0"
+
 SRC_URI = "file://${FILE}"
 
 ##################################################################
-- 
1.7.0.4



