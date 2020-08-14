Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.12373.1597383427521779022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+SQuod+;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 189so3357573pgg.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bKvrDYiHjdhd43iweWBi5zgczabLL0eP5+1HGf/w79M=;
        b=k+SQuod+gtjuesvSTXHZqstphMA8BhKjKSzfGuuk0PkomJlh2rb88GqVAc/K4fTXZk
         WbH3QvQlu3LUq4v1JBndAV90KUkBYT+4uMEz1tFxJ7sd7Y1m8PR7brdit2rjA9agFFLJ
         z+xqtefApL4VNizA/onXxFfI44hghJ7nx8ndJe6JwlgFLrIgv2/aazXbqqA0S+23mzni
         5HE/iyXmr9oS4vKUYcPGfVeZC45gHfLw+57tqFkc5AbJA3mPwCJ7Dps6n+vzz66EuIHw
         271nbeTl1sHYrCU729USeCwWW0Bqz+pPUaElf/9BeYz8WLy7t8u7EgVdUvSu+vFEPiEk
         fPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKvrDYiHjdhd43iweWBi5zgczabLL0eP5+1HGf/w79M=;
        b=igsfFlltKz08KvLakdS0ECN4jrg/n8xCufX6paZKeaS7aC1hxf7w3+roGehBJleOFS
         wyZCTvvE2EBpvn+MMe2YQqO+sLgx+v0sqrYF0l1PbtjbJAMSVP17QrIMAsRyMhkQiMkO
         8yOTirQ9xPGRQ7T26wD51P4UIGdoUOaIFJt37uFOqF8Q19MAvlcpQNbBDzgnD61LzGKD
         TEY3x3Beja60Vc6lSTdlq46/C2CLbzyzggp4ecelxNXNgkRkVp5+044NtvtdqRVCCJ7w
         koowhr2mmcftCII8W7fUtYIyyRmjDQ2HowgSgmkRRYi+HIl3hCFejErtFw/M9oos9lsp
         LlTw==
X-Gm-Message-State: AOAM530Dor/nCkQnc5ux/3xih0YXdnl1qCwjEGHRz2ehYTYot8Shfssk
	wp+3pohqlEffxKry+WtOB0HcFpytUwsTOA==
X-Google-Smtp-Source: ABdhPJzlHquUFh1OVh3K72yBM/C3csORsh/ypFEkzkM59F1yUJWyS/6Sl63wjAYQKUKt1TDlv1WnBA==
X-Received: by 2002:a62:f904:: with SMTP id o4mr704346pfh.14.1597383426724;
        Thu, 13 Aug 2020 22:37:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/21] cdrkit: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:44 -0700
Message-Id: <20200814053657.1701247-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |  1 +
 ...oimage-Add-missing-extern-definition.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-missing-extern-definition.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 3b10e978ef..ebb95cf782 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -10,6 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-genisoimage-Fix-fprintf-format-errors.patch \
            file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch \
            file://0002-Do-not-use-rcmd-on-build-with-musl.patch \
+           file://0001-genisoimage-Add-missing-extern-definition.patch \
            "
 SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
 SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-missing-extern-definition.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-missing-extern-definition.patch
new file mode 100644
index 0000000000..809d3afd76
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-missing-extern-definition.patch
@@ -0,0 +1,29 @@
+From fd5251cc8b82ce7a5f907c5129969097d75609fe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 17:38:59 -0700
+Subject: [PATCH] genisoimage: Add missing extern definition
+
+Fixed build with gcc10
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ genisoimage/genisoimage.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
+index bbedfb0..82c859b 100644
+--- a/genisoimage/genisoimage.h
++++ b/genisoimage/genisoimage.h
+@@ -376,7 +376,7 @@ extern int	use_fileversion;
+ extern int	split_SL_component;
+ extern int	split_SL_field;
+ extern char	*trans_tbl;
+-char		*outfile;
++extern char	*outfile;
+ 
+ #define	JMAX		64	/* maximum Joliet file name length (spec) */
+ #define	JLONGMAX	103	/* out of spec Joliet file name length */
+-- 
+2.28.0
+
-- 
2.28.0

