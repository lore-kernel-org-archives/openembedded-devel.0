Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id B74177D27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 17:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DF5E40C4C;
	Tue,  3 Dec 2019 17:21:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dz8pLUrwu9Ny; Tue,  3 Dec 2019 17:21:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 64C2240C49;
	Tue,  3 Dec 2019 17:21:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0C0BB174336; Tue,  3 Dec 2019 12:21:37 -0500 (EST)
Date: Tue, 3 Dec 2019 12:21:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191203172136.GS4735@denix.org>
References: <cover.1575137343.git.akuster808@gmail.com>
	<CAMKF1spELhX7gHHXJd88bS9n9ezCrsh+b7ZM+pn+5zcjXBDkvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spELhX7gHHXJd88bS9n9ezCrsh+b7ZM+pn+5zcjXBDkvQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Zeus patch review
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2019 17:21:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 30, 2019 at 10:22:18AM -0800, Khem Raj wrote:
> On Sat, Nov 30, 2019 at 10:11 AM Armin Kuster <akuster808@gmail.com> wrote:
> >
> > Please have comments back by Tuesday
> >
> > The following changes since commit aad5b3d070cd8c58828b0975cf861d8ebc90f460:
> >
> >   README: updated Maintainers list for Zeus (2019-10-30 14:16:04 -0700)
> >
> > are available in the git repository at:
> >
> >   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
> >   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
> >
> > Andreas Oberritter (1):
> >   samba: fix installation for minimal build
> >
> > Hongxu Jia (1):
> >   python-more-itertools.inc: fix python2 package not incorrectly
> >     generated
> >
> > Khem Raj (1):
> >   rsyslog: Dont force enable atomic builtins on mips
> >
> > Michael Scott (1):
> >   modemmanager: Upgrade 1.10.6 -> 1.10.8
> >
> > Slater, Joseph (1):
> >   php: fix CVE-2019-11043
> >
> > Stefan Wiehler (1):
> >   nvme-cli: defer host ID generation to post installation
> >
> > Trevor Gamblin (3):
> >   rsyslog: fix CVE-2019-17041
> >   rsyslog: upgrade from v8.1908.0 to v8.1910.0
> >   quagga: fix PIDFile path for service files
> >
> > Yi Zhao (2):
> >   samba: upgrade 4.10.8 -> 4.10.10
> >   freeradius: fix CVE-2019-10143
> >
> > Zheng Ruoqin (2):
> >   mariadb: upgrade 10.3.16 -> 10.3.18
> >   wireshark: upgrade 3.0.3 -> 3.0.6
> >
> > niko.mauno@vaisala.com (2):
> >   gitpkgv.bbclass: Use --git-dir option
> >   gitpkgv.bbclass: Support also lightweight tags
> >
> 
> this list looks good to me.

Also missed mbedtls for armv5te breakage.

Denys


> >  ...-to-radiusd-user-group-when-rotating-logs.patch | 104 +++++++++++++++++++++
> >  .../freeradius/freeradius_3.0.19.bb                |   1 +
> >  .../samba/{samba_4.10.8.bb => samba_4.10.10.bb}    |  20 ++--
> >  .../recipes-protocols/quagga/files/bgpd.service    |   4 +-
> >  .../recipes-protocols/quagga/files/ospf6d.service  |   4 +-
> >  .../recipes-protocols/quagga/files/ospfd.service   |   4 +-
> >  .../recipes-protocols/quagga/files/ripd.service    |   4 +-
> >  .../recipes-protocols/quagga/files/ripngd.service  |   4 +-
> >  .../recipes-protocols/quagga/files/zebra.service   |   4 +-
> >  .../{wireshark_3.0.3.bb => wireshark_3.0.6.bb}     |   4 +-
> >  meta-oe/classes/gitpkgv.bbclass                    |  15 ++-
> >  meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb       |   5 +-
> >  ...demmanager_1.10.6.bb => modemmanager_1.10.8.bb} |   4 +-
> >  ...native_10.3.16.bb => mariadb-native_10.3.18.bb} |   0
> >  meta-oe/recipes-dbs/mysql/mariadb.inc              |   4 +-
> >  .../{mariadb_10.3.16.bb => mariadb_10.3.18.bb}     |   0
> >  .../recipes-devtools/php/php/CVE-2019-11043.patch  |  38 ++++++++
> >  meta-oe/recipes-devtools/php/php_7.3.9.bb          |   1 +
> >  .../rsyslog/rsyslog/0001-Out-of-bounds-issue.patch |  31 ------
> >  .../{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}   |   6 +-
> >  .../python/python-more-itertools.inc               |   2 -
> >  21 files changed, 186 insertions(+), 73 deletions(-)
> >  create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
> >  rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb => samba_4.10.10.bb} (95%)
> >  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb} (95%)
> >  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb} (92%)
> >  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb} (100%)
> >  rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb} (100%)
> >  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
> >  delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
> >  rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (97%)
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

