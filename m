Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpSB8-0006SD-EJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:39:09 +0200
Received: by iwn2 with SMTP id 2so3550221iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=76VvMEnEaJE4OC9RqmOLSGxGpL8tU4MynUbVZ9Bl6XY=;
	b=Biyk0UrXg9oo7sAxCt6UFFJBCuYUpOSaUv1+BziGW+gHhvMeNJUMoETjmxZtzedSqN
	hGQJn7wPPRykb2rU3twzkVIjG7V8kkrFMI3r8s+ZDEhlnOuyn6CC6C4mg0rVtlxWkaZ2
	FG6KGCmHVttyJwq5UmpR69flKksnWbPkpmQmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YCVYe1j+VdmH50o2G6+KFIw2ngPPwqp6MJx4XOAR9/+ZuApL6I+iSpkh76WkgJTwVI
	NUCEcOGoounnJRMqRfV/wiJR2BdG9hOLKZVumLqcxJfFpJM0yJqq8wKoZChHn+MS7Ate
	l7GaBQ6qHRBcB77ia3hu4gtXzNo8jtX0xWd1I=
Received: by 10.231.184.156 with SMTP id ck28mr2807042ibb.168.1283027917478;
	Sat, 28 Aug 2010 13:38:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sat, 28 Aug 2010 13:38:17 -0700 (PDT)
In-Reply-To: <AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Aug 2010 13:38:17 -0700
Message-ID: <AANLkTinxOYYnR1DUyTgnyhTLvXxF=vk35Sd0LBQ=ymuk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2010 at 5:40 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Koen brought up this in the thread on the review process. As it
> (mostly) is about this thread I felt it was more appropriate here.
>
>
>>> =3D me
>> =3D Koen
>
>>> I see two things happening.
>>> - patches are submitted for review but do not gain any feedback in a
>>> reasonable time. I have several patches in the queue that did not get
>>> any feedback.
>>> - people are abusing their powers by rejecting changes without
>>> motivation. See e.g [1] and [2]. I feel if you reject a patch you have
>>> an obligation to explain why you rejected it.
>>
>> If you want to delete a recipe I maintain, the burden is on you or are
>> you saying that maintainers aren't in charge of their recipes anymore?
>
>
>>>[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/=
023374.html
>>>[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/=
023270.html
>
> The 10 recipes Koen nack-ed:
>> =C2=A0recipes/angstrom/angstrom-bootmanager.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A0recipes/esc/esc-node-demo_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +-
>> =C2=A0recipes/meta/meta-toolchain-arago-dvsdk.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A01 +
>> =C2=A0recipes/sugar/sugar-fructose.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0recipes/tasks/task-arago-toolchain-target.bb =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A03 +-
>> =C2=A0recipes/tasks/task-demo-x11.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 17 ++---
>> =C2=A0recipes/tasks/task-gmae.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 ++
>> =C2=A0recipes/tasks/task-gpe.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +-
>> =C2=A0recipes/udev/udev-compat141_141.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 ++-
>> =C2=A0recipes/vlc/vlc-davinci_0.8.6h.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>
> Person: =C2=A0 =C2=A0 Koen Kooi
> Mail: =C2=A0 =C2=A0 =C2=A0 koen@openembedded.org
> Website: =C2=A0 =C2=A0http://dominion.kabel.utwente.nl/koen/cms
> Machines: =C2=A0 h2200, ipaq-pxa270, efika, ep93xx, netbook-pro
> Distros: =C2=A0 =C2=A0=EF=BF=BD~Engstr=EF=BF=BD=EF=BF=BDm
> Interests: =C2=A0OpenSync, GNOME, GPE, Matchbox
> Recipes: =C2=A0 =C2=A0abiword, bootchart, dia, farsight, freeciv, fuse, g=
alago,
> geda, gimp,
> Recipes: =C2=A0 =C2=A0gnumeric, gobby, obby, imposter, inkscape
> Recipes: =C2=A0 =C2=A0*moko*, telepathy, tilibs, xchat, xournal.
>
> I don't know what others think about it, but I see only a few matches.

it really does not matter. This MAINTAINERS file is not defining the bounda=
ry
of what people can provide feedback on but its a document which says whom t=
o
approach if a recipe is not being taken care on some issues. There are
many aspects
to patches and all feedback should be welcome.

>
> That of course does not mean that Koen is not entitiled to an opinion.
> Of course not, this is a rerview request and everyone may react to it.
> However, I, and I think most of us would appreciate it if this is done
> in a professional, polite and friendly manner.

> (btw wrt the other two post about the 3 conf/distro/include files I
> proposed to delete: two are gpe, and one is maemo. you may consider
> yourself to be the maintainer of the gpe recipes. I've clearly
> indicated why I wanted to remove them and you did not address any of
> my concerns and observations; also as I wrote before maintainership
> also comes with obligations. These files are clearly broken so it
> seems the maintainer has some work there.)
>
> Frans
>
> PS: I think this is also an excellent case why it is a good idea to
> identify the maintainer within the recipe/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


