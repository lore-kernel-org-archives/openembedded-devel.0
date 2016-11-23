Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id F2E49605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id x23so664258pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DdVt9wsPFBgaU4i0mEobteT/njuu/BWca1zvZ2gyqUQ=;
	b=I8yEXTDseYlZxBm390xB+eP865JR8na3hfXHZ/3nv0/MCsYrc6fLMH/Jjgqs17bsXl
	T3dJvlHCxqizNZ94IxkrhZawt/BOxdo30UhJs3BFj/c0JQ0h91dvzZAvMGZ3Jq1cJPf9
	qlrOYprjlPzolm1F/YLWEGSWZ7cJkoGhGr92klEC3BoufBRc2JHl9E+vOOTsUsKUk8dd
	wAMBhJS/JXBBQ6xGa/T6rROjGQqcUnyuFA+1132x4LoXmayoIlOs097SALINB4Cg74NU
	wcclGcy0BK+MaNNa1XLqH+f9sxxBxSbFay7ui14r45EPmkASnCFuOs1fudZONwXXbNbJ
	lS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DdVt9wsPFBgaU4i0mEobteT/njuu/BWca1zvZ2gyqUQ=;
	b=Xxl6puK8E35AoYygyXCcbawMNAAIQdh4YT8S8yJ0luWQHDG1lh/5CLH7wq37cjMJ84
	ihbRse3jqhDUw+Wm2JgJXAih63WVDzZmy2Rle9K0mJNIJneMAwwpmAML+iKkyyzMwrfx
	0JlM0A5VW4HWJJnFL6/0GG5bi6ZOUrc+xjtpdMQJKc1bmk56xpbybVbyEhY9nbH4BwYd
	du4v/fgbmWqmx4sXJ/B8/sSqWe+HzCF2prWls8v6e92dykKl0gVibl0WsNOy5QNG5yJm
	IeDMLGJH+9AZzryTh//v1GEEx7tiH3IsK9afHXT/UebzWWxLH1dWPOKxrLrMCM9pykve
	kmEw==
X-Gm-Message-State: AKaTC01RNWNojWQwZzHBLmQuVMj2JPjwf12cpPWSIQifquW8XTkgLJGw7kdjlyuyTl7g6Q==
X-Received: by 10.99.244.17 with SMTP id g17mr3582924pgi.80.1479892966745;
	Wed, 23 Nov 2016 01:22:46 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:58 -0800
Message-Id: <20161123092209.23699-38-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 38/49] fribidi: Fix build with security flags turned on
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:45 -0000

Clang complains like below
| ../../fribidi-0.19.7/charset/fribidi-char-sets-cap-rtl.c:148:7: error: expected expression
|       DBG ("warning: could not find a mapping for CapRTL to Unicode:");

Therefore quick fix is to remove FORTIFY_SOURCE from cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
index f8e7aa0..e79de66 100644
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
@@ -10,6 +10,7 @@ DEPENDS = "glib-2.0 libpcre"
 inherit autotools lib_package pkgconfig
 
 CFLAGS_append = "  -DPAGE_SIZE=4096 "
+SECURITY_CFLAGS_remove_toolchain-clang = "-D_FORTIFY_SOURCE=2"
 
 SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
 
-- 
2.10.2


