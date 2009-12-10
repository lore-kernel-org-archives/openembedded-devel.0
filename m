Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NIkZC-0004ne-6M
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 16:04:33 +0100
Received: by pwi18 with SMTP id 18so517476pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to:cc
	:content-type; bh=ZTIVRaBYhNd0cn3BuSXVZ7rNpU60P1Sxxk9u5Bt4J0o=;
	b=S50v3JND8RU9qaQSvab04jI4OjPprGQKCUnWH0+Y/qU+ClN8W93ysdB/6Pvm/+jRDw
	SuVIljW1BbC1PfIC523JjDKj2Ci0IpPl8FDnXqSvw2NTwFbq2IeyyTupkxrkteOH9THU
	Ec4Lq5zl0A69NCbs8Nosiv04iu+KOb84PlodQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=j4gsOf3COzvHYvZQkEs2pRdHRN0QLQzNK4W0VrCnHp3Wvo0o2skrGgXD7Nq5LdEG/D
	Weav8bOyqs5faVSpXlmJizBpHIcZtUVOvvUkPTMN3J12caBz/W9PKA81iovCLP6A3nZL
	v7Z/3BNuY9kLsG62QID3sFFYA0soCOb0lvPRE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.21.30 with SMTP id y30mr2775wfi.229.1260457367214; Thu, 10 
	Dec 2009 07:02:47 -0800 (PST)
In-Reply-To: <BAY127-W19F38E3292656B84EAB3A3D88D0@phx.gbl>
References: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>
	<4B1E7699.7000004@mlbassoc.com> 
	<b6ebd0a50912080821r295faf03rd8b4159561a497c6@mail.gmail.com> 
	<BAY127-W19F38E3292656B84EAB3A3D88D0@phx.gbl>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Dec 2009 08:02:27 -0700
X-Google-Sender-Auth: 9ed803a6e920ee16
Message-ID: <b6ebd0a50912100702s63a6db1lc3ce936f15ce0ad1@mail.gmail.com>
To: saleh usman <salehusman@hotmail.com>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Thu, 10 Dec 2009 15:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

If that's a copy/pasted line, you're referencing an 'oe' variable, likely
set in your environment?  Is it exported?  Did you add it to the bitbake
environment whitelist?  Run bitbake -e | grep \^BBFILES, and see what it
*really* ends up set to.

On Thu, Dec 10, 2009 at 8:00 AM, saleh usman <salehusman@hotmail.com> wrote=
:

>  I've set BBFILES in the local.conf file as
>  *BBFILES =3D "${oe}/openembedded/recipes/images/helloworld-image.bb"
> *where *oe *is directory in which openembedded is placed. I've also tried
> helloworld-image.But it returned same messages.
>
> I am just following the isntructions of *Getting Started* page and using =
*
> helloworld-image* given in the openembedded/recipes/images directory.
>
>
> Terminal window was like this
>
>
> [saleh@localhost build]$ bitbake helloworld-image
>
>
> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> ERROR: Nothing PROVIDES 'helloworld-image'
>
>
> ------------------------------
> From: clarson@kergoth.com
> Date: Tue, 8 Dec 2009 09:21:04 -0700
> Subject: Re: [oe] Problem using "bitbake"
> To: openembedded-devel@lists.openembedded.org
> CC: salehusman@hotmail.com
>
>
>
>
> On Tue, Dec 8, 2009 at 8:54 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
> On 12/08/2009 08:49 AM, saleh usman wrote:
>
>
> Hello
>
> I am trying to build   "helloworld_image"  given in openembedded
> recipes/images directory but the following error is occuring. Please help=
 me
> in diagnosing the pr0blem and moving forward.
>
>
> [saleh@localhost build]$ bitbake helloworld_image
>
> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> ERROR: Nothing PROVIDES 'helloword_image'
>
>
> Try 'bitbake helloworld-image' (dash, not underscore)
>
>
> The 0 cached, 0 parsed, 0 skipped, 0 masked from the parse implies that
> BBFILES was not set correctly, or at all.
> --
> Chris Larson
> clarson at kergoth dot com
> clarson at mvista dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Software Engineer
> MontaVista Software, Inc.
>
> ------------------------------
> Keep your friends updated=E2=80=94 even when you=E2=80=99re not signed in=
.<http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/=
social-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_5:0=
92010>
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

