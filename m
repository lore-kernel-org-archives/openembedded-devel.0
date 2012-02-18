Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RyhPB-00041T-9a
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 11:20:37 +0100
Received: by eekd41 with SMTP id d41so1400647eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2012 02:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.112.203 as permitted sender) client-ip=10.213.112.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.112.203 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.112.203])
	by 10.213.112.203 with SMTP id x11mr418959ebp.59.1329559942162
	(num_hops = 1); Sat, 18 Feb 2012 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=49BPiFBUDymEZYFcvJm4wPDLHXReejyTmpZhyttaK8E=;
	b=gMVYPeaDtNiY5PnKftvQgkpZyHaPgAR/8i2HI4u+mo0WWLjehxfZEukQpMoTSphsri
	tkZx3Dg1Wt45i4Rl4km2qMgqm4gb1IL7Y+JqWJc+GHQ86wAmxD2cYfr9YHh4r80s5W3W
	IcA9DjMzD2B1gDtoQ70d6GEUKIk5rUsjl8Mbo=
Received: by 10.213.112.203 with SMTP id x11mr345744ebp.59.1329559941755;
	Sat, 18 Feb 2012 02:12:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm49586483eeb.7.2012.02.18.02.12.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Feb 2012 02:12:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 11:12:12 +0100
Message-Id: <1329559932-8131-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <CAP9ODKpP-w1BfLpFnmUcTGKCpyBMn7ma=c1HKfBWs4iJZC2qBw@mail.gmail.com>
References: <CAP9ODKpP-w1BfLpFnmUcTGKCpyBMn7ma=c1HKfBWs4iJZC2qBw@mail.gmail.com>
Subject: [PATCH] polkit: enable and disable systemd/consolekit support explicitly
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
X-List-Received-Date: Sat, 18 Feb 2012 10:20:37 -0000

* people using sysvinit already have or can set something like
  task-core-boot.bb does VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
  to disable systemd explicitly (so it's not picked by shlib when it's
  available because other packages).
* and for the rest it will disable consolekit and enable systemd
  explititly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
new file mode 100644
index 0000000..d649f61
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -0,0 +1,6 @@
+PRINC := "${@int(PRINC) + 3}"
+
+PACKAGECONFIG ??= "${@base_contains('VIRTUAL-RUNTIME_init_manager', 'sysvinit', 'consolekit', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
-- 
1.7.8.4



