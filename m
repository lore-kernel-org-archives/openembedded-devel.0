Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYH09-00075y-AV for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 12:49:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYGzt-0008O5-N7 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 12:48:45 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 12:48:45 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 12:48:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 30 Dec 2010 12:48:30 +0100
Message-ID: <ifhrie$a01$1@dough.gmane.org>
References: <4D1C4E4A.5000705@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4D1C4E4A.5000705@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: ti-c6accel-1_01_00_01: link error
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
X-List-Received-Date: Thu, 30 Dec 2010 11:49:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-12-10 10:18, Eric Bénard wrote:
> hi,
> 
> using today's master + angstrom 2010.x + beagleboard I get the following
> error :
> 
> .../...
> Linking c6accel_app from appMain.o c6accel_testfxns.o
> ../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: c6accel_app_config/linker.cmd contains output sections; did you
> forget -T?
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> .gnu.attributes not found for insert
> collect2: ld returned 1 exit status
> 
> Any idea on how to fix this ?

This is a combination of a bug in xdctools and c6accel, could you open
an issue on e2e.ti.com for this so the right people (e.g. Gagan for
c6accel and Sasa for xdctools) can have a look at it?
There was a work around for a codesourcery bug in xdctools that broke
any non-CSL toolchain when building codec-engine, and the fix seems to
have some side effects, like the one you are seeing.

You can get the command it's trying to run by commenting the 'VERBOSE =
@' in the Makefile in soc/app/something.

I'm on holiday till the 9th :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNHHGOMkyGM64RGpERAj/GAKCMNGZm1Z5bb/FhhVZFPWYPN/YIfACdE2M8
/I9n89tfyEc8iMJ4Qn3RFQs=
=Po04
-----END PGP SIGNATURE-----



