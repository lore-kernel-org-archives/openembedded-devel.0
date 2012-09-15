Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TCoqS-0003Hu-6T for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 11:39:24 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TCoeJ-0005uT-U7 for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 11:26:51 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 11:26:51 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 11:26:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 15 Sep 2012 11:26:35 +0200
Message-ID: <k31hk6$es6$1@ger.gmane.org>
References: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCH] meta-systemd: Introduce a create-volatile to create tmp directories
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
X-List-Received-Date: Sat, 15 Sep 2012 09:39:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-09-12 18:59, Holger Hans Peter Freyther schreef:
> From: Holger Hans Peter Freyther <zecke@selfish.org>
> 
> The base-files create symlinks from /var/{log,tmp,lock,cache,run} to the
> /var/volatile. The directories are created by sysv initscripts. Use the
> systemd-tmpfiles to create the directories. One needs to be careful with
> the naming of the file as systemd first collects all *.conf files, sorts
> them by name and is parsing them then. Make sure the new file is parsed
> before the systemd.conf.

I'm not sure this is the right place to fix it, I'd prefer a base files
bbappend and an fs-perms.txt for this. You know, like angstrom does :)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQVEnLMkyGM64RGpERAnhuAJ9jXlRDx9WddJ1zMaByOElCh2dUPQCgqedT
E1bm2zqcw4woino/cCXtQfM=
=CAHE
-----END PGP SIGNATURE-----



