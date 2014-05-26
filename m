Return-Path: <mario.goulart@gmail.com>
Received: from mail-yk0-f182.google.com (unknown [209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id DDBA465FC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 13:07:09 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 9so6122127ykp.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2CMucp011lP6JXyFehlDM2i5wz35rxPAxrWP4O51vi8=;
	b=0lyyIUiRfY/GgILqm77xgZmkJ9cKu5JwX/oed1gZNCJZCwlndzaxg4Q9d3046eEvYK
	9v+s3DGzYSRpqmmlq+/+q8kICUHyUuw0x91bbozLHmjWb+Es7EflEqx27F8dB7Ed4hVM
	kRpw/Y3H82VgFSnSl3jB7ri5m0cyMP3UyeQ+tKsfT4Qj8FfQPdHrZw9odRPRXbPpk5aH
	WdjR0TwegHUAySRF7xuuFot6EJn6j+n17EsWtNUjapOjtOoHan8FbzOPwKyztKFfxEQl
	jErbN3kA/hgi3sfq3fZSBzitsUinD7DWwkVgpd8XVrI8HPKQr8zIOJC8XZlwCBCcvj3h
	+Yag==
X-Received: by 10.236.161.161 with SMTP id w21mr32147293yhk.23.1401109153119; 
	Mon, 26 May 2014 05:59:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	j21sm17833931yhj.29.2014.05.26.05.59.11 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 05:59:12 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 09:59:00 -0300
Message-Id: <1401109140-30267-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] contrib/tesseract-langs.sh: add script to generate recipes for tesseract languages
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
X-List-Received-Date: Mon, 26 May 2014 13:07:10 -0000

This script writes language recipes for tesseract.  It downloads the
listing of available languages and language tarballs from the official
site and writes language recipes tesseract-lang-<lang>_<version>.bb
for each language.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 contrib/tesseract-langs.sh |   92 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100755 contrib/tesseract-langs.sh

diff --git a/contrib/tesseract-langs.sh b/contrib/tesseract-langs.sh
new file mode 100755
index 0000000..50873c1
--- /dev/null
+++ b/contrib/tesseract-langs.sh
@@ -0,0 +1,92 @@
+#! /bin/sh
+
+# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
+
+PV='3.02'
+
+# Sometimes the software package has a minor version, but language
+# packages have not.  Example: 
+#   software package: tesseract-ocr-3.02.02.tar.gz
+#   language package: tesseract-ocr-3.02.por.tar.gz
+MINOR_PV=02
+
+recipes_dir=$1
+
+usage() {
+    echo "Usage: `basename $0` <recipes dir> [ <download dir> ]"
+}
+
+if [ -z "$recipes_dir" ]; then
+    usage
+    exit 1
+fi
+mkdir -p "$recipes_dir"
+
+file_list_uri='https://code.google.com/p/tesseract-ocr/downloads/list'
+file_list=`mktemp`
+
+remove_dl_dir=
+if [ -z "$2" ]; then
+    remove_dl_dir=1
+    dl_dir=`mktemp -d`
+else
+    dl_dir="$2"
+fi
+
+mkdir -p $dl_dir
+
+tesseract_langs() {
+    wget -q -O "$file_list" "$file_list_uri"
+
+    grep -E 'a href="detail\?name=tesseract-ocr-'${PV}'\.[^\.]+.tar.gz&amp;can=2&amp;q=">' "$file_list" | \
+        sed -r -e 's/.*tesseract-ocr-'${PV}'\.*([^\.]+)\.tar\.gz.*/\1/' | \
+        grep -Ev '('${MINOR_PV}'|'${MINOR_PV}'-doc-html)' | \
+        sort -u
+}
+
+download_lang_files() {
+    local langs="$1"
+    local uri
+    for lang in $langs; do
+        if [ ! -e "$dl_dir/tesseract-ocr-${PV}.${lang}.tar.gz" ]; then
+            uri="https://tesseract-ocr.googlecode.com/files/tesseract-ocr-${PV}.${lang}.tar.gz"
+            echo "Downloading $uri"
+            wget -q -P "$dl_dir" "$uri"
+        fi
+    done
+}
+
+create_recipe() {
+    local lang=$1
+    local tarball
+
+    tarball="$dl_dir/tesseract-ocr-${PV}.${lang}.tar.gz"
+
+    md5sum=`md5sum $tarball | awk '{print $1}'`
+    sha256sum=`sha256sum $tarball | awk '{print $1}'`
+
+    cat > $recipes_dir/tesseract-lang-`echo ${lang} | sed s/_/-/g`_${PV}.bb <<EOF
+# Copyright (C) 2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see meta-openembedded layer's COPYING.MIT)
+
+TESSERACT_LANG = "$lang"
+
+require tesseract-lang.inc
+
+SRC_URI[md5sum] = "${md5sum}"
+SRC_URI[sha256sum] = "${sha256sum}"
+EOF
+}
+
+
+LANGS=`tesseract_langs`
+
+download_lang_files "$LANGS"
+
+for lang in $LANGS; do
+    create_recipe $lang
+done
+
+[ -n "$remove_dl_dir" ] && rm -rf $dl_dir
+rm -f $file_list
-- 
1.7.10.4


