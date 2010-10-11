Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P5PW0-0005td-MD
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 23:02:38 +0200
Received: by gwb17 with SMTP id 17so961568gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=sRFKPXzAElbNhH2XSGGiocFFKr6IVEdJADmqtMVkcnc=;
	b=UY+aogcarZI+wIMzrh5O2gnJ/B320u2o2GHdpHL7WcB7zr+CvkhNESZY/e3fZG9ygH
	n/XMXvEsHmAKbqkou5y09cBn/f9gZ1RPQxwM1fj0BPqRpRFvgUuUZ4YRMeqKgWCQ+hck
	q50IuPIGlXpwY9PSpT4h1hWUq3zyAEJY8TiZo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=asJ7fgzJt7OJqcoTojxR+Ybk3s7+b+9LGeJAM77yArLZCtEbqixMReZyIrHG5kS8aB
	7alNCxDPqPLKRpMk4xk9+a87VLhPBIRlBOPi72Tk/F8E45usTxX/aY9q8FRfS5QQGRA5
	VhMD+jghf4p4uFlb5Ozd9LwP0PyiJhj9clkXE=
Received: by 10.90.31.14 with SMTP id e14mr3307732age.21.1286830926710; Mon,
	11 Oct 2010 14:02:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Mon, 11 Oct 2010 14:01:43 -0700 (PDT)
In-Reply-To: <20101011185710.GD3465@jama>
References: <i8ufbd$27r$1@dough.gmane.org>
	<1286795697-9335-1-git-send-email-Martin.Jansa@gmail.com>
	<20101011184934.GA3461@rhein.zuhause.netz> <20101011185710.GD3465@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2010 14:01:43 -0700
Message-ID: <AANLkTinMwZAXvhimsOQ7Mhb9MrLGPn2520J7-VTZhCqu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openjade: return oj-native-libosp-fix.patch, lost in BBCLASSEXTEND change fdf02c61607acb5046afaa11c5c682ab99f4d508
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
X-List-Received-Date: Mon, 11 Oct 2010 21:02:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2010 at 11:57 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, Oct 11, 2010 at 08:49:35PM +0200, Henning Heinold wrote:
>> On Mon, Oct 11, 2010 at 01:14:57PM +0200, Martin Jansa wrote:
>> > ---
>> > =C2=A0recipes/openjade/openjade_1.3.2.bb | =C2=A0 =C2=A05 +++--
>> > =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/ope=
njade_1.3.2.bb
>> > index 238586b..9462636 100644
>> > --- a/recipes/openjade/openjade_1.3.2.bb
>> > +++ b/recipes/openjade/openjade_1.3.2.bb
>> > @@ -5,9 +5,10 @@ DESCRIPTION =3D "OpenJade is a suite of tools for val=
idating, \
>> > =C2=A0processing, and applying DSSSL (Document Style Semantics and \
>> > =C2=A0Specification Language) stylesheets to SGML and XML documents."
>> > =C2=A0LICENSE =3D "BSD"
>> > -PR =3D "r2"
>> > +PR =3D "r3"
>> > =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.g=
z \
>> > - =C2=A0 =C2=A0 =C2=A0file://configure.patch \
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://oj-native-libosp-fix.patch=
 \
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.patch \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>> >
>> > =C2=A0inherit autotools
>>
>> Didnt you forgot the oj-native-libosp-fix.patch or came it from an earli=
er version?
>
> no, it was lost from SRC_URI =C2=A0in previous patch (replacing openjade-=
native with
> BBCLASSEXTEND), but file is still there and doesn't seem to do any harm
> to non-native version as well (so applied to both now).

I just applied a different patch to fix it.

>
> Regards,
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


