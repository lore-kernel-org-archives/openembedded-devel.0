Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzDp7-0005is-Bl
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:20:49 +0200
Received: by iwn2 with SMTP id 2so811179iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 12:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=Drucpfxq+Sd7Qa/xl1Vspz9quriYPnSNKNT+z0r1W4o=;
	b=El1TWG+SlKgWe04dsK1VFnvUKmUGROCAJ13/74du9ENUKeaIrApz5kSwEuxu1nnnaI
	c+k7Wzj8c2MUOt1tgcNprKGiLXvAAVupyKKLUvkLjg9NThTuG4Fjpc+7WLv23y14JTo8
	lYemcD2Z74Mjp2Ahuzvms0n1xjn7pkhAkjaw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lwKH336g1EsUyeNloHvutf6ALptQ0WpzBrb2y57NL2PhYD0ThFaccSncHQS5LWnH7/
	v/yrdV7BE4wF/xiMYSom2F2j18Uu8XfAiDYlX28/taYvnvFhua0A126qChBMXmhadtD+
	vgGU242eFYINSnsWFkAKNLF9dN8WitFwoKJOw=
Received: by 10.231.14.69 with SMTP id f5mr4217819iba.116.1285356026431; Fri,
	24 Sep 2010 12:20:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Fri, 24 Sep 2010 12:20:06 -0700 (PDT)
In-Reply-To: <AANLkTinLsQ+3ffLMOBfLjPH7Ma9QvkToNruEN6q_mru-@mail.gmail.com>
References: <E1OzA6d-00044S-Vd@melo.openembedded.org>
	<AANLkTinLsQ+3ffLMOBfLjPH7Ma9QvkToNruEN6q_mru-@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Sep 2010 12:20:06 -0700
Message-ID: <AANLkTimBBcZNquOmOfwRd3xw91MnDAoMOyKdgDDxcmJK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : speex: make float and asm settings more intelligent
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
X-List-Received-Date: Fri, 24 Sep 2010 19:20:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2010 at 11:13 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Sep 24, 2010 at 5:22 PM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: e06553979d23531397af3dd71870abb80718c681
>> URL: =C2=A0 =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=
=3Dcommit;h=3De06553979d23531397af3dd71870abb80718c681
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date: =C2=A0 Fri Sep 24 17:20:54 2010 +0200
>>
>> speex: make float and asm settings more intelligent
>>
>> ---
>>
>> =C2=A0recipes/speex/speex-fpu.inc | =C2=A0 =C2=A05 +++++
>> =C2=A0recipes/speex/speex_1.2.bb =C2=A0| =C2=A0 14 ++++++++------
>> =C2=A02 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes/speex/speex-fpu.inc b/recipes/speex/speex-fpu.inc
>> new file mode 100644
>> index 0000000..4c63920
>> --- /dev/null
>> +++ b/recipes/speex/speex-fpu.inc
>> @@ -0,0 +1,5 @@
>> +def get_speex_fpu_setting(bb, d):
>> + =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft'=
 ]:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return "--enable-fixe=
d-point --disable-float-api --disable-vbr"
>> + =C2=A0 =C2=A0 =C2=A0 return ""
>> +
>> diff --git a/recipes/speex/speex_1.2.bb b/recipes/speex/speex_1.2.bb
>> index f498731..049b472 100644
>> --- a/recipes/speex/speex_1.2.bb
>> +++ b/recipes/speex/speex_1.2.bb
>> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.speex.org"
>> =C2=A0DEPENDS =3D "libogg"
>> =C2=A0BETA =3D "1.2rc1"
>> =C2=A0PV =3D "1.1+${BETA}"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =C2=A0SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-${B=
ETA}.tar.gz"
>> =C2=A0S =3D "${WORKDIR}/speex-${BETA}"
>> @@ -25,13 +25,15 @@ LEAD_SONAME =3D "libspeex.so"
>> =C2=A0# =C2=A0 =C2=A0 =C2=A0 --disable-float-api --disable-vbr (must dis=
able-vbr if disable-float-api)
>> =C2=A0#
>>
>> -EXTRA_OECONF_append_openmn =3D " --enable-arm5e-asm --enable-fixed-poin=
t --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_amsdelta =3D " --enable-arm4-asm --enable-fixed-poi=
nt --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_bfin =3D " --enable-blackfin-asm --enable-fixed-poi=
nt --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_arm =3D " --enable-fixed-point --disable-float-api =
--disable-vbr "
>> -EXTRA_OECONF_append_dht-walnut =3D " --enable-fixed-point --disable-flo=
at-api --disable-vbr "
>> +#check for TARGET_FPU=3Dsoft and inform configure of the result so it c=
an disable some floating points
>> +require speex-fpu.inc
>> +EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}"
>>
>> +ARMASM_armv4t =3D "--enable-arm4-asm"
>
> Hi,
>
> for some reason it fails on armv4t (om-gta02) with --enable-arm4-asm
>
> http://tinderbox.openembedded.net/packages/779499/

this app should be compile in ARM only mode. Add

ARM_INSTRUCTION_SET =3D "arm" to thr bb file and retry.

>
>> +ARMASM_armv5te =3D "--enable-arm5e-asm"
>
> and this breaks armv5te (spitz)
>
> http://tinderbox.openembedded.net/packages/779550/
>
> pity :/
>
> Regards,
>> +ARMASM ?=3D ""
>>
>> +EXTRA_OECONF +=3D "${ARMASM}"
>>
>> =C2=A0do_configure_append() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i s/"^OGG_CFLAGS.*$"/"OGG_CFLAGS =3D "/g=
 Makefile */Makefile */*/Makefile



--=20
-Khem


