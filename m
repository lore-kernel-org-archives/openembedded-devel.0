Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 49FA173306
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:35:35 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so7613921pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nOo4H1T9Cacw23tHxSD4hrlfzgsQoLdlqY1nrk4x7YM=;
	b=uy2C3z3yh648HIBm8PaJqUlsouKJ3tockzeoBZ3msZI699ryDTFhxbl8stfKilWU9J
	LqR2xGNCQnC5C4lxwaQfbo6BXttjNY4tL6zjHKLnCL4kEk53GgtAMQZmg/YNWMH3RDqU
	Opula2GCYs79sycQv9TIS3Uk5VC59VOmW9Aa+FMgkwQ2AelWf3af74MBkPaKnkLaSUcX
	aKR01FDNPnmTD5Nw5XsTrDHXmAt8XSU7f+rjpxCe6ZYruVetcg+u18U9i8XG3ofnXabZ
	KKk/p246QFQBFA9jmTNRnJnut1Ore3nCfLEAavFznyV1NTFn+GOEUUSzGMpEuF3jjtNh
	8ZzA==
MIME-Version: 1.0
X-Received: by 10.66.124.137 with SMTP id mi9mr10023562pab.144.1423780537036; 
	Thu, 12 Feb 2015 14:35:37 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Thu, 12 Feb 2015 14:35:36 -0800 (PST)
In-Reply-To: <20150212222204.GJ2272@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-2-git-send-email-schnitzeltony@googlemail.com>
	<20150212222204.GJ2272@jama>
Date: Thu, 12 Feb 2015 23:35:36 +0100
Message-ID: <CALbNGRR=AJAqS2MD=Ve7VMSi5qiCPaxHtRBVKBmhMEQvpURR5A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/19] libmbim: initial add 1.12.2
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
X-List-Received-Date: Thu, 12 Feb 2015 22:35:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 11:22 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Feb 12, 2015 at 10:21:41PM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb | 15 +++++++++++=
++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.=
bb
>>
>> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/me=
ta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
>> new file mode 100644
>> index 0000000..17cfba2
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY =3D "libmbim is a glib-based library for talking to WWAN modems=
 and devices which speak the Mobile Interface Broadband Model (MBIM) protoc=
ol"
>
> SUMMARY should be short, please change to short SUMMARY + longer
> DESCRIPTION.
>
>> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libmbim/"
>> +LICENSE =3D "GPLv2 & LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
>> +"
>> +
>> +DEPENDS =3D "glib-2.0 udev"
>> +
>> +inherit autotools pkgconfig
>> +
>> +SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.ta=
r.xz"
>> +SRC_URI[md5sum] =3D "921fb5ab3f13f1e00833e009d8f3b4f6"
>> +SRC_URI[sha256sum] =3D "949351d3e3d69b81e40a49f1d187944c26149e0647a415f=
0227ccdc112047b29"
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
Wow - I don't care for this but want to be a good boy: What is maximum
length of SUMMARY?

Andreas

