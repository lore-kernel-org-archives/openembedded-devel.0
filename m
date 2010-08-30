Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Oq7b8-0004f7-0B
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:52:43 +0200
Received: by qyk8 with SMTP id 8so3218603qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=T76dRSNx059bvEn8BxIf/N28DmbCHasszh6zoUD82r4=;
	b=msRqk2b/k4+avTKA0b9vr/M5qg+a11pQb2XLEKCEKWXzlqtbuj87GMjQ13x2BIHoPp
	3HDPWMWFQ7M+fwPlnm968z5qyGVzpqgFgZthjU9UU8tplH21vlMK2YYM4nhN4viYP/+7
	cJbylsdHEDAolEATPFtERcBLOR8uVJPgMfKjE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OSy79vJ2r6XSkZIOTNHyx8eKJ+9Bx9J2kYMc7Xj6FMTjYIW2ShuzfZlifsEfLxzFhh
	rHPiYwCHjw1f4s+6CEttLtE0EFRg7v4Eh4xVJ4G6SUAAS98rCTLW4ASDy6yp1Zyu+YdC
	9UciQrXe+xI8Woz9ILquROM07AqZvCvweDoWY=
MIME-Version: 1.0
Received: by 10.229.37.3 with SMTP id v3mr3239636qcd.169.1283187128323; Mon,
	30 Aug 2010 09:52:08 -0700 (PDT)
Received: by 10.229.23.1 with HTTP; Mon, 30 Aug 2010 09:52:07 -0700 (PDT)
In-Reply-To: <AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
Date: Mon, 30 Aug 2010 18:52:07 +0200
Message-ID: <AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Mon, 30 Aug 2010 16:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 4:27 PM, Chris Larson <clarson@kergoth.com> wrote:

> Okay, how about..
>
> OVERRIDES =3D. "${@['', 'target:']['${BPN}' =3D=3D '${PN}']}"

I can also think of at least one way to do this without using anonymous cod=
e.

In base.bbclass:
RECIPE_TYPE =3D "target"
OVERRIDES =3D. "${RECIPE_TYPE}"

In native.bbclass:
RECIPE_TYPE =3D "native"

In cross.bbclass:
RECIPE_TYPE =3D "cross"

and so on...

/Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


