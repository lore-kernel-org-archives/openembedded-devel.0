Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id BF7907035B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 08:47:47 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X5WUb-0003oN-Pn for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2014 10:47:45 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 10:47:45 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 10:47:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 11 Jul 2014 10:47:32 +0200
Message-ID: <lpo8b4$3hd$1@ger.gmane.org>
References: <CAEaCVQiEEX45zS0PLGrExLxqLofDNht5c7MD9uBDbh4MpbskDA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <CAEaCVQiEEX45zS0PLGrExLxqLofDNht5c7MD9uBDbh4MpbskDA@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: systemd service failing at start
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
X-List-Received-Date: Fri, 11 Jul 2014 08:47:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Eduardo Silva schreef op 11-07-14 04:43:
> Hi,
> 
> For some reason the systemd service that i plan to use for Monkey HTTP 
> Server in Yocto is not starting up when booting the core-image-sato
> image. Once is booting it hangs saying:
> 
> [  OK  ] Stopped Monkey HTTP Server [  ***   ] A Start job is running for
> Run pending postinsts (20min 12s...)
> 
> My service file looks like this:
> 
> --- start of monkey.service---
> 
> [Unit] Description=Monkey HTTP Server Requires=network.target
> remote-fs.target After=network.target remote-fs.target
> 
> [Service] Type=forking ExecStart=/usr/bin/monkey --daemon 
> PIDFile=/var/run/monkey.pid.2001 TimeoutSec=10
> 
> [Install] WantedBy=multi-user.target
> 
> -- end--
> 
> If i deploy Monkey RPM (cooked by bitbake) on the Sato image and i add
> this service once the system is up, systemd can start the service
> without problems, everything works: start, stop, status, etc. Do i am
> missing something that can be generating some problems on the first boot
> ?

The postinst startup script is blocking boot, you;d have to check which
postinst is causing the holdup.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTv6SkMkyGM64RGpERAko3AJ9aJCgDtQqTNaDRFx0x0/J0JbE3agCgrYxP
cfEuXH8Qg/Z+jdh6yeCS96U=
=t4rZ
-----END PGP SIGNATURE-----


