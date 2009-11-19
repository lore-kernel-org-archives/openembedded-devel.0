Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ahsan.khwaja@gmail.com>) id 1NB72K-0004ms-GO
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:27:03 +0100
Received: by pwj11 with SMTP id 11so1388581pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 05:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=XeWAb44UovuJgfDYZd8yvQv7TrihCTXYqetbIPhL85o=;
	b=QPQR0W5cbH+3jBDoMu3KWkHNsus0cRRwdbN8d0vLmXcOAHJDNXQeO/GumYfXqdMhQ4
	ZH02ULLsR7hcDHs6QbUyd33o7Jn/0qKDQBbliWZUjxmawIhKflKY8VQHYWYI/BPt3kVP
	XbX35EWRDUC3FTT18wRUNWA7aSfeAKUMBIEaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pl/rDJcyA8fYHAgLAPcQvS8nc82r7ibiGjitBV2pIH6Tm/xUV3HionlulGKJ6jQ9lS
	N5Keyxj0vWfuW+LR2g0Xo6Sewh/PB9QLFE4RPPIe2YQzRecF3xFPjjScYoLZEkU17rjC
	PrtyPavww3/IUPl6uGQ/Rnp33rvEDNYjs0U4w=
MIME-Version: 1.0
Received: by 10.114.29.14 with SMTP id c14mr8078401wac.111.1258637134771; Thu, 
	19 Nov 2009 05:25:34 -0800 (PST)
In-Reply-To: <200911191422.43470.marcin@juszkiewicz.com.pl>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
	<200911191422.43470.marcin@juszkiewicz.com.pl>
Date: Thu, 19 Nov 2009 18:25:34 +0500
Message-ID: <818ccfc40911190525g7aa33d4dkee8028bbfeb253cb@mail.gmail.com>
From: Ahsan Khawaja <ahsan.khwaja@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: ahsan.khwaja@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Thu, 19 Nov 2009 13:27:04 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

build my development system on Ubuntu 9.04 and found no problem.

On Thu, Nov 19, 2009 at 6:22 PM, Marcin Juszkiewicz <
marcin@juszkiewicz.com.pl> wrote:

> Dnia czwartek, 19 listopada 2009 o 14:06:43 Hodgson, Simon napisa=B3(a):
>
> > I'm setting up a new machine with Linux specifically to use for
> >  OpenEmbedded development. Which Linux distro should I go with?
> >
> > I'm looking to make it as easy as possible to get started, so ideally a=
ll
> >  the packages I need will be available from that distro's standard
> >  repositry.
> >
> > I've tried SuSE in the past and given up trying to get all of the
> required
> > tools installed, and more recently been using Debian, but the Python
> > version in Debian is a few versions behind and there was talk of OE soo=
n
> > requiring a more up to date version.
>
> OpenEmbedded require Python 2.4 or newer. Debian lenny (stable) and squee=
ze
> (testing) should work fine. I use 'sid' for development.
>
> > Ubuntu is a good candidate at the moment as I belive there won't be any
> > hardware issues with the laptop I want to use, but this wiki page
> suggests
> > there's some faffing to do
> > http://wiki.openembedded.net/index.php/Gcc_issues_in_Intrepid_and_later
> > which I'd like to avoid if possible - does anyone know if these issues
> are
> > present in the latest version 9.10?
>
> I use OpenEmbedded on Ubuntu 8.04 machine and Poky on 8.04/9.04/9.10
> without
> problems.
>
> So I suggest Debian 'testing' or Ubuntu 9.10/9.04 as a base.
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

