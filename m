Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwg-0001OY-Vg
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:29 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so324601eaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=OeCtTeUzhWdSp3Ltji4V4n9o4CvkaJ0ABtaKmy6ZAJI=;
	b=dfEtAG0P8OWz7p97KlPUdp/hNsZvq4nLbBs2ZzT8htktacbsxDxyXi3+TsZo2iz1qw
	p58yxeBOzW39jQdK4u72nOrvGErRZ5lX0B7pEYOFQ4IS5aBpee7nG3cEsNiuM/mMkzyr
	GlhO6tbxQ6j45PG4FVGgXm8h9P4+seaTESA71xO6onvhMhr4PU0BfThaauKw+MQehXlV
	N4EQqrK9rSjToIPfpJ0mV02JEu+Lih9TpwtjYbWKMNzxd+KjsDaIJ8pkvDnCRBfiyycx
	IZiHaJ56G6qxVYHGn9G94XyP+7drwlyakV0X57fCfjM9NsGkSjBexWsq/ljKShBtgnIF
	uhhw==
X-Received: by 10.14.210.132 with SMTP id u4mr6954442eeo.19.1365610505412;
	Wed, 10 Apr 2013 09:15:05 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.15.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:15:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:22 +0200
Message-Id: <1365610462-29689-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmvpe5XX+Mud7pfjm9kwVRT/miHvj0VOsBQAUCCkNxbwkWUsgzcKHAemGTgOSKxzf8NuYkw
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 8/8] cloud9 bbappend: add EnvironmentFile
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:30 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index f805ea9..495b131 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -4,6 +4,7 @@ ConditionPathExists=|/var/lib/cloud9
 
 [Service]
 Restart=always
+EnvironmentFile=-/etc/default/node
 ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
-- 
1.8.1.4



