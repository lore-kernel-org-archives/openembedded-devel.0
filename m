Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UGRAV-0003tG-Gy for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 10:43:20 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UGQuf-0008Cl-TO for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 10:26:57 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2013 10:26:57 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2013 10:26:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 15 Mar 2013 10:26:24 +0100
Message-ID: <khupfr$e4v$1@ger.gmane.org>
References: <1363192654-5856-1-git-send-email-ftonello@cercacor.com>
	<khsn7t$31g$1@ger.gmane.org> <51426724.4050607@felipetonello.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <51426724.4050607@felipetonello.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCH v3] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Fri, 15 Mar 2013 09:43:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-03-13 01:11, Felipe Ferreri Tonello schreef:
> Hi Koen,
> 
> On 03/14/2013 07:35 AM, Koen Kooi wrote: Op 13-03-13 17:37,
> eu@felipetonello.com schreef:
>>>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>>> 
>>>> Fingerterm is a terminal emulator for Nokia Harmattan, but it works
>>>> in any Qt4 environment.
>>>> 
>>>> This recipe can be extended by a .bbappend to add .desktop, icon
>>>> and others to the target device.
> 
> Why not include a default .desktop in the recipe so it actually works out
> of the box?
> 
>> The binary is been installed. So it will work out of the box.

Eh, no. You need a .desktop to launch it properly.

> 
>> Regarding the .desktop file, it is not installed by default because  it
>> was done for MeeGo only. It needs some hack to work for generic
>> desktops that follow desktop-entry spec[1].

Then add a .desktop that adheres to the spec, I see no reason why this
recipe has to be so 'special' that it needs a .bbappend to work as intended.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRQulAMkyGM64RGpERAmgSAJ4ig6vvXAYDa6Z/YAKH+p7YNetshACgj/Xm
nt4iz6waFF9QQjtytfRo/2Q=
=wmfE
-----END PGP SIGNATURE-----



