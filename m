Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXmnQ-0006X0-TK
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 08:15:32 +0200
Received: by mail-ea0-f181.google.com with SMTP id a11so86623eae.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2013 22:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ZGZapSiwr9UlPHnlRMmdCaBGyoAkH08kAyJFiqjLwRg=;
	b=ntkpKHFxD+kKR3Kog3LFihP//w7m9JeDHZjT5pcZaZubgbUFeTAciNOwt+SPs2Uvea
	RMwWRek48qzuOtE3an73FFMMxgdGtC7KL2JKq/Bb0+XBmKsS8qe0WqGyXyqiUMruEpGM
	64yG4hON4aCyroSsgjsLuCM7oywkEMzX5W//AaUq9cvfUCKsyP+17jEYlJQBuZqpmM1A
	4YpYaptS02UoPE4R6ZIYaE21Q+uG9mlt1DYa9yjRY3Ol61SL4Nw3jb1IOyJsX7Hz3LmV
	dQhKXwxVM4bzD9osvO9nPZGpqazxRy9neNN3MbExpr7zdoE8AJ9To6y9OqYyll/bLBgt
	isew==
X-Received: by 10.15.36.135 with SMTP id i7mr15614174eev.34.1367474239938;
	Wed, 01 May 2013 22:57:19 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id cd3sm7434258eeb.6.2013.05.01.22.57.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 01 May 2013 22:57:19 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 May 2013 07:57:12 +0200
Message-Id: <1367474232-30799-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlr0eSItmKos0r/mSPMkGmmbmB2w5RzNDScvu4oLd3dwdfeGBNTvz+Zb2aPcMpBhU98EV7t
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-systemd][PATCH] dropbear@.service: don't kill screen/tmux processes on disconnect
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
X-List-Received-Date: Thu, 02 May 2013 06:15:39 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
index 813788f..59ed07b 100644
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
+++ b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
@@ -8,3 +8,4 @@ EnvironmentFile=-/etc/default/dropbear
 ExecStart=-/usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key -p 22 $DROPBEAR_EXTRA_ARGS
 ExecReload=/bin/kill -HUP $MAINPID
 StandardInput=socket
+KillMode=process
-- 
1.8.1.4



