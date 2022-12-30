Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32387C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 20:49:36 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.28020.1672433374151767278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 12:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qak1WIRb;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so13711130otk.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 12:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ9wyEsdtyyoPxlVOBJqGPjTgXCbETsZy0bKtM14mGA=;
        b=qak1WIRbtPuM1lzDBnUWFdy2v05Xz5w2IBFaS7cz2OYAmaIUEVpktPthntEm32mtzb
         ammBTADxythTNrRMlqqmKw8gdke4nYRJn9P5YSeCPFxK3dbapMcAg8Lqw0dkIsHH57la
         dFPJdN6pLPdV3tKuEUBXyadJ1B0FYWO3SHHv/jYyZYzOt9g0Jl5hmTvGny7lWlHIUpuQ
         hh65sVvy4ZlAaHRn8XhyJ+KbeYLgCkyo3WjcTudeBZRybDPw7B6Q6+hTa9BAiqGQgKAA
         c/2l7Swen5k8TUElg7hiRKbQIqol7YFF6BcVDn8kANyWHdxSm4I43LX1njlGvj0yy/ON
         PVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9wyEsdtyyoPxlVOBJqGPjTgXCbETsZy0bKtM14mGA=;
        b=R2a24PXrbExEIT2nNAx9SYh21s2GyIRvZS35XPp2nbbwCwjRz2dLwosL3cqsMVSdPu
         WDUQAx1G1H0ldH0eV/sXl8E/B1Z9RgeZwPCMKsyVOwhCWxJv/RehqSM+gDh9lcObodFo
         QOrbzVqlJLNsfDnB0smNBGrMA4B7JAwP/V0nNcFZCVCye4IITyR/DtKUtw1YYAThTRzs
         cOrt+2821YTsjVWKzs1ItIh5NYxBxmgiiGG2p0rk/Mbu/O3GoEy8IL/4s9sjjmoXX9Yf
         8IglimdV0ErSmbGjhT7urN93eJhU3sNovQ6Ql00HZ9yFTi2krH8CWkKMPc1JxE67+al2
         3gvw==
X-Gm-Message-State: AFqh2kqpNmqWAS/jMxPxGrTt+yxez34qUO2oNxvxEOMYNQkEg7K8xtvB
	6nbpvqhA2FmzBIGfZ7rmepr1jZczeU8MFyf14xw=
X-Google-Smtp-Source: AMrXdXtMKL4azNXabgTtJYGTFrgxzIyBkabwTM7aChZwBv3S6aZ5nPLPCwVdeyFiG60rxNOMLU2NncPJaaQkSgab7/c=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr1934045otk.111.1672433373168; Fri, 30
 Dec 2022 12:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20221230014607.703918-1-yi.zhao@windriver.com>
In-Reply-To: <20221230014607.703918-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Dec 2022 12:49:07 -0800
Message-ID: <CAMKF1sqYXMgszgQDALtrvLCXrhHJex3111VeM_oRRg9g8_np3Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] krb5: upgrade 1.17.2 -> 1.20.1
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 20:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100314

This regresses samba [1] [2]. Please look into that as well and
propose a fix along with this.

[1] https://errors.yoctoproject.org/Errors/Details/685903/
[2] https://errors.yoctoproject.org/Errors/Details/685873/

On Thu, Dec 29, 2022 at 5:46 PM Yi Zhao <yi.zhao@eng.windriver.com> wrote:
>
> Release Notes:
> https://web.mit.edu/kerberos/krb5-1.20/krb5-1.20.1.html
>
> License-Update: Update AES algorithm copyright [1]
>                 Update copyright years [2]
>
> [1] https://github.com/krb5/krb5/commit/cb5f190056ef4d123c5fe5d4923982b830288438
> [2] https://github.com/krb5/krb5/commit/f1535bf6b47e8dc03d69fcfb98e798546ff7c272
>
> * Update PACKAGECONFIG[keyutils] and drop the local patch.
> * Drop backport CVE patches.
> * Inherit pkgconfig bbclass to find com_err library correctly.
> * Drop --without-tcl option as it has been removed upstream.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...ameter-to-disable-keyutils-detection.patch |  32 -----
>  .../krb5/krb5/CVE-2021-36222.patch            | 121 ------------------
>  .../krb5/krb5/CVE-2021-37750.patch            |  53 --------
>  .../krb5/{krb5_1.17.2.bb => krb5_1.20.1.bb}   |  19 ++-
>  4 files changed, 9 insertions(+), 216 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
>  delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
>  delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
>  rename meta-oe/recipes-connectivity/krb5/{krb5_1.17.2.bb => krb5_1.20.1.bb} (93%)
>
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
> deleted file mode 100644
> index cbd5d71fd..000000000
> --- a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From a9e4057bfda190ad365b503af058b460ab8c7616 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Tue, 1 Oct 2013 22:22:57 +0200
> -Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> ----
> - aclocal.m4 | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/aclocal.m4 b/aclocal.m4
> -index d6d1279..80ce604 100644
> ---- a/aclocal.m4
> -+++ b/aclocal.m4
> -@@ -1679,12 +1679,16 @@ fi
> - dnl
> - dnl If libkeyutils exists (on Linux) include it and use keyring ccache
> - AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
> -+AC_ARG_ENABLE([keyutils],
> -+AC_HELP_STRING([--disable-keyutils],don't enable using keyutils for keyring ccache @<:@enabled@:>@), , enable_keyutils=yes)
> -+if test "$enable_keyutils" = yes; then
> -   AC_CHECK_HEADERS([keyutils.h],
> -     AC_CHECK_LIB(keyutils, add_key,
> -       [dnl Pre-reqs were found
> -        AC_DEFINE(USE_KEYRING_CCACHE, 1, [Define if the keyring ccache should be enabled])
> -        LIBS="-lkeyutils $LIBS"
> -       ]))
> -+fi
> - ])dnl
> - dnl
> - dnl If libkeyutils supports persistent keyrings, use them
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
> deleted file mode 100644
> index fee6e64c1..000000000
> --- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
> +++ /dev/null
> @@ -1,121 +0,0 @@
> -From fc98f520caefff2e5ee9a0026fdf5109944b3562 Mon Sep 17 00:00:00 2001
> -From: Joseph Sutton <josephsutton@catalyst.net.nz>
> -Date: Wed, 7 Jul 2021 11:47:44 +1200
> -Subject: [PATCH] Fix KDC null deref on bad encrypted challenge
> -
> -The function ec_verify() in src/kdc/kdc_preauth_ec.c contains a check
> -to avoid further processing if the armor key is NULL.  However, this
> -check is bypassed by a call to k5memdup0() which overwrites retval
> -with 0 if the allocation succeeds.  If the armor key is NULL, a call
> -to krb5_c_fx_cf2_simple() will then dereference it, resulting in a
> -crash.  Add a check before the k5memdup0() call to avoid overwriting
> -retval.
> -
> -CVE-2021-36222:
> -
> -In MIT krb5 releases 1.16 and later, an unauthenticated attacker can
> -cause a null dereference in the KDC by sending a request containing a
> -PA-ENCRYPTED-CHALLENGE padata element without using FAST.
> -
> -[ghudson@mit.edu: trimmed patch; added test case; edited commit
> -message]
> -
> -ticket: 9007 (new)
> -tags: pullup
> -target_version: 1.19-next
> -target_version: 1.18-next
> -
> -CVE: CVE-2021-36222
> -
> -Upstream-Status: Backport
> -[https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/kdc/kdc_preauth_ec.c      |  3 ++-
> - src/tests/Makefile.in         |  1 +
> - src/tests/t_cve-2021-36222.py | 46 +++++++++++++++++++++++++++++++++++
> - 3 files changed, 49 insertions(+), 1 deletion(-)
> - create mode 100644 src/tests/t_cve-2021-36222.py
> -
> -diff --git a/src/kdc/kdc_preauth_ec.c b/src/kdc/kdc_preauth_ec.c
> -index 7e636b3f9..43a9902cc 100644
> ---- a/src/kdc/kdc_preauth_ec.c
> -+++ b/src/kdc/kdc_preauth_ec.c
> -@@ -87,7 +87,8 @@ ec_verify(krb5_context context, krb5_data *req_pkt, krb5_kdc_req *request,
> -     }
> -
> -     /* Check for a configured FAST ec auth indicator. */
> --    realmstr = k5memdup0(realm.data, realm.length, &retval);
> -+    if (retval == 0)
> -+        realmstr = k5memdup0(realm.data, realm.length, &retval);
> -     if (realmstr != NULL)
> -         retval = profile_get_string(context->profile, KRB5_CONF_REALMS,
> -                                     realmstr,
> -diff --git a/src/tests/Makefile.in b/src/tests/Makefile.in
> -index fc6fcc0c3..1a1938306 100644
> ---- a/src/tests/Makefile.in
> -+++ b/src/tests/Makefile.in
> -@@ -166,6 +166,7 @@ check-pytests: unlockiter s4u2self
> -       $(RUNPYTEST) $(srcdir)/t_cve-2012-1015.py $(PYTESTFLAGS)
> -       $(RUNPYTEST) $(srcdir)/t_cve-2013-1416.py $(PYTESTFLAGS)
> -       $(RUNPYTEST) $(srcdir)/t_cve-2013-1417.py $(PYTESTFLAGS)
> -+      $(RUNPYTEST) $(srcdir)/t_cve-2021-36222.py $(PYTESTFLAGS)
> -       $(RM) au.log
> -       $(RUNPYTEST) $(srcdir)/t_audit.py $(PYTESTFLAGS)
> -       $(RUNPYTEST) $(srcdir)/jsonwalker.py -d $(srcdir)/au_dict.json \
> -diff --git a/src/tests/t_cve-2021-36222.py b/src/tests/t_cve-2021-36222.py
> -new file mode 100644
> -index 000000000..57e04993b
> ---- /dev/null
> -+++ b/src/tests/t_cve-2021-36222.py
> -@@ -0,0 +1,46 @@
> -+import socket
> -+from k5test import *
> -+
> -+realm = K5Realm()
> -+
> -+# CVE-2021-36222 KDC null dereference on encrypted challenge preauth
> -+# without FAST
> -+
> -+s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
> -+a = (hostname, realm.portbase)
> -+
> -+m = ('6A81A0' '30819D'          # [APPLICATION 10] SEQUENCE
> -+     'A103' '0201' '05'         #  [1] pvno = 5
> -+     'A203' '0201' '0A'         #  [2] msg-type = 10
> -+     'A30E' '300C'              #  [3] padata = SEQUENCE OF
> -+     '300A'                     #   SEQUENCE
> -+     'A104' '0202' '008A'       #    [1] padata-type = PA-ENCRYPTED-CHALLENGE
> -+     'A202' '0400'              #    [2] padata-value = ""
> -+     'A48180' '307E'            #  [4] req-body = SEQUENCE
> -+     'A007' '0305' '0000000000' #   [0] kdc-options = 0
> -+     'A120' '301E'              #   [1] cname = SEQUENCE
> -+     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
> -+     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
> -+     '1B06' '6B7262746774'      #     krbtgt
> -+     '1B0B' '4B5242544553542E434F4D'
> -+                                #     KRBTEST.COM
> -+     'A20D' '1B0B' '4B5242544553542E434F4D'
> -+                                #   [2] realm = KRBTEST.COM
> -+     'A320' '301E'              #   [3] sname = SEQUENCE
> -+     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
> -+     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
> -+     '1B06' '6B7262746774'      #     krbtgt
> -+     '1B0B' '4B5242544553542E434F4D'
> -+                                #     KRBTEST.COM
> -+     'A511' '180F' '31393934303631303036303331375A'
> -+                                #   [5] till = 19940610060317Z
> -+     'A703' '0201' '00'         #   [7] nonce = 0
> -+     'A808' '3006'              #   [8] etype = SEQUENCE OF
> -+     '020112' '020111')         #    aes256-cts aes128-cts
> -+
> -+s.sendto(bytes.fromhex(m), a)
> -+
> -+# Make sure kinit still works.
> -+realm.kinit(realm.user_princ, password('user'))
> -+
> -+success('CVE-2021-36222 regression test')
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
> deleted file mode 100644
> index c67bca32e..000000000
> --- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From b3999be7ab59a5af4b2f1042ce0d6b03ecb17d4e Mon Sep 17 00:00:00 2001
> -From: Greg Hudson <ghudson@mit.edu>
> -Date: Tue, 3 Aug 2021 01:15:27 -0400
> -Subject: [PATCH] Fix KDC null deref on TGS inner body null server
> -
> -After the KDC decodes a FAST inner body, it does not check for a null
> -server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
> -would typically result in an error from krb5_unparse_name(), but with
> -the addition of get_local_tgt() it results in a null dereference.  Add
> -a null check.
> -
> -Reported by Joseph Sutton of Catalyst.
> -
> -CVE-2021-37750:
> -
> -In MIT krb5 releases 1.14 and later, an authenticated attacker can
> -cause a null dereference in the KDC by sending a FAST TGS request with
> -no server field.
> -
> -ticket: 9008 (new)
> -tags: pullup
> -target_version: 1.19-next
> -target_version: 1.18-next
> -
> -CVE: CVE-2021-37750
> -
> -Upstream-Status: Backport
> -[https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/kdc/do_tgs_req.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
> -index 587342a..622b48f 100644
> ---- a/src/kdc/do_tgs_req.c
> -+++ b/src/kdc/do_tgs_req.c
> -@@ -201,6 +201,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
> -         status = "FIND_FAST";
> -         goto cleanup;
> -     }
> -+    if (sprinc == NULL) {
> -+        status = "NULL_SERVER";
> -+        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
> -+        goto cleanup;
> -+    }
> -
> -     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
> -                             &local_tgt, &local_tgt_storage);
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
> rename to meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
> index 6e0b2fdac..2221000e3 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
> @@ -14,14 +14,12 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
>  HOMEPAGE = "http://web.mit.edu/Kerberos/"
>  SECTION = "console/network"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=dd4d0ad4c5e98abb58aa0d312f276791"
> -DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
> +LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d31018dba5a0ef195eb426a1e61f02e"
>
> -inherit autotools-brokensep binconfig perlnative systemd update-rc.d
> +inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
>
>  SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
> -           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
>             file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
>             file://crosscompile_nm.patch \
>             file://etc/init.d/krb5-kdc \
> @@ -30,26 +28,26 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
>             file://etc/default/krb5-admin-server \
>             file://krb5-kdc.service \
>             file://krb5-admin-server.service \
> -           file://CVE-2021-36222.patch;striplevel=2 \
> -           file://CVE-2021-37750.patch;striplevel=2 \
>  "
> -SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
> -SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
> +SRC_URI[md5sum] = "73f5780e7b587ccd8b8cfc10c965a686"
> +SRC_URI[sha256sum] = "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
>
>  CVE_PRODUCT = "kerberos"
>  CVE_VERSION = "5-${PV}"
>
>  S = "${WORKDIR}/${BP}/src"
>
> +DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
> +
>  PACKAGECONFIG ??= "pkinit"
>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[openssl] = "--with-crypto-impl=openssl,,openssl"
> -PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
> +PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils"
>  PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
>  PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[pkinit] = "--enable-pkinit, --disable-pkinit"
>
> -EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
> +EXTRA_OECONF += "--with-system-et --disable-rpath"
>  CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
>                    ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
>                    ac_cv_file__etc_TIMEZONE=no"
> @@ -85,6 +83,7 @@ do_install:append() {
>
>          echo "RUN_KADMIND=true" >> ${D}/${sysconfdir}/default/krb5-admin-server
>      fi
> +
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>          install -d ${D}${sysconfdir}/tmpfiles.d
>          echo "d /run/krb5kdc - - - -" \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100305): https://lists.openembedded.org/g/openembedded-devel/message/100305
> Mute This Topic: https://lists.openembedded.org/mt/95947642/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

