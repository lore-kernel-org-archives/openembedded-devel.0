Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rq63j-0001xc-6k for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 17:50:55 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rq5wA-0002IU-Ln for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 17:43:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 17:43:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 17:43:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 25 Jan 2012 17:42:54 +0100
Message-ID: <jfpbee$l8a$1@dough.gmane.org>
References: <1327506238-29483-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1327506238-29483-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe] qt-4.8.0: enable sql features as in 4.7.4
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
X-List-Received-Date: Wed, 25 Jan 2012 16:50:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-01-12 16:43, Eric Bénard schreef:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Missing PR(INC) bumps

> --- meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend |    5 +++++ 
> meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend |    5 +++++ 2 files
> changed, 10 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend create mode 100644
> meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
> 
> diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
> b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend new file mode
> 100644 index 0000000..9b4ede4 --- /dev/null +++
> b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend @@ -0,0 +1,5 @@ 
> +DEPENDS += "mysql5 postgresql sqlite" +QT_SQL_DRIVER_FLAGS =
> "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> -plugin-sql-sqlite2 -plugin-sql-sqlite" +QT_CONFIG_FLAGS +=
> "-I${STAGING_INCDIR}/mysql \ +
> -I${STAGING_INCDIR}/postgresql" + diff --git
> a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
> b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend new file mode
> 100644 index 0000000..9b4ede4 --- /dev/null +++
> b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend @@ -0,0 +1,5 @@ 
> +DEPENDS += "mysql5 postgresql sqlite" +QT_SQL_DRIVER_FLAGS =
> "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> -plugin-sql-sqlite2 -plugin-sql-sqlite" +QT_CONFIG_FLAGS +=
> "-I${STAGING_INCDIR}/mysql \ +
> -I${STAGING_INCDIR}/postgresql" +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8gMQwACgkQMkyGM64RGpHsmQCfQSCWdT41PQuxdQ09EQ/CxGoS
qloAn3Hi35LbSgKL7/n6xB7BN+y+EfQh
=nOCe
-----END PGP SIGNATURE-----



