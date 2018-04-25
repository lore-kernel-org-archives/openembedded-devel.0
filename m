Return-Path: <andre.draszik@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B057374540
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:59:55 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 82so3685231pge.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+mnaBq5eWZGpvAkR2dlYgtlR18ByamQD8YjKMJMm2k8=;
	b=A078+ttf7BA9XyZ+Wj1Lybl7+hDCntNsKeuHG2SHEXL5tKXbkpKNHqkqoIRIbs5ZkC
	Uj+AQ2q2K+CifyoIN6WOOHNxDle+sVrbNxveW+TQR3B9CkFCjYmW0k9AjxPi6gns7BaV
	voK34wjBCG9eXPLdFpRJRhjrF+n2h8og+MWL37NuDmyTuaOiESAqGW4FnG58O8Oa6XEW
	24k+9L71FTwIeY8iGN9wPEkX+r5uDRiGUjTZ1fj7NISp+gNtdVnD47OcLuKyFxTQvc8+
	VDbD+c8aaNASiYYFKXJQtzw7r5XzCYybf0+K/wMwOBbM1+qn4oA4JO2JryPI7DWNAx7y
	Efbg==
X-Gm-Message-State: ALQs6tAaTQlMujCjcrZWtTflSp7qeUvgLpxoX9WRSb4kn5gomgIE49FK
	afn9O6tjahNSI0DKU5BWz80aiVss
X-Google-Smtp-Source: AB8JxZrZH6TQTR3VCBiO0rcy8HilF+sgKKd2Vs64EovxQM3/57gkoD8QCGzdYb9zMEE1sUZKw316Ug==
X-Received: by 10.98.182.16 with SMTP id j16mr5293419pff.17.1524668396362;
	Wed, 25 Apr 2018 07:59:56 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x8sm6068253pfa.173.2018.04.25.07.59.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 07:59:55 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 15:59:49 +0100
Message-Id: <20180425145949.8524-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-java][PATCH] libecj-bootstrap-native: simplify build
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
X-List-Received-Date: Wed, 25 Apr 2018 14:59:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Piping 'find' output into multiple files to re-read
them seems inelegant and is error prone - just use a
pipe with appropriate options instead.

This avoids potential problems with funny file names,
and now also makes use of BB_NUMBER_THREADS to speed
up compilation.

This is a better example to copy from now...

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/ecj/libecj-bootstrap.inc | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index 9350550..04425f4 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -17,13 +17,8 @@ JAR = "ecj-bootstrap-${PV}.jar"
 
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
-  if [ ! -d source ]; then
-    mkdir source
-  fi
-
-  if [ ! -d build ]; then
-    mkdir build
-  fi
+  mkdir -p source
+  mkdir -p build
 
   # Remove crap.
   rm -f about.html build.xml
@@ -44,24 +39,18 @@ do_unpackpost() {
   cp -R source/org build/
 
   # Remove source code and other stuff.
-  find build -name '*.java' -exec rm -f {} \;
-  find build -name '*.html' -exec rm -f {} \;
+  find build -depth \( -name '*.java' -o -name '*.html' \) -delete
 }
 
 addtask unpackpost after do_unpack before do_patch
 
 do_compile() {
-  find source -name '*.java' | LC_ALL=C sort > sourcefiles
-  split -l 25 sourcefiles ecj-sources.
-
   # Compiling in place is done because the sources contain
   # property files which need to be available at runtime.
-  for list in `find . -name 'ecj-sources.*'`; do
-      echo "building files in $list ...";
-      echo jikes-initial -d build -source 1.4 -sourcepath source `cat $list`;
-      jikes-initial \
-				-d build -source 1.4 -sourcepath source `cat $list`;
-  done
+  find source -name '*.java' -print0 \
+    | LC_ALL=C sort -z \
+    | xargs -0 -n25 -P ${BB_NUMBER_THREADS} \
+        jikes-initial -d build -source 1.4 -sourcepath source
 
   fastjar -c -C build . -f ${JAR}
 }
-- 
2.16.2


