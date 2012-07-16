Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqgRb-0004wH-5O
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 10:14:15 +0200
Received: by eaal1 with SMTP id l1so1326114eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 01:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=4pabDbH0CCzNV3U/I12aEy+ELvLBtIADBmHMww9Du9o=;
	b=SbE8vv802949QI7oxwL1tN/GXww8EANZtv21k+i5Aq0F1+ZWALP9bEvmiOIynj6DtH
	/Hb4oredltz2hkcm8clzINwhS9hRuHzZPyMXC+AB2pVqf7siVsnIiarTea62EENxXfCd
	yiiLGh2BgvXPxwiFPoMtrfxk6K4pWigMUj48xDkewfIe3B6UsImff9DoyXAfI76VNjS6
	S7TxaTk21s6NizA40OqVIFhEMflGUdzp5EyByZCxUnGn/hm9FUIIHPIB6dqhSVL0vSye
	vCPwQmAc/ZxQ+h139eDWB3zQbuCnQBBlb/qATUoCodqWB2nFtrFGmOU2VsCb1AAVspYB
	+MEw==
Received: by 10.14.180.67 with SMTP id i43mr7972490eem.23.1342425777314;
	Mon, 16 Jul 2012 01:02:57 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id w3sm16398263eep.2.2012.07.16.01.02.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 01:02:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 10:02:52 +0200
Message-Id: <1342425772-6146-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmtCj8IO2m4CpHngj5UDWYs+x/RmPd6ViBuj1o/hlbFOJ3BCZGIYRqBljYxqdcO1+Ih8Atv
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-systemd][PATCH] libpam 1.1.5 bbappend: register PAM session with logind
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
X-List-Received-Date: Mon, 16 Jul 2012 08:14:15 -0000

This makes screen/tmux/etc work as intended

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/recipes-extended/pam/libpam_1.1.5.bbappend |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-systemd/recipes-extended/pam/libpam_1.1.5.bbappend

diff --git a/meta-systemd/recipes-extended/pam/libpam_1.1.5.bbappend b/meta-systemd/recipes-extended/pam/libpam_1.1.5.bbappend
new file mode 100644
index 0000000..7c4bcd8
--- /dev/null
+++ b/meta-systemd/recipes-extended/pam/libpam_1.1.5.bbappend
@@ -0,0 +1,6 @@
+PRINC := "${@int(PRINC) + 1}"
+
+# Register with logind to make screen/tmux/etc work
+do_install_append() {
+	echo "session required	pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
+}
-- 
1.7.10



