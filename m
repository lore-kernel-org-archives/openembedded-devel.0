Received: from smtp-out05.msg.oleane.net ([62.161.7.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QMoOJ-0002Pc-4P for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 23:34:51 +0200
Received: from smtp06.msg.oleane.net (smtp06.mail.priv [172.17.20.115]) 
	by smtp-out05.msg.oleane.net with ESMTP id p4ILVwdu028813;
	Wed, 18 May 2011 23:31:58 +0200
Received: from [192.168.1.148] (AMarseille-551-1-69-231.w80-9.abo.wanadoo.fr
	[80.9.124.231]) (authenticated)
	by smtp06.msg.oleane.net (MTA) with ESMTP id p4ILBo0c006080;
	Wed, 18 May 2011 23:11:51 +0200
X-Oleane-Rep: REPA
Message-ID: <4DD43619.4020804@cioinfoindus.fr>
Date: Wed, 18 May 2011 23:11:53 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305664937-20683-1-git-send-email-christian.charreyre@cioinfoindus.fr>
	<1305668584.4260.19.camel@mattotaupa>
In-Reply-To: <1305668584.4260.19.camel@mattotaupa>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.6.0.2009776, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.18.205718 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] libsdl-pango: new recipe for version 0.1.2
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
X-List-Received-Date: Wed, 18 May 2011 21:34:51 -0000
X-Groupsio-MsgNum: 32186
Content-Type: multipart/mixed; boundary="------------080707020308040606080905"

--------------080707020308040606080905
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out05.msg.oleane.net id p4ILVwdu028813

Dear Paul,

I'll try to correct what is wrong, and resubmit the patch.

Le 17/05/2011 23:43, Paul Menzel a =C3=A9crit :
> Dear Christian,
>
>
> Am Dienstag, den 17.05.2011, 22:42 +0200 schrieb Christian Charreyre:
>> This patches creates a new recipe for libsdl-pango.
> =C2=BBThis patch =E2=80=A6=C2=AB is most of the time redundant in a com=
mit message. You
> could read [1].
OK, thanks for the reference.
>> It uses debian patches, unless rebootstrap.patch which is very big and=
 doesn't
>> seem necessary for the recipe.
> Please add the link/URL of the Debian patches.
OK
> What machine and distribution (custom right) did you use?
MACHINE =3D beagleboard, DISTRO=3Dangstrom-2008.1
I'll put it in the comment next time.

[...]

>> --- /dev/null
>> +++ b/recipes/libsdl/libsdl-pango_0.1.2.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION =3D "Simple DirectMedia Layer Pango library."
>> +SECTION =3D "libs/network"
>> +PRIORITY =3D "optional"
>> +DEPENDS =3D "virtual/libsdl pango"
>> +LICENSE =3D "LGPL"
> Please sort those according to the style guide [2]. Setting `HOMEPAGE`
> would be nice too.
OK, sorted
>> +
>> +SRC_URI =3D "http://freefr.dl.sourceforge.net/project/sdlpango/SDL_Pa=
ngo/${PV}/SDL_Pango-${PV}.tar.gz \
> You should use `SOURCEFORGE_MIRROR`.
>
> 	git grep SOURCEFORGE_MIRROR
OK, I'll use as soon as possible macros.
>> +	file://am_maintainer_mode.patch \
>> +	file://api_additions.patch \
>> +	file://matrix_declarations.patch \
>> +	file://sans-serif.patch \
>> +	file://fillrect_crash.patch \
>> +	file://blit_overflow.patch \
>> +"
>> +
>> +SRC_URI[md5sum] =3D "85bbf9bb7b1cee0538154dadd045418c"
>> +SRC_URI[sha256sum] =3D "7f75d3b97acf707c696ea126424906204ebfa07660162=
de925173cdd0257eba4"
>> +
>> +S =3D "${WORKDIR}/SDL_Pango-${PV}"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF +=3D "SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/sdl-config"
>> +
>> +do_stage() {
>> +	autotools_stage_all
>> +}
> As Henning wrote already, `do_stage()` should not be used anymore [3].
> Probably the documentation you used is outdated.
This was due to a copy of an old recipe, it's not necessary, so I=20
suppress it.
> Unfortunately trying to build this recipe task patch fails with the
> following error message using `angstrom-2010.x` for `MACHINE =3D
> "beagleboard"`.
>
> 	NOTE: package libsdl-pango-0.1.2-r0: task do_patch: Started
> 	ERROR: Execution of 'quilt --quiltrc=3D/oe/build-angstrom-next/angstro=
m-dev/sysroots/i686-linux/usr/bin/quiltrc push' failed with exit code 1:
> 	Applying patch am_maintainer_mode.patch
> 	patching file configure.in
> 	Hunk #1 FAILED at 1.
> 	1 out of 1 hunk FAILED -- rejects in file configure.in
> 	Patch am_maintainer_mode.patch does not apply (enforce with -f)
>
> 	NOTE: package libsdl-pango-0.1.2-r0: task patch_do_patch: Failed
Here is the trouble, I have rebuilt it with bitbake 1.8.18 and bitbake=20
1.10.2 without error.
Could you have a more precise look on what is wrong with the patch on=20
your conf., because it is quite simple, and I don't understand
why do_patch gives you an error. Perhaps I don't use quilt in do_patch=20
(don't know where to look to see what do_patch really do).
Thanks for your answer.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------080707020308040606080905
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuOkNocmlzdGlhbiAgQ2hhcnJleXJlDQpuOkNoYXJyZXlyZTtDaHJpc3Rp
YW4gDQpvcmc6Q0lPIEluZm9ybWF0aXF1ZSBJbmR1c3RyaWVsbGUNCmFkcjtkb206OzsxMSBBdmVu
dWUgTWFyaWdueTtNYXJzZWlsbGU7OzEzMDE0DQplbWFpbDtpbnRlcm5ldDpjaHJpc3RpYW4uY2hh
cnJleXJlQGNpb2luZm9pbmR1cy5mcg0KdGVsO3dvcms6MDQgOTUgMDUgMTkgNDENCnVybDpodHRw
Oi8vd3d3LmNpb2luZm9pbmR1cy5mcg0KdmVyc2lvbjoyLjENCmVuZDp2Y2FyZA0KDQo=

--------------080707020308040606080905--
