Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NSR7r-0006P6-KB for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 09:20:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NSR5s-0005hy-Kq
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 09:18:16 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 09:18:16 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 09:18:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 06 Jan 2010 09:17:52 +0100
Message-ID: <hi1gvg$auc$1@ger.gmane.org>
References: <201001060507.31754.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091222 Shredder/3.0.1pre
In-Reply-To: <201001060507.31754.holger+oe@freyther.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 08:20:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-01-10 05:07, Holger Hans Peter Freyther wrote:

> 
> 	*) Sometimes we have pretty embarassing issues like some images switching
>             from mdev back to udev and we don't notice for months(!!!)
>             It would totally rock if one could change the rootfs.bbclass (or
>             such) class and count the size of the image on the first run, store 
>             it in the temp directory and report the diff's back to the 
>             tinderbox and then we could have a view on the tinderbox?
> 
>             Inside the build summary we should see the new size of the image
>             and the growth compared to the first built?
> 
>             The idea would be to have people look at the waterfall and go OMG 
>             why did "minimal-image" grow by 2MB?
> 
>           *) The next step would be to transfer packet sizes as well
> 
> 	  *) Integrate some testing into recipes. E.g. attempt to boot the console-
>              image and grep the Serial Console for the "Loging:" prompt..
>              Test the toolchain to compile binaries...

Those 3 points are exactly what testlab.bbclass was created for :) Over
2 years old now, but illustrates the usefullness of that class:
http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLREcwMkyGM64RGpERAquMAJ0ew07LQRZutS5gu6vCIvmyukEEAgCeJ6Lx
/4mvjNmmqeVP6TbVl8pRSYY=
=qUTY
-----END PGP SIGNATURE-----



