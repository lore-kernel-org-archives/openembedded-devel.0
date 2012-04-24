Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SMn43-0002TM-2u
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 23:14:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SMmun-0001d6-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 23:04:50 +0200
Message-ID: <1335301431.3133.144.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 22:03:51 +0100
In-Reply-To: <4F9713C4.2020908@gmail.com>
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com> <4F932ADB.7040003@gmail.com>
	<4F970F9C.7030508@gmail.com> <1335300289.3133.136.camel@x121e.pbcl.net>
	<4F9713C4.2020908@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
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
X-List-Received-Date: Tue, 24 Apr 2012 21:14:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 13:57 -0700, j wrote:
> The build machines all give messages like this just vary on libc version 
> listed
> 
> [47152.769257] ld[22617]: segfault at 403 ip 00007f2149cfd435 sp 
> 00007fffb83ccb50 error 4 in libc-2.15.so[7f2149cb6000+197000]
> 2012-04-18T14:50:08-07:00 localhost kernel: [47163.860996] ld[31096]: 
> segfault at 403 ip 00007fc2da152435 sp 00007fffab491c30 error 4 in 
> libc-2.15.so[7fc2da10b000+197000]

Does this correlate with an actual problem, or did you just see those
messages in the log and think that they were cause for concern?

If I had to guess I would say that this is probably some autoconf test
which is tickling a bug in ld.  You could probably establish which
package is doing that by looking at the timestamps and correlating them
with the build logs.

> qa.log has more than these messages but every machines logs are the same 
> like this
> 
> udev-182: udev: 
> /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/libgudev/lib/libgudev-1.0.so.0.1.1 
> links to something under exec_prefix

That doesn't appear to be related to the ld segfault
.
> each one of the machines from a fresh install have this problem. The 
> resulting image boots but does not fully function. I have issues such as 
> the native sdk does not install all the packages correctly.
> example would be install.
> normall you would find it
> /usr/bin/install
> I end up with
> /home/bill/OE/usr/bin/install

... and nor really does this.  This latter problem is almost certainly
just a bug in the SDK packaging and nothing at all to do with your build
host.

p.




