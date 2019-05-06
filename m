Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 180C27D443
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 10:56:38 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id t200so19147512itf.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XZyO3M3FT896Zk1SfSsBNT+ikLxnXXKZCD38ObIEPRU=;
	b=bGeUuoxG8Kr0u2K/N78sDWaWvw7TG3ppe7J1s0nQTXDBbNqhFg11qbl1D3d78oS232
	x7bZwQMJEO7d/51XO9W20/yywQ8kSOHjS2vBLT6fVMp7ZRQIRXtm7W00uglTxAJi3xUQ
	yuMt9TjEV6dzyAcgFAAumOKTTkLXlnr9mnvanwZTeKMto5/7b2u2y9A4wi/u06YRG63r
	d6UTrz081KI97lmLTofg/C67BnhdrYwJ9E+bLf+rDQU7JgBOmpKRPBMpCkJ3dmvRY3Dm
	ihkdPpu7nYx6o2q6tKTvT1Zs2StyfsfjoYFz9riYiEpqUi8vkyMdKjKUJvUzMrlF4qKx
	fwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XZyO3M3FT896Zk1SfSsBNT+ikLxnXXKZCD38ObIEPRU=;
	b=BHzy/roKz+xGKEeROuX24GYIsvFAfzNqC0q4NTtqloIVsLnzH1ghC3gD5EXzLUw1J9
	74jpwa25lRw8EBtBDKrPt1gDiRYl86hhn5b5ZUFzVNZMNQadhLEM4OaDl6kzheNUl3xf
	Xd1YmWiVpExOJWYz49wgxzXscxslVLeRTStWpv2i3xugotoxWL3eDb8QhPGx8cFkBlOk
	ccjlivCfHP3x6rEr8m3jgPKlZ8Mt+7RpkLcTb3/h6icG+JC7mIM9sNSag6V2VMfMMUmH
	l6SEjQ4sXT1bZGPtygjeURf+8LnVm33bP2ilBoP3lmPs+7Wre3An4K6KscXSnv2stII6
	94zw==
X-Gm-Message-State: APjAAAUQHQ6WnPR1iaNGJwDE59JsF1ZE25LRocDhZkfYkYylqwgYAng8
	tG7fq+5nAhhmSXF+xHIaQkHjcccqXaZN2BdGnm4=
X-Google-Smtp-Source: APXvYqwWdw3TVetX0pMdRjxWk1Tt+R5TQb9yQIkl4FKmuK0gVMA8RMx2Eo4o++8q3cx3SLZ/AkxXEVXXeU6ekyIHYDk=
X-Received: by 2002:a24:fa88:: with SMTP id
	v130mr18055612ith.122.1557140200086; 
	Mon, 06 May 2019 03:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190206004547.32351-1-raj.khem@gmail.com>
	<20190206004547.32351-5-raj.khem@gmail.com>
	<CAB2nKc-E50apsLZGJYgGA85iXbFo8xEV8Mv9=QtfVbeHr4vtUw@mail.gmail.com>
In-Reply-To: <CAB2nKc-E50apsLZGJYgGA85iXbFo8xEV8Mv9=QtfVbeHr4vtUw@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 6 May 2019 12:56:28 +0200
Message-ID: <CAB2nKc8LJvJXHy3cwysjm6irTEHdjPx6ROMo_YvRpZ+YJkbnRw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/6] mongodb: Fix build with clang
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
X-List-Received-Date: Mon, 06 May 2019 10:56:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Removing this patch allow me to compile mongodb with gcc.
Maybe you need to append 0001-asio-Dont-use-experimental-with-clang.patch
only if clang is used?

Le ven. 3 mai 2019 =C3=A0 10:35, Vincent Prince <vincent.prince.fr@gmail.co=
m> a
=C3=A9crit :

> Hi Khem,
>
> I can't compile mongodb in Warrior branch with g++ either,
> it fails in boost::asio with std::basic_string_view with "-std=3Dc++14"
> cflags.
> It seems C++17 support is only present in 4.1.x branch and not in r4.0.6?
> Maybe we need to generalize this patch?
>
> Regards,
> Vincent
>
> Le mer. 6 f=C3=A9vr. 2019 =C3=A0 01:47, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...sio-Dont-use-experimental-with-clang.patch | 28 +++++++++++++++++++
>>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb    |  1 +
>>  2 files changed, 29 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with=
-clang.patch
>>
>> diff --git
>> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wi=
th-clang.patch
>> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wi=
th-clang.patch
>> new file mode 100644
>> index 0000000000..b597422e40
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wi=
th-clang.patch
>> @@ -0,0 +1,28 @@
>> +From 31ca5c563f1d9a3f70258be3dd2b1e547a65a550 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 5 Feb 2019 00:21:12 -0800
>> +Subject: [PATCH] asio: Dont use experimental with clang
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + .../asio-master/asio/include/asio/detail/string_view.hpp      | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git
>> a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
>> b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
>> +index 222c02186d..3bf7494529 100644
>> +---
>> a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
>> ++++
>> b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
>> +@@ -28,8 +28,8 @@
>> + namespace asio {
>> +
>> + #if defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
>> +-using std::experimental::basic_string_view;
>> +-using std::experimental::string_view;
>> ++using std::basic_string_view;
>> ++using std::string_view;
>> + #else // defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
>> + using std::basic_string_view;
>> + using std::string_view;
>> +--
>> +2.20.1
>> +
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> index 6494e25bf0..53a9f66117 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> @@ -21,6 +21,7 @@ SRC_URI =3D "git://
>> github.com/mongodb/mongo.git;branch=3Dv4.0 \
>>             file://arm64-support.patch \
>>
>> file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
>>             file://0001-Support-deprecated-resolver-functions.patch \
>> +           file://0001-asio-Dont-use-experimental-with-clang.patch \
>>             "
>>  SRC_URI_append_libc-musl =3D"\
>>             file://0002-Fix-default-stack-size-to-256K.patch \
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

