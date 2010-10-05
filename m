Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P300e-0006yI-0V
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 07:24:17 +0200
Received: by pwj1 with SMTP id 1so1280096pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 22:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=XgQSC8nYSE7FGLRZmQCwlD24VE8czsEDA7dbbNffx7Y=;
	b=HrdJrDDBYxijrMfdVDguGVNFkmtBcYGh5lojcDw0Q65ghAGgZI/knRE+LfrCTvWGEK
	e5s62aikgKH6hgc61K7rTQrYdrJecccVV2GdIvatBm9d+o/zAVjbeylKn1ym3eWopLL+
	5b2C4cE+jxy7j373lPT/0ke26pI13jKmOKtSw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=e6XQHphS1vdZNJrKDochAQMjtQMdi6vFZ46UlNhyr52YxYSiw08TzI+aQxsQ9SsP08
	1hTm9bdEzINidHZdg3ZZ5WUpHPPiQGTE9Ml5fL//QRofk8UvP1+B6oQAOzGCOwxwx1r/
	5TsGH4R0laZ6Hj28D8l29c3f5W9g9qnp+y2qo=
Received: by 10.142.185.5 with SMTP id i5mr9739610wff.225.1286256227424;
	Mon, 04 Oct 2010 22:23:47 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id o16sm7396221wfh.7.2010.10.04.22.23.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Oct 2010 22:23:46 -0700 (PDT)
Message-ID: <4CAAB65D.1020805@gmail.com>
Date: Tue, 05 Oct 2010 15:53:41 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc-4.3.3: fix problem with parallel builds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Oct 2010 05:24:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The relevant error is as follows.

error: conflicting types for 'strsignal'
| /usr/include/string.h:564: note: previous declaration of 'strsignal' was here

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gcc/gcc-4.3.3.inc                        |    1 +
 recipes/gcc/gcc-4.3.3/Makefile.in.parallel.patch |   21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.3.3/Makefile.in.parallel.patch

diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index a3392c0..45520f1 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -64,6 +64,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://gcc-4.3.3-fix-EXTRA_BUILD.patch \
         file://arm-gcc-objective.patch \
 	file://Makefile.in.patch \
+	file://Makefile.in.parallel.patch \
 "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/recipes/gcc/gcc-4.3.3/Makefile.in.parallel.patch b/recipes/gcc/gcc-4.3.3/Makefile.in.parallel.patch
new file mode 100644
index 0000000..d3a7aa1
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/Makefile.in.parallel.patch
@@ -0,0 +1,21 @@
+Fix problem with parallel builds failing during build of sparseset.o.
+Upstream: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=38591
+
+--- gcc-4_3-branch/gcc/Makefile.in	2010/05/14 12:40:18	159391
++++ gcc-4_3-branch/gcc/Makefile.in	2010/05/14 12:51:31	159392
+@@ -1784,12 +1784,13 @@
+     $(TREE_H) $(FUNCTION_H) $(C_PRAGMA_H) toplev.h output.h $(GGC_H) $(TM_P_H) \
+     $(C_COMMON_H) $(TARGET_H) gt-c-pragma.h $(CPPLIB_H) $(FLAGS_H)
+ graph.o: graph.c $(SYSTEM_H) coretypes.h $(TM_H) toplev.h $(FLAGS_H) output.h \
+-    $(RTL_H) $(FUNCTION_H) hard-reg-set.h $(BASIC_BLOCK_H) graph.h $(OBSTACK_H)
++    $(RTL_H) $(FUNCTION_H) hard-reg-set.h $(BASIC_BLOCK_H) graph.h $(OBSTACK_H) \
++    $(CONFIG_H)
+ sbitmap.o: sbitmap.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) $(RTL_H) \
+     $(FLAGS_H) hard-reg-set.h $(BASIC_BLOCK_H) $(OBSTACK_H)
+ ebitmap.o: ebitmap.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) \
+ 	$(EBITMAP_H)
+-sparseset.o: sparseset.c $(SYSTEM_H) sparseset.h
++sparseset.o: sparseset.c $(SYSTEM_H) sparseset.h $(CONFIG_H)
+ 
+ COLLECT2_OBJS = collect2.o tlink.o intl.o version.o
+ COLLECT2_LIBS = @COLLECT2_LIBS@
-- 
1.7.1



