Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1C52365D8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 14:49:01 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WYGHi-0006EY-DM for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2014 16:48:58 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:48:58 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:48:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Apr 2014 16:48:49 +0200
Message-ID: <li6b0g$9m6$1@ger.gmane.org>
References: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
	<CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: udev auto-mount not doing fsck
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2014 14:49:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Brian Hutchinson schreef op 10-04-14 15:10:
> OK an update.  I decided to stub the automount.rules for the moment to
> try and get things working the old way and I'm seeing some curious
> behavior. The target is running Yocto 1.5 so it is a fairly recent
> distro.
> 
> I made an entry in /etc/fstab for my eUSB with the sixth column set to
> 2. On reboot fsck doesn't run.  Hmmm, curious.  I still see the:
> 
> EXT4-fs (sda1): warning: maximal mount count reached, running e2fsck is 
> recommended EXT4-fs (sda1): mounted filesystem with ordered data mode.
> Opts: (null)
> 
> ... messages at boot.
> 
> So I do touch /forcefsck and reboot.   Same result. shutdown -rF ... same
> result.
> 
> I can't figure out why none of these methods is checking my eUSB drive.

To ask the obvious question: is fsck.ext{2,3,4} present on your system?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTRq9RMkyGM64RGpERAoV7AJ41jAQXvVid86l2Ntdeb7eR91H19wCcDx2I
y+BA/pyMjlOg2C+S8p5/lHM=
=36Lo
-----END PGP SIGNATURE-----


