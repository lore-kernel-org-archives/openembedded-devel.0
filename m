Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.474.1594063455177209946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 12:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pcpQD+wR;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id d194so15463191pga.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=wnVgEPyNN1wyiVrroKbX8rWUleDWHcnoiw9vd4UxOqw=;
        b=pcpQD+wRBrkGCf/AkY1IB7+HDYmVGy6nWsbPMCYpqjmCwvJlHZSQMabKVjOsbKt+Mt
         5heG+BSxsmTv1UhJhMfOKKY/2iJSNr3lH7aYQxJi9nDFoGbTv8lvFs1eV2Yz+xgSqa9a
         LwtlF6DHBPVRISx3GuOTZZkvGVb21K7Se5Be6ZBrzV3oGXPUAK0G4svOFgOBt2CyrsUw
         Dwh0U66dh6e5ux0JG4Y9KkYH+YXHCCscT9fqTEohVSGYcXoVK9wW/oWUm561ccAwnsxD
         JV5vmKfRbMK40SjXEmSfGWTWJxFYc2tQd5Y4uwz36vZ93Ss8xgjCu9lMdPWREMKxiZ8f
         Yt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wnVgEPyNN1wyiVrroKbX8rWUleDWHcnoiw9vd4UxOqw=;
        b=GJla5qihBQtiy3q4EIo4ST6peDAZg8KSDNCSFZeZMBEw7gERbyNEHbMaKLUQD+BJgp
         54gtEGRSBFzbu2qF8y9LptU79kl0VJIHEAhmAIwZJzKfpvjv/vPDOY7EvSh7elWnssUn
         BmB/Gj6Xo4AmLzuDTrCh1vb/NDJ0kLp0GSDLhZ3dNBnBa+fv2QyNszQAMLtdnFSJxxgI
         i7FCT+ZxWkfDdHkbgZJgWll1Zxo1JuGXOk5yiPeL2WfzS2hM68jkaI6MM2hes3/yU4sw
         VEzvR2CnybJeqsMuocakDFB8fDAYvrr5pJ6JmK6ZYOOxZCGvAJCp8Cir3kl97MYDncDu
         sKlw==
X-Gm-Message-State: AOAM5320myqaTuguirolyR93X9mmrG5TisGDZ/0CVKBgOqEZ/d8UOTip
	YvvRoNFdzf1YKifMcFdAQInrmrcXJYQ=
X-Google-Smtp-Source: ABdhPJxDFCC4qrLbQZqmR47Xsi+8lBN4kD3Y7BZHzl3NzNsYMQ1ErPg9hbhJZWQKbokv3DNXDdhF+Q==
X-Received: by 2002:a63:d208:: with SMTP id a8mr40959587pgg.351.1594063454421;
        Mon, 06 Jul 2020 12:24:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:61e6:5be1:19c9:154e? ([2601:646:9200:4e0:61e6:5be1:19c9:154e])
        by smtp.gmail.com with ESMTPSA id r8sm19741686pfg.147.2020.07.06.12.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 12:24:13 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH 2/2] ruli: recipe cleanup
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-devel@lists.openembedded.org
References: <20200705185610.364-1-kweihmann@outlook.com>
 <AM7PR05MB6881C77B1C3BB6BD1BD4EF85A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <5773ba82-f93f-8049-195d-91a1e97b3332@gmail.com>
Date: Mon, 6 Jul 2020 12:24:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <AM7PR05MB6881C77B1C3BB6BD1BD4EF85A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/5/20 11:56 AM, Konrad Weihmann wrote:
> - removed B = "${S}",  which is the default anyway
> - removed FILES_${PN} =+ "${bindir}",
>    as it's already covered by ${PN}-bin package
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta-networking/recipes-support/ruli/ruli_0.36.bb | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
> index f920b592a..90e7fec52 100644
> --- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
> +++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
> @@ -18,8 +18,6 @@ SRC_URI = "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz
>   SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
>   SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a3999dbfa"
>   
> -B = "${S}"
> -
>   EXTRA_OEMAKE = 'CC="${CC}" OOP_BASE_DIR="${STAGING_EXECPREFIXDIR}" \
>                   INSTALL_BASE_DIR="${D}${exec_prefix}" \
>                   OOP_LIB_DIR=${STAGING_EXECPREFIXDIR}/${baselib} \
> @@ -34,5 +32,3 @@ do_install() {
>   }
>   
>   PACKAGES =+ "${PN}-bin"
> -
> -FILES_${PN} =+ "${bindir}"

would this move the binaries from PN to PN-bin ?

> 
> 
> 
> 
