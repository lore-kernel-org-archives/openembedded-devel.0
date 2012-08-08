Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Syxrd-00074R-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 06:27:21 +0200
Received: by yenm1 with SMTP id m1so337129yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 21:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aT/IcsUt7CN55Sq3y030texxBOl7t7JL1U56trrA7C8=;
	b=oRjscifb+XwaSEQkjre1caJIh0VY8l1GMZIV/GJzL6H3DcXsfVA8rHrjo8K+lfsIiD
	7OG0DYXo4n5LpxA/O6EzCpmRBYYeNxjQS/F1REfiUik5XrbZsbKHwULO/FGeWZ2OsFz0
	oTu+e+a1DYLR7xTRmEOdnA9LBsNlC+9mbzVZfbW+sCUpzJ33MnBc6NsgCdfgsNYkSTmC
	Nw1u5GlhNb6Ib/l4M3ZCktrw+GwkGeQHQwwEdiGqWYtZgY2bA6OzxTMB7iW86/ki8ppo
	XOk02RnL/k2ajevzCCmYjhSiaeljr+LPNAvM/rtWAXom4kbRT1cgVpBqk4Zkfy3Jc9rR
	LJyg==
Received: by 10.66.80.165 with SMTP id s5mr30747213pax.41.1344399333609;
	Tue, 07 Aug 2012 21:15:33 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jv6sm12506552pbc.40.2012.08.07.21.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 21:15:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 21:15:14 -0700
Message-Id: <1344399314-2557-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] meta-systemd: Fix corrupted symlink
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
X-List-Received-Date: Wed, 08 Aug 2012 04:27:21 -0000

The symlink seems to be corrupt somehow

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/gitpkgv.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-systemd/classes/gitpkgv.bbclass b/meta-systemd/classes/gitpkgv.bbclass
index 8205151..f3f13d1 120000
--- a/meta-systemd/classes/gitpkgv.bbclass
+++ b/meta-systemd/classes/gitpkgv.bbclass
@@ -1 +1 @@
-../../meta-oe/classes/gitpkgv.bbclass
+../../meta-oe/classes/gitpkgv.bbclass
\ No newline at end of file
-- 
1.7.9.5



