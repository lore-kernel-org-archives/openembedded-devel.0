Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsB59-0005JJ-7P
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:00:12 +0200
Received: by eyb7 with SMTP id 7so1779811eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+ZPbz7iDFwnNW8INefMrUUdJx2DnkWjPFBJXwRBXQr0=;
	b=dPx70rpOSafFfPKgQOjuty2giUeiUGQio8iC0qdDrcaEx5qbbjHf84tL+rLeejGTac
	caI12Ljy/j0tm+H2AqWVDdnlcJnI00Rkr/KYH/8TbuRR80abWomIplwznZO1qjDYzRhl
	ihMlLE37frMfJh/M3XCopnslR6tQFJXaIDiHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eTuY+IyApa+QTljZ94+ZVk9Og0FexAbqPzz+636GpXQhVq/oz7ZZFeQ0P2Pk91mL3v
	B3NI+gweZbfSuLoJBdd2VurW5XAPCTnuPboBheAy5UyC7HBXWSjavoPGrzGsPn1syflc
	6qkdRfTHs+t0XixBygH1FSI3YosSCMS/GnsTI=
Received: by 10.213.25.144 with SMTP id z16mr1263166ebb.40.1283677175310;
	Sun, 05 Sep 2010 01:59:35 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm5988067eei.7.2010.09.05.01.59.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 01:59:34 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Sep 2010 10:59:22 +0200
Message-Id: <1283677162-7876-3-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1283677162-7876-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1283677162-7876-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1283677162-7876-2-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] js: removed old unreferenced patch file host-cc.patch
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
X-List-Received-Date: Sun, 05 Sep 2010 09:00:13 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/js/js/host-cc.patch |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)
 delete mode 100644 recipes/js/js/host-cc.patch

diff --git a/recipes/js/js/host-cc.patch b/recipes/js/js/host-cc.patch
deleted file mode 100644
index 78a1e1b..0000000
--- a/recipes/js/js/host-cc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff -urNd smjs-1.5-r0/js/src/Makefile.ref smjs-1.5-r0.new/js/src/Makefile.ref
---- smjs-1.5-r0/js/src/Makefile.ref	2003-11-15 00:10:55.000000000 +0000
-+++ smjs-1.5-r0.new/js/src/Makefile.ref	2006-01-31 23:43:16.000000000 +0000
-@@ -317,8 +317,11 @@
- 	rm -f $@
- 	$(OBJDIR)/jscpucfg > $@
- 
-+$(OBJDIR)/jscpucfg.o: jscpucfg.c jscpucfg.h
-+	$(HOST_CC) -o $@ $(CFLAGS) $(LDFLAGS) jscpucfg.c
-+
- $(OBJDIR)/jscpucfg: $(OBJDIR)/jscpucfg.o
--	$(CC) -o $@ $(OBJDIR)/jscpucfg.o
-+	$(HOST_CC) -o $@ $(OBJDIR)/jscpucfg.o
- 
- # Look in OBJDIR to find jsautocfg.h
- INCLUDES   += -I$(OBJDIR)
-- 
1.6.4.2



