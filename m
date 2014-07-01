Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 433ED6AC6D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:04:39 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id a1so10104122wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dfz0xPFeRJlgBNAIQumgyG7b7w0qXrJhyExzqgPIXOk=;
	b=Qg7Zehdky3t4jd/g3otomUvePC1jTQZFwOu8Krl32nSANBoMiAO+BZU+clsxRAMvhR
	3RC7druZyydvtQw762prFYZPI/gNjSMyMYGQXBY9IZhUAbwTHDZvMuZP6lIZzet8lTM2
	RPozuSOtiGcT3/40AXUVgc6JbKjTyBCJ+HyM8lanAYHOdcyp1aZx7/vIqGhPRtx2Re8B
	iR/e7KgT3VGskFbDdEXc9gzQKOHjbFZKq36lKc+ZCbbOi76qm02XVpZlUfMKMt551BLg
	krNTDydVSjpzvhtGTytDSPLSV8G9a6zgst3VrNnVqRIVUv65eqMwDWT61asyVz+nNtnK
	Evig==
X-Received: by 10.180.21.200 with SMTP id x8mr37477308wie.70.1404230679098;
	Tue, 01 Jul 2014 09:04:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ww4sm49012200wjc.4.2014.07.01.09.04.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:04:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jul 2014 18:04:40 +0200
Message-Id: <1404230681-5064-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404230681-5064-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] irssi: add --with-ncurses option
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
X-List-Received-Date: Tue, 01 Jul 2014 16:04:41 -0000

* otherwise do_configure tries to find ncurses.h on host and
  disables ncurses support when not found, then build fails because
  of missing -lcurses when using terminfo-core.o:
  | terminfo-core.o: In function `_set_bg':
  | /OE/irssi/0.8.15+0.8.16-rc1-r0/irssi-0.8.16-rc1/src/fe-text/terminfo-core.c:343:
    undefined reference to `tputs'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
index b4fbf7a..54d881d 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
@@ -17,5 +17,6 @@ S = "${WORKDIR}/irssi-${REALPV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-ssl"
-
+EXTRA_OECONF = "--enable-ssl \
+    --with-ncurses=${STAGING_EXECPREFIXDIR} \
+"
-- 
2.0.0


