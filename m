Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi7G-0002oS-83
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sYbOJLzLGp4HDilHa2lKZnSW3djcRv9bENri54DOgKM=;
	b=jZwG2diJU6WcRl0LOmY7GOhyQ5ndlB1QxS3MkHLjmjYEVkjlXvQ1qW9y7voIpObcyl
	2DYi8oJoogMjeJIpIiXReBBinHKadlpsp6Z54kVblkmetBpsq/FhRqAWR1O8hC/eWVi+
	t5vV2EYxmMx+uXzXQ7tgYQlhHVHgpHGKAr/L7KUJmbfOEN6oPKgahFJfVpC1YfbtZjIB
	4ROavrLfO0QDaWHtanEckTTrhsFnfIvS9ilqCxKX4PkSUI8jZ9H5exaqHVmDfrHie4yu
	5Qs0wV4Wt3hF9H/AoVR5c6sPF9aYoBcnbbd/AkjTpLHCApJtfOaOxWaxTyroyTszvkgO
	ihCw==
Received: by 10.14.175.198 with SMTP id z46mr42743448eel.26.1354586750643;
	Mon, 03 Dec 2012 18:05:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm34819973eeg.4.2012.12.03.18.05.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:18 +0100
Message-Id: <735e72e21373eebe990b47a5eb48de2bea3cd94d.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 45/58] entrance: rename xserver-nodm.service to entrance.service so it does not conflict with xserver-nodm-init in sysroot
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
X-List-Received-Date: Tue, 04 Dec 2012 02:25:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/entrance/{xserver-nodm.service => entrance.service}           | 0
 meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend           | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-systemd/meta-efl/recipes-efl/efl/entrance/{xserver-nodm.service => entrance.service} (100%)

diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance/xserver-nodm.service b/meta-systemd/meta-efl/recipes-efl/efl/entrance/entrance.service
similarity index 100%
rename from meta-systemd/meta-efl/recipes-efl/efl/entrance/xserver-nodm.service
rename to meta-systemd/meta-efl/recipes-efl/efl/entrance/entrance.service
diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
index ac0d2bc..df96e34 100644
--- a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
+++ b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
@@ -4,10 +4,10 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SRC_URI += "file://xserver-nodm.service"
+SRC_URI += "file://entrance.service"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "xserver-nodm.service"
+SYSTEMD_SERVICE = "entrance.service"
 
 RCONFLICTS_${PN}-systemd += "xserver-nodm-init-systemd"
 RREPLACES_${PN}-systemd += "xserver-nodm-init-systemd"
-- 
1.8.0



