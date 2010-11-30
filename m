Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNUhd-0002SB-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:13:21 +0100
Received: by gwj16 with SMTP id 16so2557294gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YD3Tr8sGKVvug5f7FFfSNvPgUjFBS5PuDp2/klkDZLk=;
	b=rJs2+wRG7yw1m20cKASifsI5Iu1A7cohcN5ksJft0bIsPMqn2D+cQB+LmcvsjNDj64
	yGW3Yoc6BnQJU3ARepLthkYhEkjTHlQCAzHo+qSH0dpjEa4+lV/GymPZLQvd73LFVOYR
	WB0LpJhDgGkZFhWdUr2xdWw3G99x1LjzZ0rN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fsAIVsUdeRHljaVw9zEnaQ/LrNtgzl3ht3+jRUs3ZOWvk0ZaXTFmy8KbLz0ilNfeTC
	/C2khJyB4eov6OUOcI4Vlnnf0jVPfPrxXe5fxBo2xYCNxn/l9LiY5MPGUMwQfmLLBCqr
	Lk0sgDy156IO6Lbba7wWr4cIp7z700jvQC8fE=
Received: by 10.90.9.22 with SMTP id 22mr70234agi.102.1291140716724; Tue, 30
	Nov 2010 10:11:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 10:11:36 -0800 (PST)
In-Reply-To: <AANLkTin+D5JmWZXt4xkX=wqfa-A+kNjpN8R-2dFDssxZ@mail.gmail.com>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
	<AANLkTin+D5JmWZXt4xkX=wqfa-A+kNjpN8R-2dFDssxZ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 10:11:36 -0800
Message-ID: <AANLkTim9Q6wrbPav=b0Mvb0gpJXNrnsqf+PVaYTYfx8j@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Tue, 30 Nov 2010 18:13:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2010 at 1:17 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Just committed the following 3 things to master, they could also go
> into the release (at least the last two ones wrt php).
> Still looking for a solution to get php working with iconv as without
> it it breaks another recipe (I think ampache).
> Open for ideas on that one.
>
> Frans
>
> commit 7aa6b49cabce5f85705508a0ead01433b2dafbbe
> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Date: =C2=A0 Tue Nov 30 09:30:36 2010 +0100
>
> =C2=A0 =C2=A0mythtv: removed 0.22
>
> =C2=A0 =C2=A0probably does not build with qt4.7
> =C2=A0 =C2=A0this one was not maintained anyway and only stayed because a=
 few
> distro's pinned it.
> =C2=A0 =C2=A0it is now unpinned by all so rm.
> =C2=A0 =C2=A0we already have 0.23 for almost a year, and the metadata for=
 0.23 is better
>
> =C2=A0 =C2=A0Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.c=
om>
>
> commit b0d9ce644c7847533e7b362441e45d8f7c7748b6
> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Date: =C2=A0 Tue Nov 30 09:29:14 2010 +0100
>
> =C2=A0 =C2=A0php: reinstated --without-iconv, this seems to generate conf=
igure issues
>
> =C2=A0 =C2=A0issues are wrt native paths being used.
> =C2=A0 =C2=A0e.g. get that fork is not found
> =C2=A0 =C2=A0adding --with-iconv-dir did not help
> =C2=A0 =C2=A0This needs further investigation
>
> =C2=A0 =C2=A0Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.c=
om>
>
> commit 9d3d91887fe4c36d89466dd08520449fd017928f
> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Date: =C2=A0 Tue Nov 30 09:28:13 2010 +0100
>
> =C2=A0 =C2=A0php: removed --enable-memory-limit configure argument; does =
not
> exist any moe
>
> =C2=A0 =C2=A0Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.c=
om>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


took these three too.


