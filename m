Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pevlj-000852-Gz
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 21:33:39 +0100
Received: by iyj18 with SMTP id 18so5188668iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 12:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=9e2DuYHO/kKmhbTMmIkRBU8eMX3lTPWW5B58F7u4G5E=;
	b=sx5nKef36U0i5Bec6M+6Ur2Y8/jaMnlSvEIxtYkdgyGaO5dWcBWq0VCeXibSAdVyDj
	cj15Nnf1OMQ4RIRXzTY8L+GLfQ5Wx0PzgR2nOcRoCH18Luu3z/rGcM+fSJBWqH3yD2QP
	KE9BHgSqgsgYtMCvVHkTnrQTPpqKFRLbS/XQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fiVIG9G5RNO4PqjLG4XYH2X9I2eTflbkD49iscs1LKg+PVcHfbGn7nGWLrL0wevhrp
	TCS7LAU2rEKUK4ajNvn8wiupCRncgALUY5zZmdXilRh2OAMOrxNI2Wb/BtZeBnEcP0T2
	+6UECmJ2Hiev0KQxl/hLsz/br0Rt2mBvxcp8E=
MIME-Version: 1.0
Received: by 10.231.39.74 with SMTP id f10mr4820203ibe.84.1295296381366; Mon,
	17 Jan 2011 12:33:01 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Mon, 17 Jan 2011 12:33:01 -0800 (PST)
In-Reply-To: <AANLkTi=7eH04fFi+Zzp2QcaHYfxK+BssAwaT9VqBvBr_@mail.gmail.com>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimZ5EO0OjXD668AU-ZC4uQUgOAzjM1gf+MK9Q5u@mail.gmail.com>
	<AANLkTi=7eH04fFi+Zzp2QcaHYfxK+BssAwaT9VqBvBr_@mail.gmail.com>
Date: Mon, 17 Jan 2011 21:33:01 +0100
Message-ID: <AANLkTikvmP6N5kL9q6ADA7RodyP=KGsNY_8KQn8BH6Nn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
X-List-Received-Date: Mon, 17 Jan 2011 20:33:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/17 Khem Raj <raj.khem@gmail.com>:
> On Mon, Jan 17, 2011 at 11:03 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2011/1/17 Khem Raj <raj.khem@gmail.com>:
>>> * Tested various builds seems to hold fine
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> =A0conf/distro/minimal.conf | =A0 =A05 +++--
>>> =A01 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
>>> index 5a19cbc..f495d13 100644
>>> --- a/conf/distro/minimal.conf
>>> +++ b/conf/distro/minimal.conf
>>> @@ -108,7 +108,7 @@ INHERIT +=3D "recipe_sanity"
>>> =A0# PREFERRED VERSIONS
>>> =A0####################################################################=
#########
>>> =A0require conf/distro/include/preferred-e-versions.inc
>>> -require conf/distro/include/preferred-opie-versions-1.2.4.inc
>>> +require conf/distro/include/preferred-opie-versions-1.2.5.inc
>>>
>>> =A0PREFERRED_PROVIDER_opkg ?=3D "opkg"
>>> =A0PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
>>> @@ -119,7 +119,8 @@ PREFERRED_VERSION_qt4-embedded =3D "${PREFERRED_QT_=
VERSION}"
>>> =A0PREFERRED_VERSION_qt4-embedded-gles =3D "${PREFERRED_QT_VERSION}"
>>> =A0PREFERRED_VERSION_qt4-x11-free =3D "${PREFERRED_QT_VERSION}"
>>> =A0PREFERRED_VERSION_qt4-x11-free-gles =3D "${PREFERRED_QT_VERSION}"
>>> -
>>> +PREFERRED_VERSION_perl =3D "5.10.1"
>>> +PREFERRED_VERSION_perl-native =3D "5.10.1"
>>> =A0####################################################################=
#########
>>> =A0# CONTENTS
>>> =A0####################################################################=
#########
>>> --
>>> 1.7.2.3
>>
>> No opinion on the opie stuff, but I'm using perl 5.10.1 for quite a
>> while, so that part has my ack.
>> (maybe split into two patches, one for opie, one for perl).
>>
>
> I will commit them as two patches if that helps

If others are happy (and ack) the combined thing that is fine with me,
but as a non-opie user or builder I cannot ack the opie part.
Frans.


