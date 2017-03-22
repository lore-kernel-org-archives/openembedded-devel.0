Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1C877A57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:51 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id o126so28157230pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Nr67ZQvj8XGIySZEyhLrCy5uvPSCmKKQ2+v009ufLg=;
	b=VyU7L5c6KB9RxmzFYzvXAxukIXlqQyuxKGtHBywQeYnx6mCG+tJorjXPMs14gsRl+i
	nhS+2rz4gTt3TwI2gqKPsWovLxp2EQieTpUJeEOEZrhlZN9cP52cgJS71ecFGOpUO3Vu
	4iiEjSycprqj94laUJR1ZKdcskAjkFE1KZ96bysWB1iX+VQb3cFaI98e2UAsmZBEl2/x
	VqpMmoPR69c6ZMzNns/n7t43NMuNqULXMvYjqwJy4D4PCmcTHp/ueU8DwwFyDN3g+c84
	SXl9RjMOPpKESUgBeNz+cim4XW+wf7enKlRNIjlsS521OGMihOsYF1f9cG2lfXukoCyT
	/t5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Nr67ZQvj8XGIySZEyhLrCy5uvPSCmKKQ2+v009ufLg=;
	b=ZXw/2XgGE34TKwVU4Q++vjkbUFQSzGiIHiAbuLKFYtoROA9tMDe2KR0ONbRhNdSchC
	UkIapZel9j3BFBTIEfNuuQ0ZZfkoxEBEUOiL2zyMmjfFGyfVGZUoCTaFQaAIgEIBSfeC
	0mb2pChMz/JwktPIxn2gIkgt3Fj6b1KdCg5qUgGFT37pxo7w9vkjqmrM00JIZTDxUeT4
	DxMeuCRneAS6ZWpAeMK57MTy1mBdwOY9QOFmnnlwQK8LKAP5rXqpzeJf4LTjWAbpX2Hr
	GyTr+iDg64s+Uuh8MW+unr1uAE1gMh6ZhnLCg/6bfNVM4NxuAWkGIJG3OOo2Ue7jsiD3
	O9NQ==
X-Gm-Message-State: AFeK/H3GRRNCVLloGGoS4yvsnFUxtqL5lV5ab3+v2NJIcCOFMS2LR4PGUT+HZcFVGlBftQ==
X-Received: by 10.99.142.67 with SMTP id k64mr39983193pge.31.1490208352866;
	Wed, 22 Mar 2017 11:45:52 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:30 -0700
Message-Id: <20170322184533.6501-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/10] libedit: Update to 20160618-3.1 release
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:51 -0000

fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/libedit/libedit/stdc-predef.patch  | 17 +++++++++++++++++
 ...{libedit_20160618-3.1.bb => libedit_20160903-3.1.bb} |  9 +++++----
 2 files changed, 22 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch
 rename meta-oe/recipes-devtools/libedit/{libedit_20160618-3.1.bb => libedit_20160903-3.1.bb} (64%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch
new file mode 100644
index 000000000..c95cdc9d2
--- /dev/null
+++ b/meta-oe/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -0,0 +1,17 @@
+__STDC_ISO_10646__ is defined in stdc-predef.h
+therefore include it to see if its there on a platform
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libedit-20160903-3.1/src/chartype.h
+===================================================================
+--- libedit-20160903-3.1.orig/src/chartype.h
++++ libedit-20160903-3.1/src/chartype.h
+@@ -29,6 +29,7 @@
+ #ifndef _h_chartype_f
+ #define _h_chartype_f
+ 
++#include <stdc-predef.h>
+ /* Ideally we should also test the value of the define to see if it
+  * supports non-BMP code points without requiring UTF-16, but nothing
+  * seems to actually advertise this properly, despite Unicode 3.1 having
diff --git a/meta-oe/recipes-devtools/libedit/libedit_20160618-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20160903-3.1.bb
similarity index 64%
rename from meta-oe/recipes-devtools/libedit/libedit_20160618-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20160903-3.1.bb
index bda421d81..90b5a1d39 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20160618-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20160903-3.1.bb
@@ -12,9 +12,10 @@ inherit autotools
 
 # upstream site does not allow wget's User-Agent
 FETCHCMD_wget += "-U bitbake"
-SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz \
+           file://stdc-predef.patch \
+          "
+SRC_URI[md5sum] = "0467d27684c453a351fbcefebbcb16a3"
+SRC_URI[sha256sum] = "0ccbd2e7d46097f136fcb1aaa0d5bc24e23bb73f57d25bee5a852a683eaa7567"
 
 S = "${WORKDIR}/${BPN}-${PV}"
-
-SRC_URI[md5sum] = "b6e60f326a3fce91bea1a6fe4700af58"
-SRC_URI[sha256sum] = "b6b159c0c6ec8a7f349ea2a75d8b960efa346c462c1ac4921f1ac0de85a9f5d6"
-- 
2.12.0


