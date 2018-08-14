Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 83BE97900E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:38:56 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id y2-v6so12543568wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j3N4ukFibMmluiOyVX9dnf7hTByLTyTbtK+h88nTJq4=;
	b=BF9I0nPJI49jUum267qaCVWD8xZZ3C7a8Iq8/rzUZrbiq80mnympJcXeMXhXGR+PS0
	+JQWERO2MLE4ph12A/fMi44LPYSK9JLDqoOBzwea8N7Oy0FO6wkG/DN7328GYVNtYI0d
	gW8x+8PNO7nFPizGbs+nE+487py3Wzeq/EF3NECnJxArL1JFSa9ETozX26AaiXeouBUG
	VIn0LMhS67HaEkzazKc7H8alERRahOfGclbGMH6Qov87e1PciZrAknAqRhYrsjdWEgQO
	+h+ca2YIotQjleS2/tB8/gIyC0Xy6/iMQHZ/lxc54HUyY/h0HhApotquV1OwGczT2TRY
	uJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j3N4ukFibMmluiOyVX9dnf7hTByLTyTbtK+h88nTJq4=;
	b=R6paKt8KnDVVQiytGubpOFEGz+TM0eqtTFEROC1e1kbs3mN5/38ZBj4Pie0NwVEkzq
	BsdHxxT80J9cMQrg0xO0F262StBPPnimxH/EDpXIg/pB5cGH6hFHz08z19OK5iDheF/2
	5qvMbqNoGMaynNDPAgpUQ4hsjM2l65CM5yYarX0/S4b0BUWnCNvbSk2i39O+Wss4HLTl
	REaCCZ7GIHkj+/aCuys2jCStnseEGC6HLleRFTOKfmnYEEFL4svlEw7dYv1HxvgY5Mk7
	0pYKVzVppTq79o8qug2Ig8W0sczgKxlddAkZYR4jQul/lE5Q49JHtOQJtgqPg4MoiwTq
	MOlg==
X-Gm-Message-State: AOUpUlHwZ9eb8FgGmq3LxlBsg0NbXfWKB5mq+JenVr+rL6Tqe+jgt4VH
	7JsS81L6K5FNrQzRfg3aTUfFm1eX
X-Google-Smtp-Source: AA+uWPwonm4F55DxiA1Of2/gaoedpiFmDJj28yNlQyJe/7iZDNIv1ECBtDDbGeOpi9e5LY9LyQ8d7g==
X-Received: by 2002:a1c:af0c:: with SMTP id
	y12-v6mr10448409wme.87.1534257537082; 
	Tue, 14 Aug 2018 07:38:57 -0700 (PDT)
Received: from localhost.localdomain
	(host146-228-dynamic.182-80-r.retail.telecomitalia.it.
	[80.182.228.146]) by smtp.gmail.com with ESMTPSA id
	l15-v6sm20296997wrt.67.2018.08.14.07.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 07:38:56 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 16:38:16 +0200
Message-Id: <1534257497-12184-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/2] pcmciautils: drop duplicate chunk from pcmciautils-018/makefile_race.patch
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
X-List-Received-Date: Tue, 14 Aug 2018 14:38:56 -0000

The new rule was patched into the makefile twice.

Backport of oe-core commit c52228f4d071

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pcmciautils/pcmciautils/makefile_race.patch            | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
index f5a518f..4c5eba7 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils/makefile_race.patch
@@ -16,20 +16,6 @@ Index: pcmciautils-018/Makefile
 ===================================================================
 --- pcmciautils-018.orig/Makefile
 +++ pcmciautils-018/Makefile
-@@ -249,6 +249,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
- yacc_config.o lex_config.o: %.o: %.c src/yacc_config.h
- 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
- 
-+src/lex_config.o : src/lex_config.c src/yacc_config.h
-+	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
-+
- debugtools: ccdv $(CBDUMP) $(CISDUMP)
- 
- $(CBDUMP): $(LIBC) debug/cbdump.o
-Index: pcmciautils-018/Makefile
-===================================================================
---- pcmciautils-018.orig/Makefile
-+++ pcmciautils-018/Makefile
 @@ -246,8 +246,8 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
  	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
  	$(QUIET) $(STRIPCMD) $@
-- 
2.7.4


