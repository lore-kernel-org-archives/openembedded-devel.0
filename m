Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8B5607F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:37:37 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u18so35908214wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EU3Rtn2o3/jlL6VF1FEpPE/fMhyL2z/fry75sHagw8w=;
	b=C8GJsa7/hiCKItwmrUVEUQPYYRzMaPOxOINDMKr8CSlz9Ztw/uoEeGUvWruzbQlbs8
	SiCxWwMFaU03EHEWwQLY+OfOB6Lk1W2F8ydcxVTpJ79D6ksTr0NITcdHQ/scpTRfHn07
	lmFsAlEu6BEQmbrm23qiss0fB1a4Nd4N4txCCiJXycqZg2HCcVzeWP+R8irrSbK37Q66
	zavUOivm1Rt9Ts/AaluPMusHqChm3yWYabQpNPNyknJ3eXOUXRu6fSLjSId731I8KSzM
	D2cQrhWtkrClN0y/bRN7ATGh6V7D0LBVT5+lxYk0633y9U5lDX+Z5gygsRarhN2UzUAb
	YX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EU3Rtn2o3/jlL6VF1FEpPE/fMhyL2z/fry75sHagw8w=;
	b=WOQcnom2oJGbcqet6oQFzvL/+mYwn1Y5pmMg03vyja3t3O18lDLafNIccb4wJhlR7L
	OZD9XL1xKAs294FbqfOGW6p6CJfLYuxOiQ22tABqzlr75S9v9iOFC735U9eVCHljRg++
	6a7yuqlWs8FdZb3rFlzH7lK5brL1C3xOEYbO0Xfn/FFwLj9YrhlkOYHAZ1iNZUdKkHa0
	hKE4WLr7GsidZd8zpmlzR+2pDz/KTA1DfUwInq+/HLdLU6Aax/D48noedhd5edhaQBOv
	8zP6NbvUAQFubue7UKgYp2Q1AcFo+qmCFzEOhw73tYYVdEPX0yNgImIydu5mQacNUC4S
	XXLg==
X-Gm-Message-State: AFeK/H2Eh1dk70HwwCR9kbOolqtNeWMDUxzt2hdPWna3U3GoMBSSWFxxjTbtnpCxhVf0SA==
X-Received: by 10.223.136.13 with SMTP id d13mr17757637wrd.32.1491244658965;
	Mon, 03 Apr 2017 11:37:38 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 82sm18843319wmg.0.2017.04.03.11.37.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 11:37:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 20:37:36 +0200
Message-Id: <20170403183737.14791-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170403183737.14791-1-Martin.Jansa@gmail.com>
References: <20170403183737.14791-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] uml-utilities: respect LDFLAGS not only for mconsole but for other binaries as well
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
X-List-Received-Date: Mon, 03 Apr 2017 18:37:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../uml-utilities-20040406/fix-ldflags.patch       | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
index 05cc5371f..f4a175cdf 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
@@ -14,3 +14,91 @@
  
  clean : 
  	rm -f $(BIN) $(OBJS) *~
+diff -uNr tools.orig/jailtest/Makefile tools/jailtest/Makefile
+--- tools.orig/jailtest/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/jailtest/Makefile	2017-04-03 16:00:04.857449005 +0200
+@@ -7,7 +7,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
+diff -uNr tools.orig/moo/Makefile tools/moo/Makefile
+--- tools.orig/moo/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/moo/Makefile	2017-04-03 15:59:56.466449432 +0200
+@@ -10,10 +10,10 @@
+ all : $(BIN)
+ 
+ uml_moo : $(uml_moo_OBJS)
+-	$(CC) $(CFLAGS) -o $@ $($@_OBJS)
++	$(CC) $(CFLAGS) -o $@ $($@_OBJS) $(LDFLAGS)
+ 
+ uml_mkcow : $(uml_mkcow_OBJS)
+-	$(CC) $(CFLAGS) -o $@ $($@_OBJS)
++	$(CC) $(CFLAGS) -o $@ $($@_OBJS) $(LDFLAGS)
+ 
+ $(uml_moo_OBJS) $(uml_mkcow_OBJS) : cow.h cow_sys.h
+ 
+diff -uNr tools.orig/port-helper/Makefile tools/port-helper/Makefile
+--- tools.orig/port-helper/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/port-helper/Makefile	2017-04-03 15:59:41.251450208 +0200
+@@ -7,7 +7,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
+diff -uNr tools.orig/tunctl/Makefile tools/tunctl/Makefile
+--- tools.orig/tunctl/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/tunctl/Makefile	2017-04-03 16:00:01.091449197 +0200
+@@ -7,7 +7,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
+diff -uNr tools.orig/uml_net/Makefile tools/uml_net/Makefile
+--- tools.orig/uml_net/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/uml_net/Makefile	2017-04-03 16:00:12.449448618 +0200
+@@ -14,7 +14,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
+diff -uNr tools.orig/uml_router/Makefile tools/uml_router/Makefile
+--- tools.orig/uml_router/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/uml_router/Makefile	2017-04-03 16:00:46.796446867 +0200
+@@ -13,7 +13,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
+diff -uNr tools.orig/watchdog/Makefile tools/watchdog/Makefile
+--- tools.orig/watchdog/Makefile	2017-04-03 15:56:02.068461380 +0200
++++ tools/watchdog/Makefile	2017-04-03 15:59:45.216450006 +0200
+@@ -7,7 +7,7 @@
+ all : $(BIN)
+ 
+ $(BIN) : $(OBJS)
+-	$(CC) $(CFLAGS) -o $(BIN) $(OBJS)
++	$(CC) $(CFLAGS) -o $(BIN) $(OBJS) $(LDFLAGS)
+ 
+ clean : 
+ 	rm -f $(BIN) $(OBJS) *~
-- 
2.12.2


