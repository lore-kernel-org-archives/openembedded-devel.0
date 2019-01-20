Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id AD1566B43D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2019 09:22:18 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id u47so19958069qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2019 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NBzyeeEMbnx8cmzmVA5dRV4lrT4p5RGKpaFhOidcpb8=;
	b=TK2ovRpp5tRTbbNiB/9DyH10SOBkX+Y1N6f8DwA+1RnMv45c3fBDERTH9zlLC3rBKj
	Uz0daW8zZHp6qHZ86LVXM8Ox9vIgmPFcDJhgFiEKCceZx1Il7GSiN7FSmqae4RqRbExE
	srarKGhYW7y+dKjlI0BRKNxvP8xY6gHBD6giy77OpO1Lda17RNcOac6PNFrRIyI3JXKz
	/XbilOq7YUUhustVAMc7iM6e34cneLh4U5mNaj8Apx9lQTqBXqM/7HVOzxK3XRygmZ4N
	Cbn8tUnjET9jlk2S11JgAiMfMcoBcVqv0hE0tmYVeOngh2fZ8kSEOkxsCSZxeOQbFkat
	xRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NBzyeeEMbnx8cmzmVA5dRV4lrT4p5RGKpaFhOidcpb8=;
	b=dSSRukbgGAu6XXft+t0FJpB1k4z7Vn3aW7BdNYYK8O34vKOJhlhA5CvhxAfbtdM6AF
	u+4QpVGZFIPB9RNzx8uSE9RU56bEOfm+hpily6tL9Yv3wfEPNLMs0YVU8KMgypYTrmdR
	wFbVRdjogZ0faZiKQia6VtsnqKDUtfCQhbHEBJFhWVdPNJMcw0VngcpWJsOGnujBml47
	bgdidrT1Kt2Du0Frw5dJT4A/F8ywis0vbjSQ2nc5yvzchwIYmIg9KlzQl8fTWlqL32U/
	qf+jlcWS5LAtl+36lRWvjbDDRayP1a+vSFVRedaUKhko7Nfop+Xt/YfDTZfmwpUirJ2K
	UL6A==
X-Gm-Message-State: AJcUukfKcer0kkXAWuCQ+ct/dwKMBNjwTSP1MTyghrPAl63Y7QEx4Unu
	paftKMqEuCXpHh8+W8+oGdOmeCuMxBc4YXzEjGs=
X-Google-Smtp-Source: ALg8bN73wKUXlD4n/fhbLHBLrVI2N0lBwQ14oPDZfbuH081DwMyv6CubEZcNkdbw/SjK8I0wQXo8ygiqDM9B8uSpXhI=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr21971629qvg.194.1547976139034;
	Sun, 20 Jan 2019 01:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20190119174544.19389-1-shantanu@senic.com>
	<CAMKF1sokeASo4H1JC6oFmZwvM2F_-PHZH0T-nYz04kaEaGd8xw@mail.gmail.com>
	<CAGeQtJT=5o8dp=vi5gziNZ0CzZtf-DHXB=jUCps1C0dOJ2oW6w@mail.gmail.com>
In-Reply-To: <CAGeQtJT=5o8dp=vi5gziNZ0CzZtf-DHXB=jUCps1C0dOJ2oW6w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jan 2019 01:21:53 -0800
Message-ID: <CAMKF1sooDGVUnWTe9FGi1gd27_D=bN9K8wzp7CGifcYqYRA7xg@mail.gmail.com>
To: Shantanu Choudhary <shantanu@senic.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sun, 20 Jan 2019 09:22:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2019 at 6:56 PM Shantanu Choudhary <shantanu@senic.com> wro=
te:
>
> Hello Khem,
>
> Thanks for the review and suggesting the fix,
>
> On Sun, Jan 20, 2019 at 4:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This does not address the build problem that I mentioned, please send
>> a fix the dep should be converted into rdep
>>
>> RDEPENDS_${PN} =3D "python3-core"
>
>
> When I move python3-core to RDEPENDS_${PN} I start getting following erro=
r:
>
> FileNotFoundError: [Errno 2] No such file or directory: '[clipped]/python=
3-bsddb3/6.2.6-r0/recipe-sysroot/usr/lib/python3.5/config-3.5m/Makefile'
>
> We are currently using Rocko 2.4 branch and that's where I am testing the=
 changes before submitting the patch.
>

Then add DEPENDS +=3D "python3"

test it on master if you want to upstream it.
>>
>>
>> On Sat, Jan 19, 2019 at 9:46 AM Shantanu <shantanu@senic.com> wrote:
>> >
>> > Included correction suggested from Khem of using STAGING_EXECPREFIXDIR
>> >
>> > Signed-off-by: Shantanu <shantanu@senic.com>
>> > ---
>> >  .../python/python3-bsddb3_6.2.6.bb            | 19 ++++++++++++++++++=
+
>> >  1 file changed, 19 insertions(+)
>> >  create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3=
_6.2.6.bb
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.=
bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
>> > new file mode 100644
>> > index 000000000..81baf98fd
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
>> > @@ -0,0 +1,19 @@
>> > +SUMMARY =3D "pybsddb is the Python binding for the Oracle Berkeley DB=
"
>> > +HOMEPAGE =3D "https://www.jcea.es/programacion/pybsddb.htm"
>> > +SECTION =3D "devel/python"
>> > +LICENSE =3D "BSD-3-Clause"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db3c8796b7e1f8eda0aef7e=
242e18ed43"
>> > +SRC_URI[sha256sum] =3D "42d621f4037425afcb16b67d5600c4556271a071a9a7f=
7f2c2b1ba65bc582d05"
>> > +
>> > +inherit pypi setuptools3
>> > +
>> > +PYPI_PACKAGE =3D "bsddb3"
>> > +
>> > +DEPENDS =3D "db \
>> > +  python3-core \
>> > +"
>> > +
>> > +DISTUTILS_BUILD_ARGS =3D "--berkeley-db=3D${STAGING_EXECPREFIXDIR}"
>> > +DISTUTILS_INSTALL_ARGS =3D "--berkeley-db=3D${STAGING_EXECPREFIXDIR}"
>> > +
>> > +RDEPENDS_${PN} =3D "db"
>> > \ No newline at end of file
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
>
> Shantanu
>
> Software Developer at Senic
>
> Join Newsletter =C2=B7 We're hiring =C2=B7 In the News
>
> SENIC GmbH
> Pfuelstr. 5
> 10997 Berlin
> Germany
>

