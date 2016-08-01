Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 183A76E660
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 04:43:57 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fi15so48819124pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 21:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=qxS0hwj9kOsrQEs3LzDhT2xHx79zbSJr1Hu2tFI3Q8A=;
	b=vqenbahdUeD/NZUPKg1PcK9+t8Nqa/9bsQyJLOP4Md1XLjEq4ItIM+1jDrGZpq9Wn6
	X+DIONXLHPqAvznKe6ccfh18Q7DbE1d8jYpbqJ4/kwD7RzRG920gTwfjp41SDYmHzvfG
	4x9KGZc1yh8UDB1te4eOhlr0tZiUGBAz0k+igVit8z1+Bw10nqQSUmDXJeaaVmm0aNYI
	zw2OJT/aqdpTHwjH9CzEhoWRVRqauRLK9FEjt67JYOgp64FcGsJfj9fQ57Pmhpnmcfqe
	3ViYHqIDLRGbTaWwXlc6lEtZF9aDEmNI6dak00s5e5D158nUoy2ntnQOPLgHoGUYDrXs
	G2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=qxS0hwj9kOsrQEs3LzDhT2xHx79zbSJr1Hu2tFI3Q8A=;
	b=BSLCuf8RPacAP/dP7u9Fz3udadxxxI8ZPOmvsM+dvPXPk347TNw+FQC/h/agKK2ScY
	EIXNARUFicpso3JP/sDcDL6xjjv3PjupA0Y7+ZQJy7Xg2daftxw9Ihcw2YWFq5xxVprX
	CnjMVjnIJYFLF8Vu2UpmNBvXq7GBGhFWkiWTvnqEWybd+N7j7RhKC9Mj04q0YPgnI6mS
	JmIOWmM4dDdoLvYattIgDLkye3JgAk3vYbB8rVcHZRZWcAkaICIUJEkqCO918op16iR/
	qdD9EJNhyKkcrOCODiwaXMasA5aTGr1SKGo0/x04/CEEGFxhDOKm+FAIcQLLH3y9ubgc
	8ozA==
X-Gm-Message-State: AEkoouuETshN26/aJ31Wpwo8YbjJNvFQQTD0cz8s6of9wKBuYLRsonSmYgc75b9s3uC2V5rv
X-Received: by 10.66.72.40 with SMTP id a8mr93245821pav.15.1470026638109;
	Sun, 31 Jul 2016 21:43:58 -0700 (PDT)
Received: from [192.168.1.7] (99-0-9-164.lightspeed.frokca.sbcglobal.net.
	[99.0.9.164]) by smtp.googlemail.com with ESMTPSA id
	bw10sm21722150pac.27.2016.07.31.21.43.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jul 2016 21:43:57 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1470026517-26247-1-git-send-email-jpuhlman@mvista.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
Message-ID: <8b91a02c-4d51-2d47-970b-48b6be4cc3e3@mvista.com>
Date: Sun, 31 Jul 2016 21:43:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470026517-26247-1-git-send-email-jpuhlman@mvista.com>
Subject: Re: [PATCH] Fix random python backtrace in mutlilib handling code.
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
X-List-Received-Date: Mon, 01 Aug 2016 04:43:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Not sure if this is the right way to address it(perhaps just continuing 
in the else), but
this resolves random backtraces I was having building multilib images on 
master.

On 7/31/2016 9:41 PM, Jeremy Puhlman wrote:
> newval is not defined in all cases. Set to None and check if it is set.
>
>    File
> "/local/foo/builds/x86/layers/openembedded-core/meta/classes/multilib_global.bbclass",
> line 90, in preferred_ml_updates(d=<bb.data_smart.DataSmart object at
> 0xf6fd528c>):
>                   if not d.getVar(newname, False):
>      >                d.setVar(newname, localdata.expand(newval))
>               # Avoid future variable key expansion
> UnboundLocalError: local variable 'newval' referenced before assignment
> ---
>   meta/classes/multilib_global.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
> index 67dc72b..11ae268 100644
> --- a/meta/classes/multilib_global.bbclass
> +++ b/meta/classes/multilib_global.bbclass
> @@ -72,6 +72,7 @@ def preferred_ml_updates(d):
>               pkg = pkg.replace("virtual/", "")
>               virt = "virtual/"
>           for p in prefixes:
> +            newval = None
>               if pkg != "kernel":
>                   newval = p + "-" + val
>   
> @@ -86,7 +87,7 @@ def preferred_ml_updates(d):
>   
>               # implement alternative multilib name
>               newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
> -            if not d.getVar(newname, False):
> +            if not d.getVar(newname, False) and newval != None:
>                   d.setVar(newname, localdata.expand(newval))
>           # Avoid future variable key expansion
>           provexp = d.expand(prov)

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


