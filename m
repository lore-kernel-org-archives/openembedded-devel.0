Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPxy9-0001dg-RB for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:33:58 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPxhJ-0008To-Mh for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:16:33 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 18:16:33 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 18:16:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 10 Apr 2013 18:16:28 +0200
Message-ID: <kk438m$t0a$1@ger.gmane.org>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
	<a2eefe761b129b700bbf0a1053a05999ecb69e12.1365609345.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <a2eefe761b129b700bbf0a1053a05999ecb69e12.1365609345.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCH v2 2/2] qt4: remove bbappend content
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
X-List-Received-Date: Wed, 10 Apr 2013 16:34:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-04-13 17:57, Paul Eggleton schreef:
> These changes to Qt's configuration need to be applied in distro layers, 
> not in meta-oe.
> 
> (We have to preserve the PRINC value to avoid PR going backwards.)
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
> meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend |    5 ----- 
> meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend |    5 ----- 2 files
> changed, 10 deletions(-)
> 
> diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend index
> 27cac11..d9f1c29 100644 ---
> a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend +++
> b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend @@ -1,6 +1 @@ 
> -DEPENDS += "mysql5 postgresql sqlite" -QT_SQL_DRIVER_FLAGS =
> "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> -plugin-sql-sqlite2 -plugin-sql-sqlite" -QT_CONFIG_FLAGS +=
> "-I${STAGING_INCDIR}/mysql \ -
> -I${STAGING_INCDIR}/postgresql" - PRINC := "${@int(PRINC) + 1}" diff
> --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend index
> 27cac11..d9f1c29 100644 ---
> a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend +++
> b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend @@ -1,6 +1 @@ 
> -DEPENDS += "mysql5 postgresql sqlite" -QT_SQL_DRIVER_FLAGS =
> "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> -plugin-sql-sqlite2 -plugin-sql-sqlite" -QT_CONFIG_FLAGS +=
> "-I${STAGING_INCDIR}/mysql \ -
> -I${STAGING_INCDIR}/postgresql" - PRINC := "${@int(PRINC) + 1}"

So with the reason given "I don't want to rebuilt QT when adding meta-oe" to
remove this, this doesn't actually accomplish that. You are adding an extra
rebuild with this.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRZZBcMkyGM64RGpERAh2tAJ44aceRHVjTRLixQw36lBM6hj6FtgCgkjqY
3/srLPdum6RLgzFzCmQRs5I=
=rQLL
-----END PGP SIGNATURE-----



