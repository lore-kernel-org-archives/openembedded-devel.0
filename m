Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2lfn-0001ss-TB for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 15:33:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2lcR-0002Dh-2l for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 15:30:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 15:30:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 15:30:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 16 Apr 2010 15:25:40 +0200
Message-ID: <hq9ogk$k1j$2@dough.gmane.org>
References: <20100416123920.GB3323@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <20100416123920.GB3323@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Do we really want shared Xserver script for all machines?
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
X-List-Received-Date: Fri, 16 Apr 2010 13:33:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Wouldn't it be better to merge the scripts from xserver-kdrive-common
and xserver-common and then fix all the sed/awk calls in one place?

On 16-04-10 14:39, Martin Jansa wrote:
> Hi,
> 
> on Openmoko Freerunner om-gta02 Xserver script takes about 3s on every
> boot
> http://build.shr-project.org/tests/jama/bootchart-2.6.32.9.r1.png
> 
> it's started from /etc/init.d/xserver-nodm and with eliminated Xserver
> call by passing xinit call directly with right Xorg params I get this
>  
> http://build.shr-project.org/tests/jama/bootchart-2.6.32.9.r3.png
> 
> My question is:
> 
> should I commit simplified versions of Xserver script
> xserver-kdrive-common/xserver-kdrive-common/Xserver
> to
> xserver-kdrive-common/xserver-kdrive-common/om-gta02/Xserver
> and the same for other devices supported in Xserver (to save 
> grep,awk call).
> 
> or do it only for om-gta02 (maybe even in 
> xserver-kdrive-common/xserver-nodm-init/xserver-nodm
> ) and those who care about boot time will follow?
> 
> Maybe calling fallback_screen_arg only where it's really needed would be
> good enough optimization, without the cost of loosing PACKAGE_ARCH =
> "all".
> 
> Cheers,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLyGVUMkyGM64RGpERAiyrAJwJHKahFvUdK8l+aYIgBhb2UMlwxwCgkzEF
sXq4fCHgeNYcSUlIXT/aKp4=
=Ft6E
-----END PGP SIGNATURE-----



