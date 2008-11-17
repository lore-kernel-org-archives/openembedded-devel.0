Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L202a-0005rx-HQ
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 10:05:22 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L200K-0005LP-Os
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 09:02:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 09:02:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 09:02:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Nov 2008 10:02:36 +0100
Message-ID: <gfrbvd$8h9$1@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>	<gfpdr0$6vm$1@ger.gmane.org>
	<20081117094617.9a4ad7a9.raster@rasterman.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081117094617.9a4ad7a9.raster@rasterman.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Mon, 17 Nov 2008 09:05:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-08 23:46, Carsten Haitzler (The Rasterman) wrote:
> On Sun, 16 Nov 2008 16:22:07 +0100 Koen Kooi<k.kooi@student.utwente.nl>
> babbled:

> aha! that's the one. that SHOULD be in the e-wm-images package missing!
>
> opkg search /usr/share/enlightenment/data/images/test.png
> e-wm-images - 0.16.999.043+svnr37468-r17.1
> - /usr/share/enlightenment/data/images/test.png
>
> (yes different svnrev - but that shouldn't make a difference - i'm just a little
> head locally of my public patchset. i am sure stefan can confirm that test.png
> is in the images package for the oe svnrev int he images he built)

Based on your hints, I found the problem, it's a bug in opkg that gets 
triggered now and again:

root@omap3evm:~# opkg install e-wm-images
Package e-wm-images (0.16.999.043+svnr37324-r17.1) installed in root is 
up to date.

root@omap3evm:~# opkg search /usr/share/enlightenment/data/images/test.png
e-wm-images - 0.16.999.043+svnr37324-r17.1 - 
/usr/share/enlightenment/data/images/test.png

root@omap3evm:~# file /usr/share/enlightenment/data/images/test.png
/usr/share/enlightenment/data/images/test.png: cannot open 
`/usr/share/enlightenment/data/images/test.png' (No such file or directory)

root@omap3evm:~# opkg install e-wm-images -force-reinstall
Reinstalling e-wm-images (0.16.999.043+svnr37324-r17.1) on root...
Downloading 
http://www.angstrom-distribution.org/feeds/2008/ipk/glibc//all/e-wm-images_0.16.999.043+svnr37324-r17.1_all.ipk
Configuring e-wm-images

root@omap3evm:~# !file
file /usr/share/enlightenment/data/images/test.png
/usr/share/enlightenment/data/images/test.png: PNG image data, 16 x 16, 
8-bit/color RGBA, non-interlaced
root@omap3evm:~#

opkg doesn't install all files from a package on upgrade. I noticed this 
before, but haven't been able to reproduce this.

So there was indeed a bug in upgrading, but not in e :)

Thanks for helping to debug this!

regards,

Koen


>
>>> - Full list of installed packages
>> http://dominion.thruhere.net/koen/OE/e17/e-installed-packages.txt
>>
>> Thanks for looking into this, let me know if you need more info.
>
> strange - all the libs and e-wm etc. seem to be in sync (except etk - but that
> wont affect e). how it should be. odd that u have the tiff saver module and not
> the loader!
>
>> regards,
>>
>> Koen
>>
>> [1] modulo bugs due to not running image_post_process commands
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>




