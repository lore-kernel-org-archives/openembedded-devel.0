Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDOvn-0007pA-0L
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 23:02:16 +0100
Received: by gwaa11 with SMTP id a11so4677213gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LYnC2GCCGfeiFrI42tLgGxUjT2nr99qiYpJMGF1JZ3c=;
	b=fnNrHfKqgEdybQFh/nj4EK+vMaRGEysI+I4WRzzTMVu9/2LJ00IX2LeHuwGGItdHxS
	0cv1eRL/OCoLWgzacrprZ7ko0v9W6eq4fXeobLb9fjHC9ExQCpkymumvuCP2pk/rRKo/
	SNDRxjRBZ3x7mRKOtQS9y7PmZkK6idT4GAABU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JcA7mwol+qEzS96pjlJ9FRscTqvEQFZXd1AdfiWQZvPNge+e0sXZxJJ1YR++79a8ny
	H883b0THh+UHzb1jIf5jXxKLRRDo2oq0EgULTNkqgzQykD03v3r/AzIG1FF3Srjfy+9D
	NavPwndoVdzAN4jN7tYrMrPk/w7sB4LEoBACg=
Received: by 10.91.27.32 with SMTP id e32mr2070793agj.37.1288735279556; Tue,
	02 Nov 2010 15:01:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 15:00:55 -0700 (PDT)
In-Reply-To: <AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 15:00:55 -0700
Message-ID: <AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Tue, 02 Nov 2010 22:02:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 11:38 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/2 Graham Gower <graham.gower@gmail.com>:
>> =C2=A0* Point configure at where it can find jpeg.
>> =C2=A0* Explicitly disable cdk and aalib.
>> =C2=A0* Fix license while here.
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>> ---
>> =C2=A0recipes/gphoto2/gphoto2_2.4.8.bb | =C2=A0 =C2=A09 +++++++--
>> =C2=A01 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/gphoto2/gphoto2_2.4.8.bb b/recipes/gphoto2/gphoto2_=
2.4.8.bb
>> index ea54713..836ea85 100644
>> --- a/recipes/gphoto2/gphoto2_2.4.8.bb
>> +++ b/recipes/gphoto2/gphoto2_2.4.8.bb
>> @@ -1,7 +1,8 @@
>> =C2=A0DESCRIPTION =3D "gphoto2 is a command-line utility to fetch pictur=
es from digital cameras"
>> =C2=A0SECTION =3D "console/utils"
>> -LICENSE =3D "GPL"
>> -DEPENDS =3D "libtool libgphoto2 popt"
>> +LICENSE =3D "GPLv2+"
>> +DEPENDS =3D "libtool libgphoto2 popt jpeg"
>
> The original recipe would build without the depends on jpeg
> adding it to depends should be mentioned in the commit message
>
>> +PR =3D "r1"
>>
>> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;na=
me=3Dgphoto2 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gphoto-popt-fixup.patch"
>> @@ -11,6 +12,10 @@ SRC_URI[gphoto2.sha256sum] =3D "a2e2f70fd6051234cbc3d=
76dc82df6991e8a07ead56aa8d5c4
>>
>> =C2=A0inherit autotools
>>
>> +EXTRA_OECONF=3D"--without-cdk \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-aalib \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-jpeg-prefix=3D=
${STAGING_EXECPREFIXDIR}"
>> +
>
> I have some concerns here.
> For configure it seems best to explicitly set and reset the flags in
> it, otherwise you may just pick up whatever happened to be build
> before.
>


this is the case with any package that uses configure tools. But assumption=
 here
is that when you are building you are not building stuff thats not
meant to be in
the given image.

Thx
-Khem


