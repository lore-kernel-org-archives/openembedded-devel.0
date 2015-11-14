Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE68277381
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 10:22:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAEAMaTk006316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 02:22:36 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 14 Nov 2015 02:22:35 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Nov 2015 05:22:28 -0500
Message-ID: <5be0612f0d32bdec2b6ec5d51ffcc471b7175efe.1447495903.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447495903.git.wenzong.fan@windriver.com>
References: <cover.1447495903.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4][meta-oe] krb5: fix CVE-2015-2697
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
X-List-Received-Date: Sat, 14 Nov 2015 10:22:36 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The build_principal_va function in lib/krb5/krb/bld_princ.c in MIT
Kerberos 5 (aka krb5) before 1.14 allows remote authenticated users
to cause a denial of service (out-of-bounds read and KDC crash) via
an initial '\0' character in a long realm field within a TGS request.

Backport upstream commit to fix it:
https://github.com/krb5/krb5/commit/f0c094a1b745d91ef2f9a4eae2149aac026a5789

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...-build_principal-memory-bug-CVE-2015-2697.patch | 58 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-build_principal-memory-bug-CVE-2015-2697.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/Fix-build_principal-memory-bug-CVE-2015-2697.patch b/meta-oe/recipes-connectivity/krb5/krb5/Fix-build_principal-memory-bug-CVE-2015-2697.patch
new file mode 100644
index 0000000..9b0c18b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/Fix-build_principal-memory-bug-CVE-2015-2697.patch
@@ -0,0 +1,58 @@
+From 9cb63711e63042f22da914ba039c4537b22e8fb0 Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Fri, 25 Sep 2015 12:51:47 -0400
+Subject: [PATCH 3/4] Fix build_principal memory bug [CVE-2015-2697]
+
+In build_principal_va(), use k5memdup0() instead of strdup() to make a
+copy of the realm, to ensure that we allocate the correct number of
+bytes and do not read past the end of the input string.  This bug
+affects krb5_build_principal(), krb5_build_principal_va(), and
+krb5_build_principal_alloc_va().  krb5_build_principal_ext() is not
+affected.
+
+CVE-2015-2697:
+
+In MIT krb5 1.7 and later, an authenticated attacker may be able to
+cause a KDC to crash using a TGS request with a large realm field
+beginning with a null byte.  If the KDC attempts to find a referral to
+answer the request, it constructs a principal name for lookup using
+krb5_build_principal() with the requested realm.  Due to a bug in this
+function, the null byte causes only one byte be allocated for the
+realm field of the constructed principal, far less than its length.
+Subsequent operations on the lookup principal may cause a read beyond
+the end of the mapped memory region, causing the KDC process to crash.
+
+CVSSv2: AV:N/AC:L/Au:S/C:N/I:N/A:C/E:POC/RL:OF/RC:C
+
+ticket: 8252 (new)
+target_version: 1.14
+tags: pullup
+
+Backport upstream commit:
+https://github.com/krb5/krb5/commit/f0c094a1b745d91ef2f9a4eae2149aac026a5789
+
+Upstream-Status: Backport
+---
+ src/lib/krb5/krb/bld_princ.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/lib/krb5/krb/bld_princ.c b/src/lib/krb5/krb/bld_princ.c
+index ab6fed8..8604268 100644
+--- a/src/lib/krb5/krb/bld_princ.c
++++ b/src/lib/krb5/krb/bld_princ.c
+@@ -40,10 +40,8 @@ build_principal_va(krb5_context context, krb5_principal princ,
+     data = malloc(size * sizeof(krb5_data));
+     if (!data) { retval = ENOMEM; }
+ 
+-    if (!retval) {
+-        r = strdup(realm);
+-        if (!r) { retval = ENOMEM; }
+-    }
++    if (!retval)
++        r = k5memdup0(realm, rlen, &retval);
+ 
+     while (!retval && (component = va_arg(ap, char *))) {
+         if (count == size) {
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 6c25d82..c6b873a 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://Fix-SPNEGO-context-aliasing-bugs-CVE-2015-2695.patch;striplevel=2 \
            file://Fix-IAKERB-context-aliasing-bugs-CVE-2015-2696.patch;striplevel=2 \
+           file://Fix-build_principal-memory-bug-CVE-2015-2697.patch;striplevel=2 \
            file://crosscompile_nm.patch \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
-- 
1.9.1


