Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NyLU3-0006hd-13
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Apr 2010 10:47:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id C051E2C7E1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Apr 2010 08:43:08 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxBYywnD49Pn
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Apr 2010 08:43:04 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 1E1452C7DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Apr 2010 08:43:03 +0000 (UTC)
Message-ID: <4BB8513E.40705@gmail.com>
Date: Sun, 04 Apr 2010 10:43:42 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269796691.8018.74.camel@mattotaupa>	<1269955259.4103.51.camel@mattotaupa>	<1270223959.3873.29.camel@mattotaupa>	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>	<20100402211847.GK3270@jama>
	<1270249002.3714.29.camel@mattotaupa>
In-Reply-To: <1270249002.3714.29.camel@mattotaupa>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Setting `PV` in recipes using SCM repositories
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
X-List-Received-Date: Sun, 04 Apr 2010 08:47:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Paul Menzel ha scritto, Il 03/04/2010 00:56:
> Am Freitag, den 02.04.2010, 23:18 +0200 schrieb Martin Jansa:
>> On Fri, Apr 02, 2010 at 11:28:10AM -0700, Khem Raj wrote:
>>> On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel
>>> <paulepanter@users.sourceforge.net> wrote:
>>>> 1. Create `enna.inc`.
>>>> 2. Use `INC_PR`.
>>>> 3. Move to new repository location.
>>>> 4. Use `NOTQUITESRCREV` since `SRCREV` seems to get set to the one f=
rom the EFL recipes.
>> You can use SRCREV again after
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D82b3944=
67d9142edf2721176244c3a7eb26ba69a
>=20
> I guess I have to resend a v4.
>=20
>> And maybe you want rev shown in PV or PR
>> PV =3D "0.4.0+hg${SRCPV}" or=20
>> PR_append =3D "+hg${SRCPV}"
>> is quire common and should work for hg too (haven't checked)
>=20
> Unfortunately I could not find any information about `SRCPV` in the
> BitBake or OE manual. What is the difference to `SRCREV`?
>=20
> Anyway, the problem I have with appending the `SRCREV` to `PV` is, that
> if you change the revision `bitbake -c clean recipe.bb` will not work
> and the old files stay in the build tree. Is that true with `SRCPV`
> also?
>=20
> Could the TSC make a suggestion on how to set `PV` in recipes using SCM
> repositories.
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> -----------------------------------------------------------------------=
-

I'll work on this next week

Happy Easter :-)


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


