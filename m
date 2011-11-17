Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RRBA9-00028o-6v for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 00:14:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RRB3s-0005PD-Et for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 00:08:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 00:08:04 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 00:08:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 Nov 2011 00:07:50 +0100
Message-ID: <ja4446$vbc$1@dough.gmane.org>
References: <201111140105.00784.schnitzeltony@gmx.de>
	<201111142207.50587.schnitzeltony@gmx.de>
	<j9ti41$q4t$1@dough.gmane.org>
	<201111151507.09365.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201111151507.09365.schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 17 Nov 2011 23:14:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-11-11 15:07, Andreas Müller schreef:
> On Tuesday, November 15, 2011 12:23:45 PM Koen Kooi wrote:
>> Op 14-11-11 22:07, Andreas Müller schreef:
>>> On Monday, November 14, 2011 01:05:00 AM Andreas Müller wrote:
>>>> since
>>>> 
>>>> commit 037cb32f99f229c9c55a029bec088ebc7f59d278 Author: Koen Kooi 
>>>> <koen@dominion.thruhere.net> Date:   Fri Nov 11 12:50:38 2011
>>>> +0100
>>>> 
>>>> networkmanager: update to 0.9.2.0
>>>> 
>>>> wlan connects successfully to my router but *fails* to connect 
>>>> external locations.
>>>> 
>>>> networkmanager / nm-applet set up my network as eth0: IPv4 fixed
>>>> IP wlan0: WPA & WPA 2 Personal / IPv4 DHCP
>>>> 
>>>> Attached you find the results for networkmanager 0.9.2 and 
>>>> networkmanager 0.9.0 (reverted 
>>>> 037cb32f99f229c9c55a029bec088ebc7f59d278)
>>>> 
>>>> My suggestion: * revert 037cb32f99f229c9c55a029bec088ebc7f59d278
>>>> until fixed * send a note to gnome bugzilla
>>> 
>>> FYI: with network-manager-applet the problem persists
>> 
>> I'm seeing the same problem with default route not getting set, but
>> rolling back to the older release won't solve much since binaries are
>> already out there :/
>> 
>> regards,
>> 
>> Koen
> So let's see it as another challenge :)

As a small update: I'm still working on it. Although I haven't fixed the
route issue, I have found (and fixed!) other issues :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7Fk8QACgkQMkyGM64RGpHPkwCglhcS9GFS7smPgh+Wwo5HQz7z
lm8AoJo4A2/R5wjvpjh4MvYL904p4Tc0
=Vr8k
-----END PGP SIGNATURE-----



