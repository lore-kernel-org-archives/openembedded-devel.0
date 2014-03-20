Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 87F2C6F937
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 22:54:52 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jw12so1766363veb.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RVa/grGq4GzxVcRohBdvtzpnnrLwwHRjp+f1c6OZu0w=;
	b=j7YZhx1nXEevtwBTStYxYdI7QURl6dgMpgq4CL4FN5ZafBIDyf2xs3yQP87bqE19wl
	2YyTOG8i37nMGhlGPArhG01VnINLqLQaXEH1Ah5DRLGmuUfH+icCATqe2hD+zYs4H4g1
	QrS3h/Pp1mcjo9rEcTqsxBNyAY4BFcun1SmbXy8isM8km+wTJWKf+9g/fer4aQQB/vJZ
	o+hoiBXxJsAm5v/9aoGwgmzMVZjFQG3N2p2Dj+6VeXoU3Qc0/7bMxBiXfrR9QSc8lvyy
	DHwvu5ho8GiDY8NMK9hhkA8iQCepg+IKwL4OFQ7gAZXkFZdCoe/R2OpQBDQRXXK98yc1
	HUSw==
MIME-Version: 1.0
X-Received: by 10.52.26.17 with SMTP id h17mr54124vdg.65.1395356093844; Thu,
	20 Mar 2014 15:54:53 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 20 Mar 2014 15:54:53 -0700 (PDT)
In-Reply-To: <20140320221906.GH3726@jama>
References: <CAFeBWL4=C3dWdGNX2UgGUJGu1EGdpodocwJ5hbJLDWowa-OePw@mail.gmail.com>
	<20140320221906.GH3726@jama>
Date: Thu, 20 Mar 2014 15:54:53 -0700
Message-ID: <CAFeBWL6FT5BD1S-0wBR+kd8WPJ6Q8CWvTKtgESfP2HZw6Trn2w@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libxfce4ui build fail on master branch
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
X-List-Received-Date: Thu, 20 Mar 2014 22:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Found Stephen's patch last week. Thanks!

Adam


On Thu, Mar 20, 2014 at 3:19 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Thu, Mar 20, 2014 at 02:11:04PM -0700, Adam Lee wrote:
> > Hello everyone, I am building my dora bsp layers with OE/poky master to
> > prepare for 1.6 release.
> > My console image built just fine, but I am getting this error while
> > building xfce image.
> >
> > NOTE: Executing intltoolize --copy --force --automake
> >
> > NOTE: Executing ACLOCAL="aclocal
> >
> --system-acdir=/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/"
> > autoreconf --verbose --install --force --exclude=autopoint
> >
> > autoreconf: Entering directory `.'
> >
> > autoreconf: configure.ac: not using Gettext
> >
> > autoreconf: running: aclocal
> >
> --system-acdir=/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/
> > --force
> >
> > aclocal: error: couldn't open directory
> >
> '/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/':
> > No such file or directory
> >
> > autoreconf: aclocal failed with exit status: 1
> >
> > ERROR: autoreconf execution failed.
> >
> > WARNING: exit code 1 from a shell command.
> >
> > ERROR: Function failed: do_configure (log file is located at
> >
> /media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.2388)
> >
> >
> > This
> > <
> https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/dev/default.xml
> >is
> > my manifest just in case.
> >
> > Thank you for your help!
>
> See patches on ML from last week
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

