Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PvYvJ-0003BI-Ur
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 18:36:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D7E7E314E6D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 18:34:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QxUwAp47LLCV
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 18:34:42 +0100 (CET)
Received: from [172.22.22.61] (ip-81-210-156-22.unitymediagroup.de
	[81.210.156.22])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 7F663314E6D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 18:34:42 +0100 (CET)
Message-ID: <4D7122B1.3080609@opendreambox.org>
Date: Fri, 04 Mar 2011 18:34:41 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D705C07.20508@freescale.com>	<1299244359-5345-1-git-send-email-obi@opendreambox.org>	<4D7107F9.90008@gmail.com>
	<1299255257.3830.37.camel@mattotaupa>
In-Reply-To: <1299255257.3830.37.camel@mattotaupa>
Subject: Re: [PATCH] mrouted-3.9.4: intitial recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 17:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/04/2011 05:14 PM, Paul Menzel wrote:
> Am Freitag, den 04.03.2011, 07:40 -0800 schrieb Khem Raj:
>> On 3/4/2011 5:12 AM, Andreas Oberritter wrote:
>>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>>> ---
>>> This was only compile-tested. It would be nice to get some feedback.
>>
>> Looks ok to me. Does it need any deps? May be building it from scratch=
=20
>> will detect it if not otherwise
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>=20
> With the dependencies addressed and =E2=80=A6

Other than using bison, there are no dependencies that I know of.
Binutils already depends on bison, so it's always available to cross
recipes. Should it be mentioned in mrouted explicitly, or is this a case
like binutils, gcc and libc, which never need to be mentioned in DEPENDS?

>>>   recipes/mrouted/mrouted_3.9.4.bb |   23 +++++++++++++++++++++++
>>>   1 files changed, 23 insertions(+), 0 deletions(-)
>>>   create mode 100644 recipes/mrouted/mrouted_3.9.4.bb
>>>
>>> diff --git a/recipes/mrouted/mrouted_3.9.4.bb b/recipes/mrouted/mrout=
ed_3.9.4.bb
>>> new file mode 100644
>>> index 0000000..4ba4111
>>> --- /dev/null
>>> +++ b/recipes/mrouted/mrouted_3.9.4.bb
>>> @@ -0,0 +1,23 @@
>>> +DESCRIPTION =3D "DVMRP multicast routing daemon"
>>> +HOMEPAGE =3D "http://troglobit.com/mrouted.shtml"
>>> +SECTION =3D "network"
>>> +LICENSE =3D "BSD"
>>> +
>>> +SRC_URI =3D "ftp://ftp.vmlinux.org/pub/People/jocke/mrouted/mrouted-=
${PV}.tar.bz2"
>>> +SRC_URI[md5sum] =3D "688b74fc42919d588f262e6b3c9c6d4c"
>>> +SRC_URI[sha256sum] =3D "c697549b2e506a380575f7adb67e87288ef2295b9724=
1b3a1aeb0e88b827a3e1"
>>> +
>>> +EXTRA_OEMAKE =3D " \
>>> +        datadir=3D${datadir} \
>>> +        mandir=3D${mandir} \
>>> +        prefix=3D${prefix} \
>>> +        sysconfdir=3D${sysconfdir} \
>>> +        DESTDIR=3D${D} \
>>> +"
>>> +
>>> +do_compile() {
>>> +        oe_runmake
>>> +}
>=20
> =E2=80=A6 add a blank line (?) this is

That's the output of oe-stylize. Should oe-stylize be changed to add an
empty line between functions?

> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
>>> +do_install() {
>>> +        oe_runmake install
>>> +}
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l



