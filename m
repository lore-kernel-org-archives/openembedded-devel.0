Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1PndhM-00026I-OC
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 22:05:08 +0100
Received: by fxm17 with SMTP id 17so1851458fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 13:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=/3y60Pc6/5pRQlfUCTCNIqexnBYKuRRWzG9d2X7SXhQ=;
	b=kmt6ksgEXMT4NZ4smUfbgtPtOkuyJdvH2oyLkv819UnGGnkrUAQ8R6nF9xnTybWntb
	sM9U68k41sYyjWqDX8Hgm3d5dDpcDb3pliTdqmudOhG6B0jrFuTTb3Bvo16kXxbtAQhU
	P9TdT8I5smTaB7ihhjtOhPRaEnuoATyTayzWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=iclhPm1kl1SME51gszw9RhX+A/InrdvM6MwsN2yxPCzT+kA6BnNAr6eZGEC26f3mvb
	anl98M0NlG1A36Qx9VPYjk/5MUGeoK/O3Ak7pFZAAlUQjMjhOWNzAXpd41u8fXtxhGjK
	uB3EIXaflrVcg4wYxMMmAg7x0BwlwBKYRjcOA=
Received: by 10.223.95.203 with SMTP id e11mr19507856fan.60.1297371844246;
	Thu, 10 Feb 2011 13:04:04 -0800 (PST)
Received: from localhost (c-5fdbe555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.219.95])
	by mx.google.com with ESMTPS id y3sm25787fai.38.2011.02.10.13.04.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Feb 2011 13:04:03 -0800 (PST)
Date: Thu, 10 Feb 2011 23:06:02 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110210220602.GC11237@BoggieMan>
References: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTinDhX0fSSTNa9CuiFv7Ty_4D=5bOhvfHo8OgzQi@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinDhX0fSSTNa9CuiFv7Ty_4D=5bOhvfHo8OgzQi@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Thu, 10 Feb 2011 21:05:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 10, 2011 at 09:29:34AM -0800, Khem Raj wrote:
> On Wed, Feb 9, 2011 at 12:23 PM, Filip Zyzniewski
> <filip.zyzniewski@gmail.com> wrote:
> > We use the scsi subsystem for PCMCIA ATA access, so device files are
> > /dev/sda*, not /dev/hda*.
> > See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.
> 
> is this always going to be the case ? IOW what if someone does not use
> inux-jlime-jornada7xx-2.6.34+git recipe
> 

Yes, theres no advantage in using hdX for the j7xx and the vanilla
kernel should work fine unless using very old kernel which also has no advantage.
It will therefore work fine for vanilla users also.

> >
> > Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
> 
> 
> 
> > ---
> >  recipes/base-files/base-files/jornada7xx/fstab |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes/base-files/base-files/jornada7xx/fstab b/recipes/base-files/base-files/jornada7xx/fstab
> > index f0c23d9..a06a1b6 100644
> > --- a/recipes/base-files/base-files/jornada7xx/fstab
> > +++ b/recipes/base-files/base-files/jornada7xx/fstab
> > @@ -1,7 +1,7 @@
> >  proc           /proc   proc    defaults                0  0
> > -/dev/hda2       /       ext2    defaults                0  0
> > -/dev/hda1      /mnt/cf auto    defaults,sync,noauto    0  0
> > -/dev/hda3       none    swap    sw                      0  0
> > +/dev/sda2       /       ext2    defaults                0  0
> > +/dev/sda1      /mnt/cf auto    defaults,sync,noauto    0  0
> > +/dev/sda3       none    swap    sw                      0  0
> >  tmpfs          /var/volatiles  tmpfs   defaults                0  0
> >  tmpfs          /mnt/ram        tmpfs   defaults        0  0
> >  tmpfs                /dev/shm             tmpfs      mode=0777             0  0
> > --
> > 1.7.1
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >


