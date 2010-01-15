Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVhbM-0001k5-8L for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:32:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVhZF-0001iq-17
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 09:30:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:30:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:30:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 15 Jan 2010 09:27:01 +0100
Message-ID: <hip8sk$2mq$3@ger.gmane.org>
References: <1263507455.3757.37.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263507455.3757.37.camel@gnutoo-desktop>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: illume-image
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
X-List-Received-Date: Fri, 15 Jan 2010 08:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-01-10 23:17, GNUtoo wrote:

> Next error:
> ----------------
> Collected errors:
> * Cannot find package gst-plugin-modplug.
> 
> so I did the following:
> $ wget
> http://www.angstrom-distribution.org/unstable/feed/armv6/gstreamer/gst-plugin-modplug_0.10.6-r2.2_armv6.ipk
> 
> $ mkdir modplug
> $ cd modplug
> $ ar x ../ gst-plugin-modplug_0.10.6-r2.2_armv6.ipk
> $ tar xvzf control.tar.gz
> $ cat control

> OE: gst-plugins-bad

That's the recipe name already :)

About the misssing packages: it's a bug in our recipes, every
gst-plugins-foo recipe has a PACKAGES_DYNAMIC for gst-plugin-*, so when
writing recipes you need to DEPENDS on the right gst-plugins-foo.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLUCbVMkyGM64RGpERAoiMAJ4s0sRoCSER8mbhXARuPsRPa5vs+gCdEm8N
NZ8P5Zuqs+FDHR/CEwVmVxg=
=e4Ch
-----END PGP SIGNATURE-----



