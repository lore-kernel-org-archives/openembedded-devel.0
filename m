Return-Path: <awais.belal@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id B81B672304
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:41:08 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so570114pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UeTnne989Tb8MhwIVOE0aAPp4EvfiJQi47mkODL0Rps=;
	b=KtmA3gaHQPMfEMgNnOMTI9Hs2U20dwcYetBdHG3NhOqYRtvPm3Cf8o8m/vXnzpkr8V
	NSTCegAQBQM8Up6PhfVBTd83mEMusVr+4mXpLlSqYROwOYN3MPMog+jGl0qdimgl2RMC
	4Qh/LCpDNHfxufqqCSNALj6XEkA5BZTozNprzmtA60UhlXF0FhoGDALKcAs3UmiJCk8l
	b2zR7BdSmoFi8Mlsgxfn4K298qTjmC1C0pnNQe7WRjYN5vHMTGpoPgYe6W1e1fbfOsXj
	mDLoHJvJmZ9eVzbNw+7+ULs+5+yCfroeWXNqhcNC91QVVQCUYzA64JW1S+S96X7UuXq9
	DRrA==
X-Received: by 10.68.229.193 with SMTP id ss1mr35479417pbc.16.1417779669063;
	Fri, 05 Dec 2014 03:41:09 -0800 (PST)
Received: from awais-Precision-M4700.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id
	xx2sm23695526pab.17.2014.12.05.03.41.06 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Dec 2014 03:41:08 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
X-Google-Original-From: Awais Belal <awais_belal@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Dec 2014 16:40:59 +0500
Message-Id: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/2] mplayer2: use B = "${S}"
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
X-List-Received-Date: Fri, 05 Dec 2014 11:41:10 -0000

The mplayer2 package does not support out of tree builds
and the do_configure step also tries to find the configure
script in the same build directory while the script lies in
the src directory.
This patch updates the builddir to point to the srcdir in
order to cope with the above issues.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 65fab1f..4656057 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -29,6 +29,7 @@ PR = "r13"
 PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
+B = "${S}"
 
 FILES_${PN} = "${bindir}/mplayer ${libdir} /usr/etc/mplayer/"
 CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
-- 
1.7.9.5


