Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48044.1795411877556860256
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d81zWErZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so1497086eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411877; x=1796016677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv1WRccsgRSbp0k40jokRbnJLq42MPvWkkFdZkpi0s4=;
        b=d81zWErZ5jgyZC6oqovCwn56Bk5b+fRJXaCwLvjN3frOhln5AWGsWNNLVhtiAwHur7
         hicjypIAjUajnCxTpaz9UdZ6MVrkdQ3ulGXJsi2sPy7GRJITU6OyG09mE4jNA0QmyW17
         VOKPpMMYokzQ3fu9oiPnwfU+cHI6Jcejdc1SQpB+ek0qadNj+Cahj9bbbLPV0D5JPCd+
         RnkfrfxWJb++UrNSzrIJmZR5Sa0CU8Iu6NVKy7mR2zlRvNSDfKco1gVn/P7oL6/cJISK
         l1NTkB1ZDSwOFL2VmiLG7raWrvl9ZO0pjmMgxWkA3+I/AgLNIsdq4QEXRrYkTeV2wsKj
         Q8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411877; x=1796016677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv1WRccsgRSbp0k40jokRbnJLq42MPvWkkFdZkpi0s4=;
        b=UOax4SR7ITswcvquE5jqVfRhTPLzM+itAnv+iTQ8m71xV7ujM03Z2EUYZwoywCHhw2
         7iGbYZpdeVq6mm3bfXmmg7Ed47wL62Io02nDZqC49koucypSfeKhqp507mQFRDKl9PPG
         pxPV8eG5WalHKfwG+z8c8Z+ko0QsMUDxkNwuI9VvbQJ/Ihf6dY6ufXdKMyQFXbQ5IouF
         CCufn/ampNET4CKM77EAHZdDIvetomcxlE2KGTmZHT8VjGmqyE5R6oQwzf+jPnVrJ8UW
         anViOI1KdqZsrdek6IkvrkayXXpP8pMWbInzBXQahz6Q1KslGaBkbS89eZ2BmXqLRbYQ
         UkWQ==
X-Gm-Message-State: APuU4Z+YYoiZPHbgf6J6e6t1OEPRhXo2KStmr925lwmL9gGmI/NlO60I
	rUqEqUUDf+92PUQ4BABqm98Ww47aXBO3YVc2l9O1GVJQTptZu9zbXzFIq1CfVbJSfjI=
X-Gm-Gg: AZFdTZcMLfFNrJ0mAoyX4MJfDeuQekcnRU1el2n1gt6w/new4jXzWcyYWvia432cmzf
	RVsk8BMqRswiaaW70q62sVVFwMn08HLyQCmhWgUSvhGHaOwtOcJvUJI4+nNa+qwikJe7ziYrIPd
	bwxGmxDwtTGkfLigdFndCw5TbLJdB8YluqsFuLTcg/YZlS9AdKORcDQ3yuvaig5eBmIMldBa2ae
	jHy5RnL+crXXJzCTx31RqKKfFJ5RRHUZk8BjyJRxZ7h6GG7yLq4tLdizil1ydEnq4uzDGz6DHlq
	CpkxYzQfQHMGWLgjwJv1MUKG9z4i7xH5Nj2luiZxfa7DXEY66kr23zdzlX/o4E4JZWVUMENEfKT
	85G7oHZ75Ulo+CTPzovUltMRHmGUIt1fre2aAO/eZRmBrSTdSAGLMi1BLVpYBXJ5JH0/wCGpE8B
	tUt1kKS7+eNU/smfW2sBmQvWa+/ZiPOZIYO1E8pbvnM8l32ujSEMGAoeUXGKeTu9QjxF+vAYha5
	HlYtB2CST1pCtSsQzUpALMwMxpFZqFhQ5QH1R7+9sguMrTMSF09upocj5A63hKq2PDRw8z/666K
	q1HfildDXLmSTtiD2IW34y3GSq1Q2OB1SO693gN0uOStRXLZ8kw1zfpUlk+CGkwYt484m/6QZPQ
	AePKyViUSygyTioG8DIpGbFXzBiyxXbq1Qq+f3CkB+da6/XQliMowj0y4EAomDTETCU0OkedYaP
	OopaaW/36G2PbgWZGULWUvgVbyiH8VyCc4mtrbAkMIkmXV2aPatrpSOPm1t6GgiNOsdhu8SmhNF
	F1+CFuyzRiacrM8xfNwuziT531avqxqdmaqyXr48CsfQ2Vrlu75Lv8DowHtL3w8UNVFQT9dCRGP
	Og3s+fr16BjCbX0WSRin0LtSOQ==
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr11119456eec.36.1795411876908;
        Sun, 22 Nov 2026 21:31:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 38/42] valkey: upgrade 9.1.3 -> 9.2.0
Date: Sun, 22 Nov 2026 21:29:22 -0800
Message-ID: <20261123052953.3658549-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132853
Content-Type: text/plain; charset="utf-8"

New feature release Valkey 9.2:
- New commands DELEX, INCREX, XACKDEL, XDELEX, ACL DIGEST, ACL roles,
  HOTKEYS and the Path Hash data type (PH* commands)
- Forkless RDB snapshots and full sync; Zstd and LZ4 streaming RDB
  compression; secondary TLS certificate; replication throttling
- Large sorted sets now use a B+ tree (OBJECT ENCODING "btree")
- Behaviour changes in ZRANGEBYSCORE bounds and expiry dirty counting
- Many performance improvements and crash fixes, including
  CVE-2026-130822 (use-after-free in client eviction)

COPYING now carries one reflowed BSD-3-Clause text covering both
copyright holders. Refresh the FINAL_LIBS patch to apply without fuzz.

License-Update: COPYING merged into one reflowed BSD-3-Clause text; license unchanged
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../valkey/valkey/0001-src-Do-not-reset-FINAL_LIBS.patch    | 6 ++----
 .../valkey/{valkey_9.1.3.bb => valkey_9.2.0.bb}             | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.1.3.bb => valkey_9.2.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset-FINAL_LIBS.patch
index 7dd064fc03..9112abf537 100644
--- a/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/valkey/valkey/0001-src-Do-not-reset-FINAL_LIBS.patch
@@ -15,13 +15,11 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index 5919f01e9..e95050376 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -138,7 +138,7 @@ endif
+@@ -140,7 +140,7 @@
  
- FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(SERVER_CFLAGS)
+ FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(SERVER_CFLAGS) $(CPPFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(OPT) $(SERVER_LDFLAGS) $(DEBUG)
 -FINAL_LIBS=-lm
 +FINAL_LIBS+=-lm
diff --git a/meta-oe/recipes-extended/valkey/valkey_9.1.3.bb b/meta-oe/recipes-extended/valkey/valkey_9.2.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/valkey/valkey_9.1.3.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.2.0.bb
index 40e8a9cd75..453204b434 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.1.3.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.2.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A flexible distributed key-value datastore that supports both cac
 HOMEPAGE = "http://valkey.io"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1ca212fd1b16d6043cc4a7c52d56260"
 DEPENDS = "readline lua ncurses"
 
 SRC_URI = "git://github.com/valkey-io/valkey.git;branch=${@oe.utils.trim_version(d.getVar('PV'), 2)};protocol=https;tag=${PV} \
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=${@oe.utils.trim_version
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "29173b67508b2de4c0f0ed551f3b47cf19fc3ca8"
+SRCREV = "d23684e3ec302240754664417e3b99df23e8e4c9"
 
 RPROVIDES:${PN} = "virtual-redis"
 
