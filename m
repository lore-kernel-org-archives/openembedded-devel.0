Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZg4K-0004az-G5 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 08:42:39 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZg22-0000vE-VQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 08:40:14 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 08:40:14 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 08:40:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 26 Jan 2010 08:39:53 +0100
Message-ID: <hjm689$6ab$1@ger.gmane.org>
References: <1264450250.3984.19.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264450250.3984.19.camel@mattotaupa>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [10a1258] hal 0.5.14+git: teach linux devices.c about 'input.touchscreen'
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
X-List-Received-Date: Tue, 26 Jan 2010 07:42:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-10 21:10, Paul Menzel wrote:
> Dear Koen,
> 
> 
> do you plan to get this upstream? Were all your touchscreens not
> recognized or just a certain one?

Hal doesn't know about touchscreens only about touchpads. I need to
decode RPs magic bitmask in our udev rules to come up with a proper key.
Once I have the proper key I can try to get it upstream, but HAL is a
dead project and we should look into udev-extras.

> In [1] it says regarding touch*pads*
> 
>         Keying on ABS_PRESSURE is
>         definitely not correct as some touchpads to not report it and many
>         touchscreens do. Is this on 32 or 64 bit kernels? What about userspace?
> 
> so I wonder that no one else reported this on the HAL list.

Most likely because no-one is using touchscreens managed by HAL.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXpxJMkyGM64RGpERAp6uAKCPq/vq4gVozO+XK6iWHd1bCfmf/gCfcXuP
fou3djGkE7fzDDP7yZe4E/w=
=ehpf
-----END PGP SIGNATURE-----



