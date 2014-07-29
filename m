Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id C6A856ACED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:28:51 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id w10so10635341pde.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pZ+lYBetlGxgpCuSccTYDVn1CtpP1vBWwRMtQcPQFLs=;
	b=XxZhF/sfvuEIu3H5fbh287fbx8zqY1sfocfw2ASyKtNWjRXiOXWEdZRdSMfCHB/XNk
	SzJZNC8bQu5buYAcslH9p3+4MxElr0eQu9n6uzdmbfvM5RWtqAs4NUIN3Jm6mj+sMYpe
	fSd90cHOuJrLKTvKhnyFU/Vtv8iI7Rf1rXBd8xw9icojhOrWcV+EhgdqBNWEsirvjdjE
	2Vd/wFKfGEgw2ZSQ62HkxbIPTTFx2hUI8cMNV1jFQsA2+wcpJ0hPMd+c6FQlgtMLy++F
	6f9tu5r/U7zFA0giYTwdZNqZFCsm2t8aGsqTl0HvWVhGgXa+2qS3r8adUZjX9spTKer2
	ieZw==
X-Gm-Message-State: ALoCoQnLDiPwQxctOUTl/hrXioAsa5vIYKFHpbfXAVGayMHAZ/Bs3MddWJ8Fkg9c9+D8aY5a5dUv
X-Received: by 10.68.139.194 with SMTP id ra2mr41756313pbb.20.1406593731995;
	Mon, 28 Jul 2014 17:28:51 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:d0e4:20cd:a8cf:9a4a?
	([2601:c:9380:601:d0e4:20cd:a8cf:9a4a])
	by mx.google.com with ESMTPSA id
	eh4sm18899957pbc.79.2014.07.28.17.28.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 17:28:51 -0700 (PDT)
Message-ID: <53D6EAC1.2030802@mvista.com>
Date: Mon, 28 Jul 2014 17:28:49 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <53D2DE13.9010007@mvista.com>
	<CAMKF1son3T9fsuF9X0Px4hirfk7Ezguy4s5Zit6-0JvfmXDV5A@mail.gmail.com>
	<53D65F40.7010701@windriver.com>
In-Reply-To: <53D65F40.7010701@windriver.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] libpcap-ng
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jul 2014 00:28:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/28/2014 07:33 AM, Mark Hatle wrote:
> On 7/25/14, 10:02 PM, Khem Raj wrote:
>> On Fri, Jul 25, 2014 at 3:45 PM, akuster <akuster@mvista.com> wrote:
>>> Meta-security and Meta-selinux both have libcap-ng. Instead of
>>> maintaining
>>> the same package in both places, can we get it into OE where libcap
>>> resides?
>>
>> I think at very least you can propose it for meta-oe if not or-core.

I think core libcap-ng recipe belongs in a common layer and not 
maintained in two places.

>> But I also wonder why meta-selinux is not a sub-layer under
>> meta-security,
>>
>
> meta-selinux existed first... no other reason.
>
>
> The last time I looked at meta-security (well over a year ago), it
> wasn't terribly useful.

Well when a security package like 'snort' and maybe others are in other 
locations, I can see why meta-security won't be very useful.

  It was just a random collection of
> security-like packages, some worked, some didn't.

Hopefully that will change.

- Armin

>
> If it has grown since then to be more of a cohesive set of packages,
> then meta-selinux being part of it may make sense.
>
> --Mark

