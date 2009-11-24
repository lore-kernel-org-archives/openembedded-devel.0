Received: from smtp1.utsp.utwente.nl ([130.89.2.8] helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1NCtog-0000uw-LS
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 12:44:21 +0100
Received: from [172.20.0.255] (vpn006019.vpn.utwente.nl [130.89.6.19])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	nAOAbmdU032469; Tue, 24 Nov 2009 11:37:49 +0100
Mime-Version: 1.0 (Apple Message framework v1076)
From: Koen Kooi <k.kooi@student.utwente.nl>
In-Reply-To: <20091124102028.GG28485@jama>
Date: Tue, 24 Nov 2009 11:37:48 +0100
Message-Id: <F143DC04-C363-40F0-99C7-84B5305F684C@student.utwente.nl>
References: <E1NCsJm-0008Ly-9m@melo.openembedded.org>
	<20091124102028.GG28485@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1076)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	icts.servicedesk@utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.8
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] Koen Kooi : opkg-target,sdk: bump SRCREV
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
X-List-Received-Date: Tue, 24 Nov 2009 11:44:21 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 24 nov 2009, om 11:20 heeft Martin Jansa het volgende geschreven:

> On Tue, Nov 24, 2009 at 10:08:18AM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=2fdf1aa1c869ea9deecee86206f49a2eca9d7c00
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Tue Nov 24 10:22:43 2009 +0100
>>
>> opkg-target,sdk: bump SRCREV
>
> Hi,
>
> just out of curiosity, does your opkg also ship with update- 
> alternatives
> script included in package?

Yes:

koen@dominion:/OE/angstrom-dev$ dpkg-deb -c deploy/glibc/ipk/armv7a/ 
opkg-nogpg-nocurl_0.1.6+svnr363-r16.4_armv7a.ipk
drwxr-xr-x root/root         0 2009-11-24 11:06 ./
drwxr-xr-x root/root         0 2009-11-24 11:06 ./usr/
drwxr-xr-x root/root         0 2009-11-24 11:06 ./usr/bin/
-rwxr-xr-x root/root    134428 2009-11-24 11:06 ./usr/bin/opkg-cl
-rwxr-xr-x root/root      4248 2009-11-24 11:06 ./usr/bin/update- 
alternatives
-rwxr-xr-x root/root      1671 2009-11-24 11:06 ./usr/bin/opkg-key
drwxr-xr-x root/root         0 2009-11-24 11:06 ./usr/share/
drwxr-xr-x root/root         0 2009-11-24 11:06 ./usr/share/opkg/
drwxr-xr-x root/root         0 2009-11-24 11:06 ./usr/share/opkg/ 
intercept/
-rwxr-xr-x root/root       151 2009-11-24 11:06 ./usr/share/opkg/ 
intercept/ldconfig
-rwxr-xr-x root/root       175 2009-11-24 11:06 ./usr/share/opkg/ 
intercept/update-modules
-rwxr-xr-x root/root       231 2009-11-24 11:06 ./usr/share/opkg/ 
intercept/depmod
drwxr-xr-x root/root         0 2009-11-24 11:06 ./etc/
drwxr-xr-x root/root         0 2009-11-24 11:06 ./etc/rcS.d/
-rwxr-xr-x root/root       513 2009-11-24 11:06 ./etc/rcS.d/S98configure


> Haven't you problem with it, ie not respecting
> virtual/update-alternatives set for distribution in OE?

virtual/foo is for buildtime, so some other solution is needed if you  
want to install a different u-a.

> We're using slightly modified cworth's update-alternatives script
> http://patchwork.openembedded.org/patch/1291/
> so we need to remove it from opkg, because otherwise version from opkg
> is higher in PATH :/
> http://patchwork.openembedded.org/patch/1290/
>
> Could other distributions also use this?

Those 2 patches look OK, expect that you need to add RDEPENDS =  
"update-alternatices-cworth" to the opkg recipes since they will stop  
working otherwise.
We might need something like the virtual/xserver + XSERVER to solve it  
runtime and buildtime.

regards,

Koen


