Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1N8do2-000109-2W
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 18:50:05 +0100
Received: by bwz9 with SMTP id 9so2360745bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 09:48:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.154.155 with SMTP id o27mr3505524bkw.198.1258047666038; 
	Thu, 12 Nov 2009 09:41:06 -0800 (PST)
In-Reply-To: <d1b08f940911110206h594dff39mb9a3cf7912124018@mail.gmail.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
	<d1b08f940911110206h594dff39mb9a3cf7912124018@mail.gmail.com>
Date: Thu, 12 Nov 2009 14:41:05 -0300
Message-ID: <ae9c9a1c0911120941t3e90a78cg10ce0319c31990a7@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
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
X-List-Received-Date: Thu, 12 Nov 2009 17:50:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2009 at 7:06 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
>>>There was some discussion around alternative proposals of storing the
>>> checksums in separate files within the recipes/ directory.
>
>>> The best alternatives so far where:
>>> =A0 =A0 =A0 - Place the checksums into the dir of the recipe
>>> =A0 =A0 =A0 - Use a MD5SUM_${URL} =3D "", SHA256SUM_${URL} =3D "" synta=
x
>>
>> I would be happy with the latter of those suggestions. =A0I don't think
>> the former really addresses the problems with the current checksums.ini.
>
> Yes, I sponsor the idea of a single Manifest in each dir.
>
> Let apart filetype specifier, example here:
> http://www.gentoo.org/proj/en/glep/glep-0044-extras/manifest2-example.txt
>
> Having a Manifest listing the filename, the size and some checksums on
> a single line seems to me very easy to parse for an automated script
> wich could refresh/generate the whole file.

I also like the way Gentoo handle with this problem, but I guess that
if we go that way we'd still have trouble regarding merging and
conflicts, like we current have with checksums.

Adding the checksum metadata in the recipe itself makes easier the
life of a lot of people, we just need to identify the easier and
prettier way of doing that.

Cheers,
--=20
Ricardo Salveti de Araujo


