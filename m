Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD806FF80
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 17:23:33 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id s66so102972163pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jul 2017 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0hSaNTeMuhgHTUKjNA7kXA51GVYkYvXyzyw4m4djv7g=;
	b=Ppd+9xeyHW2V9iZpuvfevkZk/0DOVJ1yf794Ne1A/vo3JK83/ZalRLyO5KHERmUfeP
	ZIZPWW2Z5HCLTAYuTOSVlFA3aCxHLMknd2y1WGZAmgae0XBSPKFMqhQXrxwDQ1tD1Q7/
	EpVIG7lx8AGrcERzuSMX6eR4qgyLbilUwzRCkUjilVudPr+8qql+LOWzEzXdQozbOrGy
	6JiYHhhGt/kgxoezsKFCofXzXilDjAoVCXnWh4HUL9Rmo0u9eCerSbLiRXM7zbQQLA26
	zXlZZWrJqqaOJESVsfpMfI5AJUzbnuj4y3xRL0FkhWYilOqwEtPHJddA4irsXT2EBT/i
	7ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0hSaNTeMuhgHTUKjNA7kXA51GVYkYvXyzyw4m4djv7g=;
	b=FwZgm+jkgeoKJ/jj9tqWx4MxMU+/wsJNaGYVti+omc/AIjy/PudUB/geTPMxseel0t
	IZvti1S2AOZvA1E64GscI09KWL4UqdsoxPHRNJ47UOMe2fhQ0P1mV4dQyCGCLwK2DyAA
	re6DofhQq4FeiZmPgS99RmEyBcKOPw1/T9Iz8P1dYG26r/t+Mww0ZN/nBCfUqquxBEGD
	C1C4wsnStjBN1a1RvuZChSp4iaZR9+NDFZb+ziLbCO+hhhYnWuAB0nXBvJSCgym7gx5B
	MJ9m1Z4jkoggWqcbnIY7Tckx9PyobX5b+e9hjDrHJ+0yNl9eYsRjp3qw29WMBiVWe60M
	9dLA==
X-Gm-Message-State: AIVw110Cy3SuZ74nWicSilfxCknBJyoZCW8TLEWmAAedy7GNFISTkL9N
	OT8MebjaLRnw0Wdw
X-Received: by 10.84.128.102 with SMTP id 93mr11517122pla.21.1499102615032;
	Mon, 03 Jul 2017 10:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id 75sm6756532pfk.84.2017.07.03.10.23.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 10:23:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jul 2017 10:23:26 -0700
Message-Id: <20170703172326.9061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-browser][PATCH] firefox: Fix missing references to hardcoded PYTHON
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
X-List-Received-Date: Mon, 03 Jul 2017 17:23:34 -0000

Since OE cross compiles we sometimes will  run into this issue
https://bugzilla.mozilla.org/show_bug.cgi?id=1243321

This fix enhances the existing patch to use PYTHON variable
itself to compute the python binary name and uses usr/bin/env
to find it instead of hardcoding it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../firefox/firefox/fix-python-path.patch          | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox/fix-python-path.patch b/recipes-mozilla/firefox/firefox/fix-python-path.patch
index 544c611..963fbae 100644
--- a/recipes-mozilla/firefox/firefox/fix-python-path.patch
+++ b/recipes-mozilla/firefox/firefox/fix-python-path.patch
@@ -9,18 +9,29 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  js/src/configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/js/src/configure b/js/src/configure
-index cce5430..780d201 100755
---- a/js/src/configure
-+++ b/js/src/configure
-@@ -15933,7 +15933,7 @@ echo creating $CONFIG_STATUS
+Index: firefox-45.9.0esr/js/src/configure
+===================================================================
+--- firefox-45.9.0esr.orig/js/src/configure
++++ firefox-45.9.0esr/js/src/configure
+@@ -17061,7 +17061,7 @@ echo creating $CONFIG_STATUS
  extra_python_path=${COMM_BUILD:+"'mozilla', "}
  
  cat > $CONFIG_STATUS <<EOF
 -#!${PYTHON}
-+#!/usr/bin/python
++#!/usr/bin/env `basename $PYTHON`
+ # coding=$encoding
+ 
+ import os
+Index: firefox-45.9.0esr/configure
+===================================================================
+--- firefox-45.9.0esr.orig/configure
++++ firefox-45.9.0esr/configure
+@@ -30461,7 +30461,7 @@ echo creating $CONFIG_STATUS
+ extra_python_path=${COMM_BUILD:+"'mozilla', "}
+ 
+ cat > $CONFIG_STATUS <<EOF
+-#!${PYTHON}
++#!/usr/bin/env `basename ${PYTHON}`
  # coding=$encoding
  
  import os
--- 
-2.1.4
-- 
2.13.2


