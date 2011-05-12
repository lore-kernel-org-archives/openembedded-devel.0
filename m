Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QKNLX-0003PO-KH
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 06:17:55 +0200
Received: by ywg8 with SMTP id 8so447187ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 21:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=poksDZtckTacStNyLohimXYrp3pfcvUhmcxNbBcjtnU=;
	b=ffwUhL6HnKM9wyt3e2+ZPHVqzpphU8is9TthucBhOlE3XQFjhxdEsITQWYwnK7nYVU
	pfbKbuZQkH4vvAz53GO+43MiipxDt9SHTDtCEBsIHLJbgHfUnXlCmTA6kKnbpT2SGmmL
	N+f7lmXSZJxEGMEfszadEOvPNxeQ7d09Iw+0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GUK8p8xjZ8PDGH2uOOHitWPBYJydMJAL2PAjCGzrlAMRKjV2mmRnL1U1idqLlSKwq5
	+fu4nfgwRonnvY7SFMe++uSc/kHPvYrHEBxZiQfxOBQQNPkb6UlKki5BWaAf7wjZBVPD
	/QHX2qJ66yPukdcXhQFBBxp72iW3q0NbRZYD8=
Received: by 10.236.181.38 with SMTP id k26mr6858652yhm.520.1305173707280;
	Wed, 11 May 2011 21:15:07 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id s36sm525916ano.1.2011.05.11.21.15.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 21:15:06 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 09:44:52 +0530
Message-Id: <1305173692-19917-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305173692-19917-1-git-send-email-heroor@gmail.com>
References: <1305173692-19917-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 3/3] sysvinit: bump PR for ti816x serial console change
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
X-List-Received-Date: Thu, 12 May 2011 04:17:55 -0000

From: Siddharth Heroor <heroor@ti.com>

* A new inittab is needed, so bump PR to regenerate it.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/sysvinit/sysvinit_2.86.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
index dacc397..7eba447 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "System-V like init."
 SECTION = "base"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://freshmeat.net/projects/sysvinit/"
-PR = "r64"
+PR = "r65"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
-- 
1.7.0.4



