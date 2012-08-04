Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxnhr-0001Z7-TE
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 01:24:28 +0200
Received: by pbbrq2 with SMTP id rq2so3081011pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 16:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zCaOWE4nhUhMeqBQbj/ycJAAwdAhWnuzlkmPzwgvQho=;
	b=OCVg9EiT8UPXdjBdvQkF51lov9WeVoKHhwopa869+pAIMbbjLXQmorskGjGvY87GDw
	UlkZxv/13PVL1A2SyQPNwIWGkK9hLVUr8H39AwdoVcHjBXjVgPpa31RHaqS0S68Fn/Al
	dkkWPWLqEetZEWQq4AXPJ0ewJsYwNtb+dQW80Oqb0gFkzCGQUAwaLkMKieBuBV5yOHVW
	NlH5hzEtoZPPR7N79kv5JORYV+MA4npRYR8g2lcOYsRWJzeY+MiUbeaZ0eJEiTcRiczQ
	wJcVWSePNbi/4IIWf3riAZZXUXqIavEmD70S01NCf9vNZg4UJueOrFnLYDDa5reDqWVr
	7scQ==
Received: by 10.68.135.201 with SMTP id pu9mr7888412pbb.146.1344121964277;
	Sat, 04 Aug 2012 16:12:44 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id pq1sm5741345pbb.3.2012.08.04.16.12.42
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 16:12:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 16:12:35 -0700
Message-Id: <1344121955-7541-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH V5 1/8] gitpkgv.bbclass: Add a symlink from meta-oe
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
X-List-Received-Date: Sat, 04 Aug 2012 23:24:28 -0000

This is for systemd layer to be used with
out depending on meta-oe eventually gitpkgv
or similar solution should come out of OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/gitpkgv.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 meta-systemd/classes/gitpkgv.bbclass

diff --git a/meta-systemd/classes/gitpkgv.bbclass b/meta-systemd/classes/gitpkgv.bbclass
new file mode 120000
index 0000000..f3f13d1
--- /dev/null
+++ b/meta-systemd/classes/gitpkgv.bbclass
@@ -0,0 +1 @@
+../../meta-oe/classes/gitpkgv.bbclass
\ No newline at end of file
-- 
1.7.5.4



