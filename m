Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A2F4265DEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 08:48:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2014 01:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,553,1406617200"; d="scan'208";a="602096552"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.139])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2014 01:48:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 19 Sep 2014 09:48:16 +0100
Message-ID: <23138750.MHktKfaJby@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <541B8EB5.9030700@windriver.com>
References: <1410875680-1588-1-git-send-email-liezhi.yang@windriver.com>
	<54184BA6.9020907@windriver.com> <541B8EB5.9030700@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] mariadb: drop anonymous function
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
X-List-Received-Date: Fri, 19 Sep 2014 08:48:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 September 2014 10:02:29 Robert Yang wrote:
> On 09/16/2014 10:39 PM, Robert Yang wrote:
> > On 09/16/2014 10:30 PM, Paul Eggleton wrote:
> >> Hi Robert,
> >> 
> >> On Tuesday 16 September 2014 06:54:40 Robert Yang wrote:
> >>> The anonymous function redefined bindir to bindir_noprefix (and others),
> >>> which broke the sstate between build dirs. After checked the vars in
> >>> CMakeCache.txt, we can drop it safely, and the builds are OK.
> >>> 
> >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>> ---
> >>> 
> >>>   meta-oe/recipes-support/mysql/mariadb_5.5.39.inc |   28
> >>> 
> >>> +++++++--------------- 1 file changed, 8 insertions(+), 20 deletions(-)
> >>> 
> >>> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> >>> b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc index
> >>> 9cc2cc9..f5c0a1f
> >>> 100644
> >>> --- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> >>> +++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> >>> @@ -35,18 +35,6 @@ SYSTEMD_AUTO_ENABLE_mariadb-server = "disable"
> >>> 
> >>>   EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
> >>> 
> >>> -python __anonymous() {
> >>> -    # This is a pain but it's the only way to pass these in since
> >>> -    # MariaDB's cmake scripts insist on prepending the prefix to the
> >>> -    # specified values for INSTALL_*
> >>> -    localdata = d.createCopy()
> >>> -    localdata.setVar('prefix', '')
> >>> -    localdata.setVar('exec_prefix', '')
> >>> -    d.setVar('bindir_noprefix', localdata.getVar('bindir',
> >>> True).lstrip('/')) -    d.setVar('sbindir_noprefix',
> >>> localdata.getVar('sbindir', True).lstrip('/')) -
> >>> d.setVar('datadir_noprefix', localdata.getVar('datadir',
> >>> True).lstrip('/'))
> >>> -    d.setVar('libdir_noprefix', localdata.getVar('libdir',
> >>> True).lstrip('/')) -}
> >>> 
> >>>   PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> >>>   'pam',
> >>> 
> >>> '', d)}" PACKAGECONFIG_class-native = ""
> >>> @@ -64,15 +52,15 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
> >>> 
> >>>                    -DNROFF=FALSE \
> >>>                    -DENABLE_DTRACE=FALSE \
> >>>                    -DWITH_PIC=ON \
> >>> 
> >>> -                 -DINSTALL_DOCDIR:PATH=${datadir_noprefix}/doc/${BPN} \
> >>> -                 -DINSTALL_BINDIR:PATH=${bindir_noprefix} \
> >>> -                 -DINSTALL_SBINDIR:PATH=${sbindir_noprefix} \
> >>> -                 -DINSTALL_SCRIPTDIR:PATH=${bindir_noprefix} \
> >>> -                 -DINSTALL_LIBDIR:PATH=${libdir_noprefix} \
> >>> -                 -DINSTALL_PLUGINDIR:PATH=${libdir_noprefix}/plugin \
> >>> +                 -DINSTALL_DOCDIR:PATH=${datadir}/doc/${BPN} \
> >>> +                 -DINSTALL_BINDIR:PATH=${bindir} \
> >>> +                 -DINSTALL_SBINDIR:PATH=${sbindir} \
> >>> +                 -DINSTALL_SCRIPTDIR:PATH=${bindir} \
> >>> +                 -DINSTALL_LIBDIR:PATH=${libdir} \
> >>> +                 -DINSTALL_PLUGINDIR:PATH=${libdir}/plugin \
> >>> 
> >>>                    -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
> >>> 
> >>> -                 -DINSTALL_MYSQLSHAREDIR:PATH=${datadir_noprefix}/mysql
> >>> \
> >>> -
> >>> -DINSTALL_SUPPORTFILESDIR:PATH=${datadir_noprefix}/mysql-support-files \
> >>> +
> >>> 
> >>>                 -DINSTALL_MYSQLSHAREDIR:PATH=${datadir}/mysql \
> >>> 
> >>> +
> >>> -DINSTALL_SUPPORTFILESDIR:PATH=${datadir}/mysql-support-files \
> >>> -DMYSQL_DATADIR:PATH=/var/mysql \
> >>> 
> >>>                    -DCAT_EXECUTABLE=`which cat` \
> >>>                    -DCMAKE_AR:FILEPATH=${AR}"
> >> 
> >> I'm pretty sure I tested this beforehand; the problem I found is that
> >> some of the scripts end up with the prefix twice in substituted paths
> >> because it is expected that the paths supplied at configuration time do
> >> not include the prefix, but our paths normally include them.
> >> 
> >> Did you do runtime tests with this change?
> > 
> > Thanks, not yet, I will do and reply later.
> 
> Hi Paul,
> 
> You are right, there are problems when runtime testing. I will try to fix
> it in another way, we need fix it is because it breaks the sstate which
> depends on mariadb. (and several ones)

When you say it breaks sstate is that because the system is unable to see the 
dependencies between e.g. bindir_noprefix and bindir? If that's the issue then 
perhaps the answer is just to explicitly add those dependencies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

