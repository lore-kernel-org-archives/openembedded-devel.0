Return-Path: <danismostlikely@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id B353460124
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 04:15:22 +0000 (UTC)
Received: by ykba4 with SMTP id a4so111246236ykb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 20:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Omwrsk0E96A1RCovgzmmlh+xqKIVTMvjvSdzKnPlGBM=;
	b=JuU8lbTAqjW91+kx2rJJIgL7tp6wSfoSUe0EhBQDNPVcZfrah+8rHXY+RId3QpwHIH
	+HXJbRiymtxeX97HC4dAMp90Mg4QwqEZ4YpKSE+9BgIa5Vfq/Et3YOFft/Oe7SPCTu7X
	ZTtFVZX/fba3xpihlskQEBF9ZgGaffh6Z/ioegQUVyirbL+WXmngH4Akk8YMosT5Iv4f
	+exO43xPtAMbyVlty6p+jKl6EaJkAWGYcNdDsotBUOzgNHc32qMVvMbYaGfHfF5qHEOt
	hQRaabhNywq9JedKda8MJ+k7SSiFJmbbpXu4QPTQgNMD2Ltw7JXwXSZQTaYMf99fMi3j
	kMWg==
MIME-Version: 1.0
X-Received: by 10.31.192.7 with SMTP id q7mr4996319vkf.63.1446696922570; Wed,
	04 Nov 2015 20:15:22 -0800 (PST)
Received: by 10.31.237.197 with HTTP; Wed, 4 Nov 2015 20:15:22 -0800 (PST)
In-Reply-To: <4E31BAC6-C2FD-4A5F-816C-C131831653AC@gmail.com>
References: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
	<4E31BAC6-C2FD-4A5F-816C-C131831653AC@gmail.com>
Date: Wed, 4 Nov 2015 22:15:22 -0600
Message-ID: <CACS+7ZTx3+uYroeLVMhbnR92Kn331JAY5WcLLg6T0tT=GRkwMA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/2] python-html5lib: import recipe from meta-openstack
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
X-List-Received-Date: Thu, 05 Nov 2015 04:15:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 November 2015 at 21:59, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Nov 4, 2015, at 7:58 PM, Dan McGregor <danismostlikely@gmail.com> wro=
te:
>>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> This recipe is needed for GateOne.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>> .../python/python-html5lib_0.999.bb                | 27 ++++++++++++++++=
++++++
>> 1 file changed, 27 insertions(+)
>> create mode 100644 meta-python/recipes-devtools/python/python-html5lib_0=
.999.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999.b=
b b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
>> new file mode 100644
>> index 0000000..9ad84e8
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION =3D "HTML parser based on the WHATWG HTML specifcation"
>> +HOMEPAGE =3D "https://github.com/html5lib/html5lib-python"
>> +SECTION =3D "devel/python"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ba5ada9e6fead1fdc32f43c9f10=
ba7c"
>> +
>> +PR =3D =E2=80=9Cr0"
>
> drop it.

Will do.

>
>> +
>> +SRCNAME =3D "html5lib"
>> +SRC_URI =3D "http://pypi.python.org/packages/source/h/${SRCNAME}/${SRCN=
AME}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "acb8ba4d6db5637360a07859192eb7f8"
>> +SRC_URI[sha256sum] =3D "c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1=
b5fd57a23b5fbc49e"
>> +
>> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +inherit setuptools
>> +
>> +# DEPENDS_default: python-pip
>> +
>> +DEPENDS +=3D " \
>> +        python-pip \
>> +        "
>> +
>> +# RDEPENDS_default:
>> +RDEPENDS_${PN} +=3D " \
>> +        =E2=80=9C
>
> why is this needed.

It possibly isn't. This was a verbatim import from what's in
meta-openstack. I'll look into it.

>
>> --
>> 2.6.2.11.gb05c2f9
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

