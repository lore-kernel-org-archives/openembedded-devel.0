Received: from [209.85.216.193] (helo=mail-px0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MElq0-0001iw-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 17:05:08 +0200
Received: by pxi31 with SMTP id 31so745010pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/lRsPziTkbXPsWEeO4eEBCXdvR0+F2omtTknjnACPCk=;
	b=Ynp4DQzCZezyz8u6uO044x7sb1OtOjEv6Iecioh3IZyO6aT1xm2uVl1Shq/N1war6/
	D1yMUf6o/69Bl26HxDKNpQOvdTOb3Z6NyiYQHTkyU5lcW/qjwknRlmCjKH3e4tzEVKxZ
	jD7rQtPf0nCfhHhbgZvZvhLylaqtOKtk1gPuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=V+oBzcQUitY8SORPRgM2ir+j1pg1SGVSJMfzvJyuhUM4Nx4Xoj8HUxk/9dR5KoZtk3
	ozpkjhcHZ6aUFDUF3EpcFYEX7Tn85EH/swNmBOOJxQTdLUCHD11JfZp4nq47dCg03E+C
	FKUoc6x/gBvami8weusmXHD4N+yZJfVIrk2o8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.155.8 with SMTP id c8mr989037wfe.1.1244732117572; Thu, 11 
	Jun 2009 07:55:17 -0700 (PDT)
In-Reply-To: <878wjzoyam.wl%peter@chubb.wattle.id.au>
References: <87k53jiiqe.wl%peter@chubb.wattle.id.au>
	<4A307A57.2040908@mvista.com> <4A307A97.8030804@mvista.com>
	<878wjzoyam.wl%peter@chubb.wattle.id.au>
Date: Thu, 11 Jun 2009 07:55:17 -0700
X-Google-Sender-Auth: 64145b74f2918030
Message-ID: <b6ebd0a50906110755x6dc978f4w49524f3e1bce02d0@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: How do I modifly kernel config?
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
X-List-Received-Date: Thu, 11 Jun 2009 15:05:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2009 at 3:33 AM, Peter Chubb<peter.chubb@nicta.com.au> wrot=
e:
>>>>>> "Christopher" =3D=3D Christopher Larson <clarson@mvista.com> writes:
>
> Christopher> Christopher Larson wrote:
>>> Peter Chubb wrote:
>>>> Hi, Is there an easy way to make a recipe that builds a kernel
>>>> with a different .config ? =C2=A0I know I can copy an entire recipe
>>>> with my own file://defconfig --- but is that the best way to
>>>> proceed?
>>>
>>> FILESPATHBASE =3D. "${TOPDIR}/files"
>
> Christopher> Erm, make that FILESPATHBASE =3D. "${TOPDIR}/files:". =C2=A0=
It's
> Christopher> colon separated.
>
> Thanks, but where do I put this? =C2=A0In build/conf/local.conf? =C2=A0or
> somewhere else? (because it seems to be being ignored for me)

Local.conf is fine, yes.  It's unlikely that it's actually being
ignored, though.  Run a bitbake -e|grep FILESPATH=3D, and see what it's
set to.  Note that it will only list the items in the search path that
actually exist, so ensure you mkdir the ${TOPDIR}/files directory
referred to there.  Also note that the default TOPDIR is $PWD, which
is where you're building from, which is most commonly your build
directory.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


