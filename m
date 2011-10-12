Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RE18T-0004xY-JQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 17:54:25 +0200
Received: by wwf27 with SMTP id 27so205424wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=GB+3cGaUBN7/NGrZ6DmusShVofMoBPKJK3VS8zmP2QI=;
	b=frB/lsw7QC8+urLliNAU15Z0T21p9Ky955QCXxpgLm/Kr4sqbJvdTb1MBZhdoEMBrj
	GyOiBC1PeaoIvuuoKDFRAtObaIpYadFtgY58k07dM894jo3YYySGCkKUm7zAXTeId6Xj
	dmWXswRKOXI8lgGjQPDsbhS2qQHISBWiHDXkw=
Received: by 10.216.230.83 with SMTP id i61mr27331weq.54.1318433376159; Wed,
	12 Oct 2011 08:29:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Wed, 12 Oct 2011 08:29:15 -0700 (PDT)
In-Reply-To: <4E95893C.6050903@mlbassoc.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<4E95893C.6050903@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Oct 2011 08:29:15 -0700
X-Google-Sender-Auth: OXKK5DJRd75DpZ_Fkn3UWopEKyo
Message-ID: <CABcZANmw3VnLfpD1X0nGy6d=3U72npvKYFoR_8g40eOaXfhBEQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 15:54:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 5:34 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2011-10-12 06:22, mgundes wrote:
>>
>> =C2=A0 =C2=A0Hi,
>>
>> =C2=A0 =C2=A0I think one of the big issue with OE is build time. It does=
 everything
>> for you, so that it takes too much times. I want to minimize build time
>> and
>> realized that OE creates ipkgs for almost every package. If there is a w=
ay
>
> Not true. =C2=A0Only the packages needed to complete your image will be b=
uilt.

This isn't the case, of course. Only the *recipes* needed to complete
your image will be built, but all of the packages for those recipes
are constructed, whether they'll eventually be used or not. Of course,
not saying that's a problem, just clarifying for mgundes.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


