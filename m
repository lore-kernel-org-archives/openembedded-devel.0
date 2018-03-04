Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4F078883
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 15:02:01 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id q13so6135406pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 07:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=rzySWYF5PLLXwMe48heAyhOKuiIcxLEPAL1m1PoCNn4=;
	b=na0jEu+9Klh3QoRaKC92duMpw2EGuit9SV22zQS1/ZRDEOvyqf4Vg4HCtQgBhYSI4X
	8W5NcInhhUQtLp0/sYrdtdUicnmfEBIt2pPwVUpmpXORZ1OKVzp6VtNgRCsSLn83s3ih
	Gismp/2U0Xhak3he4gSabGc9RhDZLigiOFsHwNFwo4Sg+AxA3wX30c61wfyF4W1Cfa6W
	vilAeu7HBJxVX/Ds5ZyfH7DCNfSbmyG66Q+GZ2VYCebk5Hl+FAzzVoSMyG19/VWXo+IL
	gdU+VG6FD3/mhssZyHelaKj59mzIiC97tC/JUp6qrzVEwmrP75HhKYG5I1QwQBeDeVv2
	z8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=rzySWYF5PLLXwMe48heAyhOKuiIcxLEPAL1m1PoCNn4=;
	b=sqPKGrag63BuwTBsJtktE2J0Syy4LkHrZJm1VGd7kE5KJG0+HmckgWxrpLbfB2u+9C
	wpD8ZWPqEmQhIHWv0LwQha4JybaHFqRPUC7V+erR3sKxNYLCX//JUIymp5SSpybcYwWK
	+fCYDDMiGau7kwcC75uBbuoqYBwfHHkxnhd7TL1fGWNbk+BTRBSpDVNwawNZFv8lxBZ9
	xcNPkWjiP1IIPRot5IoG1gKDYY33HM9lyEmAQ+gfSBtPH59Itv6PiaiavqebYI8F8Bno
	MW5/NLqqZNx3IMAmzBpc5mRXa3NzPlMT4c0isQNhBJ1g3cPkUqYNLGdRqIs+AKcU1ZdP
	Qp6A==
X-Gm-Message-State: APf1xPBGyZjMS8dIZKKqMqGxoDG1k8R/kCpz/1A1JFlajNLMg8n21bEt
	xay6f3ehLs6TKTBcaA8iv2bhyQ==
X-Google-Smtp-Source: AG47ELuUcwts0nmr5UtIFzoHaZ6xxOjAC3d9IDJyHwz4qHnDQLkD9iSn9iWnz2LUpn9Q5M3i9q47nw==
X-Received: by 10.98.31.79 with SMTP id f76mr12300692pff.60.1520175722947;
	Sun, 04 Mar 2018 07:02:02 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:6dbb:c9f4:e105:a5b4?
	([2601:202:4000:1184:6dbb:c9f4:e105:a5b4])
	by smtp.gmail.com with ESMTPSA id
	w88sm23528366pfa.50.2018.03.04.07.02.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 07:02:02 -0800 (PST)
To: Michael Siebecker <michael@siebecker.ch>,
	openembedded-devel@lists.openembedded.org
References: <e36fe405-abe4-9017-5f7a-f39249293c8f@siebecker.ch>
From: akuster808 <akuster808@gmail.com>
Message-ID: <07615424-0f9f-b54b-b94e-795b0a137d9b@gmail.com>
Date: Sun, 4 Mar 2018 07:02:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <e36fe405-abe4-9017-5f7a-f39249293c8f@siebecker.ch>
Subject: Re: [meta-oe][PATCH] Fix zram module paramter name
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
X-List-Received-Date: Sun, 04 Mar 2018 15:02:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 02/28/2018 11:08 PM, Michael Siebecker wrote:
>
> ---
>  meta-oe/recipes-extended/zram/zram/init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Please rebase

- armin
>
> diff --git a/meta-oe/recipes-extended/zram/zram/init
> b/meta-oe/recipes-extended/zram/zram/init
> index 7b6cbf4..a2c9c21 100644
> --- a/meta-oe/recipes-extended/zram/zram/init
> +++ b/meta-oe/recipes-extended/zram/zram/init
> @@ -34,7 +34,7 @@ start() {
>      mem_by_cpu=$(($memtotal/$num_cpus*$factor/100*1024))
>
>      # load dependency modules
> -    modprobe zram zram_num_devices=$num_cpus
> +    modprobe zram num_devices=$num_cpus
>      echo "zram devices probed successfully"
>
>      # initialize the devices


