Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12FD265D6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 06:25:39 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so596281pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=FVvAhyBqMC4zo0Y1Wb/AxQoGgP1lifaTeV+oSady0UU=;
	b=Pv+H23MLEGDu/QxEKXekBs7Y9Tu9i5fTYRT7Ji8MmVI7XpTYIuy1lw5suDyNMKG62c
	Veqh4LKH88bvlHijbh2VhICD3fBANdolMh4AbY+5ZuyaM30Bsd2c/F7D0WI/dl76hsU/
	vOH+7TC6CECaFxzQtx7yt31yvYhhi0pelp6FZH6b0/ffNTVWafrGveCjnzjn2ntq9gRx
	O/SNdaCbxuN4dlULump+RMOhCCqoMZ1PSin22HbTe0W2p9cY6mGp0KMzz2DpJsLTCPh+
	QJ/iKfv5SCKHngzuyFmWXl5XOGO0iV2KuEAj00TQXh1yzcDLt44iioStLTb/8Vx6ZKK9
	EAmg==
MIME-Version: 1.0
X-Received: by 10.70.88.145 with SMTP id bg17mr31406297pdb.167.1432707940535; 
	Tue, 26 May 2015 23:25:40 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 26 May 2015 23:25:40 -0700 (PDT)
In-Reply-To: <CAMKF1so3YuLs49Ng1e08+WK4kOp4Ocpb60gGPVn3LZUOMGQaDw@mail.gmail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-3-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1so3YuLs49Ng1e08+WK4kOp4Ocpb60gGPVn3LZUOMGQaDw@mail.gmail.com>
Date: Wed, 27 May 2015 08:25:40 +0200
Message-ID: <CALbNGRRCTv8EBGdz9UEHfvvL3wRUjrfct36KUR-zED9MDe7Frw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, stephen.arnold42@gmail.com, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 02/12] openjpeg: initial add 2.1.0
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
X-List-Received-Date: Wed, 27 May 2015 06:25:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 6:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> there is a recipe available here
> http://layers.openembedded.org/layerindex/recipe/25686/
> may be you want to coordinate with that layer to migrate it into meta-oe =
?
>
> On Mon, May 25, 2015 at 2:13 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb | 18 ++++++++++++++=
++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>>
>> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb b/meta-=
oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>> new file mode 100644
>> index 0000000..9f6dd57
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION =3D "OpenJPEG library is an open-source JPEG 2000 codec"
>> +HOMEPAGE =3D "http://www.openjpeg.org/index.php?menu=3Dmain"
>> +
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc648878b4840d7babaade1303e7f=
108c"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}.mirror/${PV}/${BPN}-$=
{PV}.tar.gz"
>> +SRC_URI[md5sum] =3D "f6419fcc233df84f9a81eb36633c6db6"
>> +SRC_URI[sha256sum] =3D "1232bb814fd88d8ed314c94f0bfebb03de8559583a33abb=
e8c64ef3fc0a8ff03"
>> +
>> +inherit cmake
>> +
>> +DEPENDS =3D "libpng tiff lcms"
>> +
>> +# standard path for *.cmake
>> +EXTRA_OECMAKE +=3D "-DOPENJPEG_INSTALL_PACKAGE_DIR=3D${baselib}/cmake"
>> +
>> +FILES_${PN}-dev +=3D "${libdir}/cmake/*.cmake"
>> --
>> 1.9.3
I checked: That layer uses openjpeg only native. Suggestion: Will try
to extend openjpeg for native / build mupdf from
meta-alt-desktop-extras and send a follow up. OK?

Andreas

