Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8B03170295
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:08:38 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X6yiy-0001jZ-Hb for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2014 11:08:36 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:08:36 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:08:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Jul 2014 11:08:26 +0200
Message-ID: <lq2r2a$kla$1@ger.gmane.org>
References: <1405402285-29775-1-git-send-email-akuster@mvista.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1405402285-29775-1-git-send-email-akuster@mvista.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] [v3] lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 09:08:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Armin Kuster schreef op 15-07-14 07:31:
> update to version r119 Use github instead of svn LICENSE md5sum changed
> since it was updated in r117

Good to know when it was changed, but I'm more interested in *what* changed.

> FIxes CVE-2014-4611
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com> --- 
> meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 ++++------- 1
> file changed, 4 insertions(+), 7 deletions(-) rename
> meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (68%)
> 
> diff --git a/meta/recipes-support/lz4/lz4_svn.bb
> b/meta/recipes-support/lz4/lz4_git.bb similarity index 68% rename from
> meta/recipes-support/lz4/lz4_svn.bb rename to
> meta/recipes-support/lz4/lz4_git.bb index 38e36d8..3978d76 100644 ---
> a/meta/recipes-support/lz4/lz4_svn.bb +++
> b/meta/recipes-support/lz4/lz4_git.bb @@ -2,15 +2,12 @@ SUMMARY =
> "Extremely Fast Compression algorithm" DESCRIPTION = "LZ4 is a very fast
> lossless compression algorithm, providing compression speed at 400 MB/s
> per core, scalable with multi-cores CPU. It also features an extremely
> fast decoder, with speed in multiple GB/s per core, typically reaching
> RAM speed limits on multi-core systems."
> 
> LICENSE = "BSD" -LIC_FILES_CHKSUM =
> "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
> 
> -# Upstream names releases after SVN revs -SRCREV = "112" -PV =
> "r${SRCREV}" +SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558" 
> +SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
> 
> -SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http" - 
> -S = "${WORKDIR}/trunk" +S = "${WORKDIR}/git"
> 
> EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir}
> INCLUDEDIR=${includedir}"
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTxO+KMkyGM64RGpERAnrdAJ9H8ZZGNxbZ7hGQd3sL8xKMhJ6v6wCdGKcf
r8Kx6H0IJOr+2LDz7XAKVzo=
=CNTg
-----END PGP SIGNATURE-----


