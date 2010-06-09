Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OMLmf-0002kl-6o
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:57:33 +0200
Received: by gyg10 with SMTP id 10so4287411gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u48btUE8xF0A+AYx/50RX6a47KmZIZEdGiHAjFV3f7E=;
	b=XkSOEO8IR7nuos7jiKoMDHLU8PE/woCn7d5LqPbaS9Yq+ya6HMywa70hWqX0Xo8rWY
	iE+L5rv8pikRIMlVQ02BlAmW7c82BCJSLhwm5VxLx9s+3Pn8Ba4BQxQxyw70F4VVQAqM
	v597AkAV/cpXGMMGUroksipcqGsW36Hijh66U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ksrSGpouGQDp3dpdQzbFXq2W+mayYahM465N8ycExqk3Apsf74GlHUP3NGJgxxkLZU
	afGm9rWo37SKufmNEg1juAukwaAeAD3vDZes/JiQSwx5/QWLBLyuyzyS7aMSipPJIDhq
	3WSdUhQa5pHna+Gsuo8wMKGF/BAwz6tKDZhM8=
MIME-Version: 1.0
Received: by 10.91.161.39 with SMTP id n39mr99389ago.55.1276091590660; Wed, 09 
	Jun 2010 06:53:10 -0700 (PDT)
Received: by 10.90.88.14 with HTTP; Wed, 9 Jun 2010 06:53:10 -0700 (PDT)
In-Reply-To: <4C0F9119.3000909@freyther.de>
References: <4C0F9119.3000909@freyther.de>
Date: Wed, 9 Jun 2010 15:53:10 +0200
Message-ID: <AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 09 Jun 2010 13:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/9 Holger Freyther <holger+oe@freyther.de>:
> Hi all,
>
> we didn't really have much to talk....
>
>
>
> =3D=3D Renaming the org.openmebdded.dev branch =3D=3D
>
> We were carrying the org.openembedd.dev branch name from the monotone
> era into the git era and the TSC was asked to consider renaming it to
> 'master' which is the git default for the main development tree. Now the
> actual change on the server will be minor what is of a bigger concern
> are the existing users and documentation.

Technically speaking I think we should have run an RFC for this before
it was brought to the table of the TSC.

Personally the org.openembedded.dev branch name does not bother me
although I know master is the 'standard' git name.
Afaik renaming does not really solve a problem.

I am not too sure how much this affects the current users. Actually I
doubt if the change is bigger than the packages -> recipes renaming
Isse is that if we do that we should make sure all relevant
documentation is updated, otherwise we only create confusion (which
might still creep up as people use old mailing list articles).

Considering this, I am in favour of keeping things as they are.

Frans
>
> The TSC would like to make the following proposal:
>
> =A0a.) Contributor's will be asked to push to master, a git-hook
> =A0 =A0 =A0will prevent pushes to the old branch name.
> =A0b.) The default branch will be changed to 'master' and the
> =A0 =A0 =A0documentation will be updated.
> =A0c.) To ease this for existing users and to reduce the amount of
> =A0 =A0 =A0support org.openembedded.dev will track master and remains
> =A0 =A0 =A0available for a limited but long amount of time.
>
>
> The TSC is not sure on how to implement c.) and this will determine when
> we will be able to switch over and the schedule of doing so.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


