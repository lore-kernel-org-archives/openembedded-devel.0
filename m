Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6DA27F7D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:53:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so5421200wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ws2cKHEKY/iCQGORdkx9jpuqy2q2PAG2AXT5Ve/1aDs=;
	b=mZpo0QTL1Q9C1cxY5rmQxciyNmafi/mVUVWfR/MhGCwSf/zrYUsJZLNOaaN2oebR5t
	jdlhpokQAZSQmvJSWGdqyaq8Yotj9WyceDhuU82Ldv9RRsEVSGVXJWxJzaLScmBrb3CS
	S4oJ4vpQg2n1FhgIo7Ukbl/MLJZcpZI94yxYwZuQOFVu2tOBFHnWbrhWp4K6uxl2yA01
	HuXTQLVWmAIBQCLDPIqZ5cYF+PQ7EqJkYG2D93Y7j9m5ZtGWQlWwcSPp78RbI9Dn1hJB
	FNDN4mCmN6rZSTLxtXI/XhlPUa04ciBb1ONWcwfC8iwBVDazXY1/tx4WvF3Qu/Gh5jhL
	pX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ws2cKHEKY/iCQGORdkx9jpuqy2q2PAG2AXT5Ve/1aDs=;
	b=Qq/VPx6rVw4rYCmzzSO5tcm1M6cfeNVFjfn06mQ0UbUCu+xxCoozTDV4YMlFh8VtP2
	8DWlYvEoNAW7+qh7EANPcbFay7Xs3VPULNYhtXqq4aBOtuxxIs1eZiNmqdQG1e+1vh8Y
	O/uYdKHYwAoc3bgzmRUSDjyFR9jN5LbFe8Iz6Ni5y9yNAN1m8B+Opzn9j+zOahdV0YeD
	msqQUWndv/RxaAGp+qKooH8zp8y/yspGUFJn5hFu4cwl53/qjM3s2fsRb8vuDDjSsGrh
	8/kZ+4ksnGcYCqHBex5T+AaJ2aFhlWtiVpiDenOuOzU1XZatd2S34Pyul+A0qQFes7iD
	bONA==
X-Gm-Message-State: APjAAAV4blD8ZOoLMuMxeIfZDto5V+1IHXwoQhBv2dYIrJoSXFeLzdB+
	FceJ0FpTVRGhvwlNgUXIkEq6UXNz
X-Google-Smtp-Source: APXvYqxpM6cvgNok8PJRlaofF9LW7QXyrivTCnpJ3OGrLdTtfN6JV96L+rnvQOQ2ZSYwBOPvboqhBw==
X-Received: by 2002:adf:8297:: with SMTP id 23mr25859840wrc.379.1576464792000; 
	Sun, 15 Dec 2019 18:53:12 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	o66sm15996289wmo.20.2019.12.15.18.53.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 18:53:11 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:53:07 +0000
Message-Id: <20191216025307.37864-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] ostree: Add support for gjs tests
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
X-List-Received-Date: Mon, 16 Dec 2019 02:53:12 -0000

Now gjs is packaged in meta-gnome, add support for gjs tests through
PACKAGECONFIG; note gjs has a large dependency footprint, requiring (at
least) gobject-instrospection-data, gtk-3 and x11. Move python3-pyyaml
to RDEPENDS directly based on the layer, so that building ptest without
meta-python is possible (though more tests will have to be skipped).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- enable gjs through PACKAGECONFIG, use RDEPENDS for ptest dependencies

 meta-oe/recipes-extended/ostree/ostree_2019.6.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
index 86a7aac31c27..a40cc52757f3 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
@@ -56,6 +56,7 @@ PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
 PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
+PACKAGECONFIG[gjs] = "ac_cv_path_GJS=${bindir}/gjs"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
 PACKAGECONFIG[libarchive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libmount] = "--with-libmount, --without-libmount, util-linux"
@@ -166,9 +167,10 @@ RDEPENDS_${PN}-ptest += " \
     grep \
     python3-core \
     python3-multiprocessing \
-    python3-pyyaml \
     tar \
     ${PN}-trivial-httpd \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
 
@@ -179,9 +181,3 @@ SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
 SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
 
 BBCLASSEXTEND = "native"
-
-python __anonymous() {
-    if bb.utils.contains('PTEST_ENABLED', '1', 'True', '', d):
-        if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', '', d):
-            raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
-}
-- 
2.17.1


