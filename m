Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NUOoI-0001SO-Hb
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:16:17 +0100
Received: by ywh8 with SMTP id 8so21303766ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 10:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1QlVLcmF73oGtY5qEoP3+zooieGXO1dZCvaB5qq5qvA=;
	b=Z+wptGKYy/mSw7PSgbVHnppxCmJ4cP4RFvQzOriaSOqbcWRDrx2xh+mFral+9SUyGS
	ITylr3G3GnPvCgv8c4gF9eLhF6bryp0LC1spOLQlsIitmb+Q2KyorDoFC0mVJ3QPXOxB
	Ex1/n7rwlhthpAfS6fT/EshWQTZKvgmSgdX28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=woTRHY3F1Cm1DQYvdV+pTamdw2QY1oWl8qrj6sMYMPGxFllr3V2ceHMaRT1AwMqFDW
	0SQiSfjqey+zQYW9Oo6pf7LQ+khY24SfxzeulRHIOE5edfSFxpZxLxzpiBIVV13v50tE
	YBe3q5N7NjkYq002OxQ2sYlXdJ08yj8dZJ7yI=
MIME-Version: 1.0
Received: by 10.101.190.1 with SMTP id s1mr19483908anp.94.1263233644962; Mon, 
	11 Jan 2010 10:14:04 -0800 (PST)
In-Reply-To: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
Date: Mon, 11 Jan 2010 19:14:04 +0100
Message-ID: <ac9c93b11001111014o4711d391kbdc1663f8f3beb59@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dependencies between packages
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
X-List-Received-Date: Mon, 11 Jan 2010 18:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/11 C Michael Sundius <msundius@sundius.com>:
> Some of our developers have been running into this problem and I'm wonder=
ing
> how others deal with it.
>
> It seems if we have a recipe, (A) that depends upon header files staged b=
y
> another recipe (B) then:
>
> 1) if the source for recipe (B) is modified and recompiled with:
>
> =A0 =A0bitbake -f -c compile B
> =A0 =A0bitbake B,
>
> I would expect that when recipe A is run:
>
> =A0 bitbake A
>
> It too would be recompiled, however that does not seem to be the case. In
> fact even if recipe B is cleaned up:
>
> =A0 =A0bitbake -c clean B
>
> and then we run recipe A
>
> =A0 =A0bitbake A
>
> only recipe B is run and recipe A is NOT rerun! the dependency is satisfi=
ed
> by rerunning recipe B and then bitbake stops..
>
> is this expected behaviour? Is there away to force rerunning of recipes t=
hat
> would be "out of date" due to one of its dependent recipes being return a=
nd
> re-staging (potentially) new headers and libraries?
>
> Any help of suggestions would be greatly appreciated.
>
> Mike

If you change a recipe you should bump PR. in the recipe of B. That
will cause that bitbake A will resuilt in a rebuild.


