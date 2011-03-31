Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5DwF-0006oN-NO for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:13:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5DuL-0006cR-4n for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:11:13 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 11:11:13 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 11:11:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 31 Mar 2011 11:10:56 +0200
Message-ID: <in1gf0$aun$1@dough.gmane.org>
References: <20110331074506.GB23178@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110331074506.GB23178@denix.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 09:13:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-03-11 09:45, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull these 8 commits for the external Angstrom toolchain fix,
> qt4 security advisory fix, as well as for addition of new TI machines.
> All are cherry picked from oe.dev

Merging it like this creates a few broken commits because the machines
were added first. Is that really what we want?

regards,

Koen


> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>
> ---
> 
> 
> Chase Maupin (6):
>   ti814x: Add new machine definitions
>   linux-omap3: add PSP recipe for am387x-evm
>   u-boot: Add PSP version for am387x-evm
>   sort: Add ti814x machine types
>   am-benchmarks: Add support for am387x-evm machine
>   matrix-gui: Add support for am387x-evm machine
> 
> Denys Dmytriyenko (2):
>   external-toolchain-angstrom: don't stage .la files
>   qt4: security advisory - blacklist fraudulent comodo certificates
> 
>  conf/machine/am387x-evm.conf                       |    5 +
>  conf/machine/c6a814x-evm.conf                      |    5 +
>  conf/machine/dm814x-evm.conf                       |    5 +
>  conf/machine/include/ti814x.inc                    |   26 +
>  contrib/angstrom/sort.sh                           |    2 +-
>  .../ti814x/defconfig                               | 1927 ++++++++++++++++++++
>  recipes/linux/linux-omap3_2.6.37-psp04.01.00.03.bb |   10 +
>  recipes/meta/external-toolchain-angstrom.bb        |    4 +-
>  ...klist-fraudulent-comodo-certificates-patch.diff |  134 ++
>  recipes/qt4/qt-4.6.3.inc                           |    8 +-
>  recipes/qt4/qt-4.7.1.inc                           |    3 +-
>  recipes/qt4/qt4-embedded_4.6.3.bb                  |    2 +-
>  recipes/qt4/qt4-embedded_4.7.1.bb                  |    2 +-
>  recipes/ti/am-benchmarks_1.2.bb                    |    5 +-
>  recipes/ti/matrix-gui-common.inc                   |    5 +-
>  recipes/ti/matrix-gui-e.inc                        |    5 +-
>  recipes/ti/matrix-gui.inc                          |    5 +-
>  recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb    |   14 +
>  18 files changed, 2149 insertions(+), 18 deletions(-)
>  create mode 100644 conf/machine/am387x-evm.conf
>  create mode 100644 conf/machine/c6a814x-evm.conf
>  create mode 100644 conf/machine/dm814x-evm.conf
>  create mode 100644 conf/machine/include/ti814x.inc
>  create mode 100644 recipes/linux/linux-omap3-2.6.37-psp04.01.00.03/ti814x/defconfig
>  create mode 100644 recipes/linux/linux-omap3_2.6.37-psp04.01.00.03.bb
>  create mode 100644 recipes/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
>  create mode 100644 recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNlEUgMkyGM64RGpERAhOlAJ9tJlo2fwsBqsjssEj7HAaY7kpZSACggC6j
Gb+UFuH/tfqpAutXsgc0DQk=
=jBqk
-----END PGP SIGNATURE-----



