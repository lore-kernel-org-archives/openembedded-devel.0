Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ny3OT-0006AA-WD for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 15:28:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ny3LH-00032K-3x for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 15:24:51 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Apr 2010 15:24:51 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Apr 2010 15:24:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 03 Apr 2010 15:24:40 +0200
Message-ID: <hp7fio$3nc$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hp4s4q$40a$1@dough.gmane.org>
	<1270243792.4993.180.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1270243792.4993.180.camel@rex>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Sat, 03 Apr 2010 13:28:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-04-10 23:29, Richard Purdie wrote:
> On Fri, 2010-04-02 at 15:40 +0200, Koen Kooi wrote:
>> While testing (rebased on top of this mornings OE, bitbake master) I'm
>> getting messages like this:
>>
>> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
>> RPATH=/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
>> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
>> new RPATH: $ORIGIN/../../../../usr/lib
>> open: Permission denied
>> elf_open: Invalid argument
>>
>> Are those messages from chrpath and can they be ignored?
> 
> The first messages are from the class and are safe to ignore. The
> permission denied suggests something was added to staging that was
> readonly? Can you check the permissions
> on //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so and see if that is the case. It would make sense for that code to check for read only and handle that case, restoring the permissions afterwards.
> 
> I won't get to it this weekend but I will make sure its fixed on Tuesday
> if you can confirm that is the problem.

With that patch I get:

NOTE: Task failed: ('function sysroot_stage_all failed',
'/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r7.1/temp/log.sysroot_stage_all.7491')
ERROR: Logfile of failure stored in:
/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r7.1/temp/log.sysroot_stage_all.7491
Log data follows:
|
/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r7.1/temp/run.sysroot_stage_all.7491:
line 372: cd:
/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r7.1/image/lib:
No such file or directory
| ERROR: Function sysroot_stage_all failed


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLt0GYMkyGM64RGpERAo1jAJ9ZkzNdv2uefjQhFiszydtay99o7wCfWUtI
ndju9T002woZjh8HWfBKj+8=
=gBLB
-----END PGP SIGNATURE-----



