Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQb7g-0002Th-HM
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:22:27 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so1154943eek.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=JJng7/iso3VrNmn9h5LkbEb8/zs+zLRiZcGL6m/mlC4=;
	b=GZl/hrin02CsTGuWoatO5cxHg5GT3aUfuLZdvz4Rgu+KTp6LvnuIUfSpV3RHWP+1xs
	TWdmVmlLvNSLmXqWgmjf21x3uwTpqLLEhYtDy9Wrmpt7NaX+44AvWtnuQ1ekfMkHwVca
	+G1ggdYoMR3M9R2FvowvmVEvyFHV1xJ/9bcoM+hYKWpfw50/o3tmxplYo2fudEEnGOgL
	80B6E1QRtICJM+jD+qGOWvk/XK+uZK/lpspFavqRKYahnqaSlHaLwDAgw6yN9wzP9HIZ
	7HTUu9NVpqmIDc5ZEsS+kMcOvLrnEZ0redq710RT5u3hOf6DVoHF4WFg1+TYHmpExQCS
	bTrw==
X-Received: by 10.14.218.66 with SMTP id j42mr26359083eep.46.1365761100109;
	Fri, 12 Apr 2013 03:05:00 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm10203666eeb.15.2013.04.12.03.04.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:04:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 12:04:44 +0200
Message-Id: <1365761087-1229-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkYHBfO6gw4hzVZUsODou1JC1rl3kkoOYYMxnlEiyXR3xi9kTnio9JuSF/tDx5V4kEfLgKl
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv3 2/5] gateone: fix html5 feature check
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
X-List-Received-Date: Fri, 12 Apr 2013 10:23:31 -0000

The BlobBuilder and Blob checks never succeeded, even on cutting edge browsers. Nudge SRCREV forward to drag in those fixes.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 652876f..e9c182d 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r9"
+PR = "r10"
 
 PV = "1.1"
-SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
+SRCREV = "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://server.conf \
-- 
1.8.1.4



