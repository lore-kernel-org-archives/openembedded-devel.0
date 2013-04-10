Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPy7U-0003F4-Om
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:43:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2013 09:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="284353075"
Received: from unknown (HELO helios.localnet) ([10.255.14.51])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2013 09:26:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 10 Apr 2013 17:26:12 +0100
Message-ID: <2008958.M9FfYJ4SC0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <kk438m$t0a$1@ger.gmane.org>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
	<a2eefe761b129b700bbf0a1053a05999ecb69e12.1365609345.git.paul.eggleton@linux.intel.com>
	<kk438m$t0a$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 10 Apr 2013 16:43:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 April 2013 18:16:28 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 10-04-13 17:57, Paul Eggleton schreef:
> > These changes to Qt's configuration need to be applied in distro layers,
> > not in meta-oe.
> > 
> > (We have to preserve the PRINC value to avoid PR going backwards.)
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
> > meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend |    5 -----
> > meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend |    5 ----- 2 files
> > changed, 10 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend index
> > 27cac11..d9f1c29 100644 ---
> > a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend +++
> > b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend @@ -1,6 +1 @@
> > -DEPENDS += "mysql5 postgresql sqlite" -QT_SQL_DRIVER_FLAGS =
> > "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> > -plugin-sql-sqlite2 -plugin-sql-sqlite" -QT_CONFIG_FLAGS +=
> > "-I${STAGING_INCDIR}/mysql \ -
> > -I${STAGING_INCDIR}/postgresql" - PRINC := "${@int(PRINC) + 1}" diff
> > --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend index
> > 27cac11..d9f1c29 100644 ---
> > a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend +++
> > b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend @@ -1,6 +1 @@
> > -DEPENDS += "mysql5 postgresql sqlite" -QT_SQL_DRIVER_FLAGS =
> > "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> > -plugin-sql-sqlite2 -plugin-sql-sqlite" -QT_CONFIG_FLAGS +=
> > "-I${STAGING_INCDIR}/mysql \ -
> > -I${STAGING_INCDIR}/postgresql" - PRINC := "${@int(PRINC) + 1}"
> 
> So with the reason given "I don't want to rebuilt QT when adding meta-oe" to
> remove this, this doesn't actually accomplish that. You are adding an extra
> rebuild with this.

That's the reason I don't want the bbappend to exist at all. In the absence of 
the ability to have that for now, let's at least not have the configuration 
changed and not have postgres and mysql built just by adding meta-oe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


