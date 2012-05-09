Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1SS1ST-0004UA-Ie
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 09:37:13 +0200
Received: by obhx4 with SMTP id x4so12136584obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 00:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cMyv2udYOBZuLxk2wvJIxSyGW6MZGVsSPhiwMPUKET0=;
	b=R8xb3pVMzpmFQBHTIW/nMyqLflec8fcuYOVXwMzhTIaamQ/0fwlcWPQFbeXsi2rbp6
	79yH7PwbBYdSdAf9sHqOdXtO18q+3FRWyddFonwWHhuGnjUYzwygNSFtclz3g2Z1fGCA
	FSJwXN0RXl0FyzY1dYc350jnCEkmzHN55WeMEOYigF/Fp3qeS8slrkmcHLsNPB8KZJgJ
	fmOT9vRNf30qKzcQZogJndBBQMA25b1uZQIK6qQd0AVss/aNGrTErGpsUWEY5odww1zQ
	w5gtHQQhkM7PtqnvhDWJHvF/sqAJFtGU5PITSaSBx5U+tOQ2Qo9H7PVdhy8/k4a7j2Gg
	KIlg==
MIME-Version: 1.0
Received: by 10.60.2.226 with SMTP id 2mr4299277oex.68.1336548440333; Wed, 09
	May 2012 00:27:20 -0700 (PDT)
Sender: dasty82@gmail.com
Received: by 10.76.92.66 with HTTP; Wed, 9 May 2012 00:27:20 -0700 (PDT)
In-Reply-To: <4FA990CE.2060502@emagii.com>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com>
	<1336394035.3417.12.camel@dasty-laptop>
	<4FA990CE.2060502@emagii.com>
Date: Wed, 9 May 2012 09:27:20 +0200
X-Google-Sender-Auth: i6eHL9uf7JtK-rpzpTTUUrW3SjI
Message-ID: <CAOpW-VDe6XQXsRE=o_UCh=vW0-J+nSu5=rmTU+Tw2EMtjxafFA@mail.gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Wed, 09 May 2012 07:37:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> Fixing the packages, is probably the way to go.
> You could also create pseudo package "D" which is available in several
> versions.
>
> Package D-1.0c: =A0 =A0 =A0Package D is depending on nothing
> Package D-1.0bc: =A0 =A0Package D is depending on B
>
> Package C is always dependent on Package D and A.
> Package B is always dependent on Package A
>
> If you set PREFERRED_VERSION_D =3D "1.0c"
> C is depending on D, which is depending on nothing, and C is depending on=
 A.
> No problem, A and C is built.
>
> If you set PREFERRED_VERSION_D =3D "1.0c"
> C is depending on D, which is depending on B. =A0B and C is depending on =
A.
> A is built, then B is built, and then D finalizing with C.
>
> If you only want B, don't include C in the image.
>
> Not tested, but it looks like it would work.

Thank you for very inspirational suggestion. This may actually work. I was
already considering using distro features for defining which recipes should
be included and than making chain of dependency based on them.

Also as Ciprian suggested putting everything into one recipe and building
multiple packages may be the way to go.

Thank you both for good suggestions!

Radek


