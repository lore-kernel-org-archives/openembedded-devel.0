Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 933B57D8F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:18:50 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id v12so11219401pgq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lTPukgKtUExQn3ADp1AMOX+iidJmXq2S/Jge+UoU5Ls=;
	b=F2UOEZhQEH6WokWxPm68tF+CBFg5Z84H/oiWc4/YuAvhCMzzXVCHdeuCn4pxWWd43X
	LNOE0xxofL+A+HuAys+k9l7AV0quhPAsPdLzYtqFCQ1kH4Sm7EJssPCxLrXFPoS7uhW3
	HQ8CiU436wraZgFfYhFhmXvaLgYQIcWdXVh+Onn9bpyItxZIlGDiqbeuCmTKThXyZxb9
	2IQd8z9+sGl0y8oZWEVRM5RSC/WwD7dCoR/uN0R0ZbxH3Ly8zVjUccdUCllRYL6nQBHA
	W0yCiulQSbmHGnyXJh46NeYC30eKB2H+cc2LHJC7uQhMyzw+ytAh8kijIO2O//fHKLO8
	OXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=lTPukgKtUExQn3ADp1AMOX+iidJmXq2S/Jge+UoU5Ls=;
	b=c2p5eeOAxyAKCxj+YnFMlE7r9RTfUaljUNFz2KAaYF+OTuRDKx04yGkgflAbD8S5Ns
	7/ptebEypXAsckmJy+FBMAbu5hKoUgdNZ33sxA+LPKktaZ9CGTTbJEVNh35YeA9SHWUT
	FlwHeFYXsQmM5AKlWhzHKLH5FZjxMQonPyCFqDCn2cizjQ8RWv6l0wYoQzLk1ybvMIC3
	MIWPXS8AHkD4Y3UMYS5PYdtcx6o+yWqb90oxneHq4Nb7ZdO8sjI/E7Uy7pgcbEPLOkYf
	Vx78PfvH/aLoF9hXnMlVBJoTfmx92Lv6WnuzxRoR2Q/ls682MKhbkeoJsY1jp172wQK8
	EDgw==
X-Gm-Message-State: APjAAAUnUQ9l9RQOBYrEGqW+aFqcujSZXy/9Eq53NgU19j0+1iJztIqC
	93x62Yz/cy9yAQLB0RcxXAWpD7HC
X-Google-Smtp-Source: APXvYqwANZY0QmvsMpDbqt5mhVyuRPDZFn3/9WkBmL5zuL2prm4sYE7Gg0Be943tOotWzz903FPitQ==
X-Received: by 2002:a63:6194:: with SMTP id
	v142mr18997448pgb.411.1556198331380; 
	Thu, 25 Apr 2019 06:18:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a87f:9f1d:bbdb:3483?
	([2601:202:4180:c33:a87f:9f1d:bbdb:3483])
	by smtp.gmail.com with ESMTPSA id
	t5sm28711532pfh.141.2019.04.25.06.18.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 06:18:50 -0700 (PDT)
To: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <HE1PR05MB46350C84FDF6E1F7F6C448D8C53D0@HE1PR05MB4635.eurprd05.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9c2be11a-2877-5059-35c3-58abc0d34f7b@gmail.com>
Date: Thu, 25 Apr 2019 06:18:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <HE1PR05MB46350C84FDF6E1F7F6C448D8C53D0@HE1PR05MB4635.eurprd05.prod.outlook.com>
Subject: Re: Python3 in sumo+thud does not package sha1 support in crypt
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
X-List-Received-Date: Thu, 25 Apr 2019 13:18:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/25/19 5:31 AM, Visser Sander (2) (Consultant) wrote:
> Hi
>
> It seems "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so" is missing in sumo and thud. It is listed in rocko (via sha*) and in warrior via _sha1.*.so
>
> Would a patch towards thud/sumo be accepted where _sha1.*.so is added to the crypt files?
Yes

- Armin
>
> /Regards Sander
>
> This email message and any attachments may contain confidential information and may be privileged. If you are not the intended recipient or otherwise not authorized to receive this message, you are prohibited to use, copy, disclose or take any action based on this email or any information contained herein. If you are not the intended recipient, please advise the sender immediately by replying to this email and permanently delete this message and any attachments from your system.


