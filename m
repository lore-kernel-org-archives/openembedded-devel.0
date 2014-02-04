Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id BA8C66E944
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 12:49:35 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WAfRX-0002RZ-Mt for openembedded-devel@lists.openembedded.org;
	Tue, 04 Feb 2014 13:49:35 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 13:49:35 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 13:49:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 04 Feb 2014 13:49:26 +0100
Message-ID: <lcqnk3$ei5$1@ger.gmane.org>
References: <52F0CFB2.2040708@emagii.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <52F0CFB2.2040708@emagii.com>
X-Enigmail-Version: 1.6
Subject: Re: Could not update ICEauthority file /var/lib/gdm/.ICEauthority
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
X-List-Received-Date: Tue, 04 Feb 2014 12:49:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ulf Samuelsson schreef op 04-02-14 12:32:
> I built a derivative of cloud9-gnome-image/Angstrom-1.4  for the
> Beaglebone Black on an Ubuntu 12.04 host.
> 
> When I boot, I get a popup window with the text:
> 
> "Could not update ICEauthority file /var/lib/gdm/.ICEauthority"
> 
> This appears because /var/lib/gdm is not owned by gdm. Instead it is
> owned by 115:125
> 
> I manually changed the owner and rebooted, and this time I did not get
> the error message.
> 
> I tracked down why:
> 
> The recipe for gdm in
> meta-openembedded/meta-gnome/recipes-gnome/gdm_2.32.2.bb contains:
> 
> 
> ------------------------------------------------------------------------------
>
> 
do_install_append() {
> ... chown -R gdm:gdm ${D}${localstatedir}/lib/gdm chmod 0750
> ${D}${localstatedir}/lib/gdm ... } 
> ------------------------------------------------------------------------------
>
>  Problem with this approach is that the chown command is using the
> user:group of the host .
> 
> If I do <host> # cat /etc/passwd | grep gdm I get:
> 
> gdm:x:115:125:Gnome Display Manager:/var/lib/gdm:/bin/false
> 
> If I do the same on the target I get:
> 
> root@beaglebone:~# cat /etc/passwd | grep gdm I get: 
> gdm:x:997:993::/var/lib/gdm:/bin/sh
> 
> so I think that setting the user:group must be done in a postinstall
> task.

No, you just need to extract the tarball with --numeric-owner, pseudo takes
care of having the right numeric IDs in the packages and during the build.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS8OHWMkyGM64RGpERAtDCAJ9VYcmRTm86OtzKuxmnF0Ls3DDJigCglJYH
ds2Q3f70bS29aPpNLb5xhsk=
=F2Jl
-----END PGP SIGNATURE-----


