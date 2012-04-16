Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SJiVh-0000o0-7a
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 11:46:13 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so7339715wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 02:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5ZP1+6AugTbeboJHt/GiUKziG//oUsjaUmT9VFyltDs=;
	b=eha36QoHhtdzKTgT+EHMegV5oO0yOdVVU38MVcQCzqwQzs9twSAxKVa3DCYjE6VihF
	LMRcS2RhBgZ837sSC3tS01cNrWZKb+D2B2ukWrA/8xnkbEB95kBZ2HKgUC1Kj/TWgC7Z
	uetc10iljMiwGS1H8zYYJ6AoJjhtb5esKHtQ8XmZbINLNbWBtFbLVGvCuaZjKeuAWw62
	Mb8r1L13p//EH0i5dJ/Ycg0fRqYMviZ2JLzEZMw9lGXn4QznfMjlge/Wp7KE/AtQQ+VZ
	NQrsuiDf+fMq8wDsoIv2ADPyCZWxfebWnVAamNnul114HlBlMtDqIBkfyDnbEKoh3UiA
	KXhw==
Received: by 10.180.82.132 with SMTP id i4mr9380182wiy.12.1334569010715;
	Mon, 16 Apr 2012 02:36:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm29864546wiw.5.2012.04.16.02.36.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:36:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Apr 2012 11:36:28 +0200
Message-Id: <b71bfc587af9ec4db178f900457e0de8cef418ba.1334568930.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <62de43c3c2201f1dc73e7c4c9eb6aba0c131d1b4.1334568930.git.Martin.Jansa@gmail.com>
References: <62de43c3c2201f1dc73e7c4c9eb6aba0c131d1b4.1334568930.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1334568930.git.Martin.Jansa@gmail.com>
References: <cover.1334568930.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/3] lighttpd: lastest oe-core installs lighttpd.conf directly to /etc/
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
X-List-Received-Date: Mon, 16 Apr 2012 09:46:13 -0000

From: Radek Dostal <rd@radekdostal.com>

Signed-off-by: Radek Dostal <rd@radekdostal.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lighttpd/lighttpd/lighttpd.service             |    2 +-
 .../lighttpd/lighttpd_1.4.30.bbappend              |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
index 18b752f..f4564f3 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
@@ -5,7 +5,7 @@ After=syslog.target
 [Service]
 Type=oneshot
 EnvironmentFile=-/etc/sysconfig/lighttpd
-ExecStart=/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
+ExecStart=/usr/sbin/lighttpd -D -f /etc/lighttpd.conf
 RemainAfterExit=yes
 
 [Install]
diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
index 5449b1a..1341405 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
- 
-PRINC = "2"
+
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-- 
1.7.8.5



