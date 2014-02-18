Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6AC6E9F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 07:44:56 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WFfMN-0007Kk-Gw for openembedded-devel@lists.openembedded.org;
	Tue, 18 Feb 2014 08:44:55 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:44:55 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:44:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Feb 2014 08:47:05 +0100
Message-ID: <ldv30v$jfq$1@ger.gmane.org>
References: <CAFeBWL67tUiY5BZ6Fp6dz5H00Y=smW+fvdS6dzz3A0scqaysuQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <CAFeBWL67tUiY5BZ6Fp6dz5H00Y=smW+fvdS6dzz3A0scqaysuQ@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: pam_gnome_keyring.so not getting packaged into my rootfs
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
X-List-Received-Date: Tue, 18 Feb 2014 07:44:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam Lee schreef op 18-02-14 00:00:
> Hello everyone, my gdm logs in /var/log/gdm is complaining about these 
> missing files:
> 
> - polkit-gnome-authentication-agent-1 - ck-get-x11-display-device -
> pam_gnome_keyring.so
> 
> The first two files are found in paths GDM wasn't aware of, so all I had
> to do was create symbolic links to 
> /usr/lib/gdm/{polkit-gnome-authentication-agent-1, 
> ck-get-x11-display-device}.
> 
> The last file, pam_gnome_keyring.so, is not in my rootfs. The file gets 
> generated and it's in my build directory however. I can create a
> bbappend to install this shared object into the rootfs, but I wanted to
> ask in the list to see if I missed something obvious.

Give http://patches.openembedded.org/patch/66793/ a try

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTAw/5MkyGM64RGpERAkDGAKCyFB1qqElkH2gRAtSL/578jYFa5gCgl7hE
Z9hpU5nZuPs+VJcYxDpVKNU=
=2Bsi
-----END PGP SIGNATURE-----


