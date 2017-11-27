Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0763B78411
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:37:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1511811425; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=J7TBOka0hisi1hEoRS9q29DyeaNvQiuNn+YUG1mhm/c=;
	b=MCr03jKye1O3nsEJ1ycBrGVdVo4GKNspMN4Tqwls/L7ZzUjzyDNme/MpgTHYzyu1Cs/XHrxr
	Hww0teVTMzcnXiAoHFD4ErM0oSaSGQeD2xsQJkkNz6fNfFFApdD16gWEX1y4oVZff9JxaTLA
	oQftR+mckZdv2iHAm1RPQLa/yY0=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mxa.mailgun.org with ESMTP id 5a1c6948.7fb9c0be5870-smtp-out-n02;
	Mon, 27 Nov 2017 19:36:40 -0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id f63so33960351qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:36:40 -0800 (PST)
X-Gm-Message-State: AJaThX64Vtj7QsBj52RuXVSWF+u4GC34oGwE5vecHu6DUa+5I+4zXpwP
	joPpHx5KUOpwQ/r37mEZQmlwQSixbJRV+eJpdCc=
X-Google-Smtp-Source: AGs4zMYg8IZJbRh4Yjr3KnA8jhSBkVMisGoEJXZZ+XN1rrf8SEkY6p9D0aBHS3IAPNsrzStynzrlxoF2fPvHywlcUjU=
X-Received: by 10.55.191.1 with SMTP id p1mr39444835qkf.152.1511811399910;
	Mon, 27 Nov 2017 11:36:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 27 Nov 2017 11:36:39 -0800 (PST)
In-Reply-To: <5a08d5c2-ca51-49d2-4939-f151035d3d0a@gmail.com>
References: <1511798104-16019-1-git-send-email-derek@asterius.io>
	<5a08d5c2-ca51-49d2-4939-f151035d3d0a@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 27 Nov 2017 14:36:39 -0500
X-Gmail-Original-Message-ID: <CADNbA1rrAwaRWDFb9HZbw+mTSErnGoeX9A8N6Y6mpp1KXX-HJQ@mail.gmail.com>
Message-ID: <CADNbA1rrAwaRWDFb9HZbw+mTSErnGoeX9A8N6Y6mpp1KXX-HJQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 27 Nov 2017 19:37:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure.  The change you had originally made removed the -std=3Dc++11 (
https://patchwork.openembedded.org/patch/142706/ -
2d07918e9cc6e03f8f864605c84290b66b81e998). The -std=3Dc++11 is required to
build native on Ubuntu 16.04 with gcc 5.4.0 since the default mode was
-std=3Dgnu++98 for gcc before 6.0.  Is there a standard way to query the
build host compiler version and add the -std=3Dc++11?  I can also just drop
the -std=3Dgnu99 portion, but I assume you wanted them both removed?

On another note, any idea if recipes created with BBCLASSEXTEND =3D "native=
"
are included in the world build?  I'd expect to see a failure here because
I believe Martin was using 16.04.

On Mon, Nov 27, 2017 at 1:14 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 11/27/17 7:55 AM, Derek Straka wrote:
>
>> The modification causes issues with the native builds of the package:
>>
>> src/core/lib/surface/lame_client.cc: In function =E2=80=98grpc_channel*
>> grpc_lame_client_channel_create(const char*, grpc_status_code, const
>> char*)=E2=80=99:
>> src/core/lib/surface/lame_client.cc:178:3: warning: =E2=80=98auto=E2=80=
=99 changes
>> meaning in C++11; please remove it [-Wc++0x-compat]
>>      auto chand =3D reinterpret_cast<grpc_core::ChannelData
>> *>(elem->channel_data);
>>      ^
>> src/core/lib/surface/lame_client.cc:178:8: error: =E2=80=98chand=E2=80=
=99 does not name
>> a type
>>      auto chand =3D reinterpret_cast<grpc_core::ChannelData
>> *>(elem->channel_data);
>>
>>
> This looks like an option issue for different compiler version on your
> build host. The patch is trying to paper over it. I think it will be bett=
er
> if we could fix the code to be using right options across different
> compiler versions.
>
>
> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>   meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>>   | 2 +-
>>   meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
>> | 2 --
>>   meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.b=
b
>> | 2 --
>>   3 files changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>> b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>> index 3ca7d53..d4d869d 100644
>> --- a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>> +++ b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
>> @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
>>     DEPENDS =3D "python-protobuf"
>>   -SRC_URI +=3D "file://0001-setup.py-Do-not-m
>> ix-C-and-C-compiler-options.patch \
>> +SRC_URI_append_class-target =3D "file://0001-setup.py-Do-not-m
>> ix-C-and-C-compiler-options.patch \
>>              "
>>   RDEPENDS_${PN} =3D "python-enum34 \
>>                     python-futures \
>> diff --git a/meta-python/recipes-extended/python-pyparted/python-
>> pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python=
-
>> pyparted_3.10.7.bb
>> index 8a15a89..81d61c6 100644
>> --- a/meta-python/recipes-extended/python-pyparted/python-
>> pyparted_3.10.7.bb
>> +++ b/meta-python/recipes-extended/python-pyparted/python-
>> pyparted_3.10.7.bb
>> @@ -1,7 +1,5 @@
>>   require python-pyparted.inc
>>   -DEPENDS +=3D "python-re"
>> -
>>   PV =3D "3.10.7+git${SRCPV}"
>>     inherit distutils
>> diff --git a/meta-python/recipes-extended/python-pyparted/python3-
>> pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/
>> python3-pyparted_3.10.7.bb
>> index ff72c2a..4d6f97b 100644
>> --- a/meta-python/recipes-extended/python-pyparted/python3-
>> pyparted_3.10.7.bb
>> +++ b/meta-python/recipes-extended/python-pyparted/python3-
>> pyparted_3.10.7.bb
>> @@ -1,7 +1,5 @@
>>   require python-pyparted.inc
>>   -DEPENDS +=3D "python3-re"
>> -
>>   PV =3D "3.10.7+git${SRCPV}"
>>     inherit distutils3
>>
>> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

