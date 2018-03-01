Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC8D6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:44:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j20so2843712pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=us1CUddPjY3Wi1xi4XRyaHvR+DZnEH99joaRySRsd9s=;
	b=clRxIrdibQdWwg+0+9hgCXuBDK6UhpmisC3tP+MsqEaEEDZMhRN/Zkgonvz7DpuG/i
	qV/x9/bXnetjhsTf3vg4epZymH9qrvNQfv3IDkZU8qJBG57RwzSl/R0J9v6HoNFgnTXp
	RWPskO1ZWYW6QEI4yqZCBXsxS0/Ms8ysI4Y/rLBSi6WEuKYZUsJdOANDWWavgQjypBgs
	E9w87lneTaNB/5xmYR2bRAwKG6nyPtsGlx5ItFZ53BvsQyxCF89O7PXFrZ9azEkWNs11
	vPuh61/gGQzuG7YgWWCRI+HPWeYANeh1rlAqiJb03DkZ9dRW2wJwhi2MTmZj0+d6l2C7
	aj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=us1CUddPjY3Wi1xi4XRyaHvR+DZnEH99joaRySRsd9s=;
	b=kbtf9SwoQGQSBGkmHcRyHcYRztfEvBDVPA1+T4OLtnnomyLU4+XK00XIaYicPSMMPt
	MgGJDm++GYCa7jm2i5s9o5wHVnMt3EpsSt6WO5HEVsbjZYSFGn1GuUjefKFrCEAv6uat
	lKJY+4x6o86f6ptHsbR9pObvw9C/tGXpUWN5K98uQa5Cgfr/rswutxevl669yL45ckng
	ESMVU8dcgrkrTArSDpkNo2bR8qjEAsET5rtz5YXZSCrIqdKETPq0D2kxmRWIsMs93a0L
	4Q3ZjReFEuUYV0oFT+f7jn0+wG0RmfKRiOKaivkAyqYY+XPCwogWhWC1X/AZ+KnckgXr
	wlLA==
X-Gm-Message-State: APf1xPCSEkXIuBEgMNQV+F5mnucHZxCJfFe4JZl0WsSQ3EtsoDxVL1Si
	x6d5mk2/ojca2xpH5ZW48/kgng==
X-Google-Smtp-Source: AG47ELsj9Ll3PguM0/0Zfz9tM4U/haf7heS3fGsoc8pqcj/orSPuB23PR99oZm/4bGEtX8KC9QJRrg==
X-Received: by 10.98.214.218 with SMTP id a87mr2924798pfl.146.1519929893196;
	Thu, 01 Mar 2018 10:44:53 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id
	189sm9561576pfu.129.2018.03.01.10.44.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:44:52 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
	<1d48c1f1-8b2d-2f8d-ff23-31890aeadbcc@gmail.com>
	<5542c5ec-fbbc-694a-3183-98bc78b12702@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <da663886-ec79-fea4-3b44-7d5f03658945@gmail.com>
Date: Thu, 1 Mar 2018 10:44:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5542c5ec-fbbc-694a-3183-98bc78b12702@linux.intel.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 01 Mar 2018 18:44:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 03/01/2018 01:04 AM, Alexander Kanavin wrote:
> On 03/01/2018 03:17 AM, akuster808 wrote:
>> We had/have a situation with the Yocto 4.12 kernel that broke wireguar=
d
>> in meta-networking. Their are two patches that don't exist in K.O. whi=
ch
>> are causing the problem.
>> Meta-openembedded can't fix that, do I blacklist wireguard? Wireguard
>> builds fine with K.O 4.12.
>
> I'm not sure what is K.O.,=20
Kernel.org. Upstream linux-4.12.y branch in this case.

> but if the breakage can be resolved by changing things in oe-core,
> then by all means do let us know.

These two commits introduced an ABI change.=C2=A0

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include=
/linux/random.h?h=3Dstandard/base&id=3D6e4990d8d226e1861a5a2b632cf93bc70f=
eab3af
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include=
/linux/random.h?h=3Dstandard/base&id=3D20543a488913755be70f54be52b32f727e=
8179d8

This makes linux-kernel_4.12 different than linux 4.12.y.

- Armin
>
> Alex



