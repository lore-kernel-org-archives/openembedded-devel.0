Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C22AC78686
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:12:43 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id c24so965073wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uMnW+BvHh2/SXaGJ8OtaQiMgaPPvaRCDl5YrElFO5Y0=;
	b=qqpnA9x/Z41evGn0Oe+CfHBlNHSmj8cKNgybCefZqBLEsySlHPwNqMhcMB44dRFk5b
	1sB1DCMCIju9hUA6ISyKrQYTNIFyqiNe9vWAYKqKfSKSUyqq8MWMo6+rHLlDV6JU5xkN
	dFQJDrY2YVjHaGzDmk7Z7hYBVCz27TrMzsZX0W+MZHJgjqaOVDvcw2iJAq9x+sIUib2i
	Ym15c4Adc5KKaz5L8VWqRCiv4zsJmB9p9/5ZWEIZd7Lt1YOKBDPde+vZ8TPoIRzkxZYS
	UsDMCIfTATjZO/YKSaZOAOFRXMeIm+YzaGdAOxN6cZRW9MtdOfUJknSo+m3dIwA1SqDE
	xh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uMnW+BvHh2/SXaGJ8OtaQiMgaPPvaRCDl5YrElFO5Y0=;
	b=V8tuMZFT7fMsjeV3UeYWmZtTLTIDFgE3DC8vq6329pKcKiNBiMaY/4MUcQbqlHQ4Eu
	khQuHaclKU8epiCEAmuVW9znd6oGQzQTpPgwYRJ1VeHFQTs2FxeDdOp1Fj2dupM0YjD6
	AJWDE/HLYh5gLc1wBw3VcYc6fJ2u6R5ApV5bFy9IOA6mZEIDvIRKG4fJ1YJSSmh/ymgB
	p/PfApY1f5pVKKfMI4Fv5XJ5Xy7tAET20hGQ1Ge95Jtqyoaal6afsIgAZLdwtQlYs2AC
	CsOcmIeClhmUnJU7zS1hdmc7IzINM0x9RwFaQUxe8woqsEoN3OWFGyJ6q9zg3ariOd06
	9ggg==
X-Gm-Message-State: AElRT7HjA++okZuQVIKrHh7d9j497pCfv/ZILnzjdc1cYHfKe5DFbM5S
	SuM8fg0MqHRBM67cqDdlPIW+sQ==
X-Google-Smtp-Source: AG47ELsKcqAaPgN6pLmCpJJr8aSFHhw7o63ky89PQsfDd4sTVgVYb11Rtlfj7/SHxz0y60YYKCPu1g==
X-Received: by 10.223.197.139 with SMTP id m11mr2645399wrg.198.1521231164434; 
	Fri, 16 Mar 2018 13:12:44 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v23sm2307073wmh.30.2018.03.16.13.12.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Mar 2018 13:12:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:12:46 +0000
Message-Id: <20180316201246.4794-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-networking][PATCH] tcpdump: refresh patches
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
X-List-Received-Date: Fri, 16 Mar 2018 20:12:44 -0000

WARNING: tcpdump-4.9.2-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch unnecessary-to-check-libpcap.patch
patching file configure.in
Hunk #1 succeeded at 418 with fuzz 2 (offset -149 lines).

Now at patch unnecessary-to-check-libpcap.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/tcpdump/tcpdump/add-ptest.patch   | 13 +++++++------
 .../tcpdump/unnecessary-to-check-libpcap.patch        | 19 ++++++++++---------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
index 196cec7f20..b71435a043 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
@@ -1,4 +1,4 @@
-From 7b259580800e259d232229dc89f97058b56e2fe8 Mon Sep 17 00:00:00 2001
+From 8ee1ab1ac89557d48ac1ab7ddcc3c51be9b734ad Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Wed, 22 Oct 2014 10:02:48 +0800
 Subject: [PATCH] Add ptest for tcpdump
@@ -6,15 +6,16 @@ Subject: [PATCH] Add ptest for tcpdump
 Upstream-Status: Pending
 
 Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
+
 ---
  Makefile.in | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
-Index: tcpdump-4.9.0/Makefile.in
-===================================================================
---- tcpdump-4.9.0.orig/Makefile.in
-+++ tcpdump-4.9.0/Makefile.in
-@@ -436,9 +436,17 @@ distclean:
+diff --git a/Makefile.in b/Makefile.in
+index 0941f0e..3ce40c6 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -437,9 +437,17 @@ distclean:
  	    tests/failure-outputs.txt
  	rm -rf autom4te.cache tests/DIFF tests/NEW
  
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
index d7a3ac23b1..8cefadf284 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
@@ -1,4 +1,7 @@
-unnecessary to check libpcap
+From 741d77e42fc4af49804f7ee43b7237e01633cbcd Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 8 Jul 2014 13:20:47 +0800
+Subject: [PATCH] unnecessary to check libpcap
 
 Upstream-Status: Pending
 
@@ -11,23 +14,21 @@ In fact, the libpcap has been added into the tcpdump's DEPENDS, not need to
 check if libpcap existed.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- configure.in |    2 +-
+ configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 06fade1..9125de7 100644
+index b2305a5..b3b5dbf 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -567,7 +567,7 @@ AC_SEARCH_LIBS(getrpcbynumber, nsl,
- dnl AC_CHECK_LIB(z, uncompress)
- dnl AC_CHECK_HEADERS(zlib.h)
+@@ -418,7 +418,7 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
+ AC_SEARCH_LIBS(getrpcbynumber, nsl,
+     AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
  
 -AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
 +#AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
  
  #
  # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
--- 
-1.7.9.5
-
-- 
2.15.1


