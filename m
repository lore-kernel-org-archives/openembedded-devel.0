Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pgciz-0005jP-Q5
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 13:37:49 +0100
Received: by iyj18 with SMTP id 18so2833709iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=n6BR2/AQ/fqXrchexjRTd3aqRc72Li5noGd2q8iTxBs=;
	b=qZc+9J281juO94CnS+44uDdQ6rA4JMJZUFQU+DgdaZBSeL7I7+13Cc8HXGeU9pkca7
	NwDJj7+YVsIajBG/jS/cTTBPHuXIi+fCdEquxyhZllejtK1rTwSAFNPibAj8UEL2Cr8o
	RK9RCi/NLwI2ezCvwzXxSwJUSdTeLvntuOBzw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OEbZlVfgPY+agl0n1Z7oH2kXTuPBmKAQ8Tbvnek/QshqkrW4JQtAvyqc4bC519acAR
	dtemSw5IvpIADNli4TaYJHm1p2ubr1lR4hagva3JxYfqiCWpK013/DAXMhhSX2e0n73c
	3lqb+65L3otY6NrvkJUjpmyn93NBY3mzYhaGM=
MIME-Version: 1.0
Received: by 10.231.31.196 with SMTP id z4mr2110390ibc.199.1295699806001; Sat,
	22 Jan 2011 04:36:46 -0800 (PST)
Received: by 10.231.34.69 with HTTP; Sat, 22 Jan 2011 04:36:45 -0800 (PST)
In-Reply-To: <ihedug$vsl$1@dough.gmane.org>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<ihbp5c$4ov$1@dough.gmane.org>
	<AANLkTinnrY2o___wOwe3vqrYfY8QsBQYE6AA7VFuAq7T@mail.gmail.com>
	<ihedug$vsl$1@dough.gmane.org>
Date: Sat, 22 Jan 2011 13:36:45 +0100
Message-ID: <AANLkTimR7QtotOx-e22eRkc_iT8GMr+2gwby42QF=VQ-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Sat, 22 Jan 2011 12:37:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/22 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-01-11 01:21, Khem Raj wrote:
>> On Fri, Jan 21, 2011 at 3:03 AM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>> On 20-01-11 19:12, V=EDctor M. J=E1quez L. wrote:
>>>>>
>>>>> In order to build native-sdk-image recipe, I found my self compiling
>>>>> glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev =
(the
>>>>> toolchain does not truly provide it -but that is another bug [1]-).
>>>>>
>>>>> But the glibc_2.9-r37.4 configuration fails using the canonical
>>>>> arm-angstrom-linux-gnueabi- toolchain
>>
>> If you're using angstrom 2008, glibc 2.9 is built by default. Trying to
>> rebuild it won't work because it will be missing headers due to all the
>> -initial and -intermedia shuffle.
>> If you're using angstrom 2010, eglibc is built by default and should
>> providing virtual-libc-dev
>>
>>> yes angstrom-2010.x is a better option keep in mind its new so expect
>>> some churn every now and then.
>>
>>
>> Switching to minimal will only get you anguish, since it's broken by des=
ign.
>>
>>> Heh interesting :) It would help if you elaborate on the flaws so we
>>> can improve it and in turn improve OE in general
>
> The design involves not using PREFERRED_PROVIDER for things like bluez

Do you mean this?
minimal.conf:PREFERRED_PROVIDER_bluez-utils-dbus =3D "bluez4"
minimal.conf:PREFERRED_PROVIDER_bluez-libs       =3D "bluez-libs"
minimal.conf:PREFERRED_PROVIDER_bluez-utils      =3D "bluez4"

> and not setting PREFERRED_VERSION for recipes, using source mirrors or

You mean like this:
minimal.conf:PREFERRED_QT_VERSION ?=3D "4.7.1"
minimal.conf:PREFERRED_VERSION_qt4-tools-native =3D "${PREFERRED_QT_VERSION=
}"
minimal.conf:PREFERRED_VERSION_qt4-tools-sdk =3D "${PREFERRED_QT_VERSION}"
minimal.conf:PREFERRED_VERSION_qt4-embedded =3D "${PREFERRED_QT_VERSION}"
minimal.conf:PREFERRED_VERSION_qt4-embedded-gles =3D "${PREFERRED_QT_VERSIO=
N}"
minimal.conf:PREFERRED_VERSION_qt4-x11-free =3D "${PREFERRED_QT_VERSION}"
minimal.conf:PREFERRED_VERSION_qt4-x11-free-gles =3D "${PREFERRED_QT_VERSIO=
N}"

minimal also includes sane-toolchain.inc which contains the preferred
versions of the toolchain.
(together with some other distros)

Yes there are less pinnings in minimal than in angstrom. Fortunately
not, I'd say. I assume this is because the minimal maintainers have
more confidence and trust in the package maintainers.

wrt the source mirrors.
I feel recipes should build without source mirror. However in some
cases (e.g. handhelds.org) a source mirror is useful. In my previous
reply I suggested to populate sources.openembedded.org. Those who need
it can use it.
If the sources for a recipe reside on a mirror only, the recipe
SRC_URI should be changed to reflect that. Whether a recipe fetches or
not should not depend on the distro.

> using things like insane.bbclass. As expected, you had to use pretty

get your facts straight. minimal uses insane.bbclass:
minimal.conf:INHERIT +=3D "insane"
No idea when exactly it was added. I'm not the minimal maintainer),
but it is used now.

> much all those to get minimal to build something remotely usefull.

In my opinion it is more useful than a binary generator generating
untested (and probably unreproducible) images, but that is just my
opinion. If someone wants to play the digital equivalent of russian
roulette, who am I to deny it to them.
>
> As Philip points out, people are free to deliberately not use those
> advanced features, but they should also realize that any breakage due to
> that is entirely their own fault.

Have a nice weekend! Frans.


