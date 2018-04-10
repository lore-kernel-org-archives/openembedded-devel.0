Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B97974781
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 13:25:20 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id 126-v6so11123275oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 06:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HGTLihTyZVHnN31PJCDjwCsvq+4FmokPcfbwV1ycSsM=;
	b=b2jF1rRWLd7CEWDVMyKVNTLYgTFW7iJZtBhAOmTJAczSB2Xs7Oo7pphaFhu6oZXt9L
	VEXueNJGNziKki4kJvvQs1CvOZWSaUMClYuGiCj8QB663CwUYJsJpjidkXu/wUjzXGQ8
	GH2jCh/nZQtMJjqrou1nArxpmc13pCxbaFwPyPvGDjHoKmDEZZTOJCt5AhK2Ix0HgW5h
	FdOp7GxSaPNH+YQGYw5nQhnOoM8DODyZ/E2yHQ7dJmzvUWHmQsE679y9piBUbt31e0B0
	3i0/wRWZgXD/thsgYOsDA1gc92vIo7YTZW8TBoOZsc2ikyC6cOXGXEddVFkr6t0Ij0aK
	lnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HGTLihTyZVHnN31PJCDjwCsvq+4FmokPcfbwV1ycSsM=;
	b=SQXlb9pYH97BOmEzkow5wxX/EsozqkO1sOzlRoY6/yv6M6Hja+Xngr40D0Fgvd26KX
	KkWQntJJxROhxK3W32JfEv4KQMZrm07K685nPOhHOCK5kYj99Fsn/CYuxibmW6xl2foW
	78iK9670gH26+Lj6brdg+QC56cqzxaLXpfR4N7awwlnwNlzyOnVfMFR7y4qRuikzzCbH
	FvIB4Uk84f1EIoztPtXXiSbmEdUTN47Qm4goT0dWeoUSyGVWAItIXumYok8BAGKJv9ld
	S6xH6XjkblwY1O35moN/Gh5jNpPropQGs0qB3Dsss5xiJBCslbPX8pK3myocOGVEN5qi
	1uMg==
X-Gm-Message-State: ALQs6tBAps9X6iS7bKezYuWlKfGvp8jXtyNcorIX7yku7fY6zn2PLZmJ
	4UqNm5mfSllWw/u3mtjV9tmfRrpI7WXnqbOMuN8=
X-Google-Smtp-Source: AIpwx4+ze32uDOERrz/hK9Qa3EjsRjUM+kGnWMVGwIFZDa6G1FuNwoRyGZawqvijaC5ZKbJV1JSLCxY9w81XC/O5wyw=
X-Received: by 2002:aca:b443:: with SMTP id
	d64-v6mr292598oif.104.1523366721561; 
	Tue, 10 Apr 2018 06:25:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Tue, 10 Apr 2018 06:25:20 -0700 (PDT)
In-Reply-To: <3a6ed034-db91-c9e1-5a90-b5dc7e820814@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
	<3a6ed034-db91-c9e1-5a90-b5dc7e820814@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 10 Apr 2018 15:25:20 +0200
Message-ID: <CALbNGRSsa7LvFqwUj_5zCPVLKahnQ2PbXc4VFtoSS-7SziBgXQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Fixes and updates for sumo
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
X-List-Received-Date: Tue, 10 Apr 2018 13:25:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 12:39 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 04/09/2018 03:02 PM, Andreas M=C3=BCller wrote:
>> History:
>>
>> 1. networkmanager: fix gobject-introspection/musl and cleanup: This was =
sent
>>    already but not applied yet. Now I know why: It introduced a parse er=
ror
>>    for PACKAGECONFIG. I removed this 'fix' - the recipe was perfectly fi=
ne. I did
>>    not notice this error because one of my layers overrided PACKAGECONFI=
G for
>>    networkmanager.
>> 2. poppler: Rework patch fixing do_configure: resend
>> 3. poppler: update 0.62.0- > 0.63.0: resend
>> 4. poppler: fix build for TARGET_FPU =3D "soft": Fix for qemuarm build e=
rror on
>>    autobuilder
>> 5. New - more meta-gnome cleanup
>> 6.-
>> 9. New - build- and run-tested on Raspi3
>
> Thanks. I will pull in for the next planed build.
>
Hi Armin,

can you please update stagging/master-next then - last update upstream
is 3 weeks old. For me that would help to see what the autobuilder
builds currently (and if patches are not applied look into further)

Regards

Andreas

