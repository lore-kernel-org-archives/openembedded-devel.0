Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD75C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:27:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.250.1643045252900282782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ty5FImzp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y17so5868632plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=Zsq1PPFPUJZ1H3FX9jRcAzQBRbFntIkG4Meg0EcZHys=;
        b=Ty5FImzpK2veqcGyCooOmws3BtCn1ESyIh4UBxEQukt6OpGJ/0ALovoHMF4F1Wa+4B
         yWqXewe6og5fVp2MDqQ4qdWUKRzoJTTnJ6J8UpPpKG8xM32PIlkhnfBUaghj23XAWHeP
         PAcdi1APTrefPVpO2W/LQwA7D0HAMaRHOhLU7/4Ec9+bEutROhPfoxE9QbWAB570NMJ9
         4oQfCUAkzXZ9c+nIFiJtds1AFzB1vhqhWdSim4M0cQp6Qk3w2S7r7YY8x2Qb2/7SXf2y
         a6N56/IlBrB53O7Xu6Ov60QMquPpylS+CfofMvR5mrUuE9cHO2NBWa70Ir5oKV+7ZQ0D
         9MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Zsq1PPFPUJZ1H3FX9jRcAzQBRbFntIkG4Meg0EcZHys=;
        b=B+eQauZ0sbJ0sQj3anPyB277lvXc4WFKO0ER40vx7OeK4SwMMJe6UOVQzqm0KN32NO
         aIii2hto7aot5kUyQpbER+P19lTL9nt855nzTkLoOExAFWjn4DL8k4ZJIwI6RYC47Gd3
         UsaJwxs6uJt+v7JrrYwUBtI8H6JpaXamOZD6Hna4sHPNJ1bUiM6mQo6SlYVNDvJchCBL
         4T655O4Rm18yMsYH06Le9tO/PicI6+n3wSn5+6Z26sDIOB2P63CczkALsvpkeNyldAyc
         1NwsfdVdaRRxn9GIA88HGGm3OhOG323bKNAy3Xh5sh3YEvtKwKnnadB+IfFzyqZLFAtL
         +maw==
X-Gm-Message-State: AOAM532evljDlGHyWyIOUbFGgDzdYVZMlFmgjt3awNYYBxqyu9Ea5R+O
	drLhmnHKnFNtv7xNbnXzRXo=
X-Google-Smtp-Source: 
 ABdhPJw1sKYjOWNF0C0e5kHiJ070M/+UyK+ugWzoXolQNKtnlzlikjcWyW92Oy8kcmaEEKsoPVU16A==
X-Received: by 2002:a17:90b:4f46:: with SMTP id
 pj6mr2921063pjb.170.1643045252227;
        Mon, 24 Jan 2022 09:27:32 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:a59d:646:7c4d:1d03?
 ([2601:646:9200:a0f0:a59d:646:7c4d:1d03])
        by smtp.gmail.com with ESMTPSA id
 m11sm12455570pgb.15.2022.01.24.09.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 09:27:31 -0800 (PST)
Message-ID: <f340f963-5e8a-239a-00fd-5c8a437c3cf2@gmail.com>
Date: Mon, 24 Jan 2022 09:27:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCHv3 1/2] folks: initial add recipe
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20220123120326.37863-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220123120326.37863-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 17:27:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95040

Please send incremental diff w.r.t. v1 which is now in master.

On 1/23/22 4:03 AM, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../folks/folks_0.15.4.bb                     | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> 
> diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> new file mode 100644
> index 000000000..7dc72f822
> --- /dev/null
> +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Folks is a contact aggregation library."
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +DEPENDS = " \
> +    dbus-glib \
> +    glib-2.0 \
> +    libgee \
> +    libxml2 \
> +    python3-dbusmock-native \
> +"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +GIR_MESON_OPTION = ""
> +
> +PACKAGECONFIG[eds] = "-Deds_backend=true,-Deds_backend=false,evolution-data-server"
> +PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false"
> +PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false"
> +PACKAGECONFIG[telepathy] = "-Dtelepathy_backend=true,-Dtelepathy_backend=false,telepathy-glib"
> +PACKAGECONFIG[import_tool] = "-Dimport_tool=true,-Dimport_tool=false"
> +PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false"
> +
> +PACKAGECONFIG ??= ""
> +
> +inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
> +
> +SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95012): https://lists.openembedded.org/g/openembedded-devel/message/95012
> Mute This Topic: https://lists.openembedded.org/mt/88622607/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

