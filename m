Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PH2Au-0006BS-Vo
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 23:32:53 +0100
Received: by gwaa11 with SMTP id a11so2241010gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Rm+FmZSUbrEp24nvHhwR3/Kpb7zuKCQi8yVFw1PZUVI=;
	b=YU7WT8NFAPpGDY0hovGtuUGbrj9qQdGAy37N6bT0MkOhj1+Pj/aZuibXHKkJ7ggcGy
	sSmzPsgvUzzsTv1aJQW9ji34GvOCX1MRMcJmva8zRQhr27IanncUK4wTnpx/vuN1VKZu
	w0jCMLzFeyWusR9Apxne4ghpl4KYZXsepnKnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=CLPhsKN2GZuLUEhoLXPtDyF+iKyApO6q5MuOf+ZQOXQk2eGv1cmxjJtoLQ2lRjJ2hX
	s+KYraKtkpDFO9K+jFpXlAa0GysesOofLykkOPtYMux2eVv+O4hN9uDjZLcT0bGwK2F9
	HfIZ7rN8FxurJxGA4f5JVo1kZMS9K+dqxzdaU=
Received: by 10.91.12.18 with SMTP id p18mr3936281agi.48.1289601111072; Fri,
	12 Nov 2010 14:31:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 12 Nov 2010 14:31:30 -0800 (PST)
In-Reply-To: <4CDDB992.7000603@crhc.illinois.edu>
References: <4CDDB992.7000603@crhc.illinois.edu>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2010 14:31:30 -0800
Message-ID: <AANLkTikdSDT0+JSSgSEeHrWFC3n6Km0GMuX2umS3OgNu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-4.5 r166342 PCHFLAGS problem
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
X-List-Received-Date: Fri, 12 Nov 2010 22:32:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2010 at 2:02 PM, Matt Johnson
<johnso87@crhc.illinois.edu> wrote:
> Hi All,
> =C2=A0 =C2=A0I built gcc-cross from x86_64 host to armv7a target using gc=
c 4.5
> r166342. =C2=A0I then tried to bitbake gcc (an armv7a-host, armv7a-target=
 native
> compiler) with the same revision and got build errors on libstdc++:
>

hmmm I dont see these issues here. I am using latest gcc in OE and
minimal distro with libtool 2.4 which is same like angstrom-2010
I wonder if there are some header files extra somewhere on your host
system that are interfering libstdc++ configure.
what OS do u run on the build machine.

-Khem


