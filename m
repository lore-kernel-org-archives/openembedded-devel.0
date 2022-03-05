Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04480C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 18:53:24 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.8289.1646506402875469195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hi+7oo/o;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 27so10177091pgk.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5vAaP2kk2UjT4m7EEH6kfBYuXWCPUNxvrlhjD+LEnzo=;
        b=hi+7oo/ow0ZZbmhlOyceSLzs/yf41ooPTBs8QrIvTxpOLtr5PCiy38Wso3x9XothID
         8j6oV4Rybro9MVhtITmXYqAdKL4FrkS/ek1vG49yAy8UzHCo1j+U7o4gp64Dl/c16+6T
         ahaNm7zZbPIvXOxCiIA3rbHM4kdx5AKLGhGN0CqirjV7VU9W+GkDr9aYIjccZZ4213j3
         MSN0TYxCEnup1dpN67IjjSBk0okyPJRTo9LiVjwJlr/+9X0Tk86FTBOptWVSlXKA7wVz
         0yTtBN/XRE1mSnQGLHlqvQ+Y0s3pkKZQi0XChUJb2zdE94h5airpi9lzZwtgS70UN5Ce
         lBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5vAaP2kk2UjT4m7EEH6kfBYuXWCPUNxvrlhjD+LEnzo=;
        b=KOhQ5dhQnZrkNgdMfCNGVExSAKVdIxkBtawvCh2v0ZFmZjWWfsT0voNlLiGOvHjqNo
         BJZJ9l23eJOqKADLSRvbINXaxZ/2sX1V57/hFrGP3owjva27ZYatYuDP+Tt6PASXwdvH
         SeVaB5whd7rkf0g0tcOz0ZVFIhnQvbp5x8i47F5Ex5zrutn3OOF4ohMAZzYVdaSL2HDS
         scEkUSfqivBib3h6+HqdwHwe+v529KITHbzgD8de9s5ZpQUnKfY+UE36nyIw9yOvrHR5
         fqkuS34FmrnANpvvVioDTm5g/FnU4WxO89bnRqfUbSTLVNwE9y9GpVUEvESKyKET/iG7
         5cug==
X-Gm-Message-State: AOAM530KBM5oOwvDBDTh0PNatsQXTabJ3xBL3RSuK628+yS7/n5uqFin
	CAzFhVSWXwd5uf90Lj1cVKs=
X-Google-Smtp-Source: 
 ABdhPJzg4a0pRtEbyZ1s5M3qlUMCRHWH+KUD9tftAUUqVNuR2IT9w3TXy+p8Pp3UwI4faPWknWCEKw==
X-Received: by 2002:a63:c04c:0:b0:363:d7b7:1cb7 with SMTP id
 z12-20020a63c04c000000b00363d7b71cb7mr3577054pgi.309.1646506402355;
        Sat, 05 Mar 2022 10:53:22 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:2999:fd67:72a5:6dc5?
 ([2601:202:4180:a5c0:2999:fd67:72a5:6dc5])
        by smtp.gmail.com with ESMTPSA id
 nv9-20020a17090b1b4900b001bf46719b8asm1428490pjb.2.2022.03.05.10.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 10:53:21 -0800 (PST)
Message-ID: <777eceb3-6341-21ef-34f4-00e6c552d96c@gmail.com>
Date: Sat, 5 Mar 2022 10:53:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe][meta-oe][dunfell][PATCH] p7zip: build and package lib7z.so
 needed for fastboot
Content-Language: en-US
To: akash.hadke@kpit.com, openembedded-devel@lists.openembedded.org,
 raj.khem@gmail.com
Cc: ranjitsinh.rathod@kpit.com, Nisha Parrakat <nishaparrakat@gmail.com>,
 Nisha Parrakat <Nisha.Parrakat@kpit.com>, Akash Hadke <hadkeakash4@gmail.com>
References: <1646210995-8717-1-git-send-email-akash.hadke@kpit.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <1646210995-8717-1-git-send-email-akash.hadke@kpit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 18:53:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95804



On 3/2/22 00:49, akash hadke via lists.openembedded.org wrote:
> From: Nisha Parrakat <nishaparrakat@gmail.com>
>
> a) use option 7z to build the lib7z.so library
> This is needed for android-tools for building fastboot
> from android-tools
>
> b) Packaged the lib7z.so and codec libraries as a part of this recipe
> Fastboot RDepends on it lib7z.so
>
> c) Fixed a C++17 forbidden error when lib7z.so is built
>
> fixes the below error
>
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> |   308 |           numMethods++;
> |       |           ^~~~~~~~~~
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> |   318 |         numMethods++;
>
> Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Akash Hadke <Akash.Hadke@kpit.com>
> Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
> (cherry picked from commit 3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd)
> ---
>   .../change_numMethods_from_bool_to_unsigned.patch  | 25 ++++++++++++++++++++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb      | 21 ++++++++++++++++--
>   2 files changed, 44 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>
> diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> new file mode 100644
> index 0000000..edde525
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> @@ -0,0 +1,25 @@
> +fixes the below error
> +
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> +|   308 |           numMethods++;
> +|       |           ^~~~~~~~~~
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> +|   318 |         numMethods++;
> +
> +
> +use unsigned instead of bool

Missing "Upstream-Status":

-armin
> +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> +
> +Upstream-Status: Pending
> +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402701 +0000
> ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604125 +0000
> +@@ -298,7 +298,7 @@
> +
> +       AString res;
> +
> +-      bool numMethods = 0;
> ++      unsigned numMethods = 0;
> +       for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
> +       {
> +         if (methodMask & ((UInt32)1 << i
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> index ebe32f1..8984f96 100644
> --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> @@ -9,6 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
>              file://do_not_override_compiler_and_do_not_strip.patch \
>              file://CVE-2017-17969.patch \
>              file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
> +           file://change_numMethods_from_bool_to_unsigned.patch \
>              file://CVE-2018-5996.patch \
>              "
>   
> @@ -17,10 +18,26 @@ SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
>   
>   S = "${WORKDIR}/${BPN}_${PV}"
>   
> +do_compile_append() {
> +    oe_runmake 7z
> +}
> +FILES_${PN} += "${libdir}/* ${bindir}/7z"
> +
> +FILES_SOLIBSDEV = ""
> +INSANE_SKIP_${PN} += "dev-so"
> +
>   do_install() {
>   	install -d ${D}${bindir}
> -	install -m 0755 ${S}/bin/* ${D}${bindir}
> +	install -d ${D}${bindir}/Codecs
> +	install -d ${D}${libdir}
> +	install -d ${D}${libdir}/Codecs
> +	install -m 0755 ${S}/bin/7za ${D}${bindir}
>   	ln -s 7za ${D}${bindir}/7z
> +	install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
> +	install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
>   }
>   
> -BBCLASSEXTEND = "native"
> +RPROVIDES_${PN} += "lib7z.so()(64bit) 7z lib7z.so"
> +RPROVIDES_${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95681): https://lists.openembedded.org/g/openembedded-devel/message/95681
> Mute This Topic: https://lists.openembedded.org/mt/89497302/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


