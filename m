Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HP1SJ-0005MK-Ks
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Mar 2007 20:05:43 +0100
Received: from [192.168.1.21] (54.84-48-194.nextgentel.com [84.48.194.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 707B91BF29B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2007 20:05:44 +0100 (CET)
From: =?utf-8?q?=C3=98yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Mar 2007 20:05:36 +0100
User-Agent: KMail/1.9.5
References: <E1HOvGE-0004Zn-Tg@linuxtogo.org>
	<200703071915.17291.repvik@kynisk.com>
	<45EF0482.5050601@dominion.kabel.utwente.nl>
In-Reply-To: <45EF0482.5050601@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200703072005.36195.repvik@kynisk.com>
Subject: Re: [oe-commits] org.oe.dev turbostation: Add a kernel-feed for the turbostation
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
X-List-Received-Date: Wed, 07 Mar 2007 19:05:43 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 07 March 2007 19:29, Koen Kooi wrote:
> =C3=98yvind Repvik schreef:
> > On Wednesday 07 March 2007 13:41, Koen Kooi wrote:
> >> =C3=98yvind Repvik schreef:
> >>> On Wednesday 07 March 2007 13:30, Koen Kooi wrote:
> >>>> nail commit schreef:
> >>>>> turbostation: Add a kernel-feed for the turbostation
> >>>>>
> >>>>>
> >>>>> ---
> >>>>> conf/machine/turbostation.conf	6f726b010d35f1dca1dfb881904353cbda8d=
1e
> >>>>>85 +++
> >>>>> conf/machine/turbostation.conf	d117d9cf3f641f7635130a1cff259c3c26fe=
96
> >>>>>e7
> >>>>>
> >>>>> +FEED_URIS +=3D
> >>>>> "turbostation##http://ipkg.kynisk.com/opents/cross/1.0-dev/"
> >>>>
> >>>> Don't do that, feeds are a distro thing, not a machine thing. So that
> >>>> should go into conf/distro/$yourdistro.conf
> >>>
> >>> Yeah, but since I won't touch the distro in question, I'll just clone
> >>> it and make it my own.
> >>
> >> Can't just do "echo 'require conf/distro/openprotium.conf' >
> >> conf/distro/openturbostation.conf" instead of copying it?
> >
> > Of course the simplest of all would be to allow having a
> > kernel-module-only feed in the machine.conf instead of having to create
> > another distro just to split the feed into packages/kernel-modules.
>
> You mean FEED_URI_turbostation =3D "http://foo/bar" in
> conf/distro/openprotium.conf?

You missed the part of me not touching that config. Anyway, I've made a=20
completely separate distro.

=C3=98yvind


