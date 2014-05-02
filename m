Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4583D606E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:38:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wg8yr-00029g-AT for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2014 10:38:05 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 10:38:05 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 10:38:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 May 2014 10:37:54 +0200
Message-ID: <ljvlh1$abb$1@ger.gmane.org>
References: <1399019186-19483-1-git-send-email-koen.kooi@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1399019186-19483-1-git-send-email-koen.kooi@linaro.org>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCHv4] git: fix perl binding installation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 08:38:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Wrong mailinglist, sorry. This is what happens when you run out of regular
coffee and have a decaf in the morning!

Koen Kooi schreef op 02-05-14 10:26:
> Git.pm wasn't ending up in the package because do_install removed it with
> a misleading comment about multilib. Workaround the problem so that
> Git.pm ends up in the correct dir *and* doesn't get deleted.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org> --- 
> meta/recipes-devtools/git/git.inc | 7 ++++++- 1 file changed, 6
> insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/git/git.inc
> b/meta/recipes-devtools/git/git.inc index 73e11eb..178b768 100644 ---
> a/meta/recipes-devtools/git/git.inc +++
> b/meta/recipes-devtools/git/git.inc @@ -28,10 +28,14 @@ do_install () { 
> template_dir=${datadir}/git-core/templates \ 
> GIT_PYTHON_DIR=${D}${datadir}/git-core/python
> 
> +	cd ${B}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir} + #
> ${libdir} is not applicable here, perl-native files are always #
> installed to /usr/lib on both 32/64 bits targets. +	# Fix up build paths
> and point to target locations. +	mv
> ${D}${exec_prefix}/lib/perl-native/perl ${D}${exec_prefix}/lib/perl +	sed
> -i -e s:${D}::g ${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist rm -rf
> ${D}${exec_prefix}/lib/perl-native -	rmdir ${D}${exec_prefix}/lib ||
> true }
> 
> PERLSEDFIXUP = " \ @@ -75,6 +79,7 @@ PERLTOOLS = " \ PACKAGES =+
> "${PN}-perltools" FILES_${PN}-perltools += " \ ${PERLTOOLS} \ +
> ${prefix}/lib/perl \ ${datadir}/perl \ " RDEPENDS_${PN}-perltools =
> "${PN} perl perl-module-file-path liberror-perl findutils"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTY1liMkyGM64RGpERAhjOAJ92r2TtyxOFLDc7sj8VVmpUiJzhOgCgthGJ
EItT7lT4ZV5WAdjSxyO8Ttk=
=oLc+
-----END PGP SIGNATURE-----


