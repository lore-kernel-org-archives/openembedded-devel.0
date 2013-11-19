Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id BB1506D2F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 08:47:54 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id q12so1920911vbe.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 00:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6Y5T27LZ8A9R9rU2OodyDixtfvCiBmry95HCVKavevw=;
	b=tI7yetnWKKiijLmTKltn1ndJIADFxGQUbMKXbHR0w8ThW2sFUHBhVxIG/1mqkbzW3t
	BBeiA9ZYZOIJozoxT5KbgxTJeE4tu+XjnVfm+Qu2ORxIM67BixuMuhED2jTc9CxELZtK
	/BJZ8RidpOr1hqCV0XLCRgxnw+gG8wVqaWgVg3NKtGLBn+ums7rK/lwzCk+S8E5UVnQA
	3axJGjLc8tihtjo3324syLEeyPSjC89nD81IgnB2SGZBqlmQbwxVUVDS4TLU8YRNL1uH
	HQYEZ/aLNXiEdnsF/MG2NjuC9MxAxpYi1VD5jjLzeirtenyDNYzMdIszoVJDemnTqwTq
	3sQA==
MIME-Version: 1.0
X-Received: by 10.52.165.131 with SMTP id yy3mr683220vdb.25.1384850875930;
	Tue, 19 Nov 2013 00:47:55 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Tue, 19 Nov 2013 00:47:55 -0800 (PST)
In-Reply-To: <20131118222319.GK3727@jama>
References: <1384548309-29331-1-git-send-email-schnitzeltony@googlemail.com>
	<1384548309-29331-2-git-send-email-schnitzeltony@googlemail.com>
	<20131118222319.GK3727@jama>
Date: Tue, 19 Nov 2013 09:47:55 +0100
Message-ID: <CALbNGRTmJbjEiLdWaC7v71ALUaEBup9-6F9uSU7BDf1kpF8Rgg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mpd: update to 0.18.4 and get sources from musicpd.org
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
X-List-Received-Date: Tue, 19 Nov 2013 08:47:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 11:23 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Nov 15, 2013 at 09:45:09PM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../musicpd/{mpd_0.17.1.bb =3D> mpd_0.18.4.bb}                   | 10 +=
++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.17.1.bb =3D> m=
pd_0.18.4.bb} (89%)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
>> similarity index 89%
>> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
>> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
>> index 6f2a912..b89eb0e 100644
>> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
>> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
>> @@ -5,15 +5,15 @@ HOMEPAGE =3D"http://sourceforge.net/projects/musicpd"
>>
>>  DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2=
 ffmpeg curl sqlite bzip2 pulseaudio"
>>
>> -PR =3D "r4"
>> -
>>  SRC_URI =3D " \
>> -    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
>> +    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
>>      file://mpd.conf.in \
>>  "
>>
>> -SRC_URI[md5sum] =3D "da3f3d6617a877192db4c6f53504cd38"
>> -SRC_URI[sha256sum] =3D "b18cdb1b779ca2ab323e212a0af4a567b7da4881a4e9686=
8a8979bdfdbe7c2e8"
>> +SRC_URI[md5sum] =3D "0d881fb32f9d31afcdb0bb13cb78b9ab"
>> +SRC_URI[sha256sum] =3D "6b171985f192603150c879d105dc4d05d701ac60a2db416=
30a4dce823e068388"
>> +
>> +S =3D "${WORKDIR}/${PN}-0.18"
>>
>
> Can you please review/test
>
> http://patchwork.openembedded.org/patch/56953/
>
> thanks
>
OK - hope to find time for that next week. Could you take the
libmpd-patch meanwhile?

Andreas

