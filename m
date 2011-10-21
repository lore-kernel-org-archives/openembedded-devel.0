Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHGCG-0006Ga-2Y for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:35:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHG6a-0007LU-JW for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:29:52 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 16:29:52 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 16:29:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 16:29:35 +0200
Message-ID: <j7rvkf$i6m$1@dough.gmane.org>
References: <cover.1319205291.git.otavio@ossystems.com.br>
	<db76597e3a3c1e747f762e1944363700535512c3.1319205291.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <db76597e3a3c1e747f762e1944363700535512c3.1319205291.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 2/5] systemd: add systemd-initramfs
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
X-List-Received-Date: Fri, 21 Oct 2011 14:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-10-11 15:55, Otavio Salvador schreef:
> Includes a /init that points to ${base_sbin}/init that is called so to 
> avoid having to include post rootfs commands for it.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-core/systemd/systemd_git.bb |   10 ++++++++-- 1 files
> changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb
> b/meta-oe/recipes-core/systemd/systemd_git.bb index 8faedd0..f9e024b
> 100644 --- a/meta-oe/recipes-core/systemd/systemd_git.bb +++
> b/meta-oe/recipes-core/systemd/systemd_git.bb @@ -14,7 +14,7 @@ inherit
> gitpkgv PKGV = "v${GITPKGVTAG}"
> 
> PV = "git" -PR = "r0" +PR = "r1"
> 
> inherit pkgconfig autotools vala perlnative
> 
> @@ -52,9 +52,15 @@ do_install() { autotools_do_install # provided by a
> seperate recipe rm ${D}${base_libdir}/systemd/system/serial-getty* -f + +
> # provide support for initramfs +	ln -s ${base_sbindir}/init
> ${D}/systemd }

I wasn't paying attention, sorry. The above needs to be:

ln -s ${base_bindir}/systemd ${D}/init

shall I fix it myself or do you want to send a patch?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoYHPMkyGM64RGpERAtmbAJ42uS1WPeIwDl0SBUC055oZa9gnfACeNNLO
V8rl5ePtsBq4ReGOtP8g8Ho=
=sQxg
-----END PGP SIGNATURE-----



