Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2119873F4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 08:32:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C8Ww77020828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 01:32:58 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 01:32:57 -0700
Message-ID: <5551BAB8.8090801@windriver.com>
Date: Tue, 12 May 2015 16:32:56 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1430113846-7107-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1430113846-7107-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-oe] krb5: upgrade to 1.13.1
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
X-List-Received-Date: Tue, 12 May 2015 08:33:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

在 2015年04月27日 13:50, rongqing.li@windriver.com 写道:
> From: Roy Li <rongqing.li@windriver.com>
>
> Remove a CVE patch which krb5 1.13.1 has merged.
> Update the checksum, include License file checksum, since
> the date in it is updated
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   ...rn-only-new-keys-in-randkey-CVE-2014-5351.patch | 92 ----------------------
>   .../krb5/{krb5_1.12.2.bb => krb5_1.13.1.bb}        |  7 +-
>   2 files changed, 3 insertions(+), 96 deletions(-)
>   delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch
>   rename meta-oe/recipes-connectivity/krb5/{krb5_1.12.2.bb => krb5_1.13.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch
> deleted file mode 100644
> index 0852661..0000000
> --- a/meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From af0ed4df4dfae762ab5fb605f5a0c8f59cb4f6ca Mon Sep 17 00:00:00 2001
> -From: Greg Hudson <ghudson@mit.edu>
> -Date: Thu, 21 Aug 2014 13:52:07 -0400
> -Subject: [PATCH] Return only new keys in randkey [CVE-2014-5351]
> -
> -In kadmind's randkey operation, if a client specifies the keepold
> -flag, do not include the preserved old keys in the response.
> -
> -CVE-2014-5351:
> -
> -An authenticated remote attacker can retrieve the current keys for a
> -service principal when generating a new set of keys for that
> -principal.  The attacker needs to be authenticated as a user who has
> -the elevated privilege for randomizing the keys of other principals.
> -
> -Normally, when a Kerberos administrator randomizes the keys of a
> -service principal, kadmind returns only the new keys.  This prevents
> -an administrator who lacks legitimate privileged access to a service
> -from forging tickets to authenticate to that service.  If the
> -"keepold" flag to the kadmin randkey RPC operation is true, kadmind
> -retains the old keys in the KDC database as intended, but also
> -unexpectedly returns the old keys to the client, which exposes the
> -service to ticket forgery attacks from the administrator.
> -
> -A mitigating factor is that legitimate clients of the affected service
> -will start failing to authenticate to the service once they begin to
> -receive service tickets encrypted in the new keys.  The affected
> -service will be unable to decrypt the newly issued tickets, possibly
> -alerting the legitimate administrator of the affected service.
> -
> -CVSSv2: AV:N/AC:H/Au:S/C:P/I:N/A:N/E:POC/RL:OF/RC:C
> -
> -[tlyu@mit.edu: CVE description and CVSS score]
> -
> -ticket: 8018 (new)
> -target_version: 1.13
> -tags: pullup
> -
> -Upstream-Status: Backport
> ----
> - src/lib/kadm5/srv/svr_principal.c |   21 ++++++++++++++++++---
> - 1 files changed, 18 insertions(+), 3 deletions(-)
> -
> -diff --git a/lib/kadm5/srv/svr_principal.c b/lib/kadm5/srv/svr_principal.c
> -index 5d358bd..d4e74cc 100644
> ---- a/lib/kadm5/srv/svr_principal.c
> -+++ b/lib/kadm5/srv/svr_principal.c
> -@@ -344,6 +344,20 @@ check_1_6_dummy(kadm5_principal_ent_t entry, long mask,
> -     *passptr = NULL;
> - }
> -
> -+/* Return the number of keys with the newest kvno.  Assumes that all key data
> -+ * with the newest kvno are at the front of the key data array. */
> -+static int
> -+count_new_keys(int n_key_data, krb5_key_data *key_data)
> -+{
> -+    int n;
> -+
> -+    for (n = 1; n < n_key_data; n++) {
> -+        if (key_data[n - 1].key_data_kvno != key_data[n].key_data_kvno)
> -+            return n;
> -+    }
> -+    return n_key_data;
> -+}
> -+
> - kadm5_ret_t
> - kadm5_create_principal(void *server_handle,
> -                        kadm5_principal_ent_t entry, long mask,
> -@@ -1593,7 +1607,7 @@ kadm5_randkey_principal_3(void *server_handle,
> -     osa_princ_ent_rec           adb;
> -     krb5_int32                  now;
> -     kadm5_policy_ent_rec        pol;
> --    int                         ret, last_pwd;
> -+    int                         ret, last_pwd, n_new_keys;
> -     krb5_boolean                have_pol = FALSE;
> -     kadm5_server_handle_t       handle = server_handle;
> -     krb5_keyblock               *act_mkey;
> -@@ -1686,8 +1700,9 @@ kadm5_randkey_principal_3(void *server_handle,
> -     kdb->fail_auth_count = 0;
> -
> -     if (keyblocks) {
> --        ret = decrypt_key_data(handle->context,
> --                               kdb->n_key_data, kdb->key_data,
> -+        /* Return only the new keys added by krb5_dbe_crk. */
> -+        n_new_keys = count_new_keys(kdb->n_key_data, kdb->key_data);
> -+        ret = decrypt_key_data(handle->context, n_new_keys, kdb->key_data,
> -                                keyblocks, n_keys);
> -         if (ret)
> -             goto done;
> ---
> -1.7.4.1
> -
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.1.bb
> similarity index 90%
> rename from meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
> rename to meta-oe/recipes-connectivity/krb5/krb5_1.13.1.bb
> index c492496..b266450 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.1.bb
> @@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
>   HOMEPAGE = "http://web.mit.edu/Kerberos/"
>   SECTION = "console/network"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=450c80c6258ce03387bd09df37638ebc"
> +LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=f64248328d2d9928e1f04158b5243e7f"
>   DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
>
>   inherit autotools-brokensep binconfig perlnative
> @@ -22,7 +22,6 @@ inherit autotools-brokensep binconfig perlnative
>   SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>   SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar \
>              file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
> -           file://0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch \
>              file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
>              file://crosscompile_nm.patch \
>              file://etc/init.d/krb5-kdc \
> @@ -30,8 +29,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
>              file://etc/default/krb5-kdc \
>              file://etc/default/krb5-admin-server \
>   "
> -SRC_URI[md5sum] = "357f1312b7720a0a591e22db0f7829fe"
> -SRC_URI[sha256sum] = "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
> +SRC_URI[md5sum] = "567586cdf02aa8c842c2fab7a94f3c1f"
> +SRC_URI[sha256sum] = "4df629fdf97f362cf81edbf38d613b32b492dd88c876cf3aa1c66562f296663e"
>
>   S = "${WORKDIR}/${BP}/src/"
>
>

-- 
Best Reagrds,
Roy | RongQing Li

