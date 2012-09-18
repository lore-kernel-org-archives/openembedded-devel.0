Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TE2BZ-0007WN-Iu for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 20:06:13 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TE1zO-000083-Ah for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 19:53:38 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 19:53:38 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 19:53:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Sep 2012 19:53:26 +0200
Message-ID: <k3aceg$7an$1@ger.gmane.org>
References: <CAK18fxHzC+3nrhVbsntm+3DbF=pzwtZoF8R0EcZ33z3G4uv9Mg@mail.gmail.com>
	<E5E9389A-9AA7-4BE9-85A7-BD6D5DDC9A88@dominion.thruhere.net>
	<CAK18fxFZjKMhLU_UZZe4zOHjbdYpgmKydvdWAzr5c20Z=f9hUg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAK18fxFZjKMhLU_UZZe4zOHjbdYpgmKydvdWAzr5c20Z=f9hUg@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe] zram service in meta-systemd
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
X-List-Received-Date: Tue, 18 Sep 2012 18:06:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-09-12 17:43, Andrei Gherzan schreef:
> On Tue, Sep 18, 2012 at 6:35 PM, Koen Kooi
> <koen@dominion.thruhere.net>wrote:
> 
>> 
>> Op 18 sep. 2012, om 16:58 heeft Andrei Gherzan <andrei@gherzan.ro> het 
>> volgende geschreven:
>> 
>>> Hello,
>>> 
>>> I would like to move the zram service from meta-raspberrypi to
>> meta-systemd. This is not specific to raspberrypi and can be used by
>> others as well.
>>> Koen, what do you think about this move? And if so, what recipes
>> directory should i use? recipes-extended?
>> 
>> What other machines use zram as well?
> 
> 
> Don't know. What i'm sure of is that raspberry uses this and is included
> in meta-rasberrypi even if this is not rpi specific.

I had a look and it's certainly not r-pi specific, it's support for enabling
compressed pages in RAM/swap, so I'm fine with it going into
meta-oe+meta-systemd.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQWLUWMkyGM64RGpERAhEoAJ959GVpZ193zdTOULnLu+oA5yP1jACfTvPB
zsqAFAWjxJgihEOEaih8Jgs=
=S+el
-----END PGP SIGNATURE-----



