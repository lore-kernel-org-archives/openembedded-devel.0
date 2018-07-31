Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F59E78D81
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:39:45 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id p12-v6so6722288vkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TxtUEqGe2Dekubi3Fya/5fSemj+x9MHp1FQKWBanzD8=;
	b=tjbVe6F4UfoPvgCSn+VmdpEx407HXLPF58R2b9IwJgXfN2sbqmeIRIVsAxDiztecWc
	YTfw4vCebo+JgldRCqNitydlQOums/dMDVzbPwJyBKJ9SklieQVwslKWf6hosvmHIrSg
	Gn7S9A2XHhvCUyEdbe1qqfNa8ODkGcroNebKmJey3fvamgbWdNBbHj6g5dlZY+HoWvW0
	OW0Go2KIFdyINF8DeQpI1vjBEQv08RqCEWyBAVP5EE+C2DaOPX3xEu+fbDbkQFIBmmPm
	cDIcpf9pjLLfkor76OlbmMFc2dfo/tOFsHF9/9zAhjOBBFkNbL+kzeVDXbfPSGM5NBSe
	IpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TxtUEqGe2Dekubi3Fya/5fSemj+x9MHp1FQKWBanzD8=;
	b=P8DvxQHMdO84NLqwSh2/9W2Nl6mpgNXktONScvtk9gHqOzi6fIxmiPmdBMXy04rKt2
	qhLiTB7HtDYE6TJogGkmKeEyanhbaIY9bdWWjaqh4y44/ASYX7Tk3CYrUMbA2j3LsW8y
	nmoj+A5HOVpmC0NT2/GnidZ7/d/sukzenAEs0lzT5LYaF/nyRjviJMHMbg81QiGcuLgS
	3WPJzdb613oYoQkxQfD65kAzFWKZUHVOz6Zg3VBvC99lzoWWy3AJjg58J2SsAsz0i1a1
	ADuqQlgA+PQo1i7W/hUJKKB4gyNLJvgJEfQ+s9bD+saRaeCrlbKcEuPss5HChXDVK/Up
	8NYA==
X-Gm-Message-State: AOUpUlH2E7lLqu4m+XJWtNRB6vOyb1BVlX75GOh5o2NgmrArurVLo0Dw
	bq7x1YLzzcx9V6UKtRFoB0GUCe7XdGghxJVWLPhxFA==
X-Google-Smtp-Source: AAOMgpcFC28hoTiQBbr9sMFX/WA9lLb7buiBShRLvCA4ihOFlsW11ij1otK6EGdfxKi5z4He5/UdtM/IwpxOWlki8mg=
X-Received: by 2002:a1f:b9ca:: with SMTP id
	j193-v6mr12620507vkf.139.1533001186395; 
	Mon, 30 Jul 2018 18:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
	<20180730021613.26889-2-robert.joslyn@redrectangle.org>
	<CANx9H-C9T8NyDrBwbwq7d_OLftU9g_cHg=fcLg1oc8_oiPSWsA@mail.gmail.com>
In-Reply-To: <CANx9H-C9T8NyDrBwbwq7d_OLftU9g_cHg=fcLg1oc8_oiPSWsA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 30 Jul 2018 18:39:35 -0700
Message-ID: <CANx9H-AzcN0exR0xb1w4xytWbjUNxfQhg0YirfjOmxKjDEaxsw@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 2/5] python-traceback2: Add recipe
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
X-List-Received-Date: Tue, 31 Jul 2018 01:39:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, it=E2=80=99s a backport. Never mind

On Mon, Jul 30, 2018 at 6:38 PM Tim Orling <ticotimo@gmail.com> wrote:

> Why no python3 version n as well?
>
> On Sun, Jul 29, 2018 at 8:42 PM Robert Joslyn <
> robert.joslyn@redrectangle.org> wrote:
>
>> ---
>>  .../recipes-devtools/python/python-traceback2_1.4.0.bb    | 15
>> +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/
>> python-traceback2_1.4.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python-traceback2_1.4.0.bb b/meta-python/recipes-devtools/python/
>> python-traceback2_1.4.0.bb
>> new file mode 100644
>> index 000000000..696c875c6
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY =3D "A backport of traceback to older supported Pythons"
>> +HOMEPAGE =3D "https://github.com/testing-cabal/traceback2"
>> +LICENSE =3D "Python-2.0"
>> +LIC_FILES_CHKSUM =3D
>> "file://PKG-INFO;beginline=3D31;endline=3D31;md5=3D368ddc8588431c180ae7c=
33f4fb57519"
>> +
>> +DEPENDS =3D "${PYTHON_PN}-pbr-native"
>> +
>> +SRC_URI[md5sum] =3D "9e9723f4d70bfc6308fa992dd193c400"
>> +SRC_URI[sha256sum] =3D
>> "05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030"
>> +
>> +inherit pypi setuptools
>> +
>> +CLEANBROKEN =3D "1"
>> +
>> +RDEPENDS_${PN} =3D "${PYTHON_PN}-linecache2"
>> --
>> 2.16.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

