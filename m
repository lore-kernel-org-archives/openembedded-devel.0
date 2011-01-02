Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PZRwn-0004eK-Lb for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 18:42:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PZRwS-0005O3-Q1 for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 18:42:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jan 2011 18:42:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jan 2011 18:42:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 02 Jan 2011 18:41:52 +0100
Message-ID: <ifqdd0$7cl$1@dough.gmane.org>
References: <4D20968B.4030004@mwester.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D20968B.4030004@mwester.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] e2fsprogs.inc - break shared libs into separate packages
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
X-List-Received-Date: Sun, 02 Jan 2011 17:42:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-01-11 16:15, Mike Westerhof wrote:
> Break the two shared libraries (libe2p and libext2fs) out of the general e2fsprogs
> package and into their own packages.  This avoids pulling in unwanted executables
> when a distro only desires the basic tools (such as e2fsck and/or mke2fs).
> 
> Signed-off-by: Mike Westerhof <mike@mwester.net>

Recipes with e2fsprogs in DEPENDS will need a PR bump as well, since
they might link to these libs as well. This will result in missing
libraries when using package feeds.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNILjgMkyGM64RGpERAl63AJ9d+oy10QAFluRD89/YB6g9ircOuwCfXljo
L2xm9I2E6/rkDke1UFvCG9c=
=Xptt
-----END PGP SIGNATURE-----



