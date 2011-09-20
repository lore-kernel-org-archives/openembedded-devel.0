Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5u3T-0005K9-8B for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 08:43:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5tyO-0000ZO-48 for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 08:38:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2011 08:38:28 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2011 08:38:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Sep 2011 08:38:09 +0200
Message-ID: <j59cch$2vn$1@dough.gmane.org>
References: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][PATCH 1/3] udev: make the dev cache work with /dev/shm
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
X-List-Received-Date: Tue, 20 Sep 2011 06:43:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-09-11 23:56, Andrea Adami schreef:
> * At this point in the boot process we may not have a writable /tmp *
> directory.  We will have a writable /dev/shm and the data we need * is
> small enough that we use this directory. * * Patch was committed in the
> openembedded git server with commit id *
> ca688dd2de58dbec865ac7e70fab4d2c373ad822
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com> Signed-off-by: Andrea Adami
> <andrea.adami@gmail.com>

The caching isn't needed anymore, so I'll take a patch that removes it
completely :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOeDTRMkyGM64RGpERAo1VAKC89mncrzEj0GhHFbGnxxC6wbEZMwCcDKWJ
V5hYsvrURq1Ox4T681yVH48=
=Dg5h
-----END PGP SIGNATURE-----



