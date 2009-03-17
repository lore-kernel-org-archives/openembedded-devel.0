Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Ljar6-0001OF-11
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 16:06:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id A2A6D2C81F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 15:03:46 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BekWQDhSUQWn
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 15:03:45 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 731D62C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 15:03:44 +0000 (UTC)
Message-ID: <49BFBC09.7090201@gmail.com>
Date: Tue, 17 Mar 2009 16:04:41 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 15:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz ha scritto:
> Hi
>=20
> I know that there were lot of talks about creating stable branch of=20
> OpenEmbedded in last months. But we need stable branch for vendors whic=
h=20
> use our product.
>=20
> As some people know I am working for Bug Labs company. Their product=20
> named 'BUG Linux' is based on Poky 'pinky' (last stable release). We=20
> were considering switch to newer (but never released) version named=20
> 'elroy' but recently we decided to switch to OpenEmbedded.=20
>=20
> But to what kind of OE? Development branch change every day and things=20
> break from time to time, packages get version bumps without notifying=20
> anyone etc. Other possibility would be switch to stable branch but=20
> current one is deprecated and not maintained anymore.
>=20
> So the situation looks like we will need new stable branch with few=20
> maintainers (I will be one of them) and with proper policies for mergin=
g=20
> updates from development tree of OE. I maintained OE branches used for=20
> OpenZaurus/Familiar few years ago so can say that I have needed=20
> experience for it.
>=20
> Which things needs defining? I have few in mind:
>=20
> 1. Adding new things. This should be possible only by backporting from
>    OE.dev tree and needs to be Acked by at least 2-3 developers which
>    use stable branch. New code has to build for at least one distro and
>    ARM+x86 architectures (unless it is related to one arch or even one=20
>    machine).
>=20
> 2. Marking recipes as buildable or not. With over 6000 of them it is
>    really hard to check everything for status. We can remove many old
>    versions but sometimes they are useful for some projects. I would  =20
>    rather add things like BUILDABLE_armv4t =3D "1" into recipe or into
>    conf/distro/include/${DISTRO}-status.inc file. Similar status for
>    recipes which are known to not work for some archs.
>=20
> 3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete=
'=20
>    dirs in metadata - both should be dropped in stable branch. Other
>    recipes can be marked as not buildable or dropped from branch - I di=
d
>    not thought yet on it.
>=20
> 4. Lifetime of branch. Will we do new stable release after 6 months or
>    after one year? For how long stable branch will be supported by OE
>    itself? I know that there will be companies which will provide
>    support for longer time - thats what I do with Poky 'pinky' now.
>=20
> What do you feel about it? Any opinions or suggestions? Want to join=20
> effort?

I think that a stable branch is defintely necessary when you are using
OE in industrial environment like we do. A Long Term support would be
good as well for dome main branches, something like Ubuntu does.
I agree with this proposal.

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


