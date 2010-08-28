Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpKiY-0004cV-30
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 14:41:07 +0200
Received: by gxk2 with SMTP id 2so1544793gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 05:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YIZz9LDngKuxnUFupxFTK9XBbGR9mKVaNldCi450VyA=;
	b=WsHcIYMgE9YQiWudI0Ul4LJnvjUTBKpj/bgzWGjkNPrvxVHolyqrsJTPTmEQETEMwJ
	KWHyzq3xAwzc1WRFAyLlqnT0UKbuCTmnleQESs2JBAHEOqH3AHG0UsX6KGymqY0T0m8R
	oWvNf7Uvqwr1J+ArOBH3ViIvCqqIlAMHGONxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=u7NQXnpe6lT0I6VFd/GCSsgocLBJGeKVZIA2inOJBOfvhfAmoT1NOX6J/vKSYx8VhT
	PHZLA1g0vZX2CrCgiyKCPFmIw8wq3KyBdQLCCY1PsHd7NkN91cUUtEOBg0MW7ngw9RLT
	rssb4Ep5aEqyD8L7MC4NSgAZNsuxYUzMnUIO4=
MIME-Version: 1.0
Received: by 10.150.57.7 with SMTP id f7mr3196734yba.364.1282999225891; Sat,
	28 Aug 2010 05:40:25 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 05:40:25 -0700 (PDT)
In-Reply-To: <AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
Date: Sat, 28 Aug 2010 14:40:25 +0200
Message-ID: <AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Sat, 28 Aug 2010 12:41:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Koen brought up this in the thread on the review process. As it
(mostly) is about this thread I felt it was more appropriate here.


>> =3D me
> =3D Koen

>> I see two things happening.
>> - patches are submitted for review but do not gain any feedback in a
>> reasonable time. I have several patches in the queue that did not get
>> any feedback.
>> - people are abusing their powers by rejecting changes without
>> motivation. See e.g [1] and [2]. I feel if you reject a patch you have
>> an obligation to explain why you rejected it.
>
> If you want to delete a recipe I maintain, the burden is on you or are
> you saying that maintainers aren't in charge of their recipes anymore?


>>[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/0=
23374.html
>>[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/0=
23270.html

The 10 recipes Koen nack-ed:
>  recipes/angstrom/angstrom-bootmanager.bb           |    2 +-
>  recipes/esc/esc-node-demo_git.bb                   |    4 +-
>  recipes/meta/meta-toolchain-arago-dvsdk.bb         |    1 +
>  recipes/sugar/sugar-fructose.bb                    |    2 +-
>  recipes/tasks/task-arago-toolchain-target.bb       |    3 +-
>  recipes/tasks/task-demo-x11.bb                     |   17 ++---
>  recipes/tasks/task-gmae.bb                         |    7 ++
>  recipes/tasks/task-gpe.bb                          |    6 +-
>  recipes/udev/udev-compat141_141.bb                 |    6 ++-
>  recipes/vlc/vlc-davinci_0.8.6h.bb                  |    2 +-

Person:     Koen Kooi
Mail:       koen@openembedded.org
Website:    http://dominion.kabel.utwente.nl/koen/cms
Machines:   h2200, ipaq-pxa270, efika, ep93xx, netbook-pro
Distros:    =EF=BF=BD~Engstr=EF=BF=BD=EF=BF=BDm
Interests:  OpenSync, GNOME, GPE, Matchbox
Recipes:    abiword, bootchart, dia, farsight, freeciv, fuse, galago,
geda, gimp,
Recipes:    gnumeric, gobby, obby, imposter, inkscape
Recipes:    *moko*, telepathy, tilibs, xchat, xournal.

I don't know what others think about it, but I see only a few matches.

That of course does not mean that Koen is not entitiled to an opinion.
Of course not, this is a rerview request and everyone may react to it.
However, I, and I think most of us would appreciate it if this is done
in a professional, polite and friendly manner.

(btw wrt the other two post about the 3 conf/distro/include files I
proposed to delete: two are gpe, and one is maemo. you may consider
yourself to be the maintainer of the gpe recipes. I've clearly
indicated why I wanted to remove them and you did not address any of
my concerns and observations; also as I wrote before maintainership
also comes with obligations. These files are clearly broken so it
seems the maintainer has some work there.)

Frans

PS: I think this is also an excellent case why it is a good idea to
identify the maintainer within the recipe/


