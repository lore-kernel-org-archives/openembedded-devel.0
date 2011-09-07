Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R1Ca5-00017g-Oq
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 09:30:24 +0200
Received: by qwm42 with SMTP id 42so6934097qwm.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w+q5B7hfx3ez9vlAw/4j9crIBsC79Y8aIF/Fy744yCA=;
	b=swnoDyDMzpMDPcNsMrr4t4Akut/bAgJyiGBQkb+pfwZM3PrVwAb0bkeObqHoFv0To9
	sFVbroYv149OWRWlnt+xWrBcra9zcDEoEeNJaBFfNiNmeF88y0wat/MA0R8CSKPXZGo/
	VEq/XrBQOX5yCvuBQdqJC/mEeYnoxbiZCfG7A=
Received: by 10.229.72.162 with SMTP id m34mr4693711qcj.189.1315380293239;
	Wed, 07 Sep 2011 00:24:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Wed, 7 Sep 2011 00:24:33 -0700 (PDT)
In-Reply-To: <20110907072125.GC20853@jama.jama.net>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
	<1315304074.4717.6.camel@mattotaupa>
	<CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
	<1315305904.4717.9.camel@mattotaupa>
	<CACrTVg+Zig-sAR=gUR2yt+8pRtzx_+gSBYLUnL4qro=A8t9L-Q@mail.gmail.com>
	<CACrTVgJv6yroaXzacnXL2Uo1yNvb1wc6YndSufS9iVF78MdkBA@mail.gmail.com>
	<20110907072125.GC20853@jama.jama.net>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 7 Sep 2011 09:24:33 +0200
Message-ID: <CACrTVgL7jKMiXctiJMV22bhOHAtTw8ODbYLiV4NQQXoG--wD5w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Wed, 07 Sep 2011 07:31:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi JaMa,

yes right thank you! (I could figured it out myself.. :/. to early for me)

Sylvain

2011/9/7 Martin Jansa <martin.jansa@gmail.com>

> On Wed, Sep 07, 2011 at 09:15:52AM +0200, Sylvain Par=E9 wrote:
> > Hi Paul,
> >
> > There is a mistake in my last patch.
> > As I changed the version of binutils ( + '.1') then patches are not goo=
d
> > fetched, they are looked for in files/ and not in binutils-2.21/
> > What is the best way to fix this ?
> > copy binutils-2.21/ into binutils-2.21.1/ with all its patches or updat=
e
> the
> > binutils-2.21.1.bb recipe to point to binutils-2.21/ ?
> >
> > I will then push propose a new version of my patch.
>
> git mv binutils-2.21 binutils-2.21.1
> as no recipe using binutils-2.21 directory is left
>
> don't forget to update preferred version in sane-toolchain.inc as I said
> yesterday on IRC
>
> Regards,
>
> > Thanks.
> > regards,
> >
> > Sylvain
> >
> >
> > 2011/9/6 Sylvain Par=E9 <sylvain.pare@gmail.com>
> >
> > > Paul,
> > > I had already resent my patch with proper -M -C option.
> > > Sorry for the noise. It is missing the v2 thing. is it ok?
> > > Thanks again. and next I hope it will be good from the start.
> > > Greetings,
> > > Sylvain
> > >
> > >
> > >
> > > 2011/9/6 Paul Menzel <paulepanter@users.sourceforge.net>
> > >
> > >> Am Dienstag, den 06.09.2011, 12:22 +0200 schrieb Sylvain Par=E9:
> > >>
> > >> > thank you. I was just seing these *@# line breaks..
> > >> > So yes I will use git-send.
> > >> >
> > >> > So about my patch I re-send a new one right?
> > >>
> > >> Yeah, fix the commit message with `git commit -s --amend` or `git
> rebase
> > >> -i =85`, create a new file with
> > >>
> > >>        git format-patch -s -1 -M -M -C -C -C --subject-prefix=3D"PAT=
CH
> > >>        v2"
> > >>
> > >> and use `git send-email =85`.
> > >>
> > >>
> > >> Thanks,
> > >>
> > >> Paul
> > >>
> > >>
> > >> [1]
> > >>
> http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
> > >>
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >>
> > >>
> > >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

