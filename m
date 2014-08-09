Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 301D870A78
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:00 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2379810wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b7gQMlxUBn7QOPxVjLvF+ElLFkIHPbGenSIi+K1c3QE=;
	b=AhydUNyqeG+eBwkUDdcP/8Z5OZqdW0KA/7jZ18+K75RwYnHgGqfhjlsm0p/wjaooTO
	wTlPJL2d4Z4UzezeXmY+tYeU8DUcl7MUrgmzxtWm0yHzJbk9k4nW23THbsrcS5WFBITh
	SZSDfkLZkULgTGEOKp8CNXujuGqq0YzHB4mK0GXt30JESR3qAyFGYgGPIXCoB/HmgPWd
	T00RW3xtN6CPmYZ/DAGhEujn2ImG4jrsmKGOx+qJN6wj47Fp7Ys4oaOuusHPzpIZdZ07
	3D7U6BCl8Pt+2YH4v7MochHasOy9ZBGMITcWNvBgdKDUwtJb0WqAd6rT+gycI7++l/WX
	yH4g==
X-Received: by 10.180.108.13 with SMTP id hg13mr12017208wib.28.1407600541897; 
	Sat, 09 Aug 2014 09:09:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fc7sm25517368wjc.37.2014.08.09.09.09.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:49 +0200
Message-Id: <1407600537-10857-28-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 28/36] start-stop-daemon: remove unrecognized configure option
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:02 -0000

* fixes following QA warning:
  start-stop-daemon-1.16.0.2: start-stop-daemon: configure was passed
    unrecognised options: --without-deselect [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index 82e5d8a..c232474 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -17,7 +17,6 @@ S = "${WORKDIR}/dpkg-${PV}"
 EXTRA_OECONF = " \
     --with-start-stop-daemon \
     --without-bz2 \
-    --without-deselect \
     --without-install-info \
     --without-selinux \
     --without-update-alternatives \
-- 
2.0.4


