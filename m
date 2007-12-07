Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0lFV-0001F0-10
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 23:00:45 +0100
Received: from Powerbook-2.local (vpn006044.vpn.utwente.nl [130.89.6.44])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB7Lunnk005427 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Dec 2007 22:56:49 +0100
Message-ID: <4759C1A2.3070308@student.utwente.nl>
Date: Fri, 07 Dec 2007 22:56:50 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <474EA852.7090306@whitby.id.au>	<474ECF9A.6050603@student.utwente.nl>	<b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>	<474FF886.7060308@whitby.id.au>	<b6ebd0a50711300859l392f9b43i8168d2377fb8c852@mail.gmail.com>
	<19c1b8a90712071139w299bab68k8005b8cc8d1116da@mail.gmail.com>
In-Reply-To: <19c1b8a90712071139w299bab68k8005b8cc8d1116da@mail.gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2007 22:00:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef:
> On Nov 30, 2007 8:59 AM, Chris Larson <clarson@kergoth.com> wrote:
>> On Nov 30, 2007 4:48 AM, Rod Whitby <rod@whitby.id.au> wrote:
>>> Chris Larson wrote:
>>>> Afaik, the execution of the hotplug/coldplug scripts on startup should
>>>> generate the hotplug events for the ethernet interfaces and bring them
>>>> up that way.  In debian, the hotplug scripts bring them up with ifup
>>>> --allow=hotplug [iface], such that you need an 'allow-hotplug eth0' in
>>>> interfaces to have them brought up that way.  I'm too rusty with OE to
>>>> say how we do it today, but it's not likely that auto is needed.
>>> Unfortunately, the busybox ifup applet does not support the
>>> allow-hotplug keyword.
>>>
>>> Based on the feedback, I'll add 'auto eth0'.
> 
> fwiw with this change my nfsrooted rfs does not boot. I think its a
> nice to have nfsroot option for dev work.

doing any form of 'ifup' on the interface that connects to you nfsroot
with shutdown the interface before trying to bring it up. I have the
same problem on my PVR, and as a workaround I edited
/path/to/nfs/etc/network/interface on the nfs server and removed the auto.
Volunteers to teach ifup not to not close the link when using nfsroot?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWcGiMkyGM64RGpERAiAnAJ0ZHNyCyLjmRlRjXnIi9bWxfWIUGACfTwip
qPwF61BdfukK/IxyHKWNJ5o=
=lxi4
-----END PGP SIGNATURE-----


