Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 515A1702D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 04:52:15 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi2so6661541wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 21:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hcOGQnWGGoN/TXfLAhpaojPRRytWmsCv1kQgWBAUnMY=;
	b=HASK3DjE3df2PJxFk/38E7EpuzzYctW8eRovYbABx/KsG1s74d2IDpUpcZjC/Q7Vld
	AmPReZ55LokKNmPAkOSPpZP/C3x0v735D9zT/Mgn/PjnO4b4y4rgGf/lNLAhNEBrTOAG
	8PIp3M6WPJYVG8nIvo8QXKqJds8QC17floo02zlhE9atqMDUUJhjw5tT7xnrDzSOCe84
	TzcjsCeYHzuA5cmsQsS0M6uccjJnBNJMCS6KUtTRpMJgh00JDpQaXkJOjRskALLjSnBV
	vttsNp7euq1Jx4hudTKLqf+noFT4/H+Sg+n8ioqSiLFR0TlvZikBGSg6M0uPLmHjjWZw
	o1eg==
X-Received: by 10.180.11.196 with SMTP id s4mr1507478wib.16.1412657536599;
	Mon, 06 Oct 2014 21:52:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l10sm13228189wif.20.2014.10.06.21.52.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 21:52:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 06:53:17 +0200
Message-Id: <1412657597-13020-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <CA+chaQdOUkViSuuZF+Fn1hfz+1P7ijgFYGTjgaRGUWTdVLCVZA@mail.gmail.com>
References: <CA+chaQdOUkViSuuZF+Fn1hfz+1P7ijgFYGTjgaRGUWTdVLCVZA@mail.gmail.com>
Subject: [meta-oe][PATCHv2] modphp, xdebug: blacklist because of conflict with php
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Oct 2014 04:52:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc     | 3 +++
 meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb | 1 +
 2 files changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 6932429..8707950 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -14,6 +14,9 @@ S = "${WORKDIR}/php-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
+PNBLACKLIST[modphp] = "CONFLICT: 466 header files conflict with php"
+# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
+
 inherit autotools
 
 CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
index ffff135..750b288 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
 
 DEPENDS = "modphp"
 
+PNBLACKLIST[xdebug] = "CONFLICT: depends on blocked modphp"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-- 
2.1.1


