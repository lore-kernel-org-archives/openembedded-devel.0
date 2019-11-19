Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD5A7F836
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:59:34 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 97AEA5C05C6;
	Tue, 19 Nov 2019 09:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574153974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=S4SlYgZJC4FqHBeKFGMuyRMgfxRFZSOvg0JJEmdVh3M=;
	b=LfXa5iK5fmqaQNN1zVWKc5el5bs1EwudhR8/yTuGP4ctB2UJtGOmmwjMcC5iKMwtxR/wfZ
	MzXw/C9ctuafokof+TzH/PulUPw8chbFJcheohZ6OR8xKjGugh4O6SeB74FfHcGiRPQkre
	EL2kOIWTonUTJ8VUsN7FOiW4Thr47Ds=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:59:27 +0000
Message-Id: <20191119085927.21487-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] haveged: use the Fedora service file available from upstream
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 08:59:34 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Use the Fedora systemd service file which seems more advanced than the
somewhat less maintained Redhat service file.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
index a2f0d07f2..e5b9bc947 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = "\
 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--enable-init=service.redhat --enable-initdir=${systemd_system_unitdir}, --enable-init=sysv.redhat, systemd"
+PACKAGECONFIG[systemd] = "--enable-init=service.fedora --enable-initdir=${systemd_system_unitdir}, --enable-init=sysv.redhat, systemd"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME = "haveged"
-- 
2.17.1


