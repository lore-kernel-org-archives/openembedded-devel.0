Received: from [209.85.160.53] (helo=mail-pw0-f53.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N8ATS-0005vO-0U
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 11:30:53 +0100
Received: by pwj11 with SMTP id 11so601835pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4h1BjWPzYxN6FhACskkBYNyzXMiTUVZVq6XwZ+N5PFQ=;
	b=JUP8uoFpO1Y80NJZwD/ikWHY3R1tm9Tl+YgsFpd0SaWlfg7mKm/1Pd5Cuat9BAI4g9
	2D6EvKTHp4PlFyqKjSa51duVAfI9rAbCQ3uXf5HrUbqc/iE9MNpaOgUcVflKaLuTdQGw
	YUhPUdSsAxGyPBV8q9+En7eDRBgNwJeRyhvyU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DvFOagYofxfGk/Z5PNg4/kwoiFYOiFWPJCXoe+T2OtFw9sCJ4sl8hqsreoVtyBNckZ
	CL7+svGUwDz3iWDhw3K6VKV1gZwcLH9+TbAKtZ9RiMVeHrfSk6VNu5DtcxoBv7fKiAYz
	dhQGcYSTXHHA4Gw7Jv+DS5/zTgW4rSGhC6krA=
MIME-Version: 1.0
Received: by 10.140.148.9 with SMTP id v9mr69720rvd.247.1257933993545; Wed, 11 
	Nov 2009 02:06:33 -0800 (PST)
In-Reply-To: <1257931062.25369.292.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 11:06:33 +0100
Message-ID: <d1b08f940911110206h594dff39mb9a3cf7912124018@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 10:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>>There was some discussion around alternative proposals of storing the
>> checksums in separate files within the recipes/ directory.

>> The best alternatives so far where:
>> =A0 =A0 =A0 - Place the checksums into the dir of the recipe
>> =A0 =A0 =A0 - Use a MD5SUM_${URL} =3D "", SHA256SUM_${URL} =3D "" syntax
>
> I would be happy with the latter of those suggestions. =A0I don't think
> the former really addresses the problems with the current checksums.ini.

Yes, I sponsor the idea of a single Manifest in each dir.

Let apart filetype specifier, example here:
http://www.gentoo.org/proj/en/glep/glep-0044-extras/manifest2-example.txt

Having a Manifest listing the filename, the size and some checksums on
a single line seems to me very easy to parse for an automated script
wich could refresh/generate the whole file.

Finally, a question: why do we have full URL in the checksum-file?
I can't see the real advantages in case of checksum mismatch...

My (euro)2 cents

Andrea


