Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1756.1620069133713246910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M222FNeV;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id n184so6402398oia.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=garUWf24evg8vcsG4JAYMoYYKneRgSM0reYsH7UVFF8=;
        b=M222FNeVPyhva9KBopKELy6iuyFwQcE91nUML6fJbGvulhLjl5XpFA6g1F6k4+7P/K
         HvOiEPpfxnJuyNRDh2tfLSAS9m6/5jbK60rj+1IUmqsxpANVaOsEPeMT+913Q/aY6AP2
         X6s0ZU4pROyltaqujJnQL5YiBsjLDQzT+cv0aCveAdol37KVIr184PFLobsymTzp0ghX
         uAaPoY5zwQH+zs/GI5V4bgtm/CGvQNqssG0UjmSc/3+cyxjMv9oDY/m3OOr4nWrdB+JA
         GfenxpMYSx4Dnp82hoSt8L7YTHdANAlJA8It+5RwBRbvBBbm+Q5aZE9r1De4RC46084T
         cvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=garUWf24evg8vcsG4JAYMoYYKneRgSM0reYsH7UVFF8=;
        b=mT0Nk0angzjx4c8drLynRYnJBaQuMr67ERohqq/Kb4mjp186E8NhNmwrcQdrRx27Ft
         bFhgn4ylEpH3ny5FaoQ287ab2HPWkY7sCw+tWoWh5TbF+rX0Nf2wy9kC7sj9P6MP65KB
         gdiduTRXpiLDWM1rDjF4iiugtsqwtNww1DNqaeL4nTxS16AZbymSq6sDg2as464G+/er
         V9P8FtRbgq4rTYYMeSkbxHGUiQUkk467di3PK1wMaweaMZvMr+KL60+rRSLoE/Yu2Ttq
         B60+bpH75zZRYU/tJCzrDGVHs/6gc5XzKjZaAj2pfJUoIUNbVaIN939Owrk2CJ0ExfKQ
         z/nQ==
X-Gm-Message-State: AOAM530EfZDayBlKR/ZURLL56cZGhidl6NokZMCZ7GfeS1c4IPsqBUrv
	fmUNHtZ0AJ1c6URl2BBm8LM1hYpKNUtCwQ==
X-Google-Smtp-Source: ABdhPJwakEGZefgE22jPWD+hkT7Sd02BiUlXiXGHWe5fE+AQ8SIZY9rcpd1RNcyWEDas1tCDuNsReQ==
X-Received: by 2002:a05:6808:253:: with SMTP id m19mr66141oie.56.1620069131502;
        Mon, 03 May 2021 12:12:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:11 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/14] freeradius: check existence of openssl's commands in bootstrap
Date: Mon,  3 May 2021 12:11:54 -0700
Message-Id: <601c0804998f2e478e42fe5a0008df18b73d3b8b.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

It calls openssl's commands 'dhparam' and 'pkcs12' in script bootstrap.
These commands are configurable based on configure options 'no-dh' and
'no-des', and may not be provided by openssl. So check existence of
these commands. If not, abort running of script bootstrap.

1. https://github.com/openssl/openssl/blob/master/apps/build.info#L37
2. https://github.com/openssl/openssl/blob/master/apps/build.info#L22

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8ceefc5c3fa5ce87f0e1b0a8f5bb06b259d1e76)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...eck-openssl-cmds-in-script-bootstrap.patch | 38 +++++++++++++++++++
 .../freeradius/freeradius_3.0.21.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch b/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
new file mode 100644
index 0000000000..fcadae93a0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
@@ -0,0 +1,38 @@
+bootstrap: check commands of openssl exist
+
+It calls openssl commands dhparam and pkcs12 in script bootstrap. These
+commands are configurable based on configure options 'no-dh' and
+'no-des', and may not be provided by openssl. So check existence of
+these commands. If not, abort running of script bootstrap.
+
+1. https://github.com/openssl/openssl/blob/master/apps/build.info#L37
+2. https://github.com/openssl/openssl/blob/master/apps/build.info#L22
+
+Upstream-Status: Denied [https://github.com/FreeRADIUS/freeradius-server/pull/4059]
+				 The maintainer commented in the pull that the script could
+				 be run on a host which provides these openssl commands.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ raddb/certs/bootstrap | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/raddb/certs/bootstrap b/raddb/certs/bootstrap
+index 0f719aafd4..17feddbeeb 100755
+--- a/raddb/certs/bootstrap
++++ b/raddb/certs/bootstrap
+@@ -13,6 +13,14 @@
+ umask 027
+ cd `dirname $0`
+ 
++#  check commands of openssl exist
++for cmd in dhparam pkcs12; do
++	if ! openssl ${cmd} -help >/dev/null 2>&1; then
++		echo "Error: command ${cmd} is not supported by openssl."
++		exit 1
++	fi
++done
++
+ make -h > /dev/null 2>&1
+ 
+ #
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 864a4e9447..a6df2aeb03 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://0001-workaround-error-with-autoconf-2.7.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
+    file://check-openssl-cmds-in-script-bootstrap.patch \
 "
 
 SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
-- 
2.17.1

