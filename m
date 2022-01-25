Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE24C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:21:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.126.1643131266395969961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gefuxk0W;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d1so19951073plh.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=3vyNzwGJpOrH0dqxfnlqvXCGoANr7uOIja2ipb2dzDY=;
        b=Gefuxk0WyikOENLV7YNu3YOY4I+zXQuWsEIB7AueV5cmnvV/+Y8s0q5WEJTY6uyXx4
         9QJeBmTebOQEfVgiJ+FOvm5ODE2bPWEcmSIndzpAiEAxEPq2KyPBRMgu9unRu1idiqO9
         a9N3FwCDFEFvYyZv0VuZqbzD3GfKo0IaC6yCSkQBKQ6vW9K+S51NnnOYNgowh053X1v7
         XV6+b6ldcqVer32jsWu3AdiH2dumJo1FT/inTLEyVkkikX7Aelig8iuehxV81DONnqPy
         u93DCsbfMDQ6yiiorQvgvE4KtypP7AR1bKIeqMjLfAMGeMmypo6sqfP4tTFHPVrIOgzx
         vPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3vyNzwGJpOrH0dqxfnlqvXCGoANr7uOIja2ipb2dzDY=;
        b=02x8tnTiwmkCA+Yj4sat6o3UqrmjD0/2wUEbg1uGKetu8S4YX4gmn/m7iUCOBJI9Ty
         +f1ALQWEKWTsYBQ2/n0TmscbVlEGe4FamJfFAFPrikUtjWQltkxEbf6PxR/4I3yjpMUu
         uo3pLyX9z1RaDY7sOWcJ6AjXiLjCRd0R/AohEL+++K1uaOXTUkFOy2Wo7BSZEJe03BCZ
         4RueS2VG6rymCM46T+sRBi9UvUtsHIy/kfryNScwmBRXiNvrtr0z/p7R9wuYvprBBCYL
         QPypJ/A0j21l+RyWSr+QzkwX8+D0Mlh47LxekLMTZG9dDquAc6azuzpFo3JS1qBmaxOa
         RyAQ==
X-Gm-Message-State: AOAM533x+Fc9AlXZmx+uJA5Z3LjMMAdYwfGYuhlDidhb12LUTSEJOyug
	63W99OA/lIDh/XWQXyVdJ3A=
X-Google-Smtp-Source: 
 ABdhPJz1MAlUt/bdpg+3qwpfgeZG7nQuB2KXexp9Cfvk5SOMWBVc3fX29Z+LByZ45hRvJ8/28J5uhA==
X-Received: by 2002:a17:902:7b87:b0:14a:bf7b:84da with SMTP id
 w7-20020a1709027b8700b0014abf7b84damr19591465pll.89.1643131265667;
        Tue, 25 Jan 2022 09:21:05 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:ad6e:7448:8ce5:b987?
 ([2601:646:9200:a0f0:ad6e:7448:8ce5:b987])
        by smtp.gmail.com with ESMTPSA id
 b21sm14598881pgi.51.2022.01.25.09.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 09:21:05 -0800 (PST)
Message-ID: <04bbefe7-9181-e639-2fda-f5ef3075b770@gmail.com>
Date: Tue, 25 Jan 2022 09:21:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] folks: disable tests; fix dependencies
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20220125062503.19073-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220125062503.19073-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:21:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95077



On 1/24/22 10:25 PM, Markus Volk wrote:
> disable tests and remove the now unneeded python3 dbusmock module
> add libebook dependency to all backends that need it
> ---
>   meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> index 7dc72f822..1144ea8fc 100644
> --- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>       glib-2.0 \
>       libgee \
>       libxml2 \
> -    python3-dbusmock-native \
>   "
>   
>   GNOMEBASEBUILDCLASS = "meson"
> @@ -16,14 +15,16 @@ GNOMEBASEBUILDCLASS = "meson"
>   REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>   GIR_MESON_OPTION = ""
>   
> +EXTRA_OEMESON += "-Dtests=false"

this could also be a packageconfig, which is enabled when ptest is in 
DISTRO_FEATURE

> +
>   PACKAGECONFIG[eds] = "-Deds_backend=true,-Deds_backend=false,evolution-data-server"
> -PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false"
> -PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false"
> +PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false,evolution-data-server"
> +PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false,evolution-data-server"
>   PACKAGECONFIG[telepathy] = "-Dtelepathy_backend=true,-Dtelepathy_backend=false,telepathy-glib"
>   PACKAGECONFIG[import_tool] = "-Dimport_tool=true,-Dimport_tool=false"
>   PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false"
>   
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "telepathy"
>   
>   inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95049): https://lists.openembedded.org/g/openembedded-devel/message/95049
> Mute This Topic: https://lists.openembedded.org/mt/88666737/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

