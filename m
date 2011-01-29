Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pj5eK-0007ft-EA
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 08:55:12 +0100
Received: by vws6 with SMTP id 6so1420066vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 23:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=wG1/Q0lfC0AcLYo1C1fwId43mj18i7qz8O0AkIZ+LOg=;
	b=ERKGxB4Fi10twHm2okH8O0oC8FISDDzegNMoAGGXgZRRIDMDjT28/QEMj/Nirr3HHe
	MrW5g4n6bBu8XcRuYcouiV0o7tZiKCQPcGm5eRlau4y4F23fk2yemfix+YOT/bx+7F/f
	mLXDHcw/jujWINR+khIKV7gGkSy4WONuVUGws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nLyfhokQiieBUVG4tC2YEsZPIXEXIQ4T6+nvI8o+wlNSXlehIzQdGHAFA6z1LSFzrQ
	MTusbwOlH+xbqytBdStJ1L/ziFOhEwIUizri0JaNjyGiTpj9Wcn0PHNb9LGY2m2xLEDD
	/TFKn9pnJH3NL5oVlk2KSMT3fGjYXsRAR5mPY=
MIME-Version: 1.0
Received: by 10.220.198.196 with SMTP id ep4mr909339vcb.110.1296287657402;
	Fri, 28 Jan 2011 23:54:17 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Fri, 28 Jan 2011 23:54:17 -0800 (PST)
In-Reply-To: <AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
Date: Sat, 29 Jan 2011 08:54:17 +0100
Message-ID: <AANLkTinpfzM4xu7HfVN=sF3dTU_b5-ajzyoW9S1DqSzF@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Sat, 29 Jan 2011 07:55:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 28, 2011 at 6:50 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> what xserver is chosen is s distro choice do not lock it here.


I do not agree. What if the machine is tested to work with particular
xserver and with other one have  some issues? Then this could be the right
place.

> +
> > +PREFERRED_VERSION_linux = "2.6.35"
>
> kernel should not be pinned in conf file but in the kernel recipe itself
> you should add PREFERRRED_PROVIDER_yourmacine = ...
>

I will remove this.


> > +
> > +MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget touchscreen
> keyboard"
> > +
> > +GUI_MACHINE_CLASS = "bigscreen"
> > +XSERVER ?= "xserver-xorg \
> > +           xf86-input-tslib \
> > +           xf86-input-evdev \
> > +           xf86-input-mouse \
> > +           xf86-input-keyboard \
> > +           xf86-video-fbdev \
> > +"
>
> this two defines should be part of distros to pin not machines.
>

Machine should know what features if have. Because for distros it is
impossible to know what are the hw capabilities of particular machine i
think.


Thanks

Best regards,
marek
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

