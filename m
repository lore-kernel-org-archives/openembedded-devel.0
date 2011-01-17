Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PevTf-0007dd-JT
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 21:14:59 +0100
Received: by iyj18 with SMTP id 18so5172403iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=lbfKVZ5yn+mcsdhTQ1eXnx8C2iVgNEQBn9AF4AltYsc=;
	b=DxtEP+f9IQVyllVM0JyHAlK76GB8TBlUuiHmPzGx3fWyYLsV763rrCUD4+aJzqn28K
	VuTQdGb/HgxeLqp6CQCbm+Djuh7QUB4qgixZ8P7F4xZvNqXjwI1glLKUFV+aluaCsn1h
	pvXdF+mWT0EI95AyD0UDWMCK284zR8jS8T9jY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=kVjHAodPbMH5LhdPaFj9DEaSVbTBAykvG/DWz3l912VOULHufZ9vR+XtNjrie0QJv6
	kSuyrtTIxlYuMYUUhfzT1N7+ciIon0/wbFZxNMV58nlXykck9rDiGAarpF6bjo+jdTXG
	4lVFFFszje8+RxHZUdZkGFxqrEBzeJ9Do39yA=
Received: by 10.42.228.133 with SMTP id je5mr4985949icb.407.1295295260648;
	Mon, 17 Jan 2011 12:14:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 17 Jan 2011 12:14:00 -0800 (PST)
In-Reply-To: <AANLkTimZ5EO0OjXD668AU-ZC4uQUgOAzjM1gf+MK9Q5u@mail.gmail.com>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimZ5EO0OjXD668AU-ZC4uQUgOAzjM1gf+MK9Q5u@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jan 2011 12:14:00 -0800
Message-ID: <AANLkTi=7eH04fFi+Zzp2QcaHYfxK+BssAwaT9VqBvBr_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Mon, 17 Jan 2011 20:14:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2011 at 11:03 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/1/17 Khem Raj <raj.khem@gmail.com>:
>> * Tested various builds seems to hold fine
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0conf/distro/minimal.conf | =C2=A0 =C2=A05 +++--
>> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
>> index 5a19cbc..f495d13 100644
>> --- a/conf/distro/minimal.conf
>> +++ b/conf/distro/minimal.conf
>> @@ -108,7 +108,7 @@ INHERIT +=3D "recipe_sanity"
>> =C2=A0# PREFERRED VERSIONS
>> =C2=A0##################################################################=
###########
>> =C2=A0require conf/distro/include/preferred-e-versions.inc
>> -require conf/distro/include/preferred-opie-versions-1.2.4.inc
>> +require conf/distro/include/preferred-opie-versions-1.2.5.inc
>>
>> =C2=A0PREFERRED_PROVIDER_opkg ?=3D "opkg"
>> =C2=A0PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
>> @@ -119,7 +119,8 @@ PREFERRED_VERSION_qt4-embedded =3D "${PREFERRED_QT_V=
ERSION}"
>> =C2=A0PREFERRED_VERSION_qt4-embedded-gles =3D "${PREFERRED_QT_VERSION}"
>> =C2=A0PREFERRED_VERSION_qt4-x11-free =3D "${PREFERRED_QT_VERSION}"
>> =C2=A0PREFERRED_VERSION_qt4-x11-free-gles =3D "${PREFERRED_QT_VERSION}"
>> -
>> +PREFERRED_VERSION_perl =3D "5.10.1"
>> +PREFERRED_VERSION_perl-native =3D "5.10.1"
>> =C2=A0##################################################################=
###########
>> =C2=A0# CONTENTS
>> =C2=A0##################################################################=
###########
>> --
>> 1.7.2.3
>
> No opinion on the opie stuff, but I'm using perl 5.10.1 for quite a
> while, so that part has my ack.
> (maybe split into two patches, one for opie, one for perl).
>

I will commit them as two patches if that helps

> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


