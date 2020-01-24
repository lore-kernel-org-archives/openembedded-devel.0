Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 69BBD7FD81
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 00:28:26 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n9so212696pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 16:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Dc1SmNwsdxIg/oYczzV1j11DWd2FPa4AZAFiBOpyCIA=;
	b=JMw833Clxi2ezieDiSHyl5q2kNcLvdVCO7FDosirCyqBsoKe91WPGTq//eB/HmCL88
	v/R3eoJKIm1/+PzY20vCbLNhjvUpmIHWGFvwItdXce6oF1GHiKoVb4T/8yIyeIx5fNkh
	Mq/LeZNNvL01EcG+Y0XmCZyOXMtSKn770esiH4k+FP0OAUzxRTS6iUOI+PcdIdlhbFsL
	wvLEn9OnXdx4bb/5233Hv17L1ZcaRZh4Gpw3nA629CV7HwqJHbwFsEjnGOBbVEexBClO
	3OqDpqrUgNC8jT+SjbH3MeQtzI8RTOFUdlHqzc6P9A6NmjgqgL3qRtV6osnYJ5NQ6U2T
	wXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Dc1SmNwsdxIg/oYczzV1j11DWd2FPa4AZAFiBOpyCIA=;
	b=kBlj0NKalrD7xK18lB4veN8RQCxAlrkIJhZWGem/OUx6I/zNLwipSKYBBfPHL74Gbg
	1rgmy90wsQFkh2jC/tOm9ecP7Brxvz/Rp5J/mf7C95KDjT222FB5it+1Amr1KDHANdna
	EndklYCZ6m0HbAOxIuT28XBcoTomWJOhMQz6ketXY98NMHyeDu8Sh+74SPpfYYrTQBme
	sdfJPg+YQrL1gH01pJQSmybvHUFl7Nr8L9DcbcysKkKWhYWWtmH+TVJuGsweFtT1lRzS
	1MScJWnH5Akvbvijbraqc0qhuHzKCGIH2lkr3eskHMC+OJxohU/S/ZTogglmgM3VXVx/
	GpKg==
X-Gm-Message-State: APjAAAU0yweztUn3bkAZoUKh0sa77YY44aM4kottJ3N9xK6kSxSYr4Mf
	+WQnF/T3mQJUoxwlYG0ziauAqggKpgY=
X-Google-Smtp-Source: APXvYqxXxZOG+ZI1lJ+zgLdtTXHMZDIPSloP4oI0/Mbdlgr9sPHct2hrk7ixXF/sip7vI5aIOdGDdg==
X-Received: by 2002:a62:fc93:: with SMTP id e141mr797137pfh.262.1579825707104; 
	Thu, 23 Jan 2020 16:28:27 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:9c09:6925:3189:b428?
	([2601:646:9200:4e0:9c09:6925:3189:b428])
	by smtp.gmail.com with ESMTPSA id
	c68sm3965992pfc.156.2020.01.23.16.28.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jan 2020 16:28:26 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20200123223107.64233-1-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <56af45b1-9838-3bff-f84d-958de6e3d12a@gmail.com>
Date: Thu, 23 Jan 2020 16:28:25 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123223107.64233-1-jason.wessel@windriver.com>
Subject: Re: [meta-oe][RFC PATCH 1/2] xorriso: Move from meta-filesystems to meta-oe
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
X-List-Received-Date: Fri, 24 Jan 2020 00:28:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/23/20 2:31 PM, Jason Wessel wrote:
> The change to the vboxguestdrivers requires the xorriso-native tool
> which is only available in the meta-filesystems layer.  This keeps
> meta-oe from requiring additional dependencies.
> 

I am fine with this move.

> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   .../recipes-utils/xorriso/xorriso_1.5.3.bb                        | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename {meta-filesystems => meta-oe}/recipes-utils/xorriso/xorriso_1.5.3.bb (100%)
> 
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb b/meta-oe/recipes-utils/xorriso/xorriso_1.5.3.bb
> similarity index 100%
> rename from meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
> rename to meta-oe/recipes-utils/xorriso/xorriso_1.5.3.bb
> 


