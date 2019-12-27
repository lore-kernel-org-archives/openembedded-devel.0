Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5F27D3B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 03:56:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id bd4so11226090plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 19:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P1kYvapk1YhUPCOCWdlQW4iaZ/QqaLE5pMZkRRycYMU=;
	b=GKk+ufLphkLBsvcw2qThUAdkW/QNco2Kw6bCrtQ39cbt6FfQKOQeHroQADI8WO+zfa
	RzfV1F+4ajqLFEny7n30cujBNQGdcWwwfaIN6hQ2Sq6KQJeUvJW9nwpRPdsPUn/poCAe
	e7AV1iRSSUVwxqJQshc7nZcyZFv9Y3arQhwWxRek6HMLPSuZa8kj5T64cvFWbcmV4wdJ
	PQ3ZYD3anOp+ca1y6ex+oJyIN13tSEn7/drvjgEpds5sucWQH4hyhn0Rg2hAcWX85nCB
	mEtT518V5iGNEsniYleqe03lHtawBuSqLqOvlwqsx6n95NftEb6vkwyRZkopWPTGYPv0
	dJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P1kYvapk1YhUPCOCWdlQW4iaZ/QqaLE5pMZkRRycYMU=;
	b=mkTp10WAY4QWKfDpdbSJi8CHr5IzGsESefV+VgLt2eGEniVIExTzClAUl32MhrisLD
	nD7muDiuJeL/vXapHSjzt/VvwRVGGDlwcMQlJNjR9cDaWz8qUYK1IDOl+EcOwx4xL9QP
	p+qICTnVhUJy+wzVJD31tleO6gwZrzTBYT5lQa5ScNyqZYtmYVIXjyxWCSNTTldP7Tz5
	DFEFGHBsnLeLo6FfBEQAJu8LeJ1F5buiilr591bMmOwVh3XJMAbAdb53Qgk7FQOqlyCC
	K3SBusZ+wiWnK/wO6wuJfNC8CTgnfm0i+/qS8jz/1mA8JKBAYwc3pinJ2EqWuxRV4G88
	A8WA==
X-Gm-Message-State: APjAAAVo41g0sQO2GjI32qGmx6viQgjiD5uqIY2CerQxIyRcarDDJOwW
	xJ3PfS25Io2ez/S7iNtM14NDzyleJUM=
X-Google-Smtp-Source: APXvYqwnoJnmT7FjMTgHGalkRJOUOeJXoZ3nFfUp4Vbnj3JDzWdEC8qhRl6UukQK5X/NsV6Fj2c3pw==
X-Received: by 2002:a17:902:244:: with SMTP id
	62mr9555608plc.117.1577419008739; 
	Thu, 26 Dec 2019 19:56:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r30sm36673613pfl.162.2019.12.26.19.56.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 19:56:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Dec 2019 19:56:37 -0800
Message-Id: <20191227035639.303716-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227035639.303716-1-raj.khem@gmail.com>
References: <20191227035639.303716-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 3/5] tvheadend: Fix format-truncation warnings
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
X-List-Received-Date: Fri, 27 Dec 2019 03:56:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-allocate-space-for-buf-on-heap.patch | 46 +++++++++++++++++++
 .../recipes-dvb/tvheadend/tvheadend_git.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch
new file mode 100644
index 0000000000..cbd76b6abf
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch
@@ -0,0 +1,46 @@
+From d4a405f87fc215c14e610a25b5a6b14060c1ef15 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Dec 2019 13:53:52 -0800
+Subject: [PATCH] allocate space for buf on heap
+
+Avoids
+| src/epggrab/module/xmltv.c:204:47: error: '%s' directive output may be truncated writing between 2 and 2147483645 bytes into a region of size 115 [-Werror=format-truncation=]
+|   204 |   snprintf(buf, sizeof(buf)-1, "ddprogid://%s/%s", mod->id, s);
+|       |                                               ^~
+
+Upstream-Status: Submitted [https://github.com/tvheadend/tvheadend/pull/1324]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/epggrab/module/xmltv.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/epggrab/module/xmltv.c b/src/epggrab/module/xmltv.c
+index 34ab05bdb..b1a956614 100644
+--- a/src/epggrab/module/xmltv.c
++++ b/src/epggrab/module/xmltv.c
+@@ -197,11 +197,12 @@ static void parse_xmltv_dd_progid
+   (epggrab_module_t *mod, const char *s, char **uri, char **suri,
+    epg_episode_num_t *epnum)
+ {
+-  char buf[128];
+   if (strlen(s) < 2) return;
+ 
++  char* buf = (char *)malloc(strlen(s) + strlen(mod->id) + 13);
++  buf[strlen(s) + strlen(mod->id) + 12] = '\0';
+   /* Raw URI */
+-  snprintf(buf, sizeof(buf)-1, "ddprogid://%s/%s", mod->id, s);
++  snprintf(buf, strlen(s) + strlen(mod->id) + 12, "ddprogid://%s/%s", mod->id, s);
+ 
+   /* SH - series without episode id so ignore */
+   if (strncmp("SH", s, 2))
+@@ -219,6 +220,7 @@ static void parse_xmltv_dd_progid
+       if (buf[e+1]) sscanf(&buf[e+1], "%hu", &(epnum->e_num));
+     }
+   }
++  free(buf);
+ }
+ 
+ /**
+-- 
+2.24.1
+
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index a818a961f3..20faef047e 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
 SRC_URI = "git://github.com/tvheadend/tvheadend.git \
            file://0001-adjust-for-64bit-time_t.patch \
+           file://0001-allocate-space-for-buf-on-heap.patch \
            "
 
 SRCREV = "fda89e85e0b6ae796d8a09e178d3937aa7869270"
-- 
2.24.1


