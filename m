Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVrWL-00009U-MB
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 21:12:17 +0100
Received: by wyb40 with SMTP id 40so6594669wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 12:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=Q/bRo5FnlVlfHjStRgkkV/zt4S7twauDbJUzwfW+Lf0=;
	b=TrV0Oi3jAXxZ2KAUJ8VO75Ase6YX7RZKGuDlXwVK3mnH7Zaim2DXNfbo4MGyruB/FH
	CFpYs2xhDos12a9mq8Uf7u9kJHfKVgHLuvj/4eSXJg3SWPXhjkO61O2VvQzqmLEfBBNZ
	EShoO5zOjgiN8E4jD5iSW/KTDTFYUr4Avu/+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=cRrMJ0Jz2cbkCoFg63BZmPKYGnEwzyTGIgOW5cr8eEFmOKhpY45SbYLuZzLnuNg0iV
	CDG9q/J/ZRiNh5L8ND63nCgi1yfq5HFMifrS1kQ0YTDFENPnFExyGtMVdAGtKZIREXDt
	qMa9ujwbe/n+yK2k0smKubAwyhVIN+DT+HbMk=
Received: by 10.216.165.85 with SMTP id d63mr9686473wel.12.1293135128578; Thu,
	23 Dec 2010 12:12:08 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Thu, 23 Dec 2010 12:11:47 -0800 (PST)
In-Reply-To: <AANLkTi=U08hjE7qSRHQm29yd0B0dnUJ_6cTxABD4F2tC@mail.gmail.com>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>
	<iesrb1$mue$1@dough.gmane.org>
	<AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
	<4D121D05.4090806@mentor.com> <iet6s1$h1r$1@dough.gmane.org>
	<4D1228DF.6090004@mentor.com>
	<AANLkTi=+2cXyskJw=U-yQ-R94z7UO_U09h4EO_e=+=1p@mail.gmail.com>
	<AANLkTi=U08hjE7qSRHQm29yd0B0dnUJ_6cTxABD4F2tC@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 23 Dec 2010 13:11:47 -0700
X-Google-Sender-Auth: kTqhMdbJ3JdBz5CGtBVxAcGmo_E
Message-ID: <AANLkTiknxPWF3V4gc01mRHYk=Axj7kXWo1kU4eoZ-cdB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Thu, 23 Dec 2010 20:12:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 11:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Dec 22, 2010 at 8:43 AM, Chris Larson <clarson@kergoth.com> wrote=
:
>> On Wed, Dec 22, 2010 at 9:35 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>> I agree and would like it done soon too (well, I'd almost rather see 1.=
11 be
>>> required, yaaay parallel parsing) but since we can't tell 1.10.0 from .=
1 and
>>> I don't think this week (since that's just a few more days) is too bad.
>>> =C2=A0Chris, when can you do a 1.10.2?
>>
>> I might be able to get to it today. =C2=A0We really need to make the
>> process more automated. =C2=A0We should also stop using berlios for bitb=
ake
>> release tarballs and just rely on the oe site / freshmeat / cgit, imo.
>
> our cgit now has the possibility to download tarballs so proabably
> just pointing to cgit ?
> e.g. http://git.openembedded.org/cgit.cgi/bitbake/snapshot/bitbake-1.10.1=
.tar.bz2
>
> is there
> and so are others

This won't work, unless we want to cause problems for other distros
the way upstreams do for us.  gzip includes timestamp information, if
you wget bitbake-1.10.1.tar.gz twice with over a second between, you
get tarballs with two different md5sums.  We need pristine, specific,
always locked down archives for releases.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


