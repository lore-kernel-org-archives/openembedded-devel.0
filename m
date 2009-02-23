Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LbfTL-0004xZ-58
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Feb 2009 19:24:07 +0100
Received: by yx-out-1718.google.com with SMTP id 36so826666yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2009 10:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DaYa7KzK3zPNdNU+O7mIr7isjATfGAMS1sFM3me/bwA=;
	b=GGCT1iu0nYyQEX6tgnGz1vVDtuREnvgDGet5VsfD0607CGNFhJ496LPh1Zk2DmYCd/
	EtoW0Ox16PPHz6T0s551Wu2u492Rkf6FZy9kYIoiBGe19DxiGjFwwtSVfg6bkTPb3p19
	x6P+PVUKQVxkRoGKhkelmTjwtyXXHXw7civPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AaN8/5V1X+cE1idrQBV32FivfS1umkgXRXtAJUM3X9vJQxlUYPQk7UMTUD7nNxW/+x
	WErcvQCiPmCsLrx5RJ8+E0S+Bb4DB4WHcwKTzh1KvPc602UXWWbm4uEL+Zjz3SvUwO0u
	P/MEEIUUgGll37q01fRHaE1/5AhCpzXa9RIYI=
MIME-Version: 1.0
Received: by 10.231.15.130 with SMTP id k2mr6433303iba.3.1235413272209; Mon, 
	23 Feb 2009 10:21:12 -0800 (PST)
In-Reply-To: <1235412616.27962.20.camel@andromeda>
References: <1235412616.27962.20.camel@andromeda>
Date: Mon, 23 Feb 2009 10:21:12 -0800
Message-ID: <19c1b8a90902231021o38317627k7a82bc0f0eb7f00@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: mickey/sane-updates-and-defaults
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
X-List-Received-Date: Mon, 23 Feb 2009 18:24:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2009 at 10:10 AM, Michael 'Mickey' Lauer
<mlauer@vanille-media.de> wrote:
> Hi guys,
>
> I tried to build the minimal distro again after quite a while. I noticed
> we have a bunch of inconsistent default versions in our metadata, which
> we should fix asap. To layout one of several examples: hal 0.5.11 is the
> default which depends on a libvolumeid version which has
> DEFAULT_PREFERENCE =3D -1.
>
> =C3=85ngstr=C3=B6m users will probably not notice this, since they overri=
de a
> large bunch of settings, however I think it's very important to get our
> default set of versions right as well.
>
> To check our current state wrt. upstream sources I also removed my
> source dir and disabled all mirrors -- which resulted in a bunch of
> changed SRC_URIs and udpated versions as well.
>
> Since this touches some core files, I'd like you to take a look before I
> push.

Did you forget attachment

>
> Cheers,
>
> --
> :M:
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


