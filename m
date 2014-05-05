Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 943E365F38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 15:26:21 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 19so5311155ykq.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=h3YbK/kPHqeZzqZNI8wz2dgf5caGQ9E1PYbbDFJ3tp8=;
	b=1IdqkXOEAqbBbUt3IZfrX7OGtgjff/9Plx3PmN/ZwVWCfPqd6svmqrjt2xh9pvjPRx
	b72OyiI6QjdwovZ3bNL2/hvhUCYC5VGSn0bAdSzshS6NsPV5U93KNpFkOa86nifCKuOn
	kRLQtG7ylv5zIkcRnj+NVrZOSjW1hjnYcCa6c8iYD/vWucJUFTlOGd7oQzZ7IL0U6woe
	6fiLxEqZZW7H7CSyXFGkj9ZKltIB84jx5r3TaO86zXNmBBAdbfRl0o/Nl0YjXTeaabC5
	b90oCgeU/KZCfvMPcsMmZEm+fBP8P8J5jQCOh/ti+68KzPy5V93BaJNmfO3r3r+9Kktd
	iH6w==
X-Received: by 10.236.84.98 with SMTP id r62mr49295392yhe.9.1399303582694;
	Mon, 05 May 2014 08:26:22 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f62sm16142567yhq.6.2014.05.05.08.26.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 08:26:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id D8A161AA20AB6; Mon,  5 May 2014 12:26:18 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  5 May 2014 12:26:18 -0300
Message-Id: <1399303578-20354-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] dbench: Fix out of tree build
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
X-List-Received-Date: Mon, 05 May 2014 15:26:25 -0000

This fixes the Makefile so the client.txt file is copied from the
original source tree. This fixes the out of tree build error.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-benchmark/dbench/files/destdir.patch  | 4 ++--
 meta-oe/recipes-benchmark/dbench/files/makefile.patch | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-benchmark/dbench/files/destdir.patch b/meta-oe/recipes-benchmark/dbench/files/destdir.patch
index ca9a8ee..4cd2a35 100644
--- a/meta-oe/recipes-benchmark/dbench/files/destdir.patch
+++ b/meta-oe/recipes-benchmark/dbench/files/destdir.patch
@@ -19,8 +19,8 @@ Index: dbench-3.04/Makefile.in
 -	ln -sf dbench.1 $(mandir)/tbench_srv.1
 +	${INSTALLCMD} -d $(DESTDIR)$(bindir) $(DESTDIR)$(datadir) $(DESTDIR)$(mandir)
 +	${INSTALLCMD} dbench tbench tbench_srv $(DESTDIR)$(bindir)
-+	${INSTALLCMD} client.txt $(DESTDIR)$(datadir)
-+	${INSTALLCMD} -m644 dbench.1 $(DESTDIR)$(mandir)
++	${INSTALLCMD} @top_srcdir@/client.txt $(DESTDIR)$(datadir)
++	${INSTALLCMD} -m644 @top_srcdir@/dbench.1 $(DESTDIR)$(mandir)
 +	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench.1
 +	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench_srv.1
  
diff --git a/meta-oe/recipes-benchmark/dbench/files/makefile.patch b/meta-oe/recipes-benchmark/dbench/files/makefile.patch
index 09d619a..11fb4ff 100644
--- a/meta-oe/recipes-benchmark/dbench/files/makefile.patch
+++ b/meta-oe/recipes-benchmark/dbench/files/makefile.patch
@@ -10,9 +10,9 @@ Index: dbench-4.0/Makefile.in
 @@ -35,7 +35,7 @@ install: all
  	${INSTALLCMD} -d $(DESTDIR)$(bindir) $(DESTDIR)$(datadir) $(DESTDIR)$(mandir)
  	${INSTALLCMD} dbench tbench tbench_srv $(DESTDIR)$(bindir)
- 	${INSTALLCMD} client.txt $(DESTDIR)$(datadir)
--	${INSTALLCMD} -m644 dbench.1 $(DESTDIR)$(mandir)
-+	${INSTALLCMD} -m 644 dbench.1 $(DESTDIR)$(mandir)
+ 	${INSTALLCMD} @top_srcdir@/client.txt $(DESTDIR)$(datadir)
+-	${INSTALLCMD} -m644 @top_srcdir@/dbench.1 $(DESTDIR)$(mandir)
++	${INSTALLCMD} -m 644 @top_srcdir@/dbench.1 $(DESTDIR)$(mandir)
  	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench.1
  	ln -sf dbench.1 $(DESTDIR)$(mandir)/tbench_srv.1
  
-- 
2.0.0.rc0


