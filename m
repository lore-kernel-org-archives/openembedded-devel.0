Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id AF4516D76F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:40:53 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id my13so179631bkb.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 00:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=z6h/YnwrtiXqBF0sJzFxDeKceYU7M1z8pNelbKWOxpA=;
	b=Ygi2IrZzxcTNV3yGMtKpm1rwcI6vscijjoAhDzQVzARhCuFt+m4r4jdJsFKCKlpwlr
	Sdij82ETU2UFqdNFizoNygSAYv3lhlQ404W63e4wlUlrv5gQ10j+I+9pogKTyTAsae54
	XyypXYImsf5J0CQSrcBxsjoWod3zKoFOSHVveHMl3Z+nSKKE0dJIs3ZZWKNsDSqs+2BL
	pxe0qNaRaofan/kS/uh+ahLDJD74GyCrzDEym+5OWJK3JmsRlnnt28L4wh1OgAzRLNWQ
	rOEahS3VYm5pKzfDzsT1b8W/FRqmlKIeUmQZNEiBu4+krKex8cNE6XEZmuOE3snkZWgA
	S0YQ==
X-Gm-Message-State: ALoCoQnUo3ZdgMCVejkvHngji6TKo97ub9XEezn5v91P5FGwlN0qSQlcDBsgyrEfn4EMnS8Aq/u9
X-Received: by 10.205.71.193 with SMTP id yl1mr437684bkb.45.1385023252440;
	Thu, 21 Nov 2013 00:40:52 -0800 (PST)
Received: from iMac.local ([2001:610:612:0:5883:6093:ff12:ee4b])
	by mx.google.com with ESMTPSA id m1sm22100751bkr.10.2013.11.21.00.40.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Nov 2013 00:40:50 -0800 (PST)
Message-ID: <528DC845.9040408@dominion.thruhere.net>
Date: Thu, 21 Nov 2013 09:45:57 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
In-Reply-To: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: making qt5 package machine specific
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 08:40:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nicolas Dechesne schreef op 21-11-13 09:33:
> hi,
> 
> we are building a product/distro with qt5 with support for various SoC.
> the way qt5 recipes are designed, it kind of forces the resulting
> packages to be  <machine> specific, not <arch> specific.
> 
> first each <machine> has a different provider for GL/GLES and it impacts 
> the RDEPENDS, on top of that we have machine specific patches in Qt5 in 
> each of our BSP layer, whether we like it or not, that's a reality that
> we cannot have the very same Qt5 config + source code for all platforms.
> 
> so we end up with many  <qt pkgs>-<arch> which are <machine> specific,
> not <arch>, and it messes up badly with sstate for example, especially
> when cleaning up the sstate (e.g. using sstate-cache-management -d).
> 
> so i have a couple of questions:
> 
> - are we doing something really wrong here? or are we getting issues
> that anyone would get when trying to have a OE based product with Qt5
> and multiple machines from the same <arch>?

You are getting issues that anyone with machine specific libs (e.g. GLES,
clutter, wayland) gets in a multimachine scenario :(

> - assuming this is a typical use case... i wish there was an easy 
> mechanism to 'mark' all Qt5 packages as PACKAGE_ARCH =
> "${MACHINE_ARCH}", without having to .bbappend every single recipe. It is
> indeed quite common to have a .bbappend for qtbase, but not for the other
> packages...

No idea on that, sorry.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD4DBQFSjchFMkyGM64RGpERAkVvAJjvUEaYUnLHT9Y0akrxXC/fmj+NAJ4sFyr9
0JdnxMHb7/3P4JZoIEwmew==
=hr2K
-----END PGP SIGNATURE-----

