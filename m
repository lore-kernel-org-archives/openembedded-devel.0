Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 676C47719D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:21:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so10291305wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hhqvHmsvrHFkTX6jA6ObxAZCJ92BPUpKgzEnbi0lW1k=;
	b=SF7rNXTEZHIB55ED9JbqMQJsmgtDCRJaP+wwnRI4BWMrqVcdgLQ992PMUeQcHVpwEc
	QlcSyAtNyAFma+GKZ65K/3ZLaxkm6hU4Dfpku2nN1y573JtiNzXrC/ELHWwS0ITMkrx/
	7itf713hn9UAyhUOkp2HsDUJW5F01t5ryYPekmgwHjRQ3CMsENAVzHELUM0BMuc8GfhF
	lzhOkqh9BSM7GHGyoFMMsZd7dWctN2WP/yVOSxyK1+kXEipsq9WOAhEsZxnN7DBPj7lc
	oMp7XaxxjCvHc0dHOMSIEjbAd7dA34q392HLIGrC0EfYfKtJcZVwKA5y3+aVq/fyQc7q
	UHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hhqvHmsvrHFkTX6jA6ObxAZCJ92BPUpKgzEnbi0lW1k=;
	b=i/mUgWWlx5ez6t2imS7pg+wbg45nV3xxHtCmMlXpx+nA5lyITlKh5ipLRP2AhVNn63
	BeKEhu8lu1QpnsUPF2ts5Q5Jd/BbEyqiCaCPfVPgY2nKk5W4GVnyDFlKQOGNL7bplsgs
	zqU5gpMUOFeQgFvGqf6zfgfKbPGAdUbcEYvvPz6mNDcPv6dLu22oRfc/Fqbkk2MZWO6g
	TqkTH/Zyp8zoOwd6DYVolDvm5G9pPEB6mNsF8kHrEskrYj5RnUKBSNnJneezPUopW74L
	YezvX5St/UdVHsbzbylExHRThGCMKIiJz6IKZPA0KnRxVA87zvZPGuCDlFQSiLGqgpSg
	gfew==
X-Gm-Message-State: AEkoous4hh8/jbXXFhZxj5bfgNpYvtMNjUAI6Gw4B/z5GPuLP2nluB5yJNI2KHOEAltGCQ==
X-Received: by 10.194.144.161 with SMTP id sn1mr36275611wjb.29.1471256464586; 
	Mon, 15 Aug 2016 03:21:04 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a203sm18337204wma.0.2016.08.15.03.21.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:21:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:47 +0200
Message-Id: <20160815102049.3291-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/11] libgxim: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:21:04 -0000

* fixes:
  | configure.ac:18: error: possibly undefined macro: AC_PROG_INTLTOOL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 768bdaa..772babf 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -20,6 +20,6 @@ LIC_FILES_CHKSUM = "\
 file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 EXTRA_OECONF = " --disable-static --disable-rebuilds"
-DEPENDS += "gtk+ glib-2.0 ruby-native"
+DEPENDS += "gtk+ glib-2.0 ruby-native intltool-native"
 
 inherit autotools pkgconfig gettext
-- 
2.9.2


