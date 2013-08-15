Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id B3E586B821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:30 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so179197eae.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=13abyDH68Uhj9s78ISqLFs6L+SKGitx/gvUePWtL6CU=;
	b=NM8x0iVCv1vaVFjFkXfQY/Je7X7OmquIc8pWx6GFdVzZTxXkdf0KgGG//xpUyyDIAa
	mdzGXNFMs2e+cdbSD+BcWaSnmLdsPuBQiPJTk904bxxW3O2GLPO4o1oZ8sNxwY3Zi3Xq
	G1WliPPL9tpRxtqzWdYKkRDv816bVYtHsDu0wo8hvAyxc7KBc6f8zClttQ8Of4/CCnuL
	ubdzDPaAy7qixrKlLhxhPMxN8cy+d921iU/xDTdPiKnTic+f/piBezQOFKaxniZ6pb3R
	Ar3qPNoOItIFhk52QVyIxtCjExXPy9lCqXYlTDJheAmx1nJMhAD0hUu5Tt6u8GD6St1M
	fg4w==
X-Received: by 10.14.104.201 with SMTP id i49mr1885950eeg.40.1376551171164;
	Thu, 15 Aug 2013 00:19:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm7572118eev.6.2013.08.15.00.19.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:09 +0200
Message-Id: <f506066c073d3094ab31950a6e4dc5a675513cc5.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 29/60] ntp: add PACKAGECONFIG for libcap and readline
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:31 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 79e7401..9367d41 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -37,6 +37,8 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-crypto, \
                           --without-openssl --without-crypto, \
                           openssl"
+PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
+PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
-- 
1.8.3.2


