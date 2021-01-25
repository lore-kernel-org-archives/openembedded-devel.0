Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.34487.1611569668072418391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 02:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m0qNpxD5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id y187so10222149wmd.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 02:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4B8SExWfQixHqFgWOp9guiaqAOvCFO+keodL0JfHjKE=;
        b=m0qNpxD5X7ayDCUBs9bafPY7Lh9p11KpXeJ447tpVASf3RIdUYp47oWauJpG1Nf2I8
         4jDoHYg2tmwsuFSzLsbBLReCq0NSO1Yd0IxLGPdn7OP431kRqmI66grP3/JrHm8dMS7J
         NV2IOG8ZeuxZopyCrCU6QC5hiv3NlR37gwbTZcrM6dkG0sha1wNlhQZyLSd9qW84WyxT
         2LMrDVdfh3gHXl/504P7N14P/Y3iI81B2YBqwRnkWTUBqsXndbqhukbumfFEfG0kksQe
         d60tids2f58rvl8Tr4PGpiynHoTDRN8a43+kVycdu561L8ShjLroPRSGEXrtN+uGIrOk
         7crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4B8SExWfQixHqFgWOp9guiaqAOvCFO+keodL0JfHjKE=;
        b=bGiQVoOE67GA6PV8j4EN9hLKWVtaOrQS2oJCuF85wRuGj+zwjQLekLQJfhUZJNYS42
         J6PBhZ6BcZuQM9JX7clTgzg4onuSpHRNPm0tkWTEUI+ms4PjTQnmW78x3CPN1/8z5dwS
         zBCFsovUrAA3SnTkOZYfJ9LEA9BnriG0OrnjujajgpLFEH6iKVUM4jKO+tXpotZiAX2u
         Qj3TWvTbQuo1/d39HXr7q7gnZ5bieXzqc/izFguMUaZocjLSGWkC3c4ZEUr7KFgQtYYG
         bqnCsq6Ki9IemyWYRKzXavX9VOdoHEZSuylHQsVV769SOjZ23iK8WJCJHlhgurl/RGAo
         zmlw==
X-Gm-Message-State: AOAM5327wPKTNT0PATfliWutpz4xidaGux/3ms9R6IDX6KwP7xG4ayhl
	h/ngp1ipLZns/9Lov1pAbcI9njT4680=
X-Google-Smtp-Source: ABdhPJwPU2eoZyse+YtkWVYEK2liccnveL0D9n85E8HBcD1GoRW5H7ELR6OYFRISb9nKarMA59OtOQ==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr5825106wmq.93.1611569666466;
        Mon, 25 Jan 2021 02:14:26 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id s4sm21990183wrt.85.2021.01.25.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 02:14:25 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH 3/3] firewalld: upgrade 0.9.2 -> 0.9.3
Date: Mon, 25 Jan 2021 11:14:12 +0100
Message-Id: <20210125101412.265244-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125101412.265244-1-adrian.freihofer@siemens.com>
References: <20210125101412.265244-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix new dependencies to nftables-python. Firewalld has been changed to
use python bindings instead of calling the nftables cli utility.

(Has this firewalld recipe been used with firewalld's default
configuration which defaults to nftables backend?)

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../firewalld/{firewalld_0.9.2.bb => firewalld_0.9.3.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.9.2.bb => firewalld_0.9.3.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.2.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.3.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.9.2.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.9.3.bb
index 792c7ad61..9aad510b4 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.3.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[sha256sum] = "f982c72d640b0677d510b73d9b05d377b4615c5ef36a3710c62350b39fb62efe"
+SRC_URI[sha256sum] = "5998894db976d77996ca0a6b700a2f4125b9f283465fb255da9bddfb1640cb27"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
-DEPENDS = "intltool-native glib-2.0-native"
+DEPENDS = "intltool-native glib-2.0-native nftables"
 
 inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
 
@@ -75,7 +75,7 @@ FILES_${PN} += "\
 FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 RDEPENDS_${PN} = "\
-    nftables \
+    nftables-python \
     iptables \
     python3-core \
     python3-io \
@@ -87,5 +87,6 @@ RDEPENDS_${PN} = "\
     python3-slip-dbus \
     python3-decorator \
     python3-pygobject \
-    nftables-python \
+    python3-json \
+    python3-ctypes \
 "
-- 
2.26.2

