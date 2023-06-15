Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AC2EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:28:01 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.16824.1686832073282125305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Uh2340s1;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-57026f4bccaso10326157b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686832072; x=1689424072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cTVZibx5lm7Gn8YKYBqFt1QTxyzfG3hp1E3CK1fyp2c=;
        b=Uh2340s1C61vl/eohHRf8zAYmp9E8olsVyDjhCm9Wvdn44ehrj2XPeEnxMYy8khNP0
         fwqxVEwblxn2jU93qluceq9MEqI1VKSErVtbjWqGeRRHdxhLo3Ia9gPWgM2GkGfE/kPc
         iggWSoB0K3IfkGTZ/9e2THiJdVq9hwA/XKU6bMa8LszaSnDRsvKL0gSRAKnU3pkAqUxm
         BduDYxD0J/gEhVwz0D1Q/vMn0z2/Uu3ZQVtVKQrMAz/cSBfKX26TA8mSRG1J73DOMKp1
         +nmP8fVKR7EAGlkxypyo0lG0sBAFXqMmATffBkHGe/LVmATzUSB4mvZZqQ3MA/rhrsal
         318w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686832072; x=1689424072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTVZibx5lm7Gn8YKYBqFt1QTxyzfG3hp1E3CK1fyp2c=;
        b=fmcfMRYSDP3sAx79EvPPVxX8vctGK+yUyWmdIAIfuwnkhD8Vbif1RqnKcKvhTCwwib
         We7lqevBqh7EX6nXNXRYhr8S9zuuNYbD9QtsqhKSBFSlzT6N3fq24vLFmUo+DothXmPc
         m4M1Jq38qfLqPODkMdmvMlawqMKVZtQsxef3yzJRgLURlAdRTuga3SKW4pFvrfNxRgDO
         5nKiuH2LkP54L1rgZm3oGbPpv9a9s4jhDs5gYBXpsOuOOfCzcQuN4xdCA2O9dmCdg4X9
         aWGbyN+uMMitoxl/2Uj/0xdkGnKg50rGRX1O/EdAoyot0RHNik71VA+uCKP35GxPFm0a
         TqEg==
X-Gm-Message-State: AC+VfDw5EKbqwzHfDpJ2dHPqYt4oZe/TzL6sedr5fH0bI1kNVZdBftlC
	b84qTXFY30FqtwZqXtSFxpfHPmYkzWA=
X-Google-Smtp-Source: ACHHUZ4aL5qkUSIrApnkc5nfUIM/EVCFExhcEX3SZbKrjgDwRkZma944VPJsOaBey4OwOANFiD/6lw==
X-Received: by 2002:a81:4f05:0:b0:565:c21d:8ec6 with SMTP id d5-20020a814f05000000b00565c21d8ec6mr5452308ywb.6.1686832072142;
        Thu, 15 Jun 2023 05:27:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b6a3:8a75:3124:ba44? ([2600:1700:9190:ba10:b6a3:8a75:3124:ba44])
        by smtp.gmail.com with ESMTPSA id c5-20020a0df305000000b0056f3779557esm1595453ywf.113.2023.06.15.05.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:27:51 -0700 (PDT)
Message-ID: <b9cceb7e-f184-fce1-c850-1d636fed0224@gmail.com>
Date: Thu, 15 Jun 2023 08:27:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe][meta-oe][dunfell][PATCH] openldap: Fix CVE-2023-2953
Content-Language: en-US
To: Vijay Anusuri <vanusuri@mvista.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1765B238F36B7A92.7352@lists.openembedded.org>
 <CANQUz18mSykrNnyHYpY3pkCk5FSY1ErknzhWUDwOhR=ddN603A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CANQUz18mSykrNnyHYpY3pkCk5FSY1ErknzhWUDwOhR=ddN603A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 12:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103303

its staged in stable/dunfell-nut

- armin

On 6/13/23 4:24 AM, Vijay Anusuri wrote:
> Hi Steve,
>
> Any update on this ?
>
> Thanks & Regards,
> Vijay
>
> On Mon, Jun 5, 2023 at 12:49 PM Vijay Anusuri via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <vanusuri=mvista.com@lists.openembedded.org> wrote:
>
>     From: Vijay Anusuri <vanusuri@mvista.com>
>
>     Upstream-Status: Backport
>     [https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce
>     &
>     <https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce&>
>     https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]
>
>     Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     ---
>      .../openldap/openldap/CVE-2023-2953-1.patch   | 30 ++++++++
>      .../openldap/openldap/CVE-2023-2953-2.patch   | 76
>     +++++++++++++++++++
>      .../openldap/openldap_2.4.57.bb <http://openldap_2.4.57.bb>      
>            |  2 +
>      3 files changed, 108 insertions(+)
>      create mode 100644
>     meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>      create mode 100644
>     meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>
>     diff --git
>     a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>     b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>     new file mode 100644
>     index 000000000..f4b4eb95d
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>     @@ -0,0 +1,30 @@
>     +From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00
>     2001
>     +From: Howard Chu <hyc@openldap.org>
>     +Date: Wed, 24 Aug 2022 14:40:51 +0100
>     +Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
>     +
>     +Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
>     +
>     +Upstream-Status: Backport
>     [https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce]
>     +CVE: CVE-2023-2953
>     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     +---
>     + libraries/libldap/fetch.c | 2 ++
>     + 1 file changed, 2 insertions(+)
>     +
>     +diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c
>     +index 9e426dc647..536871bcfe 100644
>     +--- a/libraries/libldap/fetch.c
>     ++++ b/libraries/libldap/fetch.c
>     +@@ -69,6 +69,8 @@ ldif_open_url(
>     +               }
>     +
>     +               p = ber_strdup( urlstr );
>     ++              if ( p == NULL )
>     ++                      return NULL;
>     +
>     +               /* But we should convert to LDAP_DIRSEP before use */
>     +               if ( LDAP_DIRSEP[0] != '/' ) {
>     +--
>     +GitLab
>     +
>     diff --git
>     a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>     b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>     new file mode 100644
>     index 000000000..02c43bc44
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>     @@ -0,0 +1,76 @@
>     +From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00
>     2001
>     +From: Howard Chu <hyc@openldap.org>
>     +Date: Thu, 25 Aug 2022 16:13:21 +0100
>     +Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup
>     failure
>     +
>     +Avoid unnecessary strdup in IPv6 addr parsing, check for strdup
>     +failure when dup'ing scheme.
>     +
>     +Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59
>     +
>     +Upstream-Status: Backport
>     [https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]
>     +CVE: CVE-2023-2953
>     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     +---
>     + libraries/libldap/url.c | 21 ++++++++++++---------
>     + 1 file changed, 12 insertions(+), 9 deletions(-)
>     +
>     +diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
>     +index dcf2aac9e8..493fd7ce47 100644
>     +--- a/libraries/libldap/url.c
>     ++++ b/libraries/libldap/url.c
>     +@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(
>     +               }
>     +               ludp->lud_port = port;
>     +               ludp->lud_host = specs[i];
>     +-              specs[i] = NULL;
>     +               p = strchr(ludp->lud_host, ':');
>     +               if (p != NULL) {
>     +                       /* more than one :, IPv6 address */
>     +                       if ( strchr(p+1, ':') != NULL ) {
>     +                               /* allow [address] and
>     [address]:port */
>     +                               if ( *ludp->lud_host == '[' ) {
>     +-                                      p =
>     LDAP_STRDUP(ludp->lud_host+1);
>     +-                                      /* copied, make sure we
>     free source later */
>     +-                                      specs[i] = ludp->lud_host;
>     +-                                      ludp->lud_host = p;
>     +-                                      p = strchr(
>     ludp->lud_host, ']' );
>     ++                                      p = strchr(
>     ludp->lud_host+1, ']' );
>     +                                       if ( p == NULL ) {
>     +  LDAP_FREE(ludp);
>     +  ldap_charray_free(specs);
>     +                                               return
>     LDAP_PARAM_ERROR;
>     +                                       }
>     +-                                      *p++ = '\0';
>     ++                                      /* Truncate trailing ']'
>     and shift hostname down 1 char */
>     ++                                      *p = '\0';
>     ++                                      AC_MEMCPY( ludp->lud_host,
>     ludp->lud_host+1, p - ludp->lud_host );
>     ++                                      p++;
>     +                                       if ( *p != ':' ) {
>     +                                               if ( *p != '\0' ) {
>     +  LDAP_FREE(ludp);
>     +@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(
>     +                               }
>     +                       }
>     +               }
>     +-              ldap_pvt_hex_unescape(ludp->lud_host);
>     +               ludp->lud_scheme = LDAP_STRDUP("ldap");
>     ++              if ( ludp->lud_scheme == NULL ) {
>     ++                      LDAP_FREE(ludp);
>     ++                      ldap_charray_free(specs);
>     ++                      return LDAP_NO_MEMORY;
>     ++              }
>     ++              specs[i] = NULL;
>     ++              ldap_pvt_hex_unescape(ludp->lud_host);
>     +               ludp->lud_next = *ludlist;
>     +               *ludlist = ludp;
>     +       }
>     +
>     +       /* this should be an array of NULLs now */
>     +-      /* except entries starting with [ */
>     +       ldap_charray_free(specs);
>     +       return LDAP_SUCCESS;
>     + }
>     +--
>     +GitLab
>     +
>     diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>     <http://openldap_2.4.57.bb>
>     b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>     <http://openldap_2.4.57.bb>
>     index e3e9caa1b..1e7e6b3d7 100644
>     --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>     <http://openldap_2.4.57.bb>
>     +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>     <http://openldap_2.4.57.bb>
>     @@ -24,6 +24,8 @@ SRC_URI =
>     "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>          file://openldap-CVE-2015-3276.patch \
>          file://remove-user-host-pwd-from-version.patch \
>          file://CVE-2022-29155.patch \
>     +    file://CVE-2023-2953-1.patch \
>     +    file://CVE-2023-2953-2.patch \
>      "
>      SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
>      SRC_URI[sha256sum] =
>     "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
>     -- 
>     2.25.1
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103263): https://lists.openembedded.org/g/openembedded-devel/message/103263
> Mute This Topic: https://lists.openembedded.org/mt/99335615/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


