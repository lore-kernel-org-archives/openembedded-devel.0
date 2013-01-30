Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U0YNz-0000vQ-Bd for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 15:11:35 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U0Y96-0001B6-Nh for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 14:56:12 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 14:56:12 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 14:56:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Jan 2013 14:55:46 +0100
Message-ID: <keb8ot$ea4$1@ger.gmane.org>
References: <1359539418-6925-1-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1359539418-6925-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][[RFC][PATCHv2] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 14:11:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-01-13 10:50, Koen Kooi schreef:
> The hardfp patch is a forward port from the 0.6.x version in meta-oe, the
> upstream version doesn't work. I don't know why __SOFTFP__ isn't getting
> defined, but checking for the PCS version of VFP is a lot safer and
> actually works.
> 
> Runtime tested on armv7a/angstrom

Should node also drag in dependencies that npm *might* need for some
packages? I've come across npm packages that need 'git' and
'python-compiler', should I add those to RRECOMMENDS_${PN}?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRCSZiMkyGM64RGpERAotmAJ0WeNvsakI9gE4ftDE4sUnumRBzIwCgr6PS
R/2Uo7V+JOAItM1a9kTaIUc=
=mMcU
-----END PGP SIGNATURE-----



