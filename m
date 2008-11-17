Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L20mC-00036q-HU
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 10:52:13 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 98FCA24082; Mon, 17 Nov 2008 20:49:51 +1100 (EST)
Date: Mon, 17 Nov 2008 20:17:23 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081117201723.460f8aab.raster@rasterman.com>
In-Reply-To: <gfrbvd$8h9$1@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>
	<gfpdr0$6vm$1@ger.gmane.org>
	<20081117094617.9a4ad7a9.raster@rasterman.com>
	<gfrbvd$8h9$1@ger.gmane.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Mon, 17 Nov 2008 09:52:13 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Nov 2008 10:02:36 +0100 Koen Kooi <k.kooi@student.utwente.nl>
babbled:

> On 16-11-08 23:46, Carsten Haitzler (The Rasterman) wrote:
> > On Sun, 16 Nov 2008 16:22:07 +0100 Koen Kooi<k.kooi@student.utwente.nl>
> > babbled:
> 
> > aha! that's the one. that SHOULD be in the e-wm-images package missing!
> >
> > opkg search /usr/share/enlightenment/data/images/test.png
> > e-wm-images - 0.16.999.043+svnr37468-r17.1
> > - /usr/share/enlightenment/data/images/test.png
> >
> > (yes different svnrev - but that shouldn't make a difference - i'm just a
> > little head locally of my public patchset. i am sure stefan can confirm
> > that test.png is in the images package for the oe svnrev int he images he
> > built)
> 
> Based on your hints, I found the problem, it's a bug in opkg that gets 
> triggered now and again:
> 
> root@omap3evm:~# opkg install e-wm-images
> Package e-wm-images (0.16.999.043+svnr37324-r17.1) installed in root is 
> up to date.
> 
> root@omap3evm:~# opkg search /usr/share/enlightenment/data/images/test.png
> e-wm-images - 0.16.999.043+svnr37324-r17.1 - 
> /usr/share/enlightenment/data/images/test.png
> 
> root@omap3evm:~# file /usr/share/enlightenment/data/images/test.png
> /usr/share/enlightenment/data/images/test.png: cannot open 
> `/usr/share/enlightenment/data/images/test.png' (No such file or directory)
> 
> root@omap3evm:~# opkg install e-wm-images -force-reinstall
> Reinstalling e-wm-images (0.16.999.043+svnr37324-r17.1) on root...
> Downloading 
> http://www.angstrom-distribution.org/feeds/2008/ipk/glibc//all/e-wm-images_0.16.999.043+svnr37324-r17.1_all.ipk
> Configuring e-wm-images
> 
> root@omap3evm:~# !file
> file /usr/share/enlightenment/data/images/test.png
> /usr/share/enlightenment/data/images/test.png: PNG image data, 16 x 16, 
> 8-bit/color RGBA, non-interlaced
> root@omap3evm:~#
> 
> opkg doesn't install all files from a package on upgrade. I noticed this 
> before, but haven't been able to reproduce this.
> 
> So there was indeed a bug in upgrading, but not in e :)

oooh! aha! totally bizarre! well... at least i found a small buglet and fixes
it (missing AUTHORS)... but this one was definitely a strange one that you got
hit with and not others :(

> Thanks for helping to debug this!
> 
> regards,
> 
> Koen
> 
> 
> >
> >>> - Full list of installed packages
> >> http://dominion.thruhere.net/koen/OE/e17/e-installed-packages.txt
> >>
> >> Thanks for looking into this, let me know if you need more info.
> >
> > strange - all the libs and e-wm etc. seem to be in sync (except etk - but
> > that wont affect e). how it should be. odd that u have the tiff saver
> > module and not the loader!
> >
> >> regards,
> >>
> >> Koen
> >>
> >> [1] modulo bugs due to not running image_post_process commands
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> >
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



