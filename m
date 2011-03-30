Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cargoudel@gmail.com>) id 1Q4yTY-0006hX-EB
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 18:42:32 +0200
Received: by wwb17 with SMTP id 17so1520252wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=undsqiUajTVb3vRasbDCXM3KYZNqiZ0+ljgyWHM2tmo=;
	b=jAOCOer/ANK4O6LnwShukV5oVr/auvkJIsPjfCpjqViQKeWkXXC3/nZlZ/9LEhkTka
	fI2wn0+KTA4yyj1b01DE3c38ZzfdNUtW9HVOFgJVEQXlVs6JpC/2SC4HnCn7uuUGO6cW
	qA3jejGcivrkUB0HJIvQFdbW+qRv1WRNNgORU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=SvrM5BH0yGcIathfh7/ONtvGwH2x9eeKyFMQvGnwN1P4b0fTbQCJRBPArxNFJ86e4x
	AYpk+GQwqJWEaCJxFC7dCRDAZ65TK51TqYE6+JN9TZpOzBt/5VlRAvM3xfuIhAUaLVqe
	ZhpclD0agJNREZCn39lszYxwqBnqxiJIadOpI=
Received: by 10.216.67.17 with SMTP id i17mr1357171wed.101.1301503233236; Wed,
	30 Mar 2011 09:40:33 -0700 (PDT)
MIME-Version: 1.0
Sender: cargoudel@gmail.com
Received: by 10.216.36.132 with HTTP; Wed, 30 Mar 2011 09:40:03 -0700 (PDT)
From: "R.T. McGee" <67800@udel.edu>
Date: Wed, 30 Mar 2011 12:40:03 -0400
X-Google-Sender-Auth: eeuRQcxEzHcN4lrUysUyYV8Eh2w
Message-ID: <AANLkTi=r1KzyDtTfZ74f0ZhJVpo=cTZV5n_azfAKQEHt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/6] Add support for the Technologic Systems TS7500 ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 16:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Its true, the FA526 is not a ARM920T but it's a bit different from other
standard ARMv4 types.

Comments about the FA526 and ARM920T similarity are based on work like this=
:
http://openocd.sourcearchive.com/lines/0.3.1/fa526_8c-source.html
This are not from the perspective of the instruction set, but it more or
less talking about hardware features.

In the upcoming versions of GCC there will be a mtune option for the FA526,
because it is different enough
from a old standard armv4 and there and some code optimizations for the
pipeline, cache  etc.
http://gcc.gnu.org/ml/gcc-patches/2010-11/msg02208/gcc-4.6-svn-20101116-far=
aday-cpu.patch

Just to recap for others, the TS-7500 has a Cavium CNS2132 (aka Star Semi
STR8132) SoC which contains a FA526 core.

Thanks,
RT


> From: Marcin Juszkiewicz <marcin <at> juszkiewicz.com.pl>
> Subject: Re: [oe] [PATCH 1/6] Add support for the Technologic Systems
> TS7500 ARM SBCs
> Date: 2011-03-30 14:43:36 GMT
>
> Dnia 2011-03-30, =B6ro o godzinie 10:07 -0400, UDel V2G Team pisze:
> > +++ b/conf/machine/include/tune-fa526.inc
>
> > +# This core basically resembles a ARM920T but has NO thumb
> > interworking support
> > +# which makes it not fully EABI compliant
>
> This is not arm920t core. Vendor says "The cores are based on the ARMv4(t=
m)
> instruction set and AMBA(tm) 2.0 AHB bus architecture." There is no
> information on which core they based.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel <at> lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

