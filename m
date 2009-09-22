Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1Mq59k-000324-BT
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 15:11:47 +0200
Received: by ey-out-1920.google.com with SMTP id 5so771493eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=j26S73Bn5dqA92USz8tOuaVVoPfJHV6UhQVK+q0JDK8=;
	b=flNegOkz0sTaTOI20kvgX8Kovhk+g4nIbzhb8ilCxTceFgGuFBifvTaI0fNhr4ZE6t
	lN8H/Ro9IopMlraTpCBHuy3xg7LIlaCPyYWVgB9Hz23pKUCxMKcKEjvkmJaRd62hW+S6
	O6gXgBEgCMe96YLYlKVpOgwSbXQXpE4HNA668=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=T2mZawPOeql5c7JJ491dvbh30FAzsqLgwtyDvrpHMD4eg18QR20HJG4jNQxa8MTlzv
	b6S2/cV6LgADOzjv4xIHKMhAHkZfiuIXVId7vhnya+Yn9mTSoP2F94jsjKYoKUF7W9GX
	ccvUdHCgujJfsz+Rj2rGkyf9BPvKF5ccgrlRw=
MIME-Version: 1.0
Received: by 10.216.51.143 with SMTP id b15mr230489wec.89.1253625068851; Tue, 
	22 Sep 2009 06:11:08 -0700 (PDT)
In-Reply-To: <200909212005.31498.mok@mnet-online.de>
References: <200908021211.14793.mok@mnet-online.de>
	<359c5480908040048t54ac4adbsa6a4e4fa88b7557f@mail.gmail.com>
	<359c5480909211003p49f636e9p38889c4967b2acc4@mail.gmail.com>
	<200909212005.31498.mok@mnet-online.de>
Date: Tue, 22 Sep 2009 15:11:08 +0200
Message-ID: <359c5480909220611m64f169a1g6c833a0a82d9a38b@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org, shr-devel@lists.shr-project.org
Subject: Re: [Shr-Devel] some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Tue, 22 Sep 2009 13:11:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 21, 2009 at 8:05 PM, Klaus 'mrmoku' Kurzmann
<mok@mnet-online.de> wrote:
[...]
> The reason is that some package that is needed by one of the tasks did not get
> built. As a consequence that task does not get included into the image. I
> don't remember which package it was for me, but manually building the package,
> properly cleaning the tasks and rebuilding fixed it. What annoys me is that OE
> continues to build the image instead of bailing out...
>
> If this is the reason you will have some ERROR somewhere in the rootfs log.
> Probably only on the first build though (at least that was my impression).

Hi Klaus, thanks for the answer

My build from scratch finished, I found in rootfs log an error about
fso-abyss, so rebuilt it and removed staging/all/task-shr*, rebitbaked
shr-image, I do not know if this is the way you suggested.

Anyway it boots but at some point I get:

...
Configuring ...
Configuring ...
Removing old /usr/share/gpe/pixmaps ...
Press enter to continue

Usb0 is up but no dropbear and the boot does not proceed.

On the second forced boot I lost usb networking completely (no such
device), and the configure phase terminated again with "Press enter to
continue".

Finally did a git pull, and now I have problem on libxxf86dga, so
rebuilding again from scratch, hoping your last commit on fso-abyss
depends fixed all.

Regards

    Nicola


