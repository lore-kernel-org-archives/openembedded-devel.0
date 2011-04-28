Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFPSs-0002rU-Tu for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 13:32:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFPQT-0005vs-1X for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 13:30:29 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 13:30:29 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 13:30:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 28 Apr 2011 13:30:17 +0200
Message-ID: <ipbj49$nf$1@dough.gmane.org>
References: <E1QFCsw-00061a-Qk@melo.openembedded.org>
	<BANLkTik_aF=6MBf4Ws5edfNar3hHA9y3Kg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTik_aF=6MBf4Ws5edfNar3hHA9y3Kg@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [oe-commits] Andrea Adami : linux: move stale patches to /obsolete/linux
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
X-List-Received-Date: Thu, 28 Apr 2011 11:32:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

And have we now learned to stop touching core files without review?

On 28-04-11 10:26, Andrea Adami wrote:
> On Thu, Apr 28, 2011 at 12:07 AM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 71eb55a998a150f3dc828d2478b7875f807b3536
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=71eb55a998a150f3dc828d2478b7875f807b3536
>>
>> Author: Andrea Adami <andrea.adami@gmail.com>
>> Date:   Thu Apr 28 00:05:40 2011 +0200
>>
>> linux: move stale patches to /obsolete/linux
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>
>> ---
>>
>>  recipes/{ => obsolete}/linux/files/configs/.empty  |    0
>>  recipes/{ => obsolete}/linux/files/ipaq-hal.init   |    0
>>  .../linux/files/linux-2.6-limits.patch             |    0
>>  .../linux/files/usb-gadget-ether-compat.patch      |    0
>>  4 files changed, 0 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/linux/files/configs/.empty b/recipes/obsolete/linux/files/configs/.empty
>> similarity index 100%
>> rename from recipes/linux/files/configs/.empty
>> rename to recipes/obsolete/linux/files/configs/.empty
>> diff --git a/recipes/linux/files/ipaq-hal.init b/recipes/obsolete/linux/files/ipaq-hal.init
>> similarity index 100%
>> rename from recipes/linux/files/ipaq-hal.init
>> rename to recipes/obsolete/linux/files/ipaq-hal.init
>> diff --git a/recipes/linux/files/linux-2.6-limits.patch b/recipes/obsolete/linux/files/linux-2.6-limits.patch
>> similarity index 100%
>> rename from recipes/linux/files/linux-2.6-limits.patch
>> rename to recipes/obsolete/linux/files/linux-2.6-limits.patch
>> diff --git a/recipes/linux/files/usb-gadget-ether-compat.patch b/recipes/obsolete/linux/files/usb-gadget-ether-compat.patch
>> similarity index 100%
>> rename from recipes/linux/files/usb-gadget-ether-compat.patch
>> rename to recipes/obsolete/linux/files/usb-gadget-ether-compat.patch
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>
> 
> This patch broke multikernel builds (grepping too strict...).
> 
> This part needs to be reverted:
>> rename from recipes/linux/files/configs/.empty
>> rename to recipes/obsolete/linux/files/configs/.empty
> 
> 
> I'll do it this evening if nobody does it before.
> Sorry.
> 
> 
> Andrea

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNuU/JMkyGM64RGpERAsm/AJ9+iQ+lhSFvS5Usu8IGLG0EtM0VEwCfQd+u
dpx+dBfQhzQF6IXi7LG4M8U=
=9wEh
-----END PGP SIGNATURE-----



