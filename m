Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S09cZ-0001Yv-Gt
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:40:27 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so2560024eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 02:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.25.65 as permitted sender) client-ip=10.213.25.65; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.25.65 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.25.65])
	by 10.213.25.65 with SMTP id y1mr1751140ebb.132.1329906729836 (num_hops
	= 1); Wed, 22 Feb 2012 02:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=u8fSymeMZJqetqhZg79D5eV7bb0dGMe/Rt2vcaF/DC0=;
	b=vYI/iXMtKmk7Wa3fWDVjDvqp8Ts4g5mDcek6GfCWcmfOjjR17RB5TTy4a3nvI+zgpB
	BLyFc8Dfa0XAE5S5Tgkw1vUF3cl82KbaVV3HegevLdWXIVl5qwgy+dFckb9tt7+WCMe5
	WGffmJT+aH/CNzgR4NkqFK1MpKCQ8HPSNCBDs=
Received: by 10.213.25.65 with SMTP id y1mr1428656ebb.132.1329906729720;
	Wed, 22 Feb 2012 02:32:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm101175035eeb.4.2012.02.22.02.32.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 02:32:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 11:31:54 +0100
Message-Id: <1156045bbeeb9730bc8a3243dd15c3285e196f2f.1329906640.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <9b2e009e52bb6afa05eb41b807ddbfa2e092dace.1329906640.git.Martin.Jansa@gmail.com>
References: <9b2e009e52bb6afa05eb41b807ddbfa2e092dace.1329906640.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329906639.git.Martin.Jansa@gmail.com>
References: <cover.1329906639.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] polkit: enable and disable systemd/consolekit support explicitly
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
X-List-Received-Date: Wed, 22 Feb 2012 10:40:27 -0000

* people using sysvinit need to add something like
  PACKAGECONFIG = "${@base_contains('VIRTUAL-RUNTIME_init_manager', 'sysvinit', 'consolekit', 'systemd', d)}"
  or just
  PACKAGECONFIG = "consolekit"
  to their own .bbappend if they don't want to get systemd in their
  images.
* and for the rest it will enable systemd explititly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index 3c43970..1e2cccd 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,3 +1,6 @@
-DEPENDS += "systemd"
+PRINC := "${@int(PRINC) + 3}"
 
-PRINC = "1"
+PACKAGECONFIG ??= "systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
-- 
1.7.8.4



