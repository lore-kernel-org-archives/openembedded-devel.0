Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1iC8-0004Zc-Sx for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 17:38:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1i8l-0003EJ-E8 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 17:35:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 17:35:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 17:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Apr 2010 17:32:09 +0200
Message-ID: <hq22pp$qja$2@dough.gmane.org>
References: <20100413141237.GE3616@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <20100413141237.GE3616@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Download status for all recipes in oe.dev
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
X-List-Received-Date: Tue, 13 Apr 2010 15:38:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-10 16:12, Martin Jansa wrote:
> Hi,
> 
> with script moving checksums to recipes I ended with ~1000 recipes
> failing to parse/download/checksum.
> 
> My last few commits show what was common problem. Here is list of
> recipes which I cannot/wont fix from my position. And also list of
> recipes still waiting to test manually (because it takes much longer
> than I expected/wanted to spend on it).
> 
> Be aware, that some are maybe only temprorary problems and this list was
> created before big TI merge so those recipes from /ti/ are probabaly
> already fixed or removed.
> 
> FYI: 60G   /home/downloads/OE/
> 
> http://svn.o-hand.com/ shows only matchbox repo, not clutter
> ./clutter/aaina_svn.bb
> ./clutter/clutter-box2d_svn.bb
> ./clutter/clutter-cairo_svn.bb
> ./clutter/clutter-glx_svn.bb
> ./clutter/clutter-gst_svn.bb
> ./clutter/clutter_svn.bb
> ./clutter/table_svn.bb
> ./clutter/tidy_svn.bb + missing SRCREV
> ./eds/eds-dbus_svn.bb

Those moved to git, I still haven't found time to fix clutter in OE :(

> END 0 ./ti/ti-cgt6x-native_6.0.21.bb
> END 0 ./ti/ti-cgt6x-native_6.1.9.bb
> END 0 ./ti/ti-codec-engine_2.24.01.bb
> END 0 ./ti/ti-codec-engine_2.25.01.bb
> END 0 ./ti/ti-codecs-dm365_1.0.6.bb
> END 0 ./ti/ti-codecs-omap3530_1.01.bb
> END 0 ./ti/ti-codecs-omapl137_1.0.bb
> END 0 ./ti/ti-dm365mm-module_1.0.1.bb
> END 0 ./ti/ti-dspbios-native_5.33.02.bb
> END 0 ./ti/ti-dspbios-native_5.33.04.bb
> END 0 ./ti/ti-dsplink-module_1.61.3.bb
> END 0 ./ti/ti-dvsdk-demos_3.10.00.00.bb

Some of these aren't publicly available yet, working on that (though cgt
will never be wgettable).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLxI55MkyGM64RGpERArv4AKC0SzeZ0XMUrcpOjM8MARDX2xSrVgCfdaXH
mx/w0gQM12Wsdn52yUyflb4=
=iNuW
-----END PGP SIGNATURE-----



