Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C19466E8DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:04:02 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id oy12so14085254veb.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pRMgOkk4FHJuNzpQnhx7fczOGp3paJcPdMv9zJjoZRE=;
	b=Zc/9tf7TqqhkyblBBIVgh+Klsrpkk+EuHXVOG3bX5P+ze13ie5g1bB5Jq78SqAoaw9
	7Ejh67EPvL3eBShQ+bc8RIBBXtowGjPvC+RXe+uO0LHr7y5YxI1ZntaMQEwCs4+K0LrF
	2God0b1T5/8ev8TXVJVl+uIu42HOIDOBO6OXraBkKz6a2y1VkqtpjwVWfSkFPqM47t8U
	0BXhk7vlBTSSSpqzFx5PhTu0+J745Qfxy2z7DSI9Kqj4lWZrqOyuPbU7Eo7DxgQ3Dify
	uD18ILOqskgrmpOg6bdB81JenZHvEYbCuFXJXU3+ixgShnHBwv5Dz85aLFzHfbOq6nUg
	xv0g==
MIME-Version: 1.0
X-Received: by 10.220.114.135 with SMTP id e7mr6929966vcq.39.1392757443088;
	Tue, 18 Feb 2014 13:04:03 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Tue, 18 Feb 2014 13:04:03 -0800 (PST)
In-Reply-To: <ldv30v$jfq$1@ger.gmane.org>
References: <CAFeBWL67tUiY5BZ6Fp6dz5H00Y=smW+fvdS6dzz3A0scqaysuQ@mail.gmail.com>
	<ldv30v$jfq$1@ger.gmane.org>
Date: Tue, 18 Feb 2014 13:04:03 -0800
Message-ID: <CAFeBWL5yPS71acwdJy9v7SNwC4wpi7dDGXRHFB+AZXYSQ4Jcow@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: pam_gnome_keyring.so not getting packaged into my rootfs
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
X-List-Received-Date: Tue, 18 Feb 2014 21:04:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Great, it worked :)

Thanks Koen,

Adam


On Mon, Feb 17, 2014 at 11:47 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Adam Lee schreef op 18-02-14 00:00:
> > Hello everyone, my gdm logs in /var/log/gdm is complaining about these
> > missing files:
> >
> > - polkit-gnome-authentication-agent-1 - ck-get-x11-display-device -
> > pam_gnome_keyring.so
> >
> > The first two files are found in paths GDM wasn't aware of, so all I had
> > to do was create symbolic links to
> > /usr/lib/gdm/{polkit-gnome-authentication-agent-1,
> > ck-get-x11-display-device}.
> >
> > The last file, pam_gnome_keyring.so, is not in my rootfs. The file gets
> > generated and it's in my build directory however. I can create a
> > bbappend to install this shared object into the rootfs, but I wanted to
> > ask in the list to see if I missed something obvious.
>
> Give http://patches.openembedded.org/patch/66793/ a try
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTAw/5MkyGM64RGpERAkDGAKCyFB1qqElkH2gRAtSL/578jYFa5gCgl7hE
> Z9hpU5nZuPs+VJcYxDpVKNU=
> =2Bsi
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

