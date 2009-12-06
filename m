Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsI-0000ZO-T8
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:45 +0100
Received: by ewy24 with SMTP id 24so4866247ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xWkpwticf9GvcRPC5TgZn2+dsW0AHHd+dQ7hWxjg6ro=;
	b=P2+A2uYjX3+8l4YivMx0dC3QCsmlMYxOCh1CqTYBAi468lRcvyh9ixDA/CRkuKXjOJ
	F4oidb86MTpXCQ3KZaktlcuNhmNzynSTSuBcFBvbXo7ftb9yaj3xixi/oqYNeIzg3Z10
	jhO37O4yNzjOHrE28r6cHK6mBSd2U0bMVBPLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZlVLz+yauNaiBDrsLngILHfjmhikdBZL5scFsGMSVa+tB9Ah+U+TaUf0yWDzHq6MCR
	0FnYiO1LjtWDPc9WprTuNQLi0GlbYwTA9NjWCs9WapDrbBVlVDR8qPRjVqXD1BRvmacr
	WCQ4nZcXk7g2Qp+PCyNi3/zRdpMrJGuHQ0gFQ=
Received: by 10.213.107.17 with SMTP id z17mr6279869ebo.10.1260139503987;
	Sun, 06 Dec 2009 14:45:03 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:03 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:38 +0100
Message-Id: <1260139496-21442-3-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-2-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] cyclone3_starter.conf: New machine/board for architecture nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:46 -0000

These adds the Altera Cyclone III FPGA Starter Kit which can
run a nios2 soft-core SoC processor.

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/machine/cyclone3_starter.conf |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/cyclone3_starter.conf

diff --git a/conf/machine/cyclone3_starter.conf b/conf/machine/cyclone3_starter.conf
new file mode 100644
index 0000000..95276e7
--- /dev/null
+++ b/conf/machine/cyclone3_starter.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: Altera Cyclone III FPGA Starter 
+#@DESCRIPTION: Machine configuration for a Altera Cyclone III FPGA Starter Kit
+
+TARGET_ARCH = "nios2"
+
+require conf/machine/include/nios2.inc
-- 
1.6.0.4



