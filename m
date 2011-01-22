Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PgbCu-0003py-Bz for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 12:00:36 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PgbCD-0005fI-1K for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 11:59:53 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 11:59:53 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 11:59:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 22 Jan 2011 11:59:42 +0100
Message-ID: <ihedau$stf$1@dough.gmane.org>
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
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
X-List-Received-Date: Sat, 22 Jan 2011 11:00:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-01-11 01:01, Lars Michelsen wrote:

> +	# Ensure matching ffmpeg revision in sub repositories of mplayer source
> +	#
> +	# It seems that the directories which are fetched from other repositories
> +	# get always the newest revision. This is not good for this build since
> +	# mplayer and ffmpeg code needs to fit.
> +	# So we go to the subdirs and checkout the ffmpeg revision fitting our
> +	# mplayer rev.
> +	cd ffmpeg && \
> +	svn up -r 25825 && \
> +	cd ..
> +

NAK, we don't alllow network access from inside the recipe.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNOrieMkyGM64RGpERArUuAJ9IATbAbEL74Dpv6MUZ8rcB1jFsYACcCfgl
IpiOohDrqhgxSp5iRk6Ttn8=
=rnkw
-----END PGP SIGNATURE-----



