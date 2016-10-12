Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD1371AA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 14:08:37 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x79so7334359lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rR2hX7qNX+CJIToS2jTFtx0U2H2Og0dJWMYgHjLbGcc=;
	b=K+woV62zkJKQZayGBV8TcJy+nTBVj4mrhXy8dMrnfuJSIzz28L0lbaQOhYnA3h0F+m
	2vwKPpHtZ4KMxCluYwdwsj5xtweC91sx+tSGH7AEbdGJdrczND/MNDxcZ9AqwuySPaj+
	3YPmMjnh8k7/vkJiX4OnMkqBxbzz4iOJjoO1gAZ1hHRtzPRRWDQvJistKDTqPQd0G/u0
	zfai0nwOJEm9SG6pmNzw8YdKchvvgrbHOFNpdioAa+DjXEIGfPEO2vWCJGEyeDAaVTLu
	IH5R1a18U/KR81NdqneU7LvCBndpO+tHBmBIY1QcbEgIeTdGGZBRyhO1pPEw4FJoNJn8
	SK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rR2hX7qNX+CJIToS2jTFtx0U2H2Og0dJWMYgHjLbGcc=;
	b=FsQdziBhlEzxNJp+vbXyjk2y1ooG51mzqUHkvULIo4QSy6k9ig19XbSpI+q53bfu7w
	RwVm5tMMz2w6F95pQkHBGsBvJyEntp1y/hRJmcQvCMwBQt5UyxueU456rI7zHroWXmWl
	XtSaX5Da4gUwU1qaYXbeTb1yG4xKhkZomQPr5v4nQ4wLWEo4y0qGUeYW46BoTHo7HZoX
	zoPmxmQBTbAx51vucBzbZcywBhT3yUrBxBdGO+R/peTD2gyByQTrnZx5F4RcM51HmmEH
	LVCE+JXMI9E/Q/hx1VkVozFbu5eYC4qGA2sJW861K+0A07CYAL1uhnHiCuN8C8vI2HfR
	k5vQ==
X-Gm-Message-State: AA6/9RkrqFnNsAJkqrynU6XZXtZkIUBnGQhfrmZ4kCtLg5axkrkI2HfWhBjae2kae9yTug==
X-Received: by 10.194.146.195 with SMTP id te3mr1819895wjb.51.1476281318131;
	Wed, 12 Oct 2016 07:08:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a1sm13164036wju.41.2016.10.12.07.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Oct 2016 07:08:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2016 16:08:35 +0200
Message-Id: <20161012140835.17744-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <57fcbd59.1701630a.ab09f.f183SMTPIN_ADDED_BROKEN@mx.google.com>
References: <57fcbd59.1701630a.ab09f.f183SMTPIN_ADDED_BROKEN@mx.google.com>
Subject: [meta-oe][PATCHv2] tesseract: upgrade to 3.04
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
X-List-Received-Date: Wed, 12 Oct 2016 14:08:39 -0000

From: Juhee Cho <juhee.cho@lge.com>

* use do_split_packages instead of many separate recipes
* fetch from github

Signed-off-by: Juhee Cho <juhee.cho@lge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 contrib/tesseract-langs.sh                         | 92 ----------------------
 .../tesseract/tesseract-lang-afr_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ara_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-aze_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-bel_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ben_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-bul_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-cat_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ces_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-chi-sim_3.02.bb       |  9 ---
 .../tesseract/tesseract-lang-chi-tra_3.02.bb       |  9 ---
 .../tesseract/tesseract-lang-chr_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-dan_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-deu_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ell_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-eng_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-enm_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-epo-alt_3.02.bb       |  9 ---
 .../tesseract/tesseract-lang-epo_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-equ_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-est_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-eus_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-fin_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-fra_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-frk_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-frm_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-glg_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-grc_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-heb_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-hin_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-hrv_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-hun_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ind_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-isl_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ita-old_3.02.bb       |  9 ---
 .../tesseract/tesseract-lang-ita_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-jpn_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-kan_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-kor_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-lav_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-lit_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-mal_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-mkd_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-mlt_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-msa_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-nld_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-nor_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-pol_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-por_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ron_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-rus_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-slk_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-slv_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-spa-old_3.02.bb       |  9 ---
 .../tesseract/tesseract-lang-spa_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-sqi_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-srp_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-swa_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-swe_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-tam_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-tel_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-tgl_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-tha_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-tur_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-ukr_3.02.bb           |  9 ---
 .../tesseract/tesseract-lang-vie_3.02.bb           |  9 ---
 .../recipes-graphics/tesseract/tesseract-lang.inc  | 15 ----
 .../tesseract/tesseract-lang_git.bb                | 26 ++++++
 .../tesseract/tesseract_3.02.02.bb                 | 23 ------
 .../recipes-graphics/tesseract/tesseract_git.bb    | 20 +++++
 70 files changed, 46 insertions(+), 715 deletions(-)
 delete mode 100755 contrib/tesseract-langs.sh
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-afr_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ara_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-aze_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-bel_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ben_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-bul_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-cat_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ces_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-sim_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-tra_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-chr_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-dan_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-deu_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ell_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-eng_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-enm_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-epo-alt_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-epo_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-equ_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-est_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-eus_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-fin_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-fra_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-frk_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-frm_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-glg_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-grc_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-heb_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-hin_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-hrv_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-hun_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ind_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-isl_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ita-old_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ita_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-jpn_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-kan_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-kor_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-lav_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-lit_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-mal_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-mkd_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-mlt_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-msa_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-nld_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-nor_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-pol_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-por_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ron_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-rus_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-slk_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-slv_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-spa-old_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-spa_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-sqi_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-srp_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-swa_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-swe_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-tam_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-tel_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-tgl_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-tha_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-tur_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-ukr_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang-vie_3.02.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract_git.bb

diff --git a/contrib/tesseract-langs.sh b/contrib/tesseract-langs.sh
deleted file mode 100755
index 50873c1..0000000
--- a/contrib/tesseract-langs.sh
+++ /dev/null
@@ -1,92 +0,0 @@
-#! /bin/sh
-
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-PV='3.02'
-
-# Sometimes the software package has a minor version, but language
-# packages have not.  Example: 
-#   software package: tesseract-ocr-3.02.02.tar.gz
-#   language package: tesseract-ocr-3.02.por.tar.gz
-MINOR_PV=02
-
-recipes_dir=$1
-
-usage() {
-    echo "Usage: `basename $0` <recipes dir> [ <download dir> ]"
-}
-
-if [ -z "$recipes_dir" ]; then
-    usage
-    exit 1
-fi
-mkdir -p "$recipes_dir"
-
-file_list_uri='https://code.google.com/p/tesseract-ocr/downloads/list'
-file_list=`mktemp`
-
-remove_dl_dir=
-if [ -z "$2" ]; then
-    remove_dl_dir=1
-    dl_dir=`mktemp -d`
-else
-    dl_dir="$2"
-fi
-
-mkdir -p $dl_dir
-
-tesseract_langs() {
-    wget -q -O "$file_list" "$file_list_uri"
-
-    grep -E 'a href="detail\?name=tesseract-ocr-'${PV}'\.[^\.]+.tar.gz&amp;can=2&amp;q=">' "$file_list" | \
-        sed -r -e 's/.*tesseract-ocr-'${PV}'\.*([^\.]+)\.tar\.gz.*/\1/' | \
-        grep -Ev '('${MINOR_PV}'|'${MINOR_PV}'-doc-html)' | \
-        sort -u
-}
-
-download_lang_files() {
-    local langs="$1"
-    local uri
-    for lang in $langs; do
-        if [ ! -e "$dl_dir/tesseract-ocr-${PV}.${lang}.tar.gz" ]; then
-            uri="https://tesseract-ocr.googlecode.com/files/tesseract-ocr-${PV}.${lang}.tar.gz"
-            echo "Downloading $uri"
-            wget -q -P "$dl_dir" "$uri"
-        fi
-    done
-}
-
-create_recipe() {
-    local lang=$1
-    local tarball
-
-    tarball="$dl_dir/tesseract-ocr-${PV}.${lang}.tar.gz"
-
-    md5sum=`md5sum $tarball | awk '{print $1}'`
-    sha256sum=`sha256sum $tarball | awk '{print $1}'`
-
-    cat > $recipes_dir/tesseract-lang-`echo ${lang} | sed s/_/-/g`_${PV}.bb <<EOF
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "$lang"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "${md5sum}"
-SRC_URI[sha256sum] = "${sha256sum}"
-EOF
-}
-
-
-LANGS=`tesseract_langs`
-
-download_lang_files "$LANGS"
-
-for lang in $LANGS; do
-    create_recipe $lang
-done
-
-[ -n "$remove_dl_dir" ] && rm -rf $dl_dir
-rm -f $file_list
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-afr_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-afr_3.02.bb
deleted file mode 100644
index 0c73a53..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-afr_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "afr"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "16a756bf353896e34386f4509582e487"
-SRC_URI[sha256sum] = "371399ce6700f28d04ccfc12e421f315e356e3aa26575b27d06083c06987784d"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ara_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ara_3.02.bb
deleted file mode 100644
index fb68bdc..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ara_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ara"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "d7b3708f1f1f2898c258209923063f57"
-SRC_URI[sha256sum] = "2c7be319c30e93950c121897969c1bc1eb1d6bdceb75f1184ee34a6f01d66b6a"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-aze_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-aze_3.02.bb
deleted file mode 100644
index 21ed3d3..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-aze_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "aze"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "143044ff7b643b844c2f0b2a170ceda2"
-SRC_URI[sha256sum] = "0f17a06a163d97ec23db3ab14b91b84a67aeba1e441ca5e53a8632b2110a0e79"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-bel_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-bel_3.02.bb
deleted file mode 100644
index 5f88301..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-bel_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "bel"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "3bb6dab515166d641ac62e973c868ac5"
-SRC_URI[sha256sum] = "e59e008c542f786f6f7bd14c6608b2c128c9297d6bede647ae357f7421f7a3e7"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ben_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ben_3.02.bb
deleted file mode 100644
index 673fd42..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ben_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ben"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "0b662630eb4b2e0ebf40c38184068fba"
-SRC_URI[sha256sum] = "14a87e0762dcee0cd95acfd3b370b81fd14a003d39328ed97db0b28c55d31e50"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-bul_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-bul_3.02.bb
deleted file mode 100644
index 4988fc2..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-bul_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "bul"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "91fc34ef041aafe32549a7a6232afad0"
-SRC_URI[sha256sum] = "1b8b4d7b12d896cf9f7e60e8e3274d3891886544253d41681dd9b32d6567e3f3"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-cat_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-cat_3.02.bb
deleted file mode 100644
index ec3fa74..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-cat_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "cat"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "27b77ecc66f8c8d904cd6b87886aca22"
-SRC_URI[sha256sum] = "894af4c718e821cdc4ae3ec65838b174ac8a003e5417a08557698e1576ac3a34"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ces_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ces_3.02.bb
deleted file mode 100644
index d58d0e8..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ces_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ces"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "ae144b9d230267b5ae62804ad7a09dac"
-SRC_URI[sha256sum] = "843522eddcd0e2059a1c7069183b68c2459d527157bc47833a79b6ff56bb09de"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-sim_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-sim_3.02.bb
deleted file mode 100644
index 8469801..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-sim_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "chi_sim"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "718779539d3202ae95ae5ff52a3ad5e8"
-SRC_URI[sha256sum] = "f5b196b5bea6917bcbbf15131b4c2afe94d34c2d9e21d08c0ca42dfbe5aa1095"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-tra_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-tra_3.02.bb
deleted file mode 100644
index 1c4d98d..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-chi-tra_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "chi_tra"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "391ed3fcf014bae777b33dc7a771a00d"
-SRC_URI[sha256sum] = "78742e273a9ca74a6ab5543414e04bcac90d03a317dd35edc634956beafa3d20"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-chr_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-chr_3.02.bb
deleted file mode 100644
index 7aa6cc5..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-chr_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "chr"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "dd5b4fa247500d7713ab5556af62d9fa"
-SRC_URI[sha256sum] = "27c917ba39898d63752b2a4ecb0cd8f688772bcbbae2bf430a93d894d328a4c1"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-dan_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-dan_3.02.bb
deleted file mode 100644
index 5af3f79..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-dan_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "dan"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "2f6a93920b3ce55de24ca762a66a5de1"
-SRC_URI[sha256sum] = "deb93f6326aa8a4d353159201681947a808577662084d4060daea7d644e63eb9"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-deu_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-deu_3.02.bb
deleted file mode 100644
index 4d68fd9..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-deu_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "deu"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "57bdb26ec7c767e126ff97776d8bfb10"
-SRC_URI[sha256sum] = "d03cdd0b00d368ff49ebaf77b8758bcf2ff1b0d39331368987e622ac261443ca"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ell_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ell_3.02.bb
deleted file mode 100644
index be4b90e..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ell_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ell"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "3760cc3dee6489dcc865b31e7a36bd47"
-SRC_URI[sha256sum] = "29745ced8fbfb4ec9abebeb99e4b385821cb5eb0ed81fb1870b93543553b8fba"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-eng_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-eng_3.02.bb
deleted file mode 100644
index ce15a2d..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-eng_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "eng"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "3562250fe6f4e76229a329166b8ae853"
-SRC_URI[sha256sum] = "c110029560e7f6d41cb852ca23b66899daa4456d9afeeae9d062204bd271bdf8"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-enm_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-enm_3.02.bb
deleted file mode 100644
index 5f1531f..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-enm_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "enm"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "d9dc4ad9cbcde78e5be59eb226865661"
-SRC_URI[sha256sum] = "19c9bd89c823451655e3f265b7fcd06727cd36ddec01b8fad9900159b688a1e3"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-epo-alt_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-epo-alt_3.02.bb
deleted file mode 100644
index 0469ea6..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-epo-alt_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "epo_alt"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "67815529386679223092ddf301bf57d4"
-SRC_URI[sha256sum] = "e516b8362fa060be720d2768a8abbee9cc965b9162249c5914ef1d8159e03dc2"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-epo_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-epo_3.02.bb
deleted file mode 100644
index 7f42502..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-epo_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "epo"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "5dc0cf01d21ee43ed834ee947e1e810a"
-SRC_URI[sha256sum] = "22ae681c34ee7aa825994115f927c2e1f8ec1a98c97c01218b98d2549af22252"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-equ_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-equ_3.02.bb
deleted file mode 100644
index f4d81bb..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-equ_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "equ"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "94667836c651fc4fd43645efdc34e19a"
-SRC_URI[sha256sum] = "2010e724686171ef2eb3388df00d8d89ba7e50cb2298b0368b847fffb95d804e"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-est_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-est_3.02.bb
deleted file mode 100644
index adfe25c..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-est_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "est"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "a067f5975cbe83fea205897187fa256b"
-SRC_URI[sha256sum] = "d5d6b9d4b567a10e2f63cafd2f60bf5b0c994e415470becafd729b20349e2e80"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-eus_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-eus_3.02.bb
deleted file mode 100644
index a22bcac..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-eus_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "eus"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "4c2cee5bf3558f6384e5907aa02ae80c"
-SRC_URI[sha256sum] = "78359d57896623cf8211e17604a9dfa574e2253c9157035f439c5fbe06cd5019"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-fin_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-fin_3.02.bb
deleted file mode 100644
index e8a55e2..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-fin_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "fin"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "71f8b343ed2010f775ff474faec5874f"
-SRC_URI[sha256sum] = "e02ff1798960d3af15c0dafafac0de954442cfb13f4eff45c3263c2ff6e59026"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-fra_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-fra_3.02.bb
deleted file mode 100644
index 22c9261..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-fra_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "fra"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "2bca200b783fdba2f546063c68740c50"
-SRC_URI[sha256sum] = "74592f5f2ab73a6668934922753be0505fc4333ee790543949f8b70f03eab101"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-frk_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-frk_3.02.bb
deleted file mode 100644
index f75b96a..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-frk_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "frk"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "dd734ac212a98a02945760891b657e70"
-SRC_URI[sha256sum] = "a9f4219d6b2ef4ed8b76c86be99ae3c9190509df72ba6f0217a77f7205ec52f8"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-frm_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-frm_3.02.bb
deleted file mode 100644
index d0d1398..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-frm_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "frm"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "e0ca24ca45de83e67057f0e208233ffc"
-SRC_URI[sha256sum] = "f32f774d88e7936f16ff41b832cecfbd71f82c9bf7584330d750da941c07ca79"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-glg_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-glg_3.02.bb
deleted file mode 100644
index b94fd03..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-glg_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "glg"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "ef7b8e13891e08f29b02011a5dd6b630"
-SRC_URI[sha256sum] = "82ffa27c4de17545fa9d46e0fcd5690b1b59bcce9e93f71c0a41d19afbe869ee"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-grc_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-grc_3.02.bb
deleted file mode 100644
index 16c9605..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-grc_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "grc"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "ac493e5a49e456f2dd354f5b6449573e"
-SRC_URI[sha256sum] = "586b955eb9fba5a304cfa37bfdd7c89f2db33335d5ae83f2962aed8903266805"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-heb_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-heb_3.02.bb
deleted file mode 100644
index 9d7a4fa..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-heb_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "heb"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "7ae7f3384083c66f06d63b6c0f0a66c3"
-SRC_URI[sha256sum] = "da47b0cfe241775c9b36339efda6339d59e146fa6143c65a2253eb9f67164811"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-hin_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-hin_3.02.bb
deleted file mode 100644
index d3ed173..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-hin_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "hin"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "186f17b326a58313344c2ea987ea7785"
-SRC_URI[sha256sum] = "91f91da5adc73ee71150865d6598df8a50424350480df2753ca9035320b3c78d"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-hrv_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-hrv_3.02.bb
deleted file mode 100644
index 7423687..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-hrv_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "hrv"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "0396a267d894f485b6b534476f3322dc"
-SRC_URI[sha256sum] = "e20575f5b0ec73ff7f3197c112a8dcc24303b64016910399d9127bda42e7d866"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-hun_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-hun_3.02.bb
deleted file mode 100644
index 61a9ce6..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-hun_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "hun"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "eb1b3537cd664fec48bebac75fac5992"
-SRC_URI[sha256sum] = "edf5cc42b516b2a18681955167d1964dfc7ff8cda642408ebda91b3c4656f9f1"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ind_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ind_3.02.bb
deleted file mode 100644
index 6776952..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ind_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ind"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "9f672ea7c90eecbbe35ec353ff45c764"
-SRC_URI[sha256sum] = "337ba4400a798c60dee16070071337c96fc67bcb4e2cc1b4676dcbc340fbbcd7"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-isl_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-isl_3.02.bb
deleted file mode 100644
index 7fa188f..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-isl_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "isl"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "3f05946a9e57a8ffabb3fccc8a80cfaa"
-SRC_URI[sha256sum] = "6b226366d8d2d87f859d4099e8b715e3ec3890f9317198e7b8c80fba001055f8"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ita-old_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ita-old_3.02.bb
deleted file mode 100644
index be4ad3e..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ita-old_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ita_old"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "989ca558eb05fcf6873dfdd8c692291d"
-SRC_URI[sha256sum] = "caf591be6d4eda9e7627397c3c520d58115c660002ecace680749504348ba104"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ita_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ita_3.02.bb
deleted file mode 100644
index 581977a..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ita_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ita"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "fbdba86f34b907f5a709051c01b53f71"
-SRC_URI[sha256sum] = "26453b302c108e08f594c7a19597382314529f648e141805417f9af1e4c99ac2"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-jpn_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-jpn_3.02.bb
deleted file mode 100644
index 269bdef..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-jpn_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "jpn"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "e1be2b08e667c3bb0ab0f18c9456bf2f"
-SRC_URI[sha256sum] = "09bf447a29e990c065024b3b720fd70f08d596a7be534312fc9e47d0aabf681f"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-kan_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-kan_3.02.bb
deleted file mode 100644
index 2d21085..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-kan_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "kan"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "510016e85d7ea8e1f4ebf98741138909"
-SRC_URI[sha256sum] = "15851cc22058c08cad9ec6058113f76966409061f21f5cde8c9cc1d214298c22"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-kor_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-kor_3.02.bb
deleted file mode 100644
index 617d199..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-kor_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "kor"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "fc9125f6652fb661575d6e15c94f88f6"
-SRC_URI[sha256sum] = "7c85c4107a781d90d6d4adb001f2189b113f9db6942618b4bc47f4cc80cd126a"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-lav_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-lav_3.02.bb
deleted file mode 100644
index c207504..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-lav_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "lav"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "2095b56c9c6b0dba9b837fd226ed6d29"
-SRC_URI[sha256sum] = "e6a190ee1edf0a58948a9d7b01569fd8a4c05bc678da3a40ad884c0849958c36"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-lit_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-lit_3.02.bb
deleted file mode 100644
index 83ad480..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-lit_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "lit"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "801021a1ad6e4aa3ef697f065ff6c798"
-SRC_URI[sha256sum] = "350891a182076df2e8067da04b3b2127a77e48782d9905e8339db4f1d6c7a729"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-mal_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-mal_3.02.bb
deleted file mode 100644
index 571385e..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-mal_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "mal"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "1f5e8f022d3c2697075bdfc03935f128"
-SRC_URI[sha256sum] = "72b3b23979ae4a6b63518964bf239beae8bb6c02f35a2695f47262178b3fef34"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-mkd_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-mkd_3.02.bb
deleted file mode 100644
index ad1eaff..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-mkd_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "mkd"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "b8930c64befcaadbb47951cad4a2f075"
-SRC_URI[sha256sum] = "ea489277e7a588a1b7566a21cbbd647786f16659cae087a4705d4fdabd823ee6"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-mlt_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-mlt_3.02.bb
deleted file mode 100644
index 4a6d42d..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-mlt_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "mlt"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "90a41ac86375b230980b643b35b88011"
-SRC_URI[sha256sum] = "ba99e8bfc753a274bbea38ef44f5abf81e5f12d09f9d12d267436961270ef2de"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-msa_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-msa_3.02.bb
deleted file mode 100644
index 8418ab6..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-msa_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "msa"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "cb42ec9504eecdc4f974dbca4387ac34"
-SRC_URI[sha256sum] = "f34e4950ad9079f92965a234253cc16f92deb66f1ce4e9c9a885ad2695c2d136"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-nld_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-nld_3.02.bb
deleted file mode 100644
index 412d4a7..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-nld_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "nld"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "6db5753b3b03296544bbb2c0f59a7178"
-SRC_URI[sha256sum] = "5e2e53499a05282968e5a9699aad66ae52a5abf06ae828e2f4cf2c1f6e674a98"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-nor_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-nor_3.02.bb
deleted file mode 100644
index 75d2940..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-nor_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "nor"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "6d979585abb07c13dda003820129461c"
-SRC_URI[sha256sum] = "6b5c42444595a81b5f6fea859d97999895917bcc2f85a505488ea5c2f4efa01a"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-pol_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-pol_3.02.bb
deleted file mode 100644
index 5858013..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-pol_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "pol"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "90b3f1f4113a9dccd0287e6b5b7512d6"
-SRC_URI[sha256sum] = "62999058bfb609d95d53bd519c6de99620d025b3bfbc54d8679a87b10474ccbb"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-por_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-por_3.02.bb
deleted file mode 100644
index 75f0139..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-por_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "por"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "ad490a8091ee329190266f3fd057c511"
-SRC_URI[sha256sum] = "f9b126323757c62da23aab163e2ce5257d137e86be7c37dea13bb0585e1ace3f"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ron_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ron_3.02.bb
deleted file mode 100644
index 3c8940a..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ron_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ron"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "9f498e01855a57473af8f083c125455a"
-SRC_URI[sha256sum] = "d7e6454c9cc80c84a654f94283fc06b2df33c5c7fd2d3bff269c3cbdeb0b39e7"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-rus_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-rus_3.02.bb
deleted file mode 100644
index e1dd3f1..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-rus_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "rus"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "e8c785df8aaa49e61f3a95aa24066122"
-SRC_URI[sha256sum] = "091cda49489d15f33916263fc78fbf8dcd4e6547012dc7e1a8496a38ab192315"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-slk_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-slk_3.02.bb
deleted file mode 100644
index 241b038..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-slk_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "slk"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "991e4771e16abd6a66caeaeeb2a4d4d2"
-SRC_URI[sha256sum] = "cbd5a88e2188ef39ef438c9859dbd7a9b9e2a99c23a823ec310f7f84a012cc82"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-slv_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-slv_3.02.bb
deleted file mode 100644
index 0b08210..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-slv_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "slv"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "c7bea975ba663d13e03c29d6cf33b5a8"
-SRC_URI[sha256sum] = "b901507d2901c882f98f6ef5db07dbf74636fba6a1f616c5f094954106791667"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-spa-old_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-spa-old_3.02.bb
deleted file mode 100644
index 79be8a3..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-spa-old_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "spa_old"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "7838da948e404bb760bef83a5c3d64dd"
-SRC_URI[sha256sum] = "2b980c0eda1572423dd56260b32d748288028fdd45266311c4ab448fcbce5814"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-spa_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-spa_3.02.bb
deleted file mode 100644
index 8790ee5..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-spa_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "spa"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "fe1385ed203ecd9e0999a44b135069ec"
-SRC_URI[sha256sum] = "f40cc264d037b0c71ecb4a8bb6def8b3ec04b647d8da7fd44d0daa558bfa31b1"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-sqi_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-sqi_3.02.bb
deleted file mode 100644
index 8e923a9..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-sqi_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "sqi"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "372e38617fcc7e25c77996c5499ae063"
-SRC_URI[sha256sum] = "99bfcda3e0c471f63b36cd0db7dea596e59a2219c9275c3ba51e59973555c101"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-srp_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-srp_3.02.bb
deleted file mode 100644
index 18676c4..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-srp_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "srp"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "d8350668fa790b5d4007348a55840bdf"
-SRC_URI[sha256sum] = "b1eeeb2958d0a4e2ba16fb55a98ca4ca8e69fee8b0be8162ff599ba19d0b2404"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-swa_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-swa_3.02.bb
deleted file mode 100644
index 2b9960f..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-swa_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "swa"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "6c68107a71f82fa42c858e4d6dc70aca"
-SRC_URI[sha256sum] = "2681e59f2a9333259a2de42f3deed46aa7dd84b638e6927f40db0409adff143b"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-swe_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-swe_3.02.bb
deleted file mode 100644
index 7fd1c1d..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-swe_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "swe"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "46d3a5d7159236edb33272dd8b1090f6"
-SRC_URI[sha256sum] = "ada287d7b64183df906215fe4ca86c3b6fe30dc5121e9a83113c3265ca7fc5ae"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tam_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-tam_3.02.bb
deleted file mode 100644
index fcfc1fb..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tam_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "tam"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "c68b0fdcdf34dd431c25f323673ef1d6"
-SRC_URI[sha256sum] = "75f73362421a23eb955212f7aa19c9a3efdc80a4c6761445869148bfd2a6dc62"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tel_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-tel_3.02.bb
deleted file mode 100644
index fb827ed..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tel_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "tel"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "349d203ef88864eab8d1201672ca84be"
-SRC_URI[sha256sum] = "f36af3d5ca9f8ff6e606485fe5db835f96b42e7d2380ac5d61af6b41827834fd"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tgl_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-tgl_3.02.bb
deleted file mode 100644
index 8c84ed9..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tgl_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "tgl"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "d458f0719b99e4dcfd4fa2a06e5150a3"
-SRC_URI[sha256sum] = "5c515310df83c9b40e557027e49de6df70e33a9bbabeaf1301ca9e8c13558948"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tha_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-tha_3.02.bb
deleted file mode 100644
index 06055d1..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tha_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "tha"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "3dc5a5028e75da12eaba62669a80acc4"
-SRC_URI[sha256sum] = "7a98e25e0c61dda48cbdb241f0f53c3dfaa7ef574b81799ab2ddac50da6db4fb"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tur_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-tur_3.02.bb
deleted file mode 100644
index f5ec76f..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-tur_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "tur"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "a8934e0e6496997112cbef2961adef5e"
-SRC_URI[sha256sum] = "fe4657ca3455585a06eb3d02b4a0472fda8ca06efe587be75e175662dc6329d7"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ukr_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-ukr_3.02.bb
deleted file mode 100644
index 25de06a..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-ukr_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "ukr"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "0aa61f18463bb89234a6d06fcbf0c644"
-SRC_URI[sha256sum] = "7862b10c1ff7e02b41c7a50eec7fccd2c30b8162d965fa1ae00510c6d1210762"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang-vie_3.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang-vie_3.02.bb
deleted file mode 100644
index 6bd813e..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang-vie_3.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
-
-TESSERACT_LANG = "vie"
-
-require tesseract-lang.inc
-
-SRC_URI[md5sum] = "78a74432848b4c53cc2ccf2eb339c0b6"
-SRC_URI[sha256sum] = "a113254882eac70168aec00544805e7c9cec20527217b98349ed48f6e2d2611e"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc b/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
deleted file mode 100644
index c40c71d..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
-
-SRC_URI = "https://tesseract-ocr.googlecode.com/files/tesseract-ocr-${PV}.${TESSERACT_LANG}.tar.gz"
-
-S = "${WORKDIR}/tesseract-ocr"
-
-inherit allarch
-
-do_install() {
-    install -d ${D}${datadir}/tessdata
-    cp ${S}/tessdata/${TESSERACT_LANG}.traineddata ${D}${datadir}/tessdata
-}
-
-FILES_${PN} += "${datadir}/tessdata"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
new file mode 100644
index 0000000..28ea33e
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "tesseract-ocr language files"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9648bd7af63bd3cc4f5ac046d12c49e4"
+
+PV = "3.04.00+git${SRCPV}"
+SRCREV = "3cf1e2df1fe1d1da29295c9ef0983796c7958b7d"
+SRC_URI = "git://github.com/tesseract-ocr/tessdata.git"
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+do_install() {
+    install -d ${D}${datadir}/tessdata
+    cp -R --no-dereference --preserve=mode,links -v ${S}/*.traineddata ${S}/*.cube.* ${S}/*.tesseract_cube.* ${D}${datadir}/tessdata
+}
+
+python populate_packages_prepend () {
+    tessdata_dir= d.expand('${datadir}/tessdata')
+    pkgs = do_split_packages(d, tessdata_dir, '^([a-z_]*)\.*', '${BPN}-%s', 'tesseract-ocr language files for %s', extra_depends='')
+    pn = d.getVar('PN', True)
+    d.appendVar('RDEPENDS_' + pn, ' '+' '.join(pkgs))
+}
+
+PACKAGES_DYNAMIC += "^${BPN}-.*"
+ALLOW_EMPTY_${PN} = "1"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
deleted file mode 100644
index 652bcf2..0000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "A commercial quality OCR engine "
-
-DEPENDS = "leptonica"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c0c94b3c86ad0c386bb6dec70ca8a36a"
-
-SRC_URI = "https://tesseract-ocr.googlecode.com/files/tesseract-ocr-${PV}.tar.gz"
-SRC_URI[md5sum] = "26adc8154f0e815053816825dde246e6"
-SRC_URI[sha256sum] = "26cd39cb3f2a6f6f1bf4050d1cc0aae35edee49eb49a92df3cb7f9487caa013d"
-
-EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
-
-S = "${WORKDIR}/tesseract-ocr"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${datadir}/tessdata"
-
-RRECOMMENDS_${PN} += "tesseract-lang-eng"
-
-# http://errors.yoctoproject.org/Errors/Details/35134/
-PNBLACKLIST[tesseract] ?= "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
new file mode 100644
index 0000000..c2675cd
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A commercial quality OCR engine "
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0c94b3c86ad0c386bb6dec70ca8a36a"
+
+PV = "3.04.00+git${SRCPV}"
+SRCREV = "228317caa1ced217e6d264aafc901f361ecd7e90"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git"
+S = "${WORKDIR}/git"
+
+DEPENDS = "leptonica"
+
+EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
+
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${datadir}/tessdata"
+
+RRECOMMENDS_${PN} += "tesseract-lang-eng"
-- 
2.10.1


