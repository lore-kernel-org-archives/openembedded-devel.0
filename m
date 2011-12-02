Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chris.watkins88@gmail.com>) id 1RWKs0-0001CL-A7
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 05:37:08 +0100
Received: by vbbfc21 with SMTP id fc21so2077106vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 20:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=t45f5eyWcxYZC/VJVPRWNvUOq34s65S9ZHcpBUywVcU=;
	b=A8zptJPC00ZR+2bccuPcQEdaTuy2rjrtZMDTXRKaDmZxHmFNGuXEd4dnn55K2VAAWf
	18rL/uZRIj2NHpzkjqtNIrkLhmYjQJ1UpFoL9bsnV5vlbYea9GBtVTSrO/NgF9Rqa92d
	1nYcpiOrgrLaL7AeBJxkKzsGFFQ+10UkonWQc=
Received: by 10.52.65.176 with SMTP id y16mr8496123vds.53.1322800225247; Thu,
	01 Dec 2011 20:30:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.52.107.33 with HTTP; Thu, 1 Dec 2011 20:30:04 -0800 (PST)
In-Reply-To: <CAMKF1srkBd=jusV1SBcHHwtvZkDJoL=h=Y_a8ERERabtFtTzMA@mail.gmail.com>
References: <CAESPx36Joi7Hzo5KdvNcy6QZDJ+YGXimbjzbbctZogLU_jkRyw@mail.gmail.com>
	<CAMKF1srkBd=jusV1SBcHHwtvZkDJoL=h=Y_a8ERERabtFtTzMA@mail.gmail.com>
From: Chris Watkins <chris.watkins88@gmail.com>
Date: Fri, 2 Dec 2011 15:30:04 +1100
Message-ID: <CAESPx35yyWsp90RJC9i=hn_dnJu3iccXzGGvhP_GQyrQ3JS3VQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Help building console-image
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
X-List-Received-Date: Fri, 02 Dec 2011 04:37:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks for the reply. I'm not sure exactly what you mean but I tried
"helloworld-image" and get the following:

Configuring opkg-collateral.
| Configuring angstrom-feed-configs.
| Configuring angstrom-version.
| Collected errors:
|  * opkg_install_cmd: Cannot install package helloworld.
|  * opkg_install_cmd: Cannot install package opkg.
NOTE: package helloworld-image-1.0-r0: task do_rootfs: Failed
ERROR: Function 'do_rootfs' failed (see
/media/oe/tmp/work/mini2440-angstrom-linux-gnueabi/helloworld-image-1.0-r0/temp/log.do_rootfs.29810
for further information)
ERROR: Task 14 (/media/oe/openembedded/recipes/images/helloworld-image.bb,
do_rootfs) failed with exit code '1'
ERROR: '/media/oe/openembedded/recipes/images/helloworld-image.bb' failed

However, "nano" completes successfully. The problem seems to be with opkg.
I don't know enough to actually know what opkg does (is this the package
manager for angstrom?) Any help is appreciated.

Chris

On 2 December 2011 14:56, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Dec 1, 2011 at 6:35 PM, Chris Watkins <chris.watkins88@gmail.com>
> wrote:
> > Hi,
> >
> > I've installed openembedded and managed to build 'task-base' for a
> mini2440
> > board (Though I'm not sure exactly what this). Now I'm trying to build
> > console-image to test on the device using the angstrom-2010.x distro but
> > I'm getting error messages that I can't figure out how to get around. The
> > full log file is here http://pastebin.com/raw.php?i=dtkErM5a , and
> > the error below. I'd appreciate any suggestions on how to fix this or
> where
> > to look for problems as I'm new to building embedded systems.
> >
> > Cheers,
> >
> > Chris
> >
> > Error messages:
> >
> >  satisfy_dependencies_for: Cannot satisfy the following dependencies for
> > task-base:
> >
> >  *      base-passwd *   busybox *       modutils-initscripts *  netbase
> *       opkg
> > *       util-linux-ng-mount *   util-linux-ng-umount *
> >        module-init-tools-depmod *      dropbear *      sysfsutils *
> >        module-init-tools *     alsa-utils-alsactl *
>  alsa-utils-alsamixer *
> >        usbutils *      portmap *       ppp *   ppp *
> >  * opkg_install_cmd: Cannot install package task-base.
> >  * opkg_install_cmd: Cannot install package psplash-angstrom.
> >  * opkg_install_cmd: Cannot install package psplash-zap.
> >  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> > for task-base-extended:
> >  *      wireless-tools *        wpa-supplicant *        blueprobe *
> bluez4 *
>
>
> Does it happen with all built fresh from scratch too ?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

