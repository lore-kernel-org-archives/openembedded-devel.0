Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYE-0003rO-Rw
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:47 +0200
Received: by fxi1 with SMTP id 1so3592243fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WMSUe3y6Tgk4mDS59ZSri4OyqPrQBzLHCDveAi0HF1c=;
	b=TgjXTriidlrDKrQhSUHmCnpy2SHWpvmZtADuyFBYbzn3B3SNwD/E39COFMIECdGpQL
	LEb+Pab45gR/rFxxuA5jNxmed/po94nwbGOhJ3rFyVv16M9s+aXlfvnMn97l2SNRFOKk
	3XCPVlEnogwmdqSXerTJACiICKzRPB5k2fyE0=
Received: by 10.223.36.25 with SMTP id r25mr2980689fad.125.1316345012172;
	Sun, 18 Sep 2011 04:23:32 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:31 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:03 +0400
Message-Id: <1316344999-26642-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 01/17] libopie2: also use gcc45_opiemm_include.patch for git version
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:47 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopie/libopie2_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-opie/libopie/libopie2_git.bb b/recipes-opie/libopie/libopie2_git.bb
index 5355b83..e9c1325 100644
--- a/recipes-opie/libopie/libopie2_git.bb
+++ b/recipes-opie/libopie/libopie2_git.bb
@@ -4,6 +4,7 @@ PV = "${OPIE_GIT_PV}"
 PR = "r15"
 
 SRC_URI = "${OPIE_GIT};protocol=git;subpath=libopie2 \
+           file://gcc45_opiemm_include.patch \
            file://include.pro"
 
 # libdbus-qt2 is needed for new bluez4 support
-- 
1.7.2.5



