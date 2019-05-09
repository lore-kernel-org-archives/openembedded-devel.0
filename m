Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E41D7DEAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 18:58:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w7so1590837plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3CvsBPrMtfFIcqTczT1a90bSARYJaN9Xx8SGFQoLjwc=;
	b=BWQL6wLB3cZaIqQnxoUV7moYbyIrgDBbW27KyPZXqLskfD0RO9/+fla6l/B1OgqNhq
	jcSgQJypaeSs25w9vICvdr72ug6z0aS3OrewANhk4UMByIKoLPRpIfkc6YVIRTFqb7/F
	uOOYvYsfGic3jTdj9iEPTogIFaW9PrCJYgs393Qg+umjLTG0Fp7W5K48bAtJvnCXKPoi
	KEBMRv7VFYl+PnWORwhLGprv6fb9nQx5KMOQVizKJEZLSdTvdYgvGn12CM6gyhXa8EaX
	6heynWIvd0h2PeyNt1+7oMuyZSg46S4RrsOoW2L767/yphjZUajqMpMAQYERaEI+oV3/
	28eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=3CvsBPrMtfFIcqTczT1a90bSARYJaN9Xx8SGFQoLjwc=;
	b=c9/7zVkUV4wbyD2HIqq98OiGs73bw7EHWGoLrsLfUcURy+v6e6R/04+TIw5lZsJZzg
	U6QNvji5eDy1D9EVUcArNIVY20ZQz7YUV286So5pSXIG/O4BODs0CZvywNUALZmshM9Q
	VbKX6hajeSh00RHKDOMwmT9FdrWBDilDPzDG1EWaF8KF7kfETWHS95cbxPQLfeBs9Dlr
	w2HGBzLcqsK0Jm8/fu4RogftwarV6iekgHx/C0XT0NynKMXz7OTgUR7r057nBfJYQh9f
	SqKtEvbnus9dOXWEZ9rVAEVx4Atu5uUhuc3wO4+H0X2OkYC34i4zAFDNx9O4+IkdnA/V
	6wdA==
X-Gm-Message-State: APjAAAXLHDyVUSFI5F+XyB73cEDU+9EKD2yKYYAx+1ujPJIe268bieAV
	Smn6x3rIp1fq/wA8FU/MWp5TMkrt
X-Google-Smtp-Source: APXvYqwnx1+WSSHCb50/PCE+duzywLuYnaqfpnbB45jSS/hyfJhKeWh7a9wfJrsTJAiRWjL/Rg3UwA==
X-Received: by 2002:a17:902:ba8e:: with SMTP id
	k14mr7522079pls.80.1557428282468; 
	Thu, 09 May 2019 11:58:02 -0700 (PDT)
Received: from [10.20.245.10] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id l9sm3084592pgq.48.2019.05.09.11.58.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 11:58:01 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190509161620.10742-1-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <39ed309d-7723-5261-e4fc-4ad93b61851f@gmail.com>
Date: Thu, 9 May 2019 11:58:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509161620.10742-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH] Remove me as maintainer
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
X-List-Received-Date: Thu, 09 May 2019 18:58:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/9/19 9:16 AM, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Sorry to see you leave. Thanks for all your work on this layer.

- armin

> ---
>  meta-xfce/README | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 7431e8b7c..84b019896 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -19,4 +19,3 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
>  When sending single patches, please using something like:
>  'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
>  
> -Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>


