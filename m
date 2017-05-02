Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id D135171BA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 21:23:19 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id w50so91822867wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 May 2017 14:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VlmE8XUZTGvvjDNy0O6rfLS81iPtUKHCAvWT1kYKXwI=;
	b=s6RcRohDm6Sn4wUf+wMiCZGyufFT5gNLBbnGDLsJw7lyZnKvVVrAIsW1rJlDUtNi/O
	gNUdl3i0nmcAkHbzClYFt/MFga5IABGKcZ0yKVgt6xtJ6iMmQM+qcG2FRftJhvX0VzOs
	jTbSkt2Hn10jDTul7tdG8h4BJdfd95nM4lQsE/RGLrqsMt7RTkPHUar1ZvPZTOS85yCs
	tOjqQ5MoFF64xFSwyK8ZGn5k+DGFmwkjfaIYKmJyGwyd4n66rkFmmO45lXCqJ6Sl0GmE
	QJwii0zKnfphxUgaRU9wlwbZNPrrmhnTOMoBj9KQaf9CJFnB1VK2bI3QT9T1S3l2b6kw
	fbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VlmE8XUZTGvvjDNy0O6rfLS81iPtUKHCAvWT1kYKXwI=;
	b=DIt5rquGZb44rvk11AEi/brD4WWbRtNpwEn7P7bp0uqWmgDcin+w/zr9lMtc6xQ/nv
	aORbXPmR8NyyxmmDGZw15hX+06K99DT9bKvEtR6k1jcaYsqvss+MCclh4Q0XdFnlm6TG
	/XtzqOUfHt3rkyWkFbFyGAIlnJ2W0KuEc9Dax+YXnG1GBnSaCmqyO+r1J9N32otvPTqL
	4bu9/wevQLlU0oZlpng8+trZUWz8nTDNdiDfHaHLe55ukc6b9w2xazdsP8+bPFQu4vQy
	l+RWWVNew4P0iKR1gKz54WHxo08NTsUUTtnMF6bdcGDKFcTmPx9P9VgspUvPgUCgKkgm
	Nvkw==
X-Gm-Message-State: AN3rC/4sakRUTZgfCoZYObHzByEfqsK0aHui69ZxAH9SGNdHcX83Cv4r
	iN0q+YdI2iKa4UdV
X-Received: by 10.223.133.182 with SMTP id 51mr6588755wrt.86.1493760200084;
	Tue, 02 May 2017 14:23:20 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p187sm2455148wmd.24.2017.05.02.14.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 May 2017 14:23:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 May 2017 22:23:15 +0100
Message-Id: <1493760195-11165-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-clang][PATCH] clang: update for cmake changes in oe-core
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
X-List-Received-Date: Tue, 02 May 2017 21:23:20 -0000

cmake.bbclass in oe-core master (soon to be Pyro) doesn't set
CMAKE_CROSSCOMPILING unconditionally, but only when it's actually
cross-compiling.

This means the clang-native build doesn't think it's cross-compiling, so the
recipe can be simplified.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 recipes-devtools/clang/clang_git.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 4f712e1..839fa15 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -112,13 +112,8 @@ DEPENDS_append_class-target = " clang-cross-${TARGET_ARCH} ${@bb.utils.contains(
 
 RRECOMMENDS_${PN} = "binutils"
 
-do_compile_prepend_class-native () {
-	oe_runmake LLVM-tablegen-host
-	oe_runmake CLANG-tablegen-host
-}
-
 do_install_append_class-native () {
-	install -Dm 0755 ${B}/NATIVE/bin/clang-tblgen ${D}${bindir}/clang-tblgen
+	install -Dm 0755 ${B}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
 	for f in `find ${D}${bindir} -executable -type f -not -type l`; do
 		test -n "`file $f|grep -i ELF`" && ${STRIP} $f
 		echo "stripped $f"
-- 
2.8.1


