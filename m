Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PbBbN-00086g-46
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 13:39:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 57F4D314C9DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jan 2011 13:39:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NVnBhcJ0GPdz
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jan 2011 13:38:59 +0100 (CET)
Received: from [172.22.22.61] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id B4C82314C89F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jan 2011 13:38:59 +0100 (CET)
Message-ID: <4D27096A.2050605@opendreambox.org>
Date: Fri, 07 Jan 2011 13:39:06 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>	<1294318110-23521-4-git-send-email-obi@opendreambox.org>
	<1294393961.3699.5.camel@mattotaupa>
In-Reply-To: <1294393961.3699.5.camel@mattotaupa>
Subject: Re: [PATCH 4/4] gcc: replace unconditional SRC_URI_append with SRC_URI +=
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
X-List-Received-Date: Fri, 07 Jan 2011 12:39:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/07/2011 10:52 AM, Paul Menzel wrote:
> Am Donnerstag, den 06.01.2011, 12:48 +0000 schrieb Andreas Oberritter:
>=20
> What do you mean by =C2=BBunconditional SRC_URI_append=C2=AB? I searche=
d through
> the documentation and could not find the word.

Unconditional, because it doesn't contain an override like e.g.
SRC_URI_append_beagleboard does.

> I always thought
> `SRC_URI_append =3D` and `SRC_URI +=3D` is the same and if I am not mis=
taken
> the manual says the same [1].
>=20
> Do I understand your patch correctly, that when `_append` was used in
> the recipe in some places, the space was missing and that you chose to
> replace it by `+=3D` for consistency?

Yes. I think that +=3D is easier to use and less error-prone.

- As Koen already pointed out, it adds whitespace automatically, so in
whitespace separated lists like SRC_URI you don't have to care.

- You can use multiple statements in a recipe.

SRC_URI +=3D "foo"
SRC_URI +=3D "bar"

vs.

SRC_URI_append =3D " foo"
SRC_URI_append =3D " bar"

The latter wouldn't work.

In the case of gcc, I modified SRC_URI in some inc file resulting in
"... file://my.patchfile://fortran-cross-compile-hack.patch ...".

> [1] http://docs.openembedded.org/usermanual/usermanual.html#recipes_syn=
tax

SRC_URI_append =3D "file://fixup.patch" is probably a bad example.

Regards,
Andreas



