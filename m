Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RNY1L-0007UO-Jh
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 23:50:27 +0100
Received: by wwf4 with SMTP id 4so6110096wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 14:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Z/1FTJ+9ipNCsAinVtu9sG5byJOKU9u3ziTc67OVJ5w=;
	b=yEphYhwIF5d20XA0VU0NEncK96JE9IicnSbDzryp39TE49gZUjVGB4wwFXCgQ+LFsb
	1CmFFB8JNNfAzthJm8QL24I2BwMthB9HpIayIOxm7RtrlTHBYbMDRzBoMcSLcC8rH9Wg
	ECivSLSRxQS7G0JyDtgOwzaaF/51zcOZqsYIo=
Received: by 10.216.54.83 with SMTP id h61mr4023624wec.6.1320705854138; Mon,
	07 Nov 2011 14:44:14 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Mon, 7 Nov 2011 14:43:53 -0800 (PST)
In-Reply-To: <CAE21AQoKSk=GDpKuxH-br02QNf0vxiy7MR1sV2hcayAUpVxzvg@mail.gmail.com>
References: <CAE21AQr7mWqM=RQZBk8k2FUkQW8=jXb6vPBL3k6SnXF5sqRSPg@mail.gmail.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12DBA31174@shsmsx501.ccr.corp.intel.com>
	<CAE21AQoKSk=GDpKuxH-br02QNf0vxiy7MR1sV2hcayAUpVxzvg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 7 Nov 2011 15:43:53 -0700
X-Google-Sender-Auth: mtjFPuN27VjipI3Yhdx7cd-CO1k
Message-ID: <CABcZANkjiquab1vsie0F7ZA_WY6GgT4LyMwefU5+HGphiR21ZQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Understanding recipes vs packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 22:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2011 at 3:34 PM, Charles Manning <cdhmanning@gmail.com> wrot=
e:
> On Mon, Nov 7, 2011 at 6:15 PM, Xu, Dongxiao <dongxiao.xu@intel.com> wrot=
e:
>> Hi Charles,
>>
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>> Charles Manning
>>> Sent: Monday, November 07, 2011 11:32 AM
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: [oe] Understanding recipes vs packages
>>>
>>> Hello
>>>
>>> Something very weird is going on with some changes I have made recently=
 to a
>>> custom image I am building.
>>>
>>> For some reason I was getting libpng12 built and now that no longer hap=
pens.
>>>
>>> In debugging this I've been doing things that now stump me.
>>>
>>> From my understanding, a recipe can build multiple different packages.
>>> For example libpng.inc has the following in it:
>>
>> Yes, it is correct.
>>
>>>
>>> PACKAGES =3D+ "${PN}12-dbg ${PN}12 ${PN}12-dev"
>>>
>>> FILES_${PN}12-dbg +=3D "${libdir}/libpng12*.dbg"
>>> FILES_${PN}12 =3D "${libdir}/libpng12.so.*"
>>> FILES_${PN}12-dev =3D "${libdir}/libpng12.* ${includedir}/libpng12
>>> ${libdir}/pkgconfig/libpng12.pc"
>>> FILES_${PN} =3D "${libdir}/lib*.so.*"
>>> FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/*.a ${libdir=
}/pkgconfig \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/aclocal ${b=
indir} ${sbindir}"
>>>
>>>
>>> Does that mean I should be able to build =C2=A0libgpng12 as follows:
>>>
>>> bitbake libpng12
>>
>> No, package name could not be passed to bitbake as a parameter.
>>
>> Bitbake can accept a recipe name as its parameter, and it will process t=
asks like "do_fetch", "do_unpack", ..., "do_package", etc. for that recipe.=
 In the above case, libpng12 will be generated in do_package task, and then=
 it will be archived into rpm/ipk/deb package formats.
>>
>> Try to run "bitbake libpng" and see if libpng12 is generated.
>
> Yes it is.
>
> OK thanks for the clarification....
>
> So if I want to put the libpng12 in an image then do I need to do
> something like:
>
> # Add libpng to DEPENDS to get the recipe to build
> # Add libpng12 to IMAGE_INSTALL because that's what I want in the package
>
> DEPENDS +=3D " libpng"
> IMAGE_INSTALL +=3D " libpng12"


No. Bitbake knows about both build time and runtime dependencies.
IMAGE_INSTALL's contents are automatically added to the runtime
dependencies of the image recipe, and bitbake will build the recipes
which provide those packages, so all you need is the IMAGE_INSTALL.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


