Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIB-0007iY-DE
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:49 +0200
Received: by mail-ea0-f170.google.com with SMTP id a15so660878eae.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=la2lh4kP+mQFU9VVSiIPmVYz9FP9NFxhyd3dYTMxHZ0=;
	b=Qxn7LidxozMbeubNHZFoYVzH8gCdPHMA7Gw8Kvf1dkOsqwC0qM49yhPOgoXlMeYyye
	J/YAb/QUUiAc/1GD4iXplBPNUb75E8+iYAibsjgpC3uRV0IcIRbq8oXQmfWACxz3iexQ
	pCaODEPzLjh/orJ8kTueWzLhZhaWMnMxUs9hAZtLnzCrc1Eh3XIKQwJ4aCFlIVZ5K+52
	S+C5ytLTYuuTOpZDz2qGm+aRvD7Nl3WWTGgCB3mYscpQiYdqCdLZ1xcAVZziFWwCWSZB
	W5R0MwOqgbcx2UseU0dwQLJg0c3FY6482dTBrw8MSpQfzUSlvAvY58cQMX4eU3Rh4kpJ
	I1PQ==
X-Received: by 10.15.101.200 with SMTP id bp48mr15596710eeb.38.1365677184693; 
	Thu, 11 Apr 2013 03:46:24 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:45:59 +0200
Message-Id: <1365677165-9296-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkbikn+SaalWq7ziu0UrqVxk24+7cQ9+vcvifybp+WmpBTmTHYCgPTvnGytjNSpQoYSeaSO
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 2/8] Revert "cloud9: add EnvironmentFile"
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
X-List-Received-Date: Thu, 11 Apr 2013 11:03:50 -0000
X-List-Received-Date: Thu, 11 Apr 2013 11:03:50 -0000

This introduces a gentoo-ism which we don't want, and is fixed differently now

This reverts commit 222b4eb3e469a84e929a968def6773405f369a3d.
---
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index 54a9db0..714b465 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -3,7 +3,6 @@ Description=Cloud9 IDE
 ConditionPathExists=|/var/lib/cloud9
 
 [Service]
-EnvironmentFile=-/etc/conf.d/node
 ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
-- 
1.8.1.4



