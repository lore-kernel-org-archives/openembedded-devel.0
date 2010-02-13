Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NgJel-000752-Ow
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 16:11:42 +0100
Received: by fxm26 with SMTP id 26so3449038fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 07:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7siyc4cKC8hs/CNOiBJJVsElO365BYxeyO9FIZ/3ufI=;
	b=xGsXbXWDV3BNFffgD6kDRCPKXBbRlyss2krXAby2WJSoniLHC0diYZ2ST+I9j+rYfR
	Gn0rJJhi3r8rorHFA3cUXEFKf0a+pC7EHgAuL27Zwd4euWHauO3v08VXHSgof6DrPd6H
	sd7K6JLQBr8RiLpMBwP0jC1h4WiRSquv6ti40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MKFrcfLH8FD+v17WRXmYJ6q3tUHq/135OwTZfadiPELxKWMctjEQrtbXHB6GC6O1bQ
	rCfDkJzwIXjFBqAsOI3WHeYZFOy++nJDR3XU4w/1Gl6PJ0m6KQWxYlky4a2qjV4w3lFR
	mhxystdxamdZWjAZU4rK0kQ4+hHCbkDeuyatk=
MIME-Version: 1.0
Received: by 10.223.15.21 with SMTP id i21mr1402886faa.58.1266073743702; Sat, 
	13 Feb 2010 07:09:03 -0800 (PST)
In-Reply-To: <20100213122301.GD5364@jama>
References: <ade1bdc1002130107q6e83bca2sd57391ca539ef6a4@mail.gmail.com>
	<1266053054.4218.3.camel@mattotaupa>
	<ade1bdc1002130211o51733308vc79df05ee449cb0d@mail.gmail.com>
	<20100213122301.GD5364@jama>
Date: Sat, 13 Feb 2010 16:09:03 +0100
Message-ID: <ade1bdc1002130709y151ea4d1o27f587d67a06ba3a@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: git and ssh and kernel development
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
X-List-Received-Date: Sat, 13 Feb 2010 15:11:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear Martin,
thx for comprehension.

Sometimes, for lack of experience, I ask something ...
My Linux embedded experience is quite well, I suppose, but, in OE and
so on, is very small.
I'm improving it.

>
> If you're asking what to put in SRC_URI in recipe it doesn't look stupid
> to me :).

yes, this is the point.


> I don't know how to use git+ssh in bitbake (especially with password), I
> would expect something like
> SRC_URI=3D"git://user@ipaddress/pathtogit;protocol=3Dssh;branch=3Dmaster"
> but you've to check if that's supported at least with key
> authentization"

I'll it with keygen. I had a problem to do it, but I'll fix it.

>
> 2nd question is easier
> SRC_URI =3D "file:///home/projects/pathtogit/secretProject"
> and you would probably need to adjust S variable too
> S =3D "${WORKDIR}/secretProject"

SRC_URI =3D "file:///app/opt/sources/linux-2.6-bt270"

NOTE: Unpacking ..
It's running.

>
>
> And you don't want to commit either version to public OE repo, right?

This project can be maybe free, but first is better if I ask to my company.

>
> Regards,
>
> --
> uin:136542059 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0jid:Martin.Jansa@gmail.com
> Jansa Martin =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sip:jamasip@voip.wengo.fr
> JaMa
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thx.


--=20
www.opensurf.it


