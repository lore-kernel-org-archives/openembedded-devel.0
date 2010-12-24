Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PWBRZ-0004VP-PO for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 18:28:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PWBRR-00019Y-2q for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 18:28:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 18:28:33 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 18:28:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Dec 2010 18:28:20 +0100
Message-ID: <if2l7k$6v8$1@dough.gmane.org>
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>	<AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>	<20101216154854.GB22134@gmail.com>
	<4D14B770.3000601@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4D14B770.3000601@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: testing branch 2010-12-10
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
X-List-Received-Date: Fri, 24 Dec 2010 17:28:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-12-10 16:08, Eric Bénard wrote:
> Hi Khem,
> 
> On 16/12/2010 16:48, Khem Raj wrote:
>> On (16/12/10 08:55), Cliff Brake wrote:
>>> beagleboard beagleboard-linuxtag2010-demo-image is failing with:
>>>
>>> http://tinderbox.openembedded.net/packages/1321155/
>>>
>>> ti-c6accel
>>>
>>> Linking c6accel_app from appMain.o c6accel_testfxns.o
>>> ../c6accelw/lib/c6accelw_omap3530.a470MV
>>> c6accel_app_config/linker.cmd..
>>> /lib/libgcc_s.so.1: file not recognized: File format not recognized
>>
>>
>> Have you tried with latest .dev ? It might work with latest .dev
>> I have fixed libgcc install locations
>>
> I tested beagleboard-linuxtag2010-demo-image for machine beagleboard
> with today's master and it still fails with the following messages :
> 
> Linking c6accel_app from appMain.o c6accel_testfxns.o
> ../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: c6accel_app_config/linker.cmd contains output sections; did you
> forget -T?
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> skipping incompatible /lib/libgcc_s.so.1 when searching for libgcc_s.so.1
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> skipping incompatible /lib/libgcc_s.so.1 when searching for libgcc_s.so.1
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> .gnu.attributes not found for insert
> collect2: ld returned 1 exit status
> make[2]: *** [c6accel_app] Error 1
> 
> Do you have any idea on how to fix this ?

That looks like the xdctools linkerscript problem we had before. Maybe
an xdc .clean and xdc .make would help.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNFNg0MkyGM64RGpERAttfAJ4w1FuLClSrBfa0rUq8wSbUaBXJBACgnQhk
FtZ4xrzyf8LsMfP/Y7FC4pw=
=zMd/
-----END PGP SIGNATURE-----



