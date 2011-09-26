Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1R86gs-0007e2-KI
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 10:37:30 +0200
Received: by yia27 with SMTP id 27so5181132yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=G3W+QlkVSl0SmIeShMYJwOBC+nsyFq7SQgijDJvM0zA=;
	b=P6ZT43qZZr6+KKvV6FGnVQI7JgG0ZMg2z1Kv1c0LB6rbb7KcJCanYay1m4+TJrtmeQ
	7ROh0OSFlRiNDKqJaaaZLGxvSsNvCnQuRxojq0641qHOJTw5eh/iuSEwdd0Xa0/pZv5x
	4FkE5EJO+9F7CzuyYO2y0qqXCp1VQNnJUe9RA=
Received: by 10.236.129.238 with SMTP id h74mr37433218yhi.99.1317025926317;
	Mon, 26 Sep 2011 01:32:06 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id u45sm28196558yhh.8.2011.09.26.01.32.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 01:32:03 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 11:29:36 +0300
Message-Id: <1317025776-2433-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] wpa_supplicant update to use a newer commit
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
X-List-Received-Date: Mon, 26 Sep 2011 08:37:30 -0000

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/wpa-supplicant/wpa-supplicant_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/wpa-supplicant/wpa-supplicant_git.bb b/recipes/wpa-supplicant/wpa-supplicant_git.bb
index 8f6971e..7408808 100644
--- a/recipes/wpa-supplicant/wpa-supplicant_git.bb
+++ b/recipes/wpa-supplicant/wpa-supplicant_git.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-SRCREV = "b8fb017272ed4794339978c9fbc0e74571a44728"
+SRCREV = "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
 PR = "r0"
 PV = "0.7.3+0.8.0-rc"
 PR_append = "+gitr${SRCPV}"
-- 
1.7.0.4



