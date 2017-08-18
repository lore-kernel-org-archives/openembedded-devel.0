Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 096E5782D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:44:30 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y129so16232963pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 11:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4T3Fq4cmCD0a7nr7C/FmTTwutro8fV3P5BnwlqJyWaw=;
	b=S3ylxyxDhk8133wnTIhAiCpb6RJ2O4iYIiOyzzJh9UCMBMOo1zsvub1cPzHmv+DmmT
	4ByGQ/7JjnF7+3XobIOBWX7OcF1Ebb4d+2jTdJB6sIm1zp04OExNDwBhKKDIgU4HKFfd
	p70FEYEahrQ6jHeXGVbIy34lsGbMhW/WR09GZaIZSDEqWEHc3fkxhZxG5b+As7chq/ux
	sCZVUMZ4pdj/3VpAFa3mJRXvUH3fEH9O061WLTpE4gm/bDoUz4PYqDrFm1MLiMZTWbGB
	zlm+KQbtMZjBTRO5UJ10Q6S/Ltbx9l+ORLNIdeSKFx04XQu68B7LW5hOczNtT/LCiBjj
	PoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4T3Fq4cmCD0a7nr7C/FmTTwutro8fV3P5BnwlqJyWaw=;
	b=nXwKDwLygXYyvaLG7LaygYjPW5ZBEy0D4NwHGYS9k8GdZCF6MCOJVuDwvghTUOucs+
	YBumtOyoMbloY8Z4BxJAXu2n6gcjRh53du1qtA8/5PAMSl8O6Hh37LtYB7v50xKp1Nwq
	1apx/gdu37SFlAHc0bHnHciOieYvZwHSYub5jKJdP47BAo7C0MW3A/vQM4zNF0gV93pZ
	K/hRCerK1v16j+Eov/rQya67AlgIomUSwXxPR4+dyBWJnICrFrEHNod3FSv4SUj/dNMA
	IiaC0pe/ZCPCK36EGHWbD3ah+XUsL0yBtO4c0R1M4nNyTNJnKZEn39wI3a4S9stCnx5G
	GWvQ==
X-Gm-Message-State: AHYfb5jAafPrC+zykyQVcjVBMTZXdAf5TJqQvFTNoa40B/CfnxjGUH1A
	wFFW041EkUlDDeybFhYca6Aw5wnc1Q==
X-Received: by 10.99.133.65 with SMTP id u62mr8616683pgd.100.1503081872304;
	Fri, 18 Aug 2017 11:44:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 18 Aug 2017 11:44:01 -0700 (PDT)
In-Reply-To: <00070e83-1df7-8006-a47f-b9b906c6f883@windriver.com>
References: <1502952015-23737-1-git-send-email-yi.zhao@windriver.com>
	<1502952015-23737-2-git-send-email-yi.zhao@windriver.com>
	<CAMKF1soqnxmDPWcr5-zOBRGo8CSO7qyYCXM3jzm66FfO4TPnhg@mail.gmail.com>
	<fef5a9c1-95e7-c49f-f5b2-a1b46bb1b860@windriver.com>
	<00070e83-1df7-8006-a47f-b9b906c6f883@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2017 11:44:01 -0700
Message-ID: <CAMKF1so61LG=U2+E4fq7wTv3PYWMc-bD0VH2uFuKFYDcT0xrig@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] iproute2: add bbappend for supporting tipc tool
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
X-List-Received-Date: Fri, 18 Aug 2017 18:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2017 at 11:39 AM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-08-18 02:10 AM, Yi Zhao wrote:
>>
>>
>>
>> =E5=9C=A8 2017=E5=B9=B408=E6=9C=8817=E6=97=A5 22:01, Khem Raj =E5=86=99=
=E9=81=93:
>>>
>>> On Wed, Aug 16, 2017 at 11:40 PM, Yi Zhao <yi.zhao@windriver.com> wrote=
:
>>>>
>>>> The tipcutils 2.2 removed the tipc-config tool and recommended to use
>>>> the new configuration tool named "tipc" in iproute2 package for
>>>> configuring the tipc, which utilizes the new tipc netlink kernel API.
>>>>
>>>> We supported tipc in iproute2 with PACKAGECONFIG in oe-core commit
>>>> 944ef0de241de77429ab0e5cb1dd4a7f355cf3fd
>>>>
>>>> Add iproute2 bbappend to enable tipc for tipcutils.
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>>   meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>   create mode 100644
>>>> meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>>
>>>> diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> new file mode 100644
>>>> index 0000000..0869f7f
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> @@ -0,0 +1,2 @@
>>>> +# For tipcutils
>>>> +PACKAGECONFIG_append =3D " tipc"
>>>
>>> can we do it in recipe proper itself ?
>>
>>
>> Hi Khem,
>>
>> The tipc in iproute2 needs libmnl as dependency.  Currently libmnl is in
>> meta-networking and there are some packages in meta-networking need it a=
s
>> dependency, so we can not enable tipc build in oe-core directly.
>> If we want to enable it in iproute2 recipe directly, we should move libm=
nl
>> to oe-core. I don't know if it is worth to do that because few people ne=
ed
>> tipc. How do you think about it ?
>
>
> We should move libmnl and the iproute2 change to oe-core.
>\

thats reasonable I think

> By default, TIPC is enabled as a module in YP kernel:
>
> $ grep TIPC
> tmp-glibc/work/qemuppc-oe-linux/linux-yocto/4.10.17+gitAUTOINC+e92bd55409=
_6648a34e00-r0/linux-qemuppc-standard-build/.config
> CONFIG_TIPC=3Dm
> CONFIG_TIPC_MEDIA_UDP=3Dy
>
> so it should be configurable with just the oe-core layer.
>
> Once libmnl is in oe-core, we could move nftables,
> "the successor to iptables" to oe-core say at the start of
> the 2.5 dev cycle.
>
> ../Randy
>
>
>>
>> Thanks,
>> Yi
>>
>>>
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada=
,
> K2K 2W5

