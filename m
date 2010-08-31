Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqOwF-0003Vk-Le
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 13:23:43 +0200
Received: by iwn2 with SMTP id 2so5645430iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3leRPVfYRloIyxVWgDJCPlB2ny7bZwKkdcD20cRC0sE=;
	b=jcQPOjSAhBdNxWiGxX6/G4ikMpI/HX45ZLc+cLj+0e6w/EfEfmnfnsOyO+d4KswFaR
	ojwevh9MTNizLhoZAPmcrc0vmIeew1Rd3yPXIGj4mUSO/CON0DT+C8hOYDUlhmzzVOpA
	ljrUn2C+BYrGX7Hc3fzme1gsVDT7jIEcIQKnE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kT1o1JYS0R/QWOitdvZrzYxO71jwCv47aP6zqFgs+5WyYF7Tq6pFzhCYWjlrL/jQgi
	CD7UX5zMKAYWvl5Ux76gEmHoURIxxuRsn7Cdv/I4PL8UIHrBdqft/7KgzHDzgD5CJ2Bo
	XbzrSee2SbGsiYnoCoHaeYH3WyNfZsnOKgzHg=
MIME-Version: 1.0
Received: by 10.231.17.1 with SMTP id q1mr6845085iba.17.1283253786035; Tue, 31
	Aug 2010 04:23:06 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 31 Aug 2010 04:23:05 -0700 (PDT)
In-Reply-To: <AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
Date: Tue, 31 Aug 2010 13:23:05 +0200
Message-ID: <AANLkTi=+NSsc0NA2_vRXbG4UEdu9sFzWfYBkLtz79s_9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Tue, 31 Aug 2010 11:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/31 Cliff Brake <cliff.brake@gmail.com>:
> sending again as it appears the last email did not make it ...

Cliff, thanks for resending.
It indeed didn't make it or I overlooked it.

I'm planning to set up a build for neek (nios2) /minimal/console-image
(and/or nios2/angstrom/console-image) or our autobuilder, but didn't
get to it.
Also I might see if I can set up a build for ipx4xx (probably using
nslu2 as target) and console-image + cairo + pango (which drags in
lots of other stuff.

Frans
>
>
> ---------- Forwarded message ----------
> From: Cliff Brake <cliff.brake@gmail.com>
> Date: Mon, Aug 30, 2010 at 11:51 AM
> Subject: testing branch 2010-08-30
> To: openembedded-devel@lists.openembedded.org
>
>
> Hello,
>
> Last weeks testing cycle was a good success I think -- thanks to all
> who participated.
>
> http://wiki.openembedded.net/index.php/Testing
>
> I have tagged the branch with an annotated tag that includes what built:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtesting_2010=
-08-23
>
> It seems like we are getting good coverage of target machines,
> distros, and host machines. =A0I would like to add a target to get some
> coverage of Qt x11 and Qt embedded.
>
> Ideas on how to make this better are appreciated.
>
> One change from last week -- I renamed the testing-testing branch to
> testing-next as I think that is a little more descriptive.
>
> The testing-next branch has been updated for the next testing cycle,
> and is ready for builds. =A0Please see
> http://wiki.openembedded.net/index.php/Testing if you would like to
> contribute tested combinations.
>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


