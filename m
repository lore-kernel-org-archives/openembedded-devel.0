Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OZmsF-00004y-CD
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 17:31:12 +0200
Received: by pxi12 with SMTP id 12so1124468pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=3LsAUnj5SFOX09zzGn5KzvzCGBVAuHxcak6We+WZT1M=;
	b=jsVsZRueFUvJH0/lL5JcvfmYhrYK+bA5OFoodbYJwYStCVQqYJDwyU/D/WkXFHa0CG
	5YHkxkbdE82wnUfUbo/dpMkb+mrc3+wRmBdPMuGIDrjWONQ2itjnIGEMUShzkebts8AL
	FCEK8uClZ39MDUw5G9fwLgeCS5r82ZbE30PtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ai8MDlxjKIr1pQCuE1bi9PRFwjHobyfcoF6EQZ5E2QT3Y0oOzIyhir56m3y7GjGC9i
	zlQPtk+dFja43UpFtOEG8uSsdaIKOg0rmEv8cmhyzGcmabeU1nytKk3C00a41kPItSjy
	Lyi/QBcJknTc0oqTdeosBZBOODk+ZyC+oktFg=
MIME-Version: 1.0
Received: by 10.142.180.1 with SMTP id c1mr1640804wff.265.1279294228722; Fri, 
	16 Jul 2010 08:30:28 -0700 (PDT)
Received: by 10.229.220.205 with HTTP; Fri, 16 Jul 2010 08:30:28 -0700 (PDT)
In-Reply-To: <201007150908.20262.marcin@juszkiewicz.com.pl>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
	<1278963950-2587-7-git-send-email-aalonso00@gmail.com>
	<201007150908.20262.marcin@juszkiewicz.com.pl>
Date: Fri, 16 Jul 2010 10:30:28 -0500
Message-ID: <AANLkTilKMyyPE-OS357lmDhuxzZ29B9-vOj5T-uaEWuW@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 7/9] xserver-kdrive-common: xilinx virtex5 support
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
X-List-Received-Date: Fri, 16 Jul 2010 15:31:12 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

I'm not sure how to do it,
I'm testing x11-sato-image, which includes xserver-kdrive-common and Xserve=
r
whit the proposed patchs I add support for the target that I'm interested;
and bay the way it doesn't include `sato desktop` it end ups with a basic
`gpe desktop`
I guess that I need to look at x11-sato-image to include
xserver-common instead of what
right now is included and remove gpe dependencies to include sato desktop.

Regards

On Thu, Jul 15, 2010 at 2:08 AM, Marcin Juszkiewicz <
marcin@juszkiewicz.com.pl> wrote:

> Dnia poniedzia=B3ek, 12 lipca 2010 o 21:45:48 Adrian Alonso napisa=B3(a):
> >  .../xserver-kdrive-common/Xserver                  |   11 ++++++++++-
> >  .../xserver-kdrive-common_0.1.bb                   |    2 +-
> >  2 files changed, 11 insertions(+), 2 deletio
>
> Can it finally die in favour or xserver-common 1.30?
>
> Regards,
> --
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com

