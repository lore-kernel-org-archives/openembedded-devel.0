Return-Path: <joe@deserted.net>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 06B0B73D17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 04:12:58 +0000 (UTC)
Received: by iejt8 with SMTP id t8so43176009iej.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 21:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=VZFQp0uXM6w6nJFr5picevH8i6otgOaUkwszFkam3cw=;
	b=ZUUoHYAuIrGXFRMjN+dlZv5PS9obsb4k7PHzEej6h+PPkUSFpn+PxvA8KN6euNu7mC
	vx94FuVdbISIFE8yRiFKrzJugmuULIwjPvkFBAren0JPH9h6FebfDSJHDBsX6L2YCtT9
	KM3SFZzrt7yATC9QfxoxjzeE1XFWF5BtFVAJ1ey0Q2s3lgpCiJgxKlPzgXPIDbZ2oRNx
	AdvOeNlzBTc0jTyTXvtZ8wX7VNyxIYsWk9M9ZPF8rt3o/BP0r+/my3yXE4jai+QkRlZK
	yUjoH6YrpftCpOGbVsec9iSPxYZBep+t2RBl5Miq8q4pYtT2qen/wQT8uap3wV21A6eG
	ipZQ==
X-Gm-Message-State: ALoCoQmgoZELOfELnRk9AAXWSfoSYrvH1/M9MROb+K17kDHbaaWx+n0xAdKkeMni+bA+N4tyoFYe
X-Received: by 10.50.61.175 with SMTP id q15mr2885682igr.34.1429157580016;
	Wed, 15 Apr 2015 21:13:00 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id w33sm3777380ioi.17.2015.04.15.21.12.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 21:12:59 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 00:14:26 -0400
Message-Id: <1429157668-4952-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
References: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking, for-fido][PATCH 2/4] vsftpd / init: add LSB init infos
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
X-List-Received-Date: Thu, 16 Apr 2015 04:12:59 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Keep compatibility with chkconfig tool.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-daemons/vsftpd/files/init | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-daemons/vsftpd/files/init b/meta-networking/recipes-daemons/vsftpd/files/init
index d0ec010..72adf0d 100755
--- a/meta-networking/recipes-daemons/vsftpd/files/init
+++ b/meta-networking/recipes-daemons/vsftpd/files/init
@@ -1,4 +1,13 @@
 #!/bin/sh
+### BEGIN INIT INFO
+# Provides: vsftpd
+# Default-Start:  2345
+# Default-Stop:   016
+# Short-Description: Very Secure Ftp Daemon
+# Description: vsftpd is a Very Secure FTP daemon. It was written completely from
+#              scratch
+### END INIT INFO
+
 DAEMON=/usr/sbin/vsftpd
 NAME=vsftpd
 DESC="FTP Server"
-- 
1.9.1


