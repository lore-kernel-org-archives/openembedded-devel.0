Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4628E747C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:58:40 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id t20-v6so1599650ply.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wdXDTB5pDLXlFLqpkkA7//Td7/9UEF5kuNo/vriPC2M=;
	b=U8RRxLhoWlpM/a7OH3jt7EgVBSEJexI/s6b0bSCFMF3rjgxrw/mEi+n6s4UhG0TjD7
	Znzxl3O36UhjrLd/WlipRVqwpTbB842dr+VqyPVN26FwPZ/1bkcgFYglEgGdZ1/3RnRz
	PWC4Jc33speY1hFQJ4N/JmecH4PnlY9YwjWRjMrDutOsUIhbl/vTyIvbXxIx8UN67jYL
	kMqluIJR/7Yc81t/BliS5Ih2zUgmFpoNIIUDHwzPkRw/cwb2dT6hU6qBw9UvTNPFEk2f
	m3JYShdrc21Fx3un9UAaLpnsWuzxyzWt6qqWiFRelH4yVrDaoekfCK06mIpOg6Fh6+DF
	MemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wdXDTB5pDLXlFLqpkkA7//Td7/9UEF5kuNo/vriPC2M=;
	b=hcXVtRhXuK98i+Z4O6D/L/9Rjl8Vk2tH8Qjala/mylhlonqR8JkwALkthow3IWBCS7
	23CSrDEsGT7QRiuXxEXX200Wh1Fm2G7v37elLKJk+RuIYiRjDCiWjVxeGmps1xdEyuhL
	Gof9jtjbgAdS25eb65ayA64ZbuLetVdUY2Mb2zRY7ZkXjg+k6/6Hyzm+ZxZu9WiF2Rr3
	4alDIjXsaaiw37Zusx74WBp4kIvbdcarclGqQXYwBi/pwEs8UpqiZ61KXkUbHvOUzsne
	WylSwciuILUKVgvJZKo94Mwn2AV7cbUt/pHhGi6jIte14VaYxbw4C8n99TugUTX2N7zB
	PH9Q==
X-Gm-Message-State: AElRT7Hm6I7vrcO5rYl+ewPrIR2ZZmM6o4qlw+KTQWrU/wIGGwNQ5tTh
	MvBuyS17Id2hnHKpgbQLM+jyHpRJ
X-Google-Smtp-Source: AIpwx49jGyn6nc2GXTpYrAcUCs4L1Yo1rnlr+VoI6bijZWxfw4uoCUUsAzkj5zREOLWjfp8DLxHIuQ==
X-Received: by 2002:a17:902:69ce:: with SMTP id
	m14-v6mr37755227pln.358.1523249920838; 
	Sun, 08 Apr 2018 21:58:40 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:f9f1:e8db:97b9:48ce])
	by smtp.gmail.com with ESMTPSA id
	i186sm30998201pfg.53.2018.04.08.21.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Apr 2018 21:58:39 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1523241307-30325-1-git-send-email-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <16c891b2-b8ec-cd15-4914-7952fed9e7f0@gmail.com>
Date: Sun, 8 Apr 2018 21:58:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1523241307-30325-1-git-send-email-anuj.mittal@intel.com>
Subject: Re: [PATCH] libsrtp: allow creation of empty package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 04:58:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/8/18 7:35 PM, Anuj Mittal wrote:
> Package PN is not created otherwise and results in errors like
> 
>   | Problem: conflicting requests
>   |  - nothing provides libsrtp = 1.5.2-r0 needed by libsrtp-dev-1.5.2-r0.i586
> 
> when PN-staticdev is to be installed that RDEPENDS on it.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
> index 8abaa12..0104d04 100644
> --- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
> +++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
> @@ -18,3 +18,5 @@ do_install[postfuncs] += " rm_unused_bindir "
>   rm_unused_bindir() {
>       rmdir ${D}/${bindir}
>   }
> +
> +ALLOW_EMPTY_${PN} = "1"
> 

You wont need this change if you remove this dependency from dev packages

RDEPENDS_${PN}-dev = ""
RDEPENDS_${PN}-staticdev = ""


