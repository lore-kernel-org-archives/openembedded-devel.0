Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389D5C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 09:44:56 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.9085.1644313495736633761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 01:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nYiAkyQD;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id t17so14117142qto.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOwckczrDD24KbI95UPtxNhb5AJd4nP1nuiC7XSN0DY=;
        b=nYiAkyQDrPeOXtSbc13nO6ieukbe8qToJS1umbbSuEqFeb/9op6Af8eb6o6k555qvw
         COXmaNwjCsbBbBvWGw2SSbgo/C5vSFaDJQRcbI+wNhl6weP7raOEjuj84iFzk2jBNZG6
         nBL8Erq/Gi61TPPUJfr7YTpZANHAIzZn+5YGJNKasHtxwAILlNkGDYh8gWl9xhS9UQDf
         NEwbfg1LgAheFQMbP6uxVM9N7kiNtgRJoi86qD2SSkfzNAfJHsAd/ACy1kc3+FYIlDzg
         2EJPWTc44y/BS+kalxGFvbp0Dk0p6uDX8VA26+wpLvFOH9qfPWxQgMgSJXJSS55oHnW7
         MRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOwckczrDD24KbI95UPtxNhb5AJd4nP1nuiC7XSN0DY=;
        b=VhqNOXxqozAEmkV7r2VKBLGbRSPmtSe8S+k8Z/dL0961M64EmXTdWH+c8LbbIO5pNe
         9aEqQ++6rkNSdFitBtPFJik4anIkX5D0dE7zNAv/ipARtXp0dMIENbSIDjibjh65nwL0
         DdEazyJfrWqleCjqL5bdFQoDP91WSmlkxz3Ctof9E5cKBPbl4mj4Rwy+scVrAORJoVCJ
         na4UhDvYBVJisH5Kql9Lyn4HYPd5J0FqP84MJIHqaoTQr3L9J6EexG1nWajNbLOyARfr
         0IqQNxOLBBUZia6ej3RT+UzspYOhjOAj3uQF8oGO+qBgPb09vou+I7y4OsXfmqh4BXr8
         5VTg==
X-Gm-Message-State: AOAM531rnxcj9xPVzKv0eu76nMuGHzHXHF5S8yOZQuq5tfz2PaXplyZY
	lblFseO3WqUm0yQqQgNFJ0knGfUmmHoMQc/nJwMXcKGt+2FxAQ==
X-Google-Smtp-Source: 
 ABdhPJwkk0fZEnbFFR7OdMwtRgfvPe4ywue1fJQJ0BLTptr3r8FkIeqJ7gCSuUvW2sZQCkDN2v2g5/WUXF8tWiszlJw=
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr2328644qty.229.1644313494504;
 Tue, 08 Feb 2022 01:44:54 -0800 (PST)
MIME-Version: 1.0
References: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
 <1644279908-4266-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1644279908-4266-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 01:44:28 -0800
Message-ID: 
 <CAMKF1sqoxaHv2mrHbpNcVDETkanDAD7vHZH3_E970+T+huiZzg@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] ndpi: upgrade 4.0 -> 4.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 09:44:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95261

this fails ntopng build see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1411

Can you take a look ?

On Mon, Feb 7, 2022 at 4:25 PM wangmy <wangmy@fujitsu.com> wrote:
>
> refresh 0001-autogen.sh-not-generate-configure.patch
>
> Changelog:
> =========
> New Features
> -----------
> Add a "confidence" field indicating the reliability of the classification
> Add risk exceptions for services and domain names via ndpi_add_domain_risk_exceptions()
> Add ability to report whether a protocol is encrypted
>
> New Supported Protocols and Services
> -----------------------------------
> Add protocol detection for:
> Badoo
> Cassandra
> EthernetIP
>
> Improvements
> ------------
> Significantly reduced memory footprint from 2.94 KB to 688 B per flow
> Improve protocol detection for:
> BitTorrent
> ICloud Private Relay
> IMAP, POP3, SMTP
> Log4J/Log4Shell
> Microsoft Azure
> Pandora TV
> RTP
> RTSP
> Salesforce
> STUN
> Whatsapp
> QUICv2
> Zoom
> Add flow risk:
> NDPI_CLEAR_TEXT_CREDENTIALS
> NDPI_POSSIBLE_EXPLOIT (Log4J)
> NDPI_TLS_FATAL_ALERT
> NDPI_TLS_CERTIFICATE_ABOUT_TO_EXPIRE
> Update WhatsAPP and Instagram addresses
> Update the list of default ports for QUIC
> Update WindowsUpdate URLs
> Add support for the .goog Google TLD
> Add googletagmanager.com
> Add bitmaps and API for handling compressed bitmaps
> Add JA3 in risk exceptions
> Add entropy calculation to check for suspicious (encrypted) payload
> Add extraction of hostname in SMTP
> Add RDP over UDP dissection
> Add support for TLS over IPV6 in Subject Alt Names field
> Improve JSON and CSV serialization
> Improve IPv6 support for almost all dissectors
> Improve CI and unit tests, add arm64, armhf and s390x as part of CI
> Improve WHOIS detection, reduce false positives
> Improve DGA detection for skipping potential DGAs of known/popular domain names
> Improve user agent analysis
> Reworked HTTP protocol dissection including HTTP proxy and HTTP connect
>
> Changes
> --------
> TLS obsolete protocol is set when TLS < 1.2 (used to be 1.1)
> Numeric IPs are not considered for DGA checks
> Differentiate between standard Amazon stuff (i.e market) and AWS
> Remove Playstation VUE protocol
> Remove pandora.tv from Pandora protocol
> Remove outdated SoulSeek dissector
>
> Fixes
> -----
> Fix race conditions
> Fix dissectors to be big-endian friendly
> Fix heap overflow in realloc wrapper
> Fix errors in Kerberos, TLS, H323, Netbios, CSGO, Bittorrent
> Fix wrong tuple comparison
> Fix ndpi_serialize_string_int64
> Fix Grease values parsing
> Fix certificate mismatch check
> Fix null-dereference read for Zattoo with IPv6
> Fix dissectors initialization for XBox, Diameter
> Fix confidence for STUN classifications
> Fix FreeBSD support
> Fix old GQUIC versions on big-endian machines
> Fix aho-corasick on big-endian machines
> Fix DGA false positive
> Fix integer overflow for QUIC
> Fix HTTP false positives
> Fix SonarCloud-CI support
> Fix clashes setting the hostname on similar protocols (FTP, SMTP)
> Fix some invalid TLS guesses
> Fix crash on ARM (Raspberry)
> Fix DNS (including fragmented DNS) dissection
> Fix parsing of IPv6 packets with extension headers
> Fix extraction of Realm attribute in STUN
> Fix support for START-TLS sessions in FTP
> Fix TCP retransmissions for multiple dissectors
> Fix DES initialisation
> Fix Git protocol dissection
> Fix certificate mismatch for TLS flows with no client hello observed
> Fix old versions of GQUIC on big-endian machines
>
> Misc
> ----
> Add tool for generating automatically the Azure IP list
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...001-autogen.sh-not-generate-configure.patch | 18 ++++++++----------
>  .../ntopng/{ndpi_4.0.bb => ndpi_4.2.bb}        |  6 +++---
>  2 files changed, 11 insertions(+), 13 deletions(-)
>  rename meta-networking/recipes-support/ntopng/{ndpi_4.0.bb => ndpi_4.2.bb} (82%)
>
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> index 1cbf059efd..d5c7f5f1cc 100644
> --- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> +++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> @@ -12,26 +12,24 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  refresh patch to 4.0
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> - autogen.sh | 9 ---------
> - 1 file changed, 9 deletions(-)
> + autogen.sh | 7 -------
> + 1 file changed, 7 deletions(-)
>
>  diff --git a/autogen.sh b/autogen.sh
> -index cf5d7057..cb73cf9d 100755
> +index 0aa7507..36e0423 100755
>  --- a/autogen.sh
>  +++ b/autogen.sh
> -@@ -52,12 +52,3 @@ cat configure.seed | sed \
> -     -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
> -     -e "s/@FUZZY@/$FUZZY/g" \
> -     > configure.ac
> +@@ -33,10 +33,3 @@ if test -z $PKG_CONFIG; then
> +     echo "pkg-config is missing: please install it (apt-get install pkg-config) and try again"
> +     exit
> + fi
>  -
>  -autoreconf -ivf
> --cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed "s/#define VERSION/#define NDPI_VERSION/g"  > configure.tmp
> --cat configure.tmp > configure
>  -
>  -echo "./configure $@"
>  -chmod +x configure
>  -./configure $@
>  -
>  --
> -2.17.1
> +2.25.1
>
> diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.0.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> similarity index 82%
> rename from meta-networking/recipes-support/ntopng/ndpi_4.0.bb
> rename to meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> index 960c4c2012..352d2d2426 100644
> --- a/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
> +++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> @@ -8,10 +8,10 @@ RDEPENDS:${PN} += " libpcap"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>
> -SRCREV = "dabab0e9515c2e6a71a91bdc807453e416f831ca"
> -SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.0-stable;protocol=https \
> +SRCREV = "8b5c6af71b562549f8416b31803daae223e09f46"
> +SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.2-stable;protocol=https \
>             file://0001-autogen.sh-not-generate-configure.patch \
> -"
> +           "
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95252): https://lists.openembedded.org/g/openembedded-devel/message/95252
> Mute This Topic: https://lists.openembedded.org/mt/88986552/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

