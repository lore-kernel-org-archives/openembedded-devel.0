Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3297C60017
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:10:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so40333539wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Apr 2017 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v3NOOMSw0w4WYth5CuCfxLGYoiq//yAu9JI6ifBBNgM=;
	b=FMEytxK/QFUkbtn5PLAGZiVyDxhZeTFhw0WmKFZucDlpDLZcA7/rNcRhJwTYJBQWYc
	mcNlQu1Es0h+guRDgMTsvVe3T6SBXWhe6Uz6P/kXKGWwWD7GWcrLS2p+bK6P0rEKrLEY
	lV8fv0NdGdoF5Old4RVuR0OieJv8R0lN4dTmBMuTO12gMXiMP/FyM0ZqPjDeRbv3tVmh
	jpVASCtB0PLGs1ebwJh3rGrvZsWKn2Aiko5dQxuGsFJaEAvKuOOXdFbNky+BAjl29U/C
	YGvGRWWkt9dJUyIa2WISDFqopH7IkDcdCRO5aVtXwTnXPvBUsukvtJNrwMcC2JJjJmuC
	wvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v3NOOMSw0w4WYth5CuCfxLGYoiq//yAu9JI6ifBBNgM=;
	b=EZ0RUnVeTcmNjjiD7oh3sJm85zxqo21xNgSIy6Sa/PF66rV06a/ShHcQRZhxsf70Wg
	dPDabTWSC82eKWhh6tauurS0hYDoFhjscuG53UDsu3y3KvTwge0PrIEXEyBy3lz4RrDy
	1UT5haggyOk8fbmjd0Gefz6rsgJ/us2bnXyq8W1KITYosIjyHCHZo/xUbZLpVBDKFJgx
	S/9XmNDPwF9SIE64F/Y6w/c+RKezbXUr+c2gD+5z40oQsy9yKBX1iNu+PAxN+2bpgTqy
	aV7zDoVow1y4hboNIujxBIF0xDe8eQ5F7y4sL9FNyxthX3tSpagwun8sfRbai5oTxdMo
	mD1Q==
X-Gm-Message-State: AFeK/H12p6RmG8hN++YSPrdlbUdoxTKjteNWBi8G6Sxrfy1T6ghWtGFlz3HlU2sdBi9h4g==
X-Received: by 10.28.131.205 with SMTP id f196mr13701368wmd.24.1491297036623; 
	Tue, 04 Apr 2017 02:10:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w10sm17596339wmw.14.2017.04.04.02.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 02:10:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Apr 2017 11:10:31 +0200
Message-Id: <20170404091031.29052-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170404091031.29052-1-Martin.Jansa@gmail.com>
References: <20170404091031.29052-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] dlm: fix ldflags QA warning
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
X-List-Received-Date: Tue, 04 Apr 2017 09:10:36 -0000

* fixes:
  dlm-4.0.2: No GNU_HASH in the elf binary:
  '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/dlm/4.0.2-r0/packages-split/dlm/usr/lib/libdlmcontrol.so.3.1'
  No GNU_HASH in the elf binary:
  '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/dlm/4.0.2-r0/packages-split/dlm/usr/sbin/dlm_tool'
  No GNU_HASH in the elf binary:
  '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/dlm/4.0.2-r0/packages-split/dlm/usr/sbin/dlm_controld'
  [ldflags]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../respect-ldflags-also-from-bin_ldflags.patch    | 24 ++++++++++++++++++++++
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb          |  5 ++++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch

diff --git a/meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch b/meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
new file mode 100644
index 000000000..e08718c65
--- /dev/null
+++ b/meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
@@ -0,0 +1,24 @@
+diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
+--- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 10:49:23.661320260 +0200
++++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 10:50:36.121326429 +0200
+@@ -55,7 +55,7 @@
+ BIN_CFLAGS += -fPIE -DPIE
+ BIN_CFLAGS += -I../include -I../libdlm
+ 
+-BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
++BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
+ BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
+ 
+ LIB_CFLAGS += $(BIN_CFLAGS)
+diff -uNr dlm-4.0.2.orig/dlm_tool/Makefile dlm-4.0.2/dlm_tool/Makefile
+--- dlm-4.0.2.orig/dlm_tool/Makefile	2013-07-31 17:50:26.000000000 +0200
++++ dlm-4.0.2/dlm_tool/Makefile	2017-04-04 10:50:44.617327153 +0200
+@@ -32,7 +32,7 @@
+ BIN_CFLAGS += -fPIE -DPIE
+ BIN_CFLAGS += -I../include -I../libdlm -I../dlm_controld
+ 
+-BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
++BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
+ BIN_LDFLAGS += -L../libdlm -L../dlm_controld
+ BIN_LDFLAGS += -lpthread -ldlm -ldlmcontrol
+ 
diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
index ff3730563..5988973f3 100644
--- a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
+++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz"
+SRC_URI = "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz \
+    file://respect-ldflags-also-from-bin_ldflags.patch \
+"
 
 SRC_URI[md5sum] = "efc2ee6093aa6aa0a88aaad83e998a3f"
 SRC_URI[sha256sum] = "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
@@ -20,6 +22,7 @@ inherit pkgconfig systemd distro_features_check
 SYSTEMD_SERVICE_${PN} = "dlm.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
+export LDFLAGS
 export EXTRA_OEMAKE = ""
 
 do_compile_prepend() {
-- 
2.12.2


