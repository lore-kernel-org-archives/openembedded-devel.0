Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPxpu-0000i8-7u for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:25:26 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPxZ6-0000GL-Pr for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:08:04 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 18:08:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 18:08:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 10 Apr 2013 18:07:59 +0200
Message-ID: <kk42oq$o6t$1@ger.gmane.org>
References: <1365407863-23360-1-git-send-email-jdk@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1365407863-23360-1-git-send-email-jdk@ti.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][meta-systemd][danny][PATCH] cloud9: add EnvironmentFile
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
X-List-Received-Date: Wed, 10 Apr 2013 16:25:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-04-13 09:57, Jason Kridner schreef:
> * Allows specification of NODE_PATH
> 
> Signed-off-by: Jason Kridner <jdk@ti.com> --- 
> .../recipes-devtools/cloud9/cloud9/cloud9.service  |    1 + 1 files
> changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git
> a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
> b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service 
> index 714b465..54a9db0 100644 ---
> a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service +++
> b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service @@
> -3,6 +3,7 @@ Description=Cloud9 IDE ConditionPathExists=|/var/lib/cloud9
> 
> [Service] +EnvironmentFile=-/etc/conf.d/node ExecStart=/usr/bin/node4
> /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
> 
> [Install]
> 


It's a bit late now, but this shouldn't go in, it introduces a gentoo-ism
(/etc/conf.d) that we don't want.

Martin, can you revert it please?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRZY5fMkyGM64RGpERAsUrAKCpirNbZj9g6fdigv2+GZUqSksGVQCeJths
zlp4sG6jcgBF1RjzikHwksw=
=6TFx
-----END PGP SIGNATURE-----



