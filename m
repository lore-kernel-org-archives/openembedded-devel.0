Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0AED77197B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:18:06 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id v9-v6so876670plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QpQEOq9CpiFDUH1LaOCMMWWhVX9hB0sJ8e2t2EdChJA=;
	b=Y17EiiwyHdMAObxxgUFqSIVLInfVkC9wnTjIWQCoUgZx+/MiAC1oVv0pLImtVng/dl
	zWSzF/tjhtQtKn6eNQwWwgHqQ6zXmY4BlBjABCK7SNCR5Xb/A/PgFzZhqN2s6DMvcP4T
	mkqPrBCfMlTNF1tObzLVlZoAVis1yiVvnJ2Bwik6nBKNUdRwS8TMXor+ufUOKm8ruyRh
	zImORdPSJGUFMknut2KcZPaSDWJz7HcDzFyfd5+I0hgYxYMjMPPNEbS4GesgzUeuf1hJ
	ylNGm2ratWPNOcR1vHgdWFFzAPD3pbRKfCqwGL8mgPEZD5mR2g5kLz5lpzHhb1OrxZC2
	+Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QpQEOq9CpiFDUH1LaOCMMWWhVX9hB0sJ8e2t2EdChJA=;
	b=k8D+9BxcY0Nebkr9TSjc3jWqT6NAO52s0+otasUUr5nBAkOslw62u4h3r0M4o1Q2lb
	Qb7tGVjTgIYaBDHblVs+RGnI//eL8Y8Gzg7zGmdeDF2RZPSe4fZ4Rn3h/1iW5qhwfrV8
	hzeMLpktPKEDfbnac0QQEYNPMAnNe4Ja1BWpmWc1x2KKoiniK8cNaDycEVtTh3xz4+hh
	2W+ypgMnEWIq7bQsbvBZJ9vQU50umUZNPjCOgGf3muRI1znXKgEblpCEzl+dk8yAQi09
	IlKWn6yDt7kA2lIPHlgFX2p4C9Gw8x77S4/wLLlNwTWIkvCJIVciXsuovJdxEUQyqCNs
	wteg==
X-Gm-Message-State: APf1xPBYN5tbgr8DSd+jq9Ak6SohOfMA11WhQ8OmXo8Y9xvXQFvOZ5Gu
	Ja6/U4tBmB2ejnv6/32ZBsBQ2uaMYfkI4duH1/8=
X-Google-Smtp-Source: AG47ELvtLQiviiaKDqpcjAik7y9MOE7zlamL/qtQyYteaeWp6NpR7NLdCmfm6S7TIC/xQAAfw8xIj0207N/4HfOwYIM=
X-Received: by 2002:a17:902:bc3:: with SMTP id
	61-v6mr1850093plr.398.1519795087882; 
	Tue, 27 Feb 2018 21:18:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Tue, 27 Feb 2018 21:17:37 -0800 (PST)
In-Reply-To: <1A5BB22468458840B08C979DDA869BF27EBA5F@PGSMSX103.gar.corp.intel.com>
References: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
	<0ca3f04d-dd55-cbbb-3b3e-dba03f54ebd6@gmail.com>
	<1A5BB22468458840B08C979DDA869BF27EB7CA@PGSMSX103.gar.corp.intel.com>
	<4d770b95-e279-7fda-8322-64911ac47431@gmail.com>
	<1A5BB22468458840B08C979DDA869BF27EBA5F@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Feb 2018 21:17:37 -0800
Message-ID: <CAMKF1spT1RVE7t+P13ZL-WexwwC=0Ew48W_Bb7nGdaGNJ44mgA@mail.gmail.com>
To: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Dependency loop in cryptsetup
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
X-List-Received-Date: Wed, 28 Feb 2018 05:18:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2018 at 8:42 PM, Md Ismail, Zakiah
<zakiah.md.ismail@intel.com> wrote:
> Removing libgcrypt from DEPENDS in meta-oe/recipes-support/cryptsetup/cry=
ptsetup_1.7.4.bb doesn't solve the issue. The dependency loops are still th=
ere.
>

OK which package is it complaining about ?

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Wednesday, February 28, 2018 12:11 PM
> To: Md Ismail, Zakiah <zakiah.md.ismail@intel.com>; openembedded-devel@li=
sts.openembedded.org
> Subject: Re: [oe] Dependency loop in cryptsetup
>
>
>
> On 2/27/18 8:01 PM, Md Ismail, Zakiah wrote:
>> Yes. Currently using OE-Core rocko branch, commit a8eb060cbbbb00581e8260=
dd6bfc31cff5558e8f.
>
> Does removing libgcrypt from DEPENDS in
> meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb
> help?
>>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Wednesday, February 28, 2018 11:59 AM
>> To: Md Ismail, Zakiah <zakiah.md.ismail@intel.com>; openembedded-devel@l=
ists.openembedded.org
>> Subject: Re: [oe] Dependency loop in cryptsetup
>>
>>
>>
>> On 2/27/18 7:48 PM, Md Ismail, Zakiah wrote:
>>> Hi,
>>>
>>> I want to enable cyrptsetup in systemd by adding PACKAGECONFIG_append_p=
n-systemd =3D " cryptsetup" in my local.conf; however, I encounter the depe=
ndency loop issue. The issue is similar to this: https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D11856. The difference is I'm using the latest com=
mit from meta-openembedded rocko branch. Please advise on the steps to solv=
e this issue. Thanks in advance!
>>>
>>
>> are you using latest of rocko for OE-Core as well ?
>>
>>> Regards,
>>> Zakiah
>>>
>>>

