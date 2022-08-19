Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DBCC00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 03:20:55 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.51004.1660879254004620678
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 20:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EjSqVJkY;
 spf=pass (domain: gmail.com, ip: 209.85.166.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id 62so2488722iov.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 20:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nvj05Ay1tjaCNzeqBZu+mRX36yVhAO0qLSJVK1DLhEU=;
        b=EjSqVJkY8PNK8icarUyC90cPstxygV3Fl0w08SMfCaqtm1imHHnJl3GCzjN7knPi5t
         f+EzJ+wY1+hvXE/7RuUXoF3574kPJq2y1V5ezuetySzez62u/3ktH03myvmp/XYmDtAk
         Na7rYSmUNtbVC/2o3Hwp3GX4+VBPjXOaAZuvRxZgKHm3vAGyEbtNrmmceLxC+YCMVoIN
         XkZgezDI8DOYcC+v6qh9CvOG3YJnYNKDFVllwSgGssUI9I7AGpqXUWNGt22HSboynwkP
         fHx8MC0khE4M4n0CRWtdeb/OvzIEu0eKuGrLa6malQK/Lr9oCpSKge4jXtNECTwYBfqC
         rGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nvj05Ay1tjaCNzeqBZu+mRX36yVhAO0qLSJVK1DLhEU=;
        b=Pf/fB/PRKqQEVlEM/IoXPLoDtGbPK82CGwf4PK8a4MGfcb8LXLvdv6F7ArEKjtApil
         1lmaxOk5DIZPNTkaL4oS2CaB/wAGGi+OJyevF2skpmx5BiJlIUHTuS4g6uRmaj4xKS2x
         ZuzA267mUpT62mhFDCONA807YZ+PbUvBCSOnWWmsXBzvF63DR9MAMoaQFawc56Pru+PO
         wVjK/HNL0ySrvUsfNeLV12yDFQ7Btn3aFQETNdPG8ifRu1BnWZ4IQIqcf75QyATi90/w
         sJjvDtu7ElXYat/OXUKtaaKhS1mr7o/jA6M8KTeQo/l8F+UNU3ShIEAGrfVJuPUhPbKS
         xGEQ==
X-Gm-Message-State: ACgBeo1LrUAdzedsvjy7ijfnHK531HqqGGmuyJiVAV0Ak3IivDem77zN
	7XL89dg4Ajd+Xz0n1zJXEek=
X-Google-Smtp-Source: 
 AA6agR7kJpaDWLGs/QQuYcvf8adT6fmH7cJMmPdfmGv87qtXisnbPSwhhRP1dZWAdm517AR/9gBZTA==
X-Received: by 2002:a05:6602:2d53:b0:689:60e8:a644 with SMTP id
 d19-20020a0566022d5300b0068960e8a644mr716986iow.35.1660879253268;
        Thu, 18 Aug 2022 20:20:53 -0700 (PDT)
Received: from [10.0.8.174] ([65.152.59.42])
        by smtp.gmail.com with ESMTPSA id
 y4-20020a926404000000b002dd10ca9272sm1307998ilb.24.2022.08.18.20.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 20:20:52 -0700 (PDT)
Message-ID: <cd26dfd1-ee17-f4df-bed2-1fa774456f54@gmail.com>
Date: Thu, 18 Aug 2022 21:20:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libcoap: Add recipe
Content-Language: en-US
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, Alex Kiernan <alexk@zuma.ai>,
 Khem Raj <raj.khem@gmail.com>
References: <20220818050625.3864654-1-muhammad_hamza@mentor.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220818050625.3864654-1-muhammad_hamza@mentor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 03:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98321

Muhammad,

Thanks for sending the patch. Per our stable process, we do not add new 
packages.

- armin

On 8/17/22 22:06, Muhammad Hamza wrote:
> From: Alex Kiernan <alex.kiernan@gmail.com>
>
> libcoap implements a lightweight application-protocol for devices that
> are constrained their resources such as computing power, RF range,
> memory, bandwith, or network packet sizes.
>
> Upstream-Status: Backport from
> https://github.com/openembedded/meta-openembedded/commit/1556da89029c364bea101e782bdd016b69cddb82
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>   ...alance-SESSIONS_ADD-and-SESSIONS_DEL.patch | 51 ++++++++++++++++
>   ...0001-libcoap-Fix-gnu-configize-error.patch | 44 ++++++++++++++
>   .../libcoap/libcoap/run-ptest                 |  7 +++
>   .../recipes-devtools/libcoap/libcoap_4.3.0.bb | 58 +++++++++++++++++++
>   4 files changed, 160 insertions(+)
>   create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
>   create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
>   create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
>   create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
>
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
> new file mode 100644
> index 000000000..c8ac8485a
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
> @@ -0,0 +1,51 @@
> +From c56a64ff4df7eecb6c88ff929497bcd0d65934f2 Mon Sep 17 00:00:00 2001
> +From: Jon Shallow <supjps-libcoap@jpshallow.com>
> +Date: Fri, 22 Apr 2022 13:15:39 +0100
> +Subject: [PATCH] coap_session.c: Balance SESSIONS_ADD and SESSIONS_DELETE
> + usage
> +
> +Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/7e20aa9ef17277f39203334404e6c776b1171a7d]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> +---
> + src/coap_session.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/src/coap_session.c b/src/coap_session.c
> +index 77cae598f0af..536e57573361 100644
> +--- a/src/coap_session.c
> ++++ b/src/coap_session.c
> +@@ -813,6 +813,12 @@ coap_session_create_client(
> +   return session;
> +
> + error:
> ++  /*
> ++   * Need to add in the session as coap_session_release()
> ++   * will call SESSIONS_DELETE in coap_session_free().
> ++   */
> ++  if (session)
> ++    SESSIONS_ADD(ctx->sessions, session);
> +   coap_session_release(session);
> +   return NULL;
> + }
> +@@ -1133,11 +1139,17 @@ coap_session_t *coap_new_server_session(
> +   if (session) {
> +     coap_log(LOG_DEBUG, "***%s: new incoming session\n",
> +              coap_session_str(session));
> ++    /* Returned session may already have been released and is now NULL */
> +     session = coap_session_accept(session);
> +   }
> +   return session;
> +
> + error:
> ++  /*
> ++   * Need to add in the session as coap_session_release()
> ++   * will call SESSIONS_DELETE in coap_session_free().
> ++   */
> ++  SESSIONS_ADD(ep->sessions, session);
> +   coap_session_free(session);
> +   return NULL;
> + }
> +--
> +2.35.1
> +
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
> new file mode 100644
> index 000000000..64f8d3acc
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
> @@ -0,0 +1,44 @@
> +From 25f1bebf1bc4c8da47f976d24a7a424253744e2e Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alex.kiernan@gmail.com>
> +Date: Wed, 24 Mar 2021 09:10:17 +0000
> +Subject: [PATCH] libcoap: Fix gnu-configize error
> +
> +Fix:
> +
> +  autoreconf: running: gnu-configize
> +  gnu-configize: 'configure.ac' or 'configure.in' is required
> +  autoreconf: gnu-configize failed with exit status: 1
> +
> +We're not pulling in the ext/tinydtls submodule, so this fails.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> +---
> + configure.ac | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9f51f4c67557..559808e03aa2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -472,19 +472,6 @@ if test "x$build_dtls" = "xyes"; then
> +         have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +     fi
> +
> +-    # The user wants to use explicit TinyDTLS if '--with-tinydtls was set'.
> +-    if test "x$with_tinydtls" = "xyes" ; then
> +-        if test -d "$srcdir/ext/tinydtls"; then
> +-           AC_CONFIG_SUBDIRS([ext/tinydtls])
> +-           have_tinydtls="yes"
> +-         else
> +-           have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-         fi
> +-         have_gnutls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-         have_openssl="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-         have_mbedtls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-    fi
> +-
> +     if test "$TLSCOUNT" -eq 0; then
> +       # The user hasn't requested the use of a specific cryptography library
> +       # we try first GnuTLS for usability ...
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
> new file mode 100644
> index 000000000..b56ffe68f
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +if /usr/lib/libcoap/ptest/testdriver; then
> +	echo "PASS: libcoap"
> +else
> +	echo "FAIL: libcoap"
> +fi
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
> new file mode 100644
> index 000000000..aba81d126
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
> @@ -0,0 +1,58 @@
> +SUMMARY = "A C implementation of the Constrained Application Protocol"
> +DESCRIPTION = "libcoap implements a lightweight application-protocol for \
> +devices that are constrained their resources such as computing power, \
> +RF range, memory, bandwith, or network packet sizes."
> +HOMEPAGE ="https://libcoap.net/"
> +
> +LICENSE = "BSD-2-Clause & BSD-1-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e44b3af4925ec58e9f49b9ff143b5493"
> +
> +SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
> +           file://0001-libcoap-Fix-gnu-configize-error.patch \
> +           file://0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch \
> +           file://run-ptest \
> +           "
> +SRCREV = "1da37b9abbe871675d5939395b498324ccc8ecfe"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools manpages pkgconfig ptest
> +
> +PACKAGECONFIG ?= "\
> +    async openssl tcp \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> +"
> +PACKAGECONFIG[async] = "--enable-async,--disable-async"
> +PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,openssl mbedtls"
> +PACKAGECONFIG[manpages] = "--enable-documentation --enable-doxygen --enable-manpages,--disable-documentation,asciidoc-native doxygen-native graphviz-native"
> +PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,gnutls openssl"
> +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,gnutls mbedtls"
> +PACKAGECONFIG[small-stack] = "--enable-small-stack,--disable-small-stack"
> +PACKAGECONFIG[tcp] = "--enable-tcp,--disable-tcp"
> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
> +
> +EXTRA_OECONF = "\
> +    --with-epoll --enable-add-default-names \
> +    --without-tinydtls \
> +    ${@bb.utils.contains_any('PACKAGECONFIG', 'gnutls openssl mbedtls', '--enable-dtls', '--disable-dtls', d)} \
> +"
> +
> +python () {
> +    if d.getVar('PTEST_ENABLED') == "1":
> +        d.setVar('DISABLE_STATIC', '')
> +}
> +
> +export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
> +
> +do_install_ptest () {
> +	install -d ${D}${PTEST_PATH}
> +	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +	install -m 0755 ${B}/tests/testdriver ${D}${PTEST_PATH}/testdriver
> +}
> +
> +PACKAGE_BEFORE_PN += "\
> +    ${PN}-bin \
> +"
> +
> +FILES:${PN}-bin = "${bindir}"
> +FILES:${PN}-dev += "${datadir}/${BPN}/examples"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98315): https://lists.openembedded.org/g/openembedded-devel/message/98315
> Mute This Topic: https://lists.openembedded.org/mt/93098261/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


