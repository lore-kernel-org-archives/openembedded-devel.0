Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.13465.1599017117363935935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 20:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kANP3PIg;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id b16so1466820pjp.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 20:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GV5rD+SQ+5fRRrYMkQtKdV3QOaNharMUSskKQY40K4M=;
        b=kANP3PIgc8gAblWcUQh7DRRjJNh6qOfCKu9TCyL4akcJ0iMm6kPeAXCtEp5wf5ffZ7
         LPl73kkd/WzFo9+qFeJz2WV2hOVJe+5fZ1nFzFUv/gMEjnCgm5wM2qLbMFFHNl2bOQry
         CwOyxk/IaeaVuqZ6uEDqSLu7zMIr1nOsK9XkQ+VR6xVMccJE1MrOJvzpt5SMaCOB3M9j
         FtiAJ5flersGAaZFtuW8EZ4Jz6vDpBdk0MCiOPeWfwebZ2jl7ykFHpvuCKSbJAPklsDg
         hCDzkB/q2Xc69yD9TbInePpseDbnd4d3S1JHkolV03X/bjAx/u59rvAg61DcCVgQzWHM
         odTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GV5rD+SQ+5fRRrYMkQtKdV3QOaNharMUSskKQY40K4M=;
        b=LugffrX2UawIeEIBIeXtp4KMlXeWbm6T1E6Hd0ERqD+P4/PQNPAirZuWV6/nDVdr8M
         zxIfBf96zgk5g3MpVHAIZ3Ue8jIgaxzZ4Gjp7LqQ/YGHXppxdxHQcnI9iIZD6KlixZyF
         m0CqsEDE5A6kFTu6IeiSPMlE5ZNt1C/MK0wvDwh8jWo1LmO1ysdSvgh5rZqKgP/GYDir
         Qp1naRk/dy327wPcaBUX7yRRn7s0TujbuTLnK3PW8rZ8rfrQMjysU23395zcT7xZYv90
         yVUg195xlar3bdoVpK0/J90LtQzTWQV9dFzDfKlvcw3YpxMKFov3aZCDz3WJ4Y2x2gHv
         myRQ==
X-Gm-Message-State: AOAM532DiMMUG8M3HJXCBm4TFx7JwRVuNsB2jghNJLjPnYaL0M+phVgC
	sJGuwzuCWRfbyXp2dVucPp4ncp5grYmMng==
X-Google-Smtp-Source: ABdhPJzkN3NfSZkIEudMrLHUCbDGvE6HZQ7p51fycfVVSyBdEATtUvp7XDj4m+QnBOiL0+wpD3bIEg==
X-Received: by 2002:a17:902:b494:: with SMTP id y20mr315818plr.111.1599017116383;
        Tue, 01 Sep 2020 20:25:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id b26sm3512986pfp.177.2020.09.01.20.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:25:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] imapfilter: Fix linker flags
Date: Tue,  1 Sep 2020 20:25:13 -0700
Message-Id: <20200902032513.3618424-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linker flags were not being respected as a result it was passing wrong
gnu_hash options while linking.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../imapfilter/imapfilter/ldflags.patch          | 16 ++++++++++++++++
 .../imapfilter/imapfilter_2.6.16.bb              |  6 +++++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imapfilter/imapfilter/ldflags.patch

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter/ldflags.patch b/meta-oe/recipes-support/imapfilter/imapfilter/ldflags.patch
new file mode 100644
index 0000000000..ceda8394a7
--- /dev/null
+++ b/meta-oe/recipes-support/imapfilter/imapfilter/ldflags.patch
@@ -0,0 +1,16 @@
+Append to LDFLAGS so it can respect the LDFLAGS passed from environment. This helps
+with using propert GNU_HASH settings during link on mips/arm
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -24,7 +24,7 @@ CFLAGS = -Wall -Wextra -O \
+ 	 -DCONFIG_SSL_CAPATH='"$(SSLCAPATH)"' \
+ 	 -DCONFIG_SSL_CAFILE='"$(SSLCAFILE)"' \
+ 	 $(INCDIRS) $(MYCFLAGS)
+-LDFLAGS = $(LIBDIRS) $(MYLDFLAGS)
++LDFLAGS += $(LIBDIRS) $(MYLDFLAGS)
+ LIBS = -lm -ldl $(LIBLUA) $(LIBPCRE) $(LIBSSL) $(LIBCRYPTO) $(MYLIBS)
+ 
+ MAN1 = imapfilter.1
diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
index 7d4e12dfb8..86553b5a8c 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
@@ -2,7 +2,9 @@ SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ccca8573ead8e965c130b6b2946a36ab"
 
-SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=v${PV}.tar.gz"
+SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=${BP}.tar.gz \
+           file://ldflags.patch \
+"
 SRC_URI[sha256sum] = "90af9bc9875e03fb5a09a3233287b74dd817867cb18ec9ff52fead615755563e"
 
 DEPENDS= "openssl lua libpcre"
@@ -15,3 +17,5 @@ do_install(){
     # No need for manuals at this point, MANDIR is hardcoded to depend on prefix
     rm -rf ${D}${prefix}/man
 }
+
+ASNEEDED = ""
-- 
2.28.0

