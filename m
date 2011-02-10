Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnLV2-0004NM-DR
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 02:39:12 +0100
Received: by gyd8 with SMTP id 8so367769gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 17:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=7mBtm2UaaWZo44Ll2Ik1F8PvPqSOmhhUag+SakVJ6Xg=;
	b=bNBq8VvjyYvpSdf9nBEQs97RSNqLP0w98CVhBK601xLol82/0kckcPNmoTJi81MX3R
	plC6TbZlYrS0cGonvvIaIvAWceRahaAN3wxGsMQAVHlOUfX5kF4UJxvlOCgIwGjNYKDN
	V6tHKfUsy64WNb1eV0ZNMaJtQPPuN1iRRyw4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=dLko0sXyqstMdybaCLyutdrtFKwIXEBOOX9cl8yDj74844QMdT9n0mhG6gsYjkkVFa
	5i1EHn+Tnh416F/Tg3iFxVEeeL8lwGdndGQPVcIaOaxivl2glfo1gYFX09dM7I29rWBO
	KQa67Vmeeg2sYvX+DlnCc+PnfbqcZPYyDlvmc=
Received: by 10.91.160.30 with SMTP id m30mr2149165ago.61.1297301887890; Wed,
	09 Feb 2011 17:38:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Wed, 9 Feb 2011 17:37:47 -0800 (PST)
In-Reply-To: <4D52FC34.9020401@mentor.com>
References: <1297187904-19841-1-git-send-email-coolaj86@gmail.com>
	<4D52EEA1.6040503@mentor.com> <iius8b$ke3$1@dough.gmane.org>
	<4D52FC34.9020401@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2011 17:37:47 -0800
Message-ID: <AANLkTikmVwN3h-3vatTGdWr-AmgqQho0ao1UvRjUguPt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v4] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Thu, 10 Feb 2011 01:39:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 9, 2011 at 12:42 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/09/2011 01:08 PM, Koen Kooi wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 09-02-11 20:44, Tom Rini wrote:
>>>
>>> On 02/08/2011 10:58 AM, AJ ONeal wrote:
>>>>
>>>> * added version number to patches
>>>> * libev-cross-cc_0.2.6.patch - turns off execution so that
>>>> cross-compile succeeds
>>>> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86,
>>>> x86_64, arm, and mips
>>>
>>> I didn't touch it in patchwork but (and I see these aren't all new
>>> issues):
>>>
>>>> diff --git a/recipes/nodejs/nodejs_0.2.6.bb
>>>> b/recipes/nodejs/nodejs_0.2.6.bb
>>>> new file mode 100644
>>>> index 0000000..560adc6
>>>> --- /dev/null
>>>> +++ b/recipes/nodejs/nodejs_0.2.6.bb
>>>> @@ -0,0 +1,32 @@
>>>> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>>>> +HOMEPAGE =3D "http://nodejs.org"
>>>> +LICENSE =3D "MIT"
>>>> +
>>>> +DEPENDS =3D "openssl"
>>>> +
>>>> +SRC_URI =3D " \
>>>> + =C2=A0http://nodejs.org/dist/node-v${PV}.tar.gz \
>>>> + =C2=A0file://libev-cross-cc-v${PV}.patch \
>>>> + =C2=A0file://node-cross-cc-v${PV}.patch \
>>>> +"
>>>> +SRC_URI[md5sum] =3D "b1c50ceb43bee1b221be210b7bc7a216"
>>>> +SRC_URI[sha256sum] =3D
>>>> "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
>>>> +
>>>> +S =3D "${WORKDIR}/node-v${PV}"
>>>> +
>>>> +# v8 errors out if you have set CCACHE
>>>> +CCACHE =3D ""
>>>> +
>>>> +do_configure () {
>>>> + =C2=A0./configure --prefix=3D${prefix} --without-snapshot
>>>> +}
>>>
>>> Why isn't this just EXTRA_OECONF =3D "--without-snapshot" and using the
>>> default do_configure, compile and install?
>>
>> It's one of those python abominations that try to look like autotools :(
>> And as usual, it has even more bugs than autotools when you try to
>> crosscompile
>
> Retch. =C2=A0So, unless someone pops up within the next 24h and says why =
they did
> something in patchwork or otherwise objects, I'll push this. =C2=A0Thanks=
!
>

This patch has addressed the review comments. So please go ahead.
However this should be versioned for clarity if a patch is resent

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


