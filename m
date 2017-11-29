Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7C478200
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 07:47:31 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id w7so1148099pgv.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 23:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Jwz7GiV6MCfC2QcRmGZbHqF/J9H/iD5Eywp9wJ3CSmc=;
	b=sGT9aiSX75nwOeol+MIAt3v1aWHxoEZbdc4k7Amc5A2F7migmyfdBYpM52ooxOgtaz
	oM0Pmduq0ZJBGQZUR2SNOkYutdzRrcZdNctEDKFj8mpIwiDdE3HQN9HPYw8Fp0Mq0PXJ
	7/IxMe5sMrUTA49heQN3iEbAVSI+9lsIyULaJsGbC6uhEEPmscwhqqBNvcLZdQvnc13z
	ozTJV7Wm3iYtC+oUpSGOsIeXHDMMIcsDT6p18QmmN/vb1Q3G6AnNgCa/gLd9QSQ4tWkt
	2QUDcW35ORwjRWuZqxfDcjkPeDVPxWIto7NkyrJAwWrCbnuOU2jATp5QtO4oxGID7lo+
	ktwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Jwz7GiV6MCfC2QcRmGZbHqF/J9H/iD5Eywp9wJ3CSmc=;
	b=IiTk0Jx9JWGkzkt+HUgPZ1fUEVWMRYKBG74jBENhMU4KLtPJpPRNA+oY/cKm3mDzje
	NDtrRnCalCxyNOgq9086Liotc/tnSfDArLSJSp2oKqIBve47EdU2OknWZNB3cD2y0X2y
	tc+qG/xlBLq+q0Jmq/o4HdEDKpgREFEHpyvb0WL00+fD0+CzmYSRIM63yBxs/eNkE30X
	SGlx29am/O7NW2woSmIgtkn/BO6M2lwSIsgf1ogNf1xnv8//YSpDZ4UsRJwyRW2Vjso0
	kjTYQOaOkTr33ni2WUVrDh4/3sd1s95sf6Z59b88DPwLuqQf1YA+NPdov/1Jc1/8abu+
	245Q==
X-Gm-Message-State: AJaThX4jYJaGOuHYkwv+U+6Ir0/2XNC9qWbH28ZUA3oK6XdS8HA7BLtN
	4omDE/9LUh7J8LXRXv9FbPblb4fIQPtZ2VIKZ24=
X-Google-Smtp-Source: AGs4zMbGbXX+iOkT3yQxdIeb5vw6xgRyh66NPcgp7jdCnHWs+aK+/iTjqcJ7hZh8tuZUTb59t4oafJW3l+hy+n7kTTA=
X-Received: by 10.101.74.136 with SMTP id b8mr1948559pgu.341.1511941653309;
	Tue, 28 Nov 2017 23:47:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 28 Nov 2017 23:47:02 -0800 (PST)
In-Reply-To: <CADNbA1rrAwaRWDFb9HZbw+mTSErnGoeX9A8N6Y6mpp1KXX-HJQ@mail.gmail.com>
References: <1511798104-16019-1-git-send-email-derek@asterius.io>
	<5a08d5c2-ca51-49d2-4939-f151035d3d0a@gmail.com>
	<CADNbA1rrAwaRWDFb9HZbw+mTSErnGoeX9A8N6Y6mpp1KXX-HJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2017 23:47:02 -0800
Message-ID: <CAMKF1srR4GS=qk8TRVrZjMJrtDiOyWAdj4Eah6ASx+Et-7sTFQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-grpcio: only modify the compiler arguments on the target build
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
X-List-Received-Date: Wed, 29 Nov 2017 07:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 11:36 AM, Derek Straka <derek@asterius.io> wrote:
> Sure.  The change you had originally made removed the -std=3Dc++11
> (https://patchwork.openembedded.org/patch/142706/ -
> 2d07918e9cc6e03f8f864605c84290b66b81e998). The -std=3Dc++11 is required t=
o
> build native on Ubuntu 16.04 with gcc 5.4.0 since the default mode was
> -std=3Dgnu++98 for gcc before 6.0.  Is there a standard way to query the =
build
> host compiler version and add the -std=3Dc++11?  I can also just drop the
> -std=3Dgnu99 portion, but I assume you wanted them both removed?
>

I think its ok to not apply this patch for native builds.

> On another note, any idea if recipes created with BBCLASSEXTEND =3D "nati=
ve"
> are included in the world build?  I'd expect to see a failure here becaus=
e I
> believe Martin was using 16.04.
>

If its not in the depchain for target packages its wont be built.

> On Mon, Nov 27, 2017 at 1:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 11/27/17 7:55 AM, Derek Straka wrote:
>>>
>>> The modification causes issues with the native builds of the package:
>>>
>>> src/core/lib/surface/lame_client.cc: In function =E2=80=98grpc_channel*
>>> grpc_lame_client_channel_create(const char*, grpc_status_code, const
>>> char*)=E2=80=99:
>>> src/core/lib/surface/lame_client.cc:178:3: warning: =E2=80=98auto=E2=80=
=99 changes
>>> meaning in C++11; please remove it [-Wc++0x-compat]
>>>      auto chand =3D reinterpret_cast<grpc_core::ChannelData
>>> *>(elem->channel_data);
>>>      ^
>>> src/core/lib/surface/lame_client.cc:178:8: error: =E2=80=98chand=E2=80=
=99 does not name a
>>> type
>>>      auto chand =3D reinterpret_cast<grpc_core::ChannelData
>>> *>(elem->channel_data);
>>>
>>
>> This looks like an option issue for different compiler version on your
>> build host. The patch is trying to paper over it. I think it will be bet=
ter
>> if we could fix the code to be using right options across different comp=
iler
>> versions.
>>
>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>   meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>>> | 2 +-
>>>   meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.b=
b
>>> | 2 --
>>>   meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.=
bb
>>> | 2 --
>>>   3 files changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>>> b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>>> index 3ca7d53..d4d869d 100644
>>> --- a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>>> +++ b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>>> @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
>>>     DEPENDS =3D "python-protobuf"
>>>   -SRC_URI +=3D
>>> "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
>>> +SRC_URI_append_class-target =3D
>>> "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
>>>              "
>>>   RDEPENDS_${PN} =3D "python-enum34 \
>>>                     python-futures \
>>> diff --git
>>> a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.b=
b
>>> b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.b=
b
>>> index 8a15a89..81d61c6 100644
>>> ---
>>> a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.b=
b
>>> +++
>>> b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.b=
b
>>> @@ -1,7 +1,5 @@
>>>   require python-pyparted.inc
>>>   -DEPENDS +=3D "python-re"
>>> -
>>>   PV =3D "3.10.7+git${SRCPV}"
>>>     inherit distutils
>>> diff --git
>>> a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.=
bb
>>> b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.=
bb
>>> index ff72c2a..4d6f97b 100644
>>> ---
>>> a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.=
bb
>>> +++
>>> b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.=
bb
>>> @@ -1,7 +1,5 @@
>>>   require python-pyparted.inc
>>>   -DEPENDS +=3D "python3-re"
>>> -
>>>   PV =3D "3.10.7+git${SRCPV}"
>>>     inherit distutils3
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

