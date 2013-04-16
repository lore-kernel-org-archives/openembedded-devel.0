Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1US42h-0000NE-7g for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:27:39 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1US3lm-0004Qj-7C for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:09:50 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 13:09:50 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 13:09:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 13:09:46 +0200
Message-ID: <kkjbhk$h9r$1@ger.gmane.org>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 11:27:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-04-13 12:53, Paul Eggleton schreef:
> This moves most of the remaining networking recipes in meta-oe to 
> meta-networking, with some additional tidying up.
> 
> 
> The following changes since commit
> a45830a39bb47a9eab27980d52966226c9504ea4:
> 
> recipes: Unify indentation (2013-04-15 16:23:17 +0200)
> 
> are available in the git repository at:
> 
> git://git.openembedded.org/meta-openembedded-contrib
> paule/meta-networking-moves2 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-networking-moves2
>
>  Paul Eggleton (9): vsftpd: move from meta-oe to meta-networking and
> tweak openvpn: move to meta-networking and tweak bridge-utils: move to
> meta-networking and tweak rp-pppoe: move from meta-oe to meta-networking
> and tweak dnsmasq: move to meta-networking and tweak ipsec-tools: move to
> meta-networking and tweak strongswan: move to meta-networking atftp: move
> to meta-networking and tweak

These look good to me, but

> iw: move to meta-networking and update

This is receferenced by a packagegroup in meta-oe:

	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \


With the 'meta-oe shall only depend on oe-core' rule, iw can't get moved to
meta-networking. Since iw is replacing wireless-tools I think it should move
to OE-core instead.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRbTF6MkyGM64RGpERApLoAJ9VE1iFJzYL0mXye+f+VQnukWJIqgCgtDzn
jRT3AEDi+XnA5L15qYPqkrw=
=kUrm
-----END PGP SIGNATURE-----



