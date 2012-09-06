Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNL-0002Pu-6f
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:35:59 +0200
Received: by wibhq4 with SMTP id hq4so5499674wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=NFxdjq7x65xGN2ep7EO4Eu2fnoFLu5b8kAm83jkJA/k=;
	b=NEKtCuljIeZYs2Bgu0/lVeza59xYs7fVkj6CZl9J5mJqY6B7d8BTwJlCarna/hckGc
	TlKM87wBHL0RyFRMKpYLXnmVcuBi4pREXxz0l5CYGMktpENGaHyLmRdydB67UbvsrZ+A
	A+bGXntpuTo0J/yf0NHEZljQD01nkqc9GdWPSwI5GC9ef3ubn5GGjRGaJaGZjg9HR6O5
	5RVXnYMAn6SU5/4Msc1w3Cr7iTqKJy2fHNiE3FjdaESBikYWyZVxKB7NBSUbGfBNz1Jf
	Ic+nh8NVHIAfPLN5T6eql1eH8WMZpzNIXBa1eSnSP6gpAiHDvaXcSC/hrQF9LDAajEee
	fmyg==
Received: by 10.180.97.106 with SMTP id dz10mr4169383wib.21.1346930615195;
	Thu, 06 Sep 2012 04:23:35 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:24 +0200
Message-Id: <1346930610-2977-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkMzC28Yqx1F/gGFrwW2Z3ns9J+aYXB4A1KJZxGG3jd9FwQabUvbI1pL6nMtiy9bfrFZS7b
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 2/8] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Thu, 06 Sep 2012 11:35:59 -0000

From: Liang Li <liang.li@windriver.com>

perf has been coupled to the kernel packages via kernel.bbclass.
While maintaining the build of perf out of the kernel source tree
is desired the package coupling has proved to be awkward in
several situations such as:

  - when a kernel recipe doesn't want to build/provide perf
  - when licensing of dependencies would prohibit perf and hence
    the kernel from being built.

To solve some of these problems, this recipe is the extraction of
the linux-tools.inc provided perf compilation into a standalone
perf recipe that builds out of the kernel source, but is otherwise
independent.

No new functionality is provided above what the linux-tools.inc
variant provided, but the separate recipe provides baseline for
adding new functionality.

Signed-off-by: Liang Li <liang.li@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index c44a2f5..6f1b6a4 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -475,7 +475,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
@@ -553,8 +553,3 @@ addtask deploy before do_build after do_install
 
 EXPORT_FUNCTIONS do_deploy
 
-# perf must be enabled in individual kernel recipes
-PACKAGES =+ "perf-dbg perf"
-FILES_perf = "${bindir}/* \
-              ${libexecdir}"
-FILES_perf-dbg = "${FILES_${PN}-dbg}"
-- 
1.7.7.6



