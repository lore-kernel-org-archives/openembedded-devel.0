Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWBnC-0005bO-Br
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 22:32:22 +0200
Received: by mail-pa0-f41.google.com with SMTP id kq12so2296575pab.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=twga/SHq2M2dyR8awlift/4GPbuDDNiEFwppOUjzDys=;
	b=f6dm+IZKZ7c5usUDGpu/sLdX54iQlcwDCmPG5jpUivrypAB6mJYthFNGz8OZ2hT1qZ
	1ubjgO5oDqvXGkINEEbe7RTnSTP1bqawS08aR0Aa7+1KP0WHP8RWawhXWaa/qA6SrGqh
	U5maSe4fEZvnJWmnXLzB6pVIsR4KWVVOBCxo2gIvkd8Th2xfFJzQsQvQdGBmY9a0KmaK
	TxsUQ5RpDflz23ObZb/ojoJCoQ2cgUysVdZWfFFbzjfQUN+PpWEstMlDDyidqXbqnF7r
	4jIuLI485ZOGXJTnu9PyDlaPjF1fb6z5LFi2Fxb+LnFIZwJ796wRODi44lTpV9MVLc3n
	oLcw==
X-Received: by 10.66.233.97 with SMTP id tv1mr36635383pac.96.1367093675042;
	Sat, 27 Apr 2013 13:14:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c5sm17033200pbl.37.2013.04.27.13.14.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 13:14:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 22:14:32 +0200
Message-Id: <1367093674-13613-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
References: <1367093674-13613-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] compat-wireless: exclude from world
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
X-List-Received-Date: Sat, 27 Apr 2013 20:32:26 -0000

* depends on config options which are not enabled in qemu* MACHINEs by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
index 41f673a..3981426 100644
--- a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
+++ b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
 RDEPENDS_${PN} = "wireless-tools"
 INC_PR = "r1"
 
+# depends on config options which are not enabled in qemu* MACHINEs by default
+# config.mk:25: *** "ERROR: your kernel has CONFIG_CFG80211=y, you should have it CONFIG_CFG80211=m if you want to use this thing.".  Stop.
+EXCLUDE_FROM_WORLD = "1"
+
 COMPAT_WIRELESS_VERSION = "${PV}-1"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-- 
1.8.2.1



