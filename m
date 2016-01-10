Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41919731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:13 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id pv5so24115148pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=lZ534weGno/d7ilvoFptvV0MaDGHJq8DMu6pRsjac2I=;
	b=L1Ifn1kbztL1xrKpr821Xu3bdodn+lstI1B1trhi7nDj95K+QpWcIi/ROuIpHEPj+C
	uOBqMhzWOD77UaKtTvcyiR7xV0fGCxwl8SiML7FTuMhYpTnZoRsOxJlYoORgzNsgOLZU
	xAniMuyvhOwVNuFcyA+wq0ONxX0Wqbb1eCMIRiXrU+YYiTSVJLarAj6UvVnMkaTnywe4
	LLEe56NEP3VNanqgU7JEPlQ58hKFxRlRDZwie8wUKnTzdnxCR2IvZbCZzOaJtmH52LOC
	ClNREznW5NZQ47LElH5P9ElqXW/JjUoGpV6MMmGmPBJN8TIAmemnbkPLlBSeSrZMB/cV
	4Lhg==
X-Received: by 10.66.235.202 with SMTP id uo10mr39418149pac.63.1452387614335; 
	Sat, 09 Jan 2016 17:00:14 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	h87sm13762450pfd.33.2016.01.09.17.00.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 605E2FCC84C; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:42 -0800
Message-Id: <86183a5dff16888934cd5d3d2ff32f7264b6e49c.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 19/22] samba: fix typo distinguishing between plain sysv init and lsb init
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:13 -0000

From: Jens Rehsack <rehsack@gmail.com>

During fix for distinguishing between lsb flavoured sysv init and pure, on the
rocks version, author introduced a typo.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 5eab07e..fbdbd5a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -117,7 +117,7 @@ do_install_append() {
 	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
 	update-rc.d -r ${D} samba.sh start 20 3 5 .
 	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
+    elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba.sh
 	update-rc.d -r ${D} samba.sh start 20 3 5 .
-- 
1.9.1


