Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 657C262252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:25:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAC8PNFt016837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 00:25:23 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 00:25:22 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Nov 2014 03:25:19 -0500
Message-ID: <4021bf20fdd5e39e71a22165709837027e21c670.1415780121.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415780121.git.wenzong.fan@windriver.com>
References: <cover.1415780121.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-oe] krb5: fix CVE-2014-5351
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
X-List-Received-Date: Wed, 12 Nov 2014 08:25:32 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The kadm5_randkey_principal_3 function in lib/kadm5/srv/svr_principal.c
in kadmind in MIT Kerberos 5 (aka krb5) before 1.13 sends old keys in a
response to a -randkey -keepold request, which allows remote authentic-
ated users to forge tickets by leveraging administrative access.

This back-ported patch fixes CVE-2014-5351.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...rn-only-new-keys-in-randkey-CVE-2014-5351.patch |   92 ++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb   |    1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch
new file mode 100644
index 0000000..0852661
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch
@@ -0,0 +1,92 @@
+From af0ed4df4dfae762ab5fb605f5a0c8f59cb4f6ca Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Thu, 21 Aug 2014 13:52:07 -0400
+Subject: [PATCH] Return only new keys in randkey [CVE-2014-5351]
+
+In kadmind's randkey operation, if a client specifies the keepold
+flag, do not include the preserved old keys in the response.
+
+CVE-2014-5351:
+
+An authenticated remote attacker can retrieve the current keys for a
+service principal when generating a new set of keys for that
+principal.  The attacker needs to be authenticated as a user who has
+the elevated privilege for randomizing the keys of other principals.
+
+Normally, when a Kerberos administrator randomizes the keys of a
+service principal, kadmind returns only the new keys.  This prevents
+an administrator who lacks legitimate privileged access to a service
+from forging tickets to authenticate to that service.  If the
+"keepold" flag to the kadmin randkey RPC operation is true, kadmind
+retains the old keys in the KDC database as intended, but also
+unexpectedly returns the old keys to the client, which exposes the
+service to ticket forgery attacks from the administrator.
+
+A mitigating factor is that legitimate clients of the affected service
+will start failing to authenticate to the service once they begin to
+receive service tickets encrypted in the new keys.  The affected
+service will be unable to decrypt the newly issued tickets, possibly
+alerting the legitimate administrator of the affected service.
+
+CVSSv2: AV:N/AC:H/Au:S/C:P/I:N/A:N/E:POC/RL:OF/RC:C
+
+[tlyu@mit.edu: CVE description and CVSS score]
+
+ticket: 8018 (new)
+target_version: 1.13
+tags: pullup
+
+Upstream-Status: Backport
+---
+ src/lib/kadm5/srv/svr_principal.c |   21 ++++++++++++++++++---
+ 1 files changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/lib/kadm5/srv/svr_principal.c b/lib/kadm5/srv/svr_principal.c
+index 5d358bd..d4e74cc 100644
+--- a/lib/kadm5/srv/svr_principal.c
++++ b/lib/kadm5/srv/svr_principal.c
+@@ -344,6 +344,20 @@ check_1_6_dummy(kadm5_principal_ent_t entry, long mask,
+     *passptr = NULL;
+ }
+ 
++/* Return the number of keys with the newest kvno.  Assumes that all key data
++ * with the newest kvno are at the front of the key data array. */
++static int
++count_new_keys(int n_key_data, krb5_key_data *key_data)
++{
++    int n;
++
++    for (n = 1; n < n_key_data; n++) {
++        if (key_data[n - 1].key_data_kvno != key_data[n].key_data_kvno)
++            return n;
++    }
++    return n_key_data;
++}
++
+ kadm5_ret_t
+ kadm5_create_principal(void *server_handle,
+                        kadm5_principal_ent_t entry, long mask,
+@@ -1593,7 +1607,7 @@ kadm5_randkey_principal_3(void *server_handle,
+     osa_princ_ent_rec           adb;
+     krb5_int32                  now;
+     kadm5_policy_ent_rec        pol;
+-    int                         ret, last_pwd;
++    int                         ret, last_pwd, n_new_keys;
+     krb5_boolean                have_pol = FALSE;
+     kadm5_server_handle_t       handle = server_handle;
+     krb5_keyblock               *act_mkey;
+@@ -1686,8 +1700,9 @@ kadm5_randkey_principal_3(void *server_handle,
+     kdb->fail_auth_count = 0;
+ 
+     if (keyblocks) {
+-        ret = decrypt_key_data(handle->context,
+-                               kdb->n_key_data, kdb->key_data,
++        /* Return only the new keys added by krb5_dbe_crk. */
++        n_new_keys = count_new_keys(kdb->n_key_data, kdb->key_data);
++        ret = decrypt_key_data(handle->context, n_new_keys, kdb->key_data,
+                                keyblocks, n_keys);
+         if (ret)
+             goto done;
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
index f3f16b9..c492496 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
@@ -22,6 +22,7 @@ inherit autotools-brokensep binconfig perlnative
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar \
            file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
+           file://0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://crosscompile_nm.patch \
            file://etc/init.d/krb5-kdc \
-- 
1.7.9.5


