Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7E36EEDF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:23:57 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e51so3299255eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/pOcLSYSzpeXdGI838pkpadyMIKFqE/v2FtVsh91BHU=;
	b=lwfhNbGCI8mysF2Y3RGiGNtyAvBMWDc7J5wwQV4rXmXaVEhwpBiMDvkqgP8FBS4mKT
	89uinZNLmHVhQ4sJYfl+d1yUqwVVBhotSLQmh1qwYzdPSaH3zN/5F+mgPN9N9rPlZwv4
	81lHvi2abzrJ3zC8bhx3FSCU4G2LeQ2m+gR20PNdwSxOPS1C2/IbsjzLVBADl4Cyt0dV
	r1Xx5jFig02XxTPkhmjSy7vGFjjMYeu/BqKhFWb7PeqTt8pB8DobJNGRy63LiQupCzvL
	gfkv3B87Pr2mM59o6/zT79jNk+v9OnO0+4bnKKJw1XCf8X+62qEVkRysVShJvhxhECFV
	LkvA==
X-Received: by 10.14.203.197 with SMTP id f45mr13332606eeo.90.1393878237853;
	Mon, 03 Mar 2014 12:23:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j41sm54189089eeg.10.2014.03.03.12.23.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 12:23:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Mar 2014 21:23:57 +0100
Message-Id: <1393878238-28046-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393875775-29375-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393875775-29375-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCHv2 1/2] openssh: Rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2014 20:23:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend   | 3 +++
 .../oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend        | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
new file mode 100644
index 0000000..dadbc14
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
@@ -0,0 +1,3 @@
+RPROVIDES_${PN}-sshd += "${PN}-sshd-systemd"
+RREPLACES_${PN}-sshd += "${PN}-sshd-systemd"
+RCONFLICTS_${PN}-sshd += "${PN}-sshd-systemd"
diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend
deleted file mode 100644
index dadbc14..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RPROVIDES_${PN}-sshd += "${PN}-sshd-systemd"
-RREPLACES_${PN}-sshd += "${PN}-sshd-systemd"
-RCONFLICTS_${PN}-sshd += "${PN}-sshd-systemd"
-- 
1.9.0


