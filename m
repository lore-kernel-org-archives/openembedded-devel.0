Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 041D76FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 15:41:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 145so4027231pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=PeWchoFy379HSARf4s34t1LekzG13EGKAFgHNEo0Bo4=;
	b=aHPUhbpGs5MXSacuSqZNetTRw0AZgEyuJRBwqCFNMlZ7I5zYGQvLjHVu4b6bQvExmk
	Bh9q9Lm5TRKugaZsDmZzCrfSlYFaqZJS9ueQgR01ta3TGxmrf210E4DdhAN9NItW1QT9
	P0WB/IypIH06TZwMLLKNDGRCCj8En/IMYq1dNLcEK3JNpE2283DqZOej1TvcE8w8EEl/
	4f3Hc2YzyUAIqikyHdXb0VUm+D1i803rgFfgpDQu34lpVzRXNdhfKLPYlQBbdRAgTqaf
	W27gvxHqAMCX8hSR2AOKpN5ELJZA9Qf7K13xp9R+xPTqh4hG64Ft6uNTvTbXwTrP3VnL
	fN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PeWchoFy379HSARf4s34t1LekzG13EGKAFgHNEo0Bo4=;
	b=d+X2qx5NwcxkasC0iSmhBERz8mdRN560zbhar2sbuakBDDQmdWVjhJvdzi0ZWVQWCz
	V+GjfCyGUYmY8WUwa5XZYAkr1i4DLnqmUIMIC7AFprMYwt0lmDhFH6UFjZlLz2G4TGzL
	jPqgmjNLebfYZNxk+wFWV4d6Qh9zKBbn06ihe7NB8zO1+EHx39HGRLZb6BdXRYWSByqA
	Ws57B/yq10JotMza3gAbfOs8R8HoHcYG9hG8bKstjURhpN13swpEnwJwwRkVo5+NE/z0
	4+3NK3QIgOe88o+kQhW9EnpsalODLVXg7y9TMnp9qFs+n6c/cxUAj0S4SafDwSgTblCm
	zz4w==
X-Gm-Message-State: AOPr4FV955VtfWoUX+DRlCelekdAyRQQv1aVZVZ2qNIlHv2htrJqsB18I/QhTWf7UAnyqw==
X-Received: by 10.98.52.68 with SMTP id b65mr5991207pfa.24.1462981295317;
	Wed, 11 May 2016 08:41:35 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	76sm13106584pfz.44.2016.05.11.08.41.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 08:41:34 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2016 09:41:31 -0600
Message-Id: <1462981291-6810-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [meta-oe][master][krogoth][PATCH] krb5: fix uninitialized variable warning
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
X-List-Received-Date: Wed, 11 May 2016 15:41:35 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

On some targets clang erroniously detects an uninitialized variable.
Backport the fix from upstream.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 ...-around-uninitialized-warning-in-cc_kcm.c.patch | 37 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch
new file mode 100644
index 0000000..c6731a9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch
@@ -0,0 +1,37 @@
+From f1b681a44d28946e6d8fc0080f3efe94228d7dfe Mon Sep 17 00:00:00 2001
+From: Tom Yu <tlyu@mit.edu>
+Date: Wed, 6 Jan 2016 15:24:16 -0500
+Subject: [PATCH] Work around uninitialized warning in cc_kcm.c
+
+Some versions of clang erroneously detect use of an uninitialized
+variable reply_len in kcmio_call() when building on non-Mac platforms.
+Initialize it to work around this warning.
+
+(cherry picked from commit 40b007c0d8e2a12c6f4205ac111dee731c9d970c)
+
+ticket: 8335
+version_fixed: 1.13.4
+tags: -pullup
+status: resolved
+
+Upstream-Status: backport
+---
+ src/lib/krb5/ccache/cc_kcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/krb5/ccache/cc_kcm.c b/src/lib/krb5/ccache/cc_kcm.c
+index b763ea4..6337b57 100644
+--- a/src/lib/krb5/ccache/cc_kcm.c
++++ b/src/lib/krb5/ccache/cc_kcm.c
+@@ -377,7 +377,7 @@ static krb5_error_code
+ kcmio_call(krb5_context context, struct kcmio *io, struct kcmreq *req)
+ {
+     krb5_error_code ret;
+-    size_t reply_len;
++    size_t reply_len = 0;
+ 
+     if (k5_buf_status(&req->reqbuf) != 0)
+         return ENOMEM;
+-- 
+2.8.2
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 713b76c..0c566cb 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
            file://etc/default/krb5-kdc \
            file://etc/default/krb5-admin-server \
            file://krb5-CVE-2016-3119.patch;striplevel=2 \
+           file://0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "f7ebfa6c99c10b16979ebf9a98343189"
 SRC_URI[sha256sum] = "e528c30b0209c741f6f320cb83122ded92f291802b6a1a1dc1a01dcdb3ff6de1"
-- 
2.8.2


