Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1209.1594660033949546602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 10:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESn2DDp9;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id m22so6287748pgv.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 10:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=SDN0OrrjdB6fR1tYZB2jfV6H+Ai5KXX1Ejchty3ClFY=;
        b=ESn2DDp99T3SVrfZsXNB6RoFTh9FfY9QyjetnR6nGvLjyZFYaKF40YBQdYbDDWc2zY
         Hj+sFBkI/ArSH5GwQgNfkXMU8R7/8Lyrss8NX6XVgSoD9PVJ9et87cp7rSvOTpIFgmet
         U1MkhMsWw9jiYbDoxYp9QR3dJE2Cp02dVf92RvreplsQXvfCqtQAJETSvSP+HDrO9kWw
         SlnFZETaOVR57q43RSwbzNXmQOx3Kf3esllAAOQ6c/BeLsdwIxx6oN0yY6KxUcPoVkGK
         NY31QEIuR7lTfYkQkO/3Ufq6Fnmbgit1eyk70CNNiPS9ZNr3GjNokmDe2jERfZOt9BHI
         bBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SDN0OrrjdB6fR1tYZB2jfV6H+Ai5KXX1Ejchty3ClFY=;
        b=DlA6bw4XIEFnnf9i/OZz2kgebWdjpNlrEJAi9cHXd1/Jaq6A+tY/jXBTpg+04FVWAu
         qSz7VGORVQ1v1NuDoZIMgPJuvCaPKN1bOqPhyoqBqVSCYaoZJ9Bqho6r44pEFcSHOsmu
         fxCjMHxXsGppuD2i1FKdYJERVBKOCbu2XFZO+4bbES3arQbaZc4VfHiKVtV+GnzA+3J+
         ljSdG+1ux8bfimJeIH1KrtbxGujOunGVjfuWPbyjuOSca0Cy4mvijxU3OCMLLCL00Nst
         xKjLTBrcg+nKvGM994aSmQEsjm7Z3NZzNgCHam6nrRVr0E/PgMZXBPAeqjdZ6ieQM7bn
         v7MA==
X-Gm-Message-State: AOAM5319LftOsiCu/Z6jD2ZJNKOxbNyo31unzx79vt4KtqFxTrTsFyfg
	bbSxN8rbptSJ9o4AVEcGnwUkyuUKk/U=
X-Google-Smtp-Source: ABdhPJweZfD/kcMOGNyB+UEO66o3qVzZTVWJbRcFH0zdrjAcEhhl9389pjL+4LqM1B9kMLjtyGrZyg==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr125284pga.335.1594660032928;
        Mon, 13 Jul 2020 10:07:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5886:34b9:1392:15a2? ([2601:646:9200:4e0:5886:34b9:1392:15a2])
        by smtp.gmail.com with ESMTPSA id l17sm13663033pgn.48.2020.07.13.10.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 10:07:12 -0700 (PDT)
Subject: Re: [oe][meta-networking][PATCH] net-snmp: Fix CVE-2019-20892
To: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200713100529.87717-1-wenlin.kang@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <897ea3df-8c00-90ef-3d7a-6798bfa86792@gmail.com>
Date: Mon, 13 Jul 2020 10:07:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713100529.87717-1-wenlin.kang@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/13/20 3:05 AM, wenlin.kang@windriver.com wrote:
> Fix CVE-2019-20892
> 
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   ...oduce-a-reference-count-in-struct-us.patch | 166 ++++++++++++++++++
>   .../net-snmp/net-snmp_5.8.bb                  |   1 +
>   2 files changed, 167 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
> 
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
> new file mode 100644
> index 000000000..99f02adb7
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
> @@ -0,0 +1,166 @@
> +From 76819d992fdd88e3beb08b79851c6c129da7bc7e Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Fri, 10 Jul 2020 10:48:41 +0800
> +Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
> + usmStateReference
> +
> +This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
> +
> +Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9]
> +CVE: CVE-2019-20892

do we need this on master too ?

> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + include/net-snmp/library/snmpusm.h |  1 +
> + snmplib/snmp_client.c              | 21 +++-------
> + snmplib/snmpusm.c                  | 65 +++++++++++++++++++++---------
> + 3 files changed, 51 insertions(+), 36 deletions(-)
> +
> +diff --git a/include/net-snmp/library/snmpusm.h b/include/net-snmp/library/snmpusm.h
> +index 3f60787..87b31f3 100644
> +--- a/include/net-snmp/library/snmpusm.h
> ++++ b/include/net-snmp/library/snmpusm.h
> +@@ -43,6 +43,7 @@ extern          "C" {
> +      * Structures.
> +      */
> +     struct usmStateReference {
> ++        int             refcnt;
> +         char           *usr_name;
> +         size_t          usr_name_length;
> +         u_char         *usr_engine_id;
> +diff --git a/snmplib/snmp_client.c b/snmplib/snmp_client.c
> +index 2a46351..b2ea891 100644
> +--- a/snmplib/snmp_client.c
> ++++ b/snmplib/snmp_client.c
> +@@ -402,27 +402,16 @@ _clone_pdu_header(netsnmp_pdu *pdu)
> +         return NULL;
> +     }
> +
> +-    if (pdu->securityStateRef &&
> +-        pdu->command == SNMP_MSG_TRAP2) {
> +-
> +-        ret = usm_clone_usmStateReference((struct usmStateReference *) pdu->securityStateRef,
> +-                (struct usmStateReference **) &newpdu->securityStateRef );
> +-
> +-        if (ret)
> +-        {
> ++    sptr = find_sec_mod(newpdu->securityModel);
> ++    if (sptr && sptr->pdu_clone) {
> ++        /* call security model if it needs to know about this */
> ++        ret = sptr->pdu_clone(pdu, newpdu);
> ++        if (ret) {
> +             snmp_free_pdu(newpdu);
> +             return NULL;
> +         }
> +     }
> +
> +-    if ((sptr = find_sec_mod(newpdu->securityModel)) != NULL &&
> +-        sptr->pdu_clone != NULL) {
> +-        /*
> +-         * call security model if it needs to know about this
> +-         */
> +-        (*sptr->pdu_clone) (pdu, newpdu);
> +-    }
> +-
> +     return newpdu;
> + }
> +
> +diff --git a/snmplib/snmpusm.c b/snmplib/snmpusm.c
> +index 3cfa126..4d8edad 100644
> +--- a/snmplib/snmpusm.c
> ++++ b/snmplib/snmpusm.c
> +@@ -285,39 +285,63 @@ free_enginetime_on_shutdown(int majorid, int minorid, void *serverarg,
> + struct usmStateReference *
> + usm_malloc_usmStateReference(void)
> + {
> +-    struct usmStateReference *retval = (struct usmStateReference *)
> +-        calloc(1, sizeof(struct usmStateReference));
> ++    struct usmStateReference *retval;
> ++
> ++    retval = calloc(1, sizeof(struct usmStateReference));
> ++    if (retval)
> ++        retval->refcnt = 1;
> +
> +     return retval;
> + }                               /* end usm_malloc_usmStateReference() */
> +
> ++static int
> ++usm_clone(netsnmp_pdu *pdu, netsnmp_pdu *new_pdu)
> ++{
> ++    struct usmStateReference *ref = pdu->securityStateRef;
> ++    struct usmStateReference **new_ref =
> ++        (struct usmStateReference **)&new_pdu->securityStateRef;
> ++    int ret = 0;
> ++
> ++    if (!ref)
> ++        return ret;
> ++
> ++    if (pdu->command == SNMP_MSG_TRAP2) {
> ++        netsnmp_assert(pdu->securityModel == SNMP_DEFAULT_SECMODEL);
> ++        ret = usm_clone_usmStateReference(ref, new_ref);
> ++    } else {
> ++        netsnmp_assert(ref == *new_ref);
> ++        ref->refcnt++;
> ++    }
> ++
> ++    return ret;
> ++}
> +
> + void
> + usm_free_usmStateReference(void *old)
> + {
> +-    struct usmStateReference *old_ref = (struct usmStateReference *) old;
> +-
> +-    if (old_ref) {
> ++    struct usmStateReference *ref = old;
> +
> +-        SNMP_FREE(old_ref->usr_name);
> +-        SNMP_FREE(old_ref->usr_engine_id);
> +-        SNMP_FREE(old_ref->usr_auth_protocol);
> +-        SNMP_FREE(old_ref->usr_priv_protocol);
> +-
> +-        if (old_ref->usr_auth_key) {
> +-            SNMP_ZERO(old_ref->usr_auth_key, old_ref->usr_auth_key_length);
> +-            SNMP_FREE(old_ref->usr_auth_key);
> +-        }
> +-        if (old_ref->usr_priv_key) {
> +-            SNMP_ZERO(old_ref->usr_priv_key, old_ref->usr_priv_key_length);
> +-            SNMP_FREE(old_ref->usr_priv_key);
> +-        }
> ++    if (!ref)
> ++        return;
> +
> +-        SNMP_ZERO(old_ref, sizeof(*old_ref));
> +-        SNMP_FREE(old_ref);
> ++    if (--ref->refcnt > 0)
> ++        return;
> +
> ++    SNMP_FREE(ref->usr_name);
> ++    SNMP_FREE(ref->usr_engine_id);
> ++    SNMP_FREE(ref->usr_auth_protocol);
> ++    SNMP_FREE(ref->usr_priv_protocol);
> ++
> ++    if (ref->usr_auth_key_length && ref->usr_auth_key) {
> ++        SNMP_ZERO(ref->usr_auth_key, ref->usr_auth_key_length);
> ++        SNMP_FREE(ref->usr_auth_key);
> ++    }
> ++    if (ref->usr_priv_key_length && ref->usr_priv_key) {
> ++        SNMP_ZERO(ref->usr_priv_key, ref->usr_priv_key_length);
> ++        SNMP_FREE(ref->usr_priv_key);
> +     }
> +
> ++    SNMP_FREE(ref);
> + }                               /* end usm_free_usmStateReference() */
> +
> + struct usmUser *
> +@@ -3345,6 +3369,7 @@ init_usm(void)
> +     def->encode_reverse = usm_secmod_rgenerate_out_msg;
> +     def->encode_forward = usm_secmod_generate_out_msg;
> +     def->decode = usm_secmod_process_in_msg;
> ++    def->pdu_clone = usm_clone;
> +     def->pdu_free_state_ref = usm_free_usmStateReference;
> +     def->session_setup = usm_session_init;
> +     def->handle_report = usm_handle_report;
> +--
> +2.18.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> index 192b6b506..c23dcd3cf 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> @@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>              file://reproducibility-have-printcap.patch \
>              file://reproducibility-accept-configure-options-from-env.patch \
>              file://0001-net-snmp-fix-compile-error-disable-des.patch \
> +           file://0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch \
>              "
>   SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
>   SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
> 
> 
> 
> 
