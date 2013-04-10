Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwV-0001MU-49
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:15 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so324523ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=la2lh4kP+mQFU9VVSiIPmVYz9FP9NFxhyd3dYTMxHZ0=;
	b=DRTD9aWTT9qTmEL81JEuILZd614HjMU8RKyCYa0+noFCbDsLpIRKCUSjfo2X7qcpaX
	/JMg6dKWRGLlDTltsUKV+CiUNGf64imWW9XyFLvAlIa11OOkx+/DI33SvDX5U0CaqwXI
	w7v8AKMti+UPeYm8qQ2Exa6bv6gHZY3Nzm8an7QWgVh6ds5bPjuXJsfrM5A2WSO5wK84
	UirMf80JRBSTSxNJaivb/aSWkbQhTybAHfbBIm4yt0w4VsL18/J8fjmPcAQAgJ7C9md5
	W+ZVGhdgnmtV/DXRTCltFJBRh3xXWaxUIyygzMYZ0Cc0ifzUbvDSm0PSdbVVxa5bIBVZ
	btTQ==
X-Received: by 10.14.216.2 with SMTP id f2mr6831138eep.44.1365610493418;
	Wed, 10 Apr 2013 09:14:53 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.14.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:14:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:16 +0200
Message-Id: <1365610462-29689-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQncI3YUXuut7r3gFf36SNXB0fYvF+OmFPorFPWpwnXeNoayOv9A1XXBAECOYFyFrJiLCvbr
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/8] Revert "cloud9: add EnvironmentFile"
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:15 -0000

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



