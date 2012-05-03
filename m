Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPwGE-00047V-Sg for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 15:39:59 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPw6o-0007JI-Lz for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 15:30:14 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 15:30:14 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 15:30:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 03 May 2012 15:30:03 +0200
Message-ID: <jnu18r$n5e$1@dough.gmane.org>
References: <4FA26C26.7080105@nedap.com>
	<CACW_hTb3huecpjkFWmm1zXAij-_hx+NBXfrA0ou6DvafGTWtEw@mail.gmail.com>
	<4FA27A3F.60500@nedap.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <4FA27A3F.60500@nedap.com>
X-Enigmail-Version: 1.3.4
Subject: Re: upgrading from oe-classic to oe-core
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
X-List-Received-Date: Thu, 03 May 2012 13:39:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-05-12 14:29, Jaap de Jong schreef:
> 
> 
> On 05/03/2012 01:40 PM, Frans Meulenbroeks wrote:
>> Op 3 mei 2012 13:29 heeft Jaap de Jong<jaap.dejong@nedap.com>  het 
>> volgende geschreven:
>>> Hi All, If I have devices running on oe-classic and I want to upgrade
>>> them to oe-core, will the upgrade be without worries? It will
>>> probably download all packages? Or do I have to takes special steps?
>> Depends on the devices and how well they are supported in yocto (e.g. 
>> is there a bsp for them) And on the actual packages you want to have on
>> your device.
>> 
>> If you have some recipes of your own, you definitely will have some 
>> work upgrading these.
>> 
> That part is clear! And I'm working on that right now.
> 
> What I ment is: I have these devices with all those packages on them
> build with oe-classic. I would really like to have an idea what will
> happen when I do a 'opkg update ; opkg upgrade' on them. Anyone done
> that?

It won't work, various packages have been renamed, combined or split up. Not
to mention that the toolchains are vastly different.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFPoohbMkyGM64RGpERAvwaAJ9AbIIQLNmptpY6zCk7LcqKctebdwCeJydH
x9SAtsiTqH4kU3jwoqY/xRg=
=OW43
-----END PGP SIGNATURE-----



