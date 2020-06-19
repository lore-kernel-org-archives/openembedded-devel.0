Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.4616.1592566339272149730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kdh4xxgX;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id o15so9789779ejm.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=47qFVqfCAMev4ZPwHL5LbHiaX93sUktWIex32YOPu8A=;
        b=kdh4xxgXoFBhUZFWaSJZb+0qjQsItSHEOD56X/zrJj27RDAS2y5I5idalEECw8h8ea
         zPjaS4CJCqG3pC8u4ucx9WHWLTMgceqcrEYYKX+cNSLKnPw1krOSqeIl3It93NpSHzZJ
         w9BOVmZOtcp1qFAfy4cdbSpYq0ld52L82j61nAsU7ZCSvbki/CumUo8l+0bzrQc6iV7O
         J5gXzryX47iU0+Xpmgdd4+Rs9T4HSOFLPLeyIbSdz6zL92pwknRJx7p33TGfDrni7yTL
         Phxe17ThwZWcLGZHTTlHPsHH49WkiQezuXRr15gOwJHJkt+kYDyzhOfZKjJ6vCjDbI3U
         92EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=47qFVqfCAMev4ZPwHL5LbHiaX93sUktWIex32YOPu8A=;
        b=kWiucnykSbiE/cxS4sRaymuPM9bM4NybdK1Aj/uuwYy8E4DEoDS/rYauxpARz9AdL3
         m633mVViRBH9+5H+/9xRLrpKOWZdDukk+kJs+9ytYyUdKKlARaFSz1kyCormQyMDydLU
         cGtgrSGqCQLOFMza+sqnhOLblD09vJEAc65nyB6GdIFujrFekPMitqWmckUC6NG+Pt27
         HnV+cSwfODXBKgEkBPdwNU6sxPZFHo8NqHGWAnjKi1rrJvEmMjpa7GyP2V3+qcf8PiqN
         BbOG65Hn/hOJcLD3rEUszHm6aVZBwhmNImM3bwnzBOJsaC4KkP4Yd9tmOfiOpZUGEnu5
         KVWA==
X-Gm-Message-State: AOAM532/6rQ+vtXvfrbZtBefNkw5Vl/cMFe43PfoTQdvsQ5FpooCKq/T
	Hx9ctlWqcCKT152BPr8IqXfLrumX/qw=
X-Google-Smtp-Source: ABdhPJwyIPtbVbTftXGWUOW++sCoMwyKHfdJ3vllNFvOK+xwlxORuNdtra/8OvcpH5hcWVchIpMo3Q==
X-Received: by 2002:a17:906:b28e:: with SMTP id q14mr3129688ejz.484.1592566337393;
        Fri, 19 Jun 2020 04:32:17 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:16 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/10] redis: upgrade 5.0.9 -> 6.0.4
Date: Fri, 19 Jun 2020 13:32:00 +0200
Message-Id: <20200619113201.2811033-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../hiredis-use-default-CC-if-it-is-set.patch | 21 ++++++++++++-------
 .../redis/{redis_5.0.9.bb => redis_6.0.4.bb}  |  4 ++--
 2 files changed, 15 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_5.0.9.bb => redis_6.0.4.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
index 421f306de..878cd3697 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
@@ -11,20 +11,25 @@ Signed-off-by: Venture Research <tech@ventureresearch.com>
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
+Reworked for 6.0.4
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- deps/hiredis/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ deps/hiredis/Makefile | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 9a4de836..271c06ba 100644
+index 25ac154..569f82b 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -36,7 +36,7 @@ endef
+@@ -42,8 +42,6 @@ endef
  export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
--CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
-+CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
- CXX:=$(shell sh -c 'type $(CXX) >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
+-CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+-CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
  OPTIMIZATION?=-O3
- WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
+ WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
+ DEBUG_FLAGS?= -g -ggdb
+-- 
+2.21.3
+
diff --git a/meta-oe/recipes-extended/redis/redis_5.0.9.bb b/meta-oe/recipes-extended/redis/redis_6.0.4.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_5.0.9.bb
rename to meta-oe/recipes-extended/redis/redis_6.0.4.bb
index d04293369..ffa28ccfe 100644
--- a/meta-oe/recipes-extended/redis/redis_5.0.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.4.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "c94523c9f4ee662027ddf90575d0e058"
-SRC_URI[sha256sum] = "53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85"
+SRC_URI[md5sum] = "37200b25c282f94da4521bc510d79ced"
+SRC_URI[sha256sum] = "3337005a1e0c3aa293c87c313467ea8ac11984921fab08807998ba765c9943de"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.26.2

