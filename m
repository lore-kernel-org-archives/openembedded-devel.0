Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5B66BA8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 05:03:42 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so4347597pde.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 22:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yWU12YcFJN5nSeGzoTJwlYhK0R1OJJOZP+Viyldml/o=;
	b=l5JcOYHtL8BQYoiKdhl6wtUbZB7jEEBAR8Pd61CQMRzOIPWRQpNK/km95zV45jU+C7
	JlfYhHObM+vQuyfCaafj3Co4KNQIMJ4cA8IHhpKZtSUfvHQ2n5T2RQ+mHNSd5s59psHm
	KT6rP1BVxLTDlRk52IsU8HL/IrjjkZxRN9Nqcs8jppWO1xTuOUQeeYRoRONqEHpaF61T
	IaY9FhRBuD1hKOTP1clKqFxHeqAXjAxUFoKRTUvTVKhOjkPUidM7k5GptjTKhOFH+SGb
	Hfk2ZwT/oZ4Lh3cnUG/hIo1xIK97zvwyCNd1w/tjHVNh0hg/siCsucviS/FnC9ppWxLH
	cVwg==
X-Received: by 10.68.244.200 with SMTP id xi8mr6766462pbc.156.1377579822660;
	Mon, 26 Aug 2013 22:03:42 -0700 (PDT)
Received: from sa-nc-common2-240.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	os4sm21954605pbb.25.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 22:03:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <21550950.hdvkljmBJI@helios>
Date: Mon, 26 Aug 2013 22:03:37 -0700
Message-Id: <99DB6787-504F-4C7F-BB26-0A1062E9E60A@gmail.com>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<1419577.68pc7GzaiK@helios>
	<C76898E3-8DF0-4327-9A24-510259D58C39@gmail.com>
	<21550950.hdvkljmBJI@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Tue, 27 Aug 2013 05:03:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 2:53 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Monday 26 August 2013 14:39:10 Khem Raj wrote:
>> On Aug 24, 2013, at 2:47 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>> wrote:
>>> On Friday 23 August 2013 10:36:15 Khem Raj wrote:
>>>> On Aug 23, 2013, at 4:33 AM, Paul Eggleton
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>> This bbappend has effectively been merged into OE-Core, although =
the
>>>>> log buffer size is the busybox default rather than 64K - layers =
may
>>>>> change this either by providing their own =
/etc/default/busybox-syslog
>>>>> file (when using systemd) or modifying the
>>>>> CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build =
time
>>>>> config
>>>>=20
>>>> I think it would be better if we added this option via a kconfig =
fragment
>>>> in OE-Core if DISTRO_FEATURES contained systemd and then remove =
this from
>>>> here. I say this because otherwise size of circular buffer goes =
back to
>>>> 16k from 64k and may not be enough to hold valuable info.
>>>=20
>>> Why is this specific to systemd?
>>=20
>> It probably is not. Otavio added it, so I am CCing him
>> however this is default used in many distros, just to keep enough
>> messages around while you can affort 64K buffer which is not a huge =
ask
>> these days.
>=20
> If it's generally useful and not specific to systemd (and it seems it =
isn't the=20
> latter) I'd have to say I agree, let's set the default in our busybox=20=

> defconfig.
>=20

I have no issues with changed the defconfig.

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


