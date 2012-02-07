Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusFJ-0001OI-0F
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 22:06:37 +0100
Received: by yenr5 with SMTP id r5so3080431yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=BfpFdliYToiBLoHC0zYJfzpc+FdOQjbdOjOXcMU0BPI=;
	b=avsGfAy6hv4G6bHwg5gvuqdwboufEBSkJln1/cL8MVBMSrjaVKIbCChW4LFG7dRVft
	tKAyQ4BZ+Z8bXCEdnFahyNMS2HgrtprI+FOfYtJoWc99OLnHAggk27+M+xfqIxhX4xHO
	yjXyM4oiPzuzbFVqqbM8NHPAMx/RdemIkhldY=
Received: by 10.236.184.129 with SMTP id s1mr34641367yhm.21.1328648314122;
	Tue, 07 Feb 2012 12:58:34 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o61sm30096056yhk.10.2012.02.07.12.58.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 12:58:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 20:58:22 +0000
Message-Id: <883623185202434d1d83aebc211fffae3c05e800.1328648257.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328648257.git.otavio@ossystems.com.br>
References: <cover.1328648257.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328648257.git.otavio@ossystems.com.br>
References: <cover.1328648257.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/3] Revert "systemd.bbclass: depends on systemd"
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
X-List-Received-Date: Tue, 07 Feb 2012 21:06:37 -0000

This reverts commit c029d4a268de1ac7076fbeb9e337e96fdb1b226d.
---
 meta-oe/classes/systemd.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 094a12c..2ca7bfc 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_append = " systemd systemd-systemctl-native"
+DEPENDS_append = " systemd-systemctl-native"
 
 systemd_postinst() {
 OPTS=""
-- 
1.7.2.5



