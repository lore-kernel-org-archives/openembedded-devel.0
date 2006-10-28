Received: from [89.149.200.90] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1GdckG-0005Ws-6J
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Oct 2006 03:12:20 +0200
Received: from [10.0.0.22] (54.84-48-194.nextgentel.com [84.48.194.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 067109A9FC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2006 03:09:50 +0200 (CEST)
Message-ID: <4542AE65.2040102@kynisk.com>
Date: Sat, 28 Oct 2006 03:12:05 +0200
From: =?ISO-8859-1?Q?=D8yvind_Repvik?= <repvik@kynisk.com>
User-Agent: Thunderbird 1.5.0.7 (X11/20060918)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200610271801.52172.openembedded@hrw.one.pl>
	<1161978194.1649.335.camel@gandalf.tm.informatik.uni-frankfurt.de>
In-Reply-To: <1161978194.1649.335.camel@gandalf.tm.informatik.uni-frankfurt.de>
X-Mailman-Approved-At: Sat, 28 Oct 2006 11:18:26 +0200
Subject: Re: RFC: More granular libraries packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Oct 2006 01:12:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Michael 'Mickey' Lauer wrote:
> Am Freitag, den 27.10.2006, 18:01 +0200 schrieb Marcin Juszkiewicz:
>> My proposition is - let split each library to separate package. This w=
ill=20
>> enlarge feeds (so ipkg will get hurt more ;( but in some situations ca=
n=20
>> give us smaller rootfs.
>=20
> +1 from me, however would this be explicit or implicit, i.e. do we need
> to opt-in for it to happen (e.g. by inheriting package_libs) or do we
> need to opt-out for it _not_ to happen (e.g. by defining
> PACKAGE_LIBS_AUTOMATIC =3D "0").

I wouldn't mind it being opt-out, since that makes it somewhat easier=20
(imho) to figure out which packages "break" with this change.

Regards,
=D8yvind "NAiL" Repvik


