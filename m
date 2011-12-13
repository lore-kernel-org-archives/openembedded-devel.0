Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RaXSm-00087n-E1 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 19:52:28 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RaXM4-0000xD-7z for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 19:45:32 +0100
Received: from host86-139-215-125.range86-139.btcentralplus.com
	([86.139.215.125]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 19:45:32 +0100
Received: from koen by host86-139-215-125.range86-139.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 19:45:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 13 Dec 2011 18:45:21 +0000
Message-ID: <jc86fu$pem$1@dough.gmane.org>
References: <cover.1323772986.git.otavio@ossystems.com.br>
	<dd9bd4910b7278f024c9602b8d0cc162efc485fa.1323772987.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: host86-139-215-125.range86-139.btcentralplus.com
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <dd9bd4910b7278f024c9602b8d0cc162efc485fa.1323772987.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH 3/4] dropbear: bump epoch to ensure an upgrade path and cleanup packaging
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
X-List-Received-Date: Tue, 13 Dec 2011 18:52:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-12-11 10:43, Otavio Salvador schreef:
> An old package called dropbear-systemd, at version v1, might be available
> on the feed and thus our binary package won't be used. To fix this the
> epoch has been bumped to 1.
> 
> The symbolic link required to disable the sysvinit init script is now 
> done during the do_install task so making the recipe simple.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> .../dropbear/dropbear_2011.54.bbappend             |   11 +++-------- 1
> files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
> b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend index
> 874a7d4..3f2fa29 100644 ---
> a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend +++
> b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend @@ -1,5 +1,7
> @@ inherit systemd
> 
> +PE = "1"

I'd really like to avoid PE in bbappends for obvious reasons. Can we get
this into OE-core instead?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7nnT8ACgkQMkyGM64RGpFQvwCgnk3I8913J+gJDNvLyseDcPvo
a94Anji8g64EOfO/dGvomaPUybz0O412
=iKue
-----END PGP SIGNATURE-----



