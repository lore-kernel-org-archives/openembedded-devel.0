Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N344M-0004uB-LG
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 09:39:53 +0100
Received: by mail-ew0-f209.google.com with SMTP id 5so489094ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6ag5ucpWLATWf4pQVAbYB7U40JneFUgXJtUEjTuItCU=;
	b=WLL3opU1e+qUCe17jXGPCM4DQDJhsVRVv4qSQNdZifUm7wuuf+uzhj04um4YXzxoSE
	fKM5YuEQdaLz3LMHk2uLMbmC07FLt4MbYqoqUTiQ1ISC0X5eW1K6PjwqxCMF2TvJQZjZ
	hVO9T/BnB3ntOQBman4T2GXxRVrELdpvtzHes=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ekmtd6vKafpAxj7Z5B05/pEjf1aZCF66nETMrItGKwYv7XfibDl6okSi18VgLXnM7D
	P2WERj7oOdlfa4emA0lQqHrBA8utycThpbjmfh79RIlU5DePzw5LccDlECKAFb9ZjCwh
	LQcl7jkt/S3keZvtTUIabQwA+wBk/Ws+xGGL4=
Received: by 10.211.147.5 with SMTP id z5mr1248174ebn.87.1256719126249;
	Wed, 28 Oct 2009 01:38:46 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 10sm2203065eyz.19.2009.10.28.01.38.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Oct 2009 01:38:45 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 09:38:39 +0100
Message-Id: <1256719119-2413-6-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1256719119-2413-5-git-send-email-eballetbo@gmail.com>
References: <1256719119-2413-1-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-2-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-3-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-4-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-5-git-send-email-eballetbo@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [STABLE][PATCH 5/5] netbase: Add version for IGEP v2 board
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
X-List-Received-Date: Wed, 28 Oct 2009 08:39:53 -0000

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>


Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 recipes/netbase/netbase/igep0020/interfaces |    5 +++++
 recipes/netbase/netbase_4.21.bb             |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/igep0020/interfaces

diff --git a/recipes/netbase/netbase/igep0020/interfaces b/recipes/netbase/netbase/igep0020/interfaces
new file mode 100644
index 0000000..d7409f7
--- /dev/null
+++ b/recipes/netbase/netbase/igep0020/interfaces
@@ -0,0 +1,5 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+
+# The loopback interface
+auto lo
+iface lo inet loopback
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 71259d3..11d59f7 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r37"
+PR = "r38"
 
 inherit update-rc.d
 
-- 
1.5.4.3



