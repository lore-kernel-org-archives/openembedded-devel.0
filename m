Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OJlks-0006Qd-RG
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 13:05:26 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id CCB3E16607B3; Wed,  2 Jun 2010 05:00:48 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2F5DD166073B;
	Wed,  2 Jun 2010 05:00:48 -0600 (MDT)
Message-ID: <4C0639E0.40708@mlbassoc.com>
Date: Wed, 02 Jun 2010 05:00:48 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C04F6FD.4070804@mlbassoc.com>	<alpine.DEB.2.00.1006011021440.32142@lynx>	<201006011647.23770.ml@vdm-design.de>	<4C052584.2040905@mlbassoc.com>
	<AANLkTimsExreeJ4iWCwwaYoo-HJKC1zEuKKsX5gzzn29@mail.gmail.com>
In-Reply-To: <AANLkTimsExreeJ4iWCwwaYoo-HJKC1zEuKKsX5gzzn29@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Wed, 02 Jun 2010 11:05:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2010 06:30 PM, Graham Gower wrote:
> On 2 June 2010 00:51, Gary Thomas<gary@mlbassoc.com>  wrote:
>>
>> I reran my build and it passed through (no repository changes).
>> This particular problem seems to be a multi-threaded build (I run
>> with BB_NUMBER_THREADS = "4")
>>
>> Sadly, the final image still does not build:
>>
>> | log_check: Matched keyword: [Cannot satisfy the following dependencies]
>> | Collected errors:
>> |  * resolve_conffiles: Existing conffile
>> /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table
>> is different from the conffile in the new package. The new conffile will be
>> placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b *
>> satisfy_dependencies_for: Cannot satisfy the following dependencies for
>> angstrom-task-gnome:
>> |  *    encodings *     encodings *     encodings *
>> |
>> NOTE: package beagleboard-linuxtag2010-demo-image-1.0-r0: task do_rootfs:
>> Failed
>>
>> I don't understand this error well enough (believe me, I've
>> spent hours reading the various recipes and trying things)
>> to hazard a guess as to what this error means.
>>
>
> Not understanding the error is probably because most of this error
> message comes from opkg (which is a heap of crap) and part of it has
> been truncated.
>
> The first bit:
>> |  * resolve_conffiles: Existing conffile
>> /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table
>> is different from the conffile in the new package. The new conffile will be
>> placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b
>
> This indicates that multiple packages are trying to provide the
> /etc/device_table config file. The message has been truncated at 256
> chars - even the '\n' has been stripped so it runs on to the next
> error.
>
> I've just bumped this limit to 4096 in upstream opkg, so longer errors
> should be more readable.

Yes, your change improved the readability of the messages, thanks.

That said, I'm not sure that this first part is such a problem as it also
happens when building 'beagleboard-demo-image' that does succeed.  Looking
at the results, I see these files:

$ \ls tmp/rootfs/beagleboard-*-image/etc/device_table* -l
-rw-rw-r-- 1 gthomas gthomas 1378 Jun  1 07:37 tmp/rootfs/beagleboard-demo-image/etc/device_table
-rwxr-xr-x 1 gthomas gthomas 6666 May 22 21:17 tmp/rootfs/beagleboard-demo-image/etc/device_table-opkg
-rw-rw-r-- 1 gthomas gthomas 1378 Jun  2 04:35 tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table
-rwxr-xr-x 1 gthomas gthomas 6666 May 22 21:17 tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table-opkg

This implies that the same conditions exist for both beagleboard-demo-image
and beagleboard-linuxtag2010-demo-image, so I'm not sure why in one case the
error checker catches it and the other not.

>
>> satisfy_dependencies_for: Cannot satisfy the following dependencies for
>> angstrom-task-gnome:
>> |  *    encodings *     encodings *     encodings *
>
> Package "angstrom-task-gnome" depends on Package "encodings", but it
> cannot be found in the list of available packages. I have no idea why
> its listed three times.

I also don't understand this one as those packages are most
certainly there:

$ tmp/sysroots/i686-linux/usr/bin/opkg-cl -f tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/opkg/opkg.conf -o tmp/rootfs/beagleboard-linuxtag2010-demo-image list 'encodings*'
encodings - 1:1.0.3-r1.0.5 - Version 1.0.3-r1.0 of package encodings
encodings-dbg - 1:1.0.3-r1.0.5 - Version 1.0.3-r1.0 of package encodings
encodings-dev - 1:1.0.3-r1.0.5 - Version 1.0.3-r1.0 of package encodings

What am I missing?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


