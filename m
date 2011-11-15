Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RQHDd-00035u-7c for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 12:30:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RQH7T-0005wz-Ks for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 12:24:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:24:03 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:24:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Nov 2011 12:23:45 +0100
Message-ID: <j9ti41$q4t$1@dough.gmane.org>
References: <201111140105.00784.schnitzeltony@gmx.de>
	<201111142207.50587.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201111142207.50587.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.3
Subject: Re: networkmanager: update to 0.9.2.0 causes trouble
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
X-List-Received-Date: Tue, 15 Nov 2011 11:30:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-11-11 22:07, Andreas Müller schreef:
> On Monday, November 14, 2011 01:05:00 AM Andreas Müller wrote:
>> since
>> 
>> commit 037cb32f99f229c9c55a029bec088ebc7f59d278 Author: Koen Kooi
>> <koen@dominion.thruhere.net> Date:   Fri Nov 11 12:50:38 2011 +0100
>> 
>> networkmanager: update to 0.9.2.0
>> 
>> wlan connects successfully to my router but *fails* to connect
>> external locations.
>> 
>> networkmanager / nm-applet set up my network as eth0: IPv4 fixed IP 
>> wlan0: WPA & WPA 2 Personal / IPv4 DHCP
>> 
>> Attached you find the results for networkmanager 0.9.2 and
>> networkmanager 0.9.0 (reverted
>> 037cb32f99f229c9c55a029bec088ebc7f59d278)
>> 
>> My suggestion: * revert 037cb32f99f229c9c55a029bec088ebc7f59d278 until
>> fixed * send a note to gnome bugzilla
>> 
> FYI: with network-manager-applet the problem persists

I'm seeing the same problem with default route not getting set, but rolling
back to the older release won't solve much since binaries are already out
there :/

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7CS70ACgkQMkyGM64RGpFxqQCfVwzCXyrpYj0ANAzmE7Efmqpf
b44An0rXBlEj4XAVnCJSon8qLBcDkfxs
=tCGV
-----END PGP SIGNATURE-----



