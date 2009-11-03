Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1N5J3q-0003zA-FZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 14:04:37 +0100
Received: by ewy5 with SMTP id 5so612980ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2009 05:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lailJTMzOoXSE7mh1xE6b74e96EgDCQIl6x3Fe7eulg=;
	b=W/qr1oCKzrVCwhGkaQKBFFlWa18bfm08kvkBEymhNf2MyBczsOA1hRieDibzJJw9ds
	hlskQf8dUZHDsBOzOJZh6aRu37qvRidsMvl130FQmDtbbl3d+sMcFyT1SyKE8ksUT6eE
	MJbB+cIe4gGZYbWrBasP5RJhZ3o3xX5np3d4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=og3FruYkEytOlN9xRq4hnoXFmZNB4sqKy35kAhNFKuncfzdJvKsbCOJU18ZG8NjEaK
	Owh2tFxNSl9SeS8/MoBs0Aw+XiWuWvbrJaMdEFhp9yBvBsyR3jLAIarDJiCZuv6FuA/x
	SLl8Ufu8w5+19Urx74cp1/6V+E+UOA+q2fqVY=
MIME-Version: 1.0
Received: by 10.213.26.138 with SMTP id e10mr200113ebc.67.1257253388665; Tue, 
	03 Nov 2009 05:03:08 -0800 (PST)
In-Reply-To: <200908250845.33035.holger+oe@freyther.de>
References: <4A9375A5.2080306@4d-electronics.co.nz>
	<200908250845.33035.holger+oe@freyther.de>
Date: Tue, 3 Nov 2009 14:03:08 +0100
Message-ID: <359c5480911030503k23964dc6x9f09d6041d2aeb93@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] add lupdate, lrelease to qmake2 bbclass
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
X-List-Received-Date: Tue, 03 Nov 2009 13:04:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2009 at 7:45 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Tuesday 25 August 2009 07:24:53 Matthew Dombroski wrote:
>> add lrelease4, lupdate4 to the environment.
>
>
> Acked-by: Holger Freyther <zecke@selfish.org>
>
>> ---
>> =A0 classes/qmake2.bbclass | =A0 =A02 ++
>> =A0 1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
>> index 26e813a..3772189 100644
>> --- a/classes/qmake2.bbclass
>> +++ b/classes/qmake2.bbclass
>> @@ -19,3 +19,5 @@ export OE_QMAKE_INCDIR_QT =3D "${STAGING_INCDIR}/qt4"
>> =A0 export OE_QMAKE_LIBDIR_QT =3D "${STAGING_LIBDIR}"
>> =A0 export OE_QMAKE_LIBS_QT =3D "qt"
>> =A0 export OE_QMAKE_LIBS_X11 =3D "-lXext -lX11 -lm"
>> +export OE_QMAKE_LRELEASE =3D "${STAGING_BINDIR_NATIVE}/lrelease4"
>> +export OE_QMAKE_LUPDATE =3D "${STAGING_BINDIR_NATIVE}/lupdate4"
>> --
>> 1.6.3.3

It seems as this patch was not applyed?

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/qmake2.bbcl=
ass

regards

    Nicola


