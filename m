Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PV7qF-0007ia-5b
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 20:25:48 +0100
Received: by wwi17 with SMTP id 17so4290240wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lk9uuLnnnQoPnsGn5XzLAHawox1v7Hp9yhF8AAcRIBk=;
	b=t487hEb3dlvfm7jN0AOm5e4GDd5lf9r5d76Nxp2unS6+36z62PJfPF7onNR5jtIzzJ
	itc9Zv3CvyKQQp7SBrJGx8dZUr79pr37OsthQzB+Fu0F8rygsh2636Upcc8qohZV00mU
	OOvqQg/b8/GeCCC3pXbge+2UsKqFyjV6K/UC0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eemiBEYJzn9FBkrwqqst/Lybh2gjOAzDlVJtlyJhqkmFfZAKwEADo1lBdecJD+9KCI
	dCWaJNKZTBoDCK2cMaAsnFClUp28Wml847eU75wzNKJa3jpUFaAWsU/wXN6FPCNdbUxg
	wHYeLYQoZswP+gc75lexN13nrmqB7VXxDrgis=
MIME-Version: 1.0
Received: by 10.216.177.9 with SMTP id c9mr6716604wem.34.1292959539596; Tue,
	21 Dec 2010 11:25:39 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Tue, 21 Dec 2010 11:25:39 -0800 (PST)
In-Reply-To: <4D10F69B.8080604@mentor.com>
References: <ienu66$5gf$1@dough.gmane.org>
	<AANLkTimSZHSb23N1opQc=zQ4cNgsEzA_jaO_rn0=pV3o@mail.gmail.com>
	<4D10F69B.8080604@mentor.com>
Date: Tue, 21 Dec 2010 14:25:39 -0500
Message-ID: <AANLkTi=NMydMgVW4GF10we=_csy+gtpncR-5Dq4vmVJc@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Tue, 21 Dec 2010 19:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 1:48 PM, Tom Rini <tom_rini@mentor.com> wrote:

>> yes this is something what we should do. We need to setup gitolite on
>> the git server
>
> Can I just put in my 2 cents for some github love? =A0Chris got me starte=
d
> using it and I'm quite happy. =A0It'd also be less admin work and since I
> forked Chris' tree, my space usage is still practically nil (I'm not sure
> about his), so the free accounts are fine.

I'm sure our gitserver will never compare to github in features, but
it seems like there is a fundamental limit in that github cannot
possible host every git repo on the planet, especially for larger
projects like OE where you have a lot of people pulling.  I think
there is some value in:

1) hosting OE at openembedded.org (branding, professional image, etc).
 That said, I realize that companies like Nokia are hosting their
stuff on gitorious (http://qt.gitorious.org/), so perhaps this is not
an issue, though its likely Nokia is funding Gitorious to obtain
bandwidth, etc.
2) we are more in control of bandwidth, locations, etc.  We have a lot
of checkouts from our repo, and other than some problems in Europe, I
think our availability has been reasonably good.

I don't know if these benefits outweigh those provided by github.
Perhaps some others can share experiences.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


