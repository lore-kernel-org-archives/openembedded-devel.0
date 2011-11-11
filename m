Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROvUf-0002rJ-M1 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 19:06:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROvOa-00052K-B2 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 19:00:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 19:00:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 19:00:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 11 Nov 2011 18:57:20 +0100
Message-ID: <j9jnm2$r0q$2@dough.gmane.org>
References: <1321032164.26881.5.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321032164.26881.5.camel@ted>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] opkg: Ensure we use the uname/gname fields when extracting tarballs
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
X-List-Received-Date: Fri, 11 Nov 2011 18:06:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-11-11 18:22, Richard Purdie schreef:
> When extracting packages onto the target system in particular, we really 
> want to ensure the name fields in the tarball are used over and above the
> numerical uid/gid values. This patch adds this functionality to opkg and
> ensures package upgrades work correctly permission wise
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> --- diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
> b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch new file mode
> 100644 index 0000000..885f75f --- a/dev/null +++
> b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch @@ -0,0 +1,85
> @@ +When updating packages on the target device we ideally want to match
>  +user and group numbers from the existing file system. This patch
> encourages +opkg to lookup the uname/gname fields first and only use the
> hardcoded +numerical values if that fails.

This seems to be missing the upstream-status field

> +RP 11/11/11

UK or US date notation?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk69YgAACgkQMkyGM64RGpHBwwCfVPVYgFkPIrJRfbCprw96V7FC
kJEAn2K8LvKBG+NsStT9dCeAuvkCVX9O
=zJCW
-----END PGP SIGNATURE-----



