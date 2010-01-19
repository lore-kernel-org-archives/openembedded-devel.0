Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NXE5P-0004OE-QP
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 14:25:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 9194A2C820
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 13:20:25 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORyedOIDyTRw
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 13:20:21 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 1F0352C7D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 13:20:20 +0000 (UTC)
Message-ID: <4B55B26C.5040706@gmail.com>
Date: Tue, 19 Jan 2010 14:23:56 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B54F654.4000500@atmel.com>
In-Reply-To: <4B54F654.4000500@atmel.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom: x11-gpe-image : Calibration of Screen ?
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
X-List-Received-Date: Tue, 19 Jan 2010 13:25:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ulf Samuelsson ha scritto, Il 19/01/2010 01:01:
> This was discussed early autumn and apparently there was a conflict
> between different libraries + X Windows versions, so it could not be do=
ne.
>=20
> Any news here?
>=20

No (really good) news,
but I'm currently working on this.
I tried to enable touchscreen calibration without success.

I built Xorg version Xorg-1.7.3 configured with --enable-xcalibrate
but I didn't get this extension in my Xorg, so when I try to call xtscal
I always get this error:
 # xtscal
 XCALIBRATE extension missing: Success

I debugged a bit the following packages: xtscal_0.6.3,
libxcalibrate_git, libxext_1.1.1

Temporary conclusion is that xtscal is no longer usable because the
xcalibrate extension is only implemented for kdrive.
Possible options are to use kdrive (hopefully not) or find another way
to calibrate our touchscreen.
I am working on a new way to calibrate the screen in the xorg (not
kdrive) way.

Any hints or help would be greatly appreciated.

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com




