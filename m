Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RggSs-0008Dj-KO for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 18:41:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RggLs-0000jq-Sf for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 18:34:44 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 18:34:44 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 18:34:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 30 Dec 2011 18:34:24 +0100
Message-ID: <jdksmv$83n$1@dough.gmane.org>
References: <cover.1325263010.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <cover.1325263010.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH v3 0/3] Move xserver-nodm-init systemd support to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 17:41:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-12-11 17:40, Otavio Salvador schreef:
> With this patchset version addresses the complains done on mailing list.
> For people using sysvinit at list a task-x11 needs a virtual runtime
> override to avoid bringing systemd as dependency.
> 
> The following changes since commit
> 2642db3615ea2d4196b9c73537d9ebff6c57de2d:
> 
> dialog: add 1.1-20111020 recipe (dynamic and static) (2011-12-24 19:07:53
> +0100)
> 
> are available in the git repository at: 
> git://github.com/OSSystems/meta-oe master 
> https://github.com/OSSystems/meta-oe/tree/master
> 
> Otavio Salvador (3): xserver-nodm-init: move systemd service to
> xserver-nodm-init-systemd meta-efl: elsa: rconflicts/rreplaces
> xserver-nodm-init-systemd task-x11: use xserver-nodm-init-systemd

Still missing a few:

koen@dominion:/OE/tentacle/sources/openembedded-core$ for i in ../* ; do
echo $(basename $PWD); git grep xserver-nodm-init | grep -v
distro_tracking_fields ; cd $i ; done
openembedded-core
meta/conf/multilib.conf:BBCLASSEXTEND_append_pn-xserver-nodm-init = "
${MULTILIBS}"
meta/recipes-sato/tasks/task-core-x11.bb:# elsa, xserver-nodm-init
meta/recipes-sato/tasks/task-core-x11.bb:VIRTUAL-RUNTIME_graphical_init_manager
?= "xserver-nodm-init"
angstrom-layers
bitbake
downloads
fatal: Not a git repository (or any parent up to mount parent )
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
bash: cd: ../layers.dot: No such file or directory
downloads
fatal: Not a git repository (or any parent up to mount parent )
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
bash: cd: ../layers.txt: No such file or directory
downloads
fatal: Not a git repository (or any parent up to mount parent )
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
meta-angstrom
recipes-images/angstrom/efl-nodm-image.bb:    xserver-nodm-init \
meta-archos
meta-efikamx
meta-ettus
meta-handheld
meta-igep
meta-intel
meta-java
meta-nslu2
meta-openembedded
meta-efl/recipes-efl/efl/elsa_svn.bb:RCONFLICTS_${PN} += "xserver-nodm-init"
meta-efl/recipes-efl/efl/elsa_svn.bb:RREPLACES_${PN} += "xserver-nodm-init"
meta-efl/recipes-efl/efl/elsa_svn.bb:RCONFLICTS_${PN}-systemd +=
"xserver-nodm-init"
meta-efl/recipes-efl/efl/elsa_svn.bb:RREPLACES_${PN}-systemd +=
"xserver-nodm-init"
meta-oe/recipes-core/tasks/task-x11_1.0.bb:# elsa, xserver-nodm-init
meta-oe/recipes-core/tasks/task-x11_1.0.bb:VIRTUAL-RUNTIME_graphical_init_manager
?= "xserver-nodm-init"
meta-openpandora
meta-shr
meta-smartphone
meta-shr/conf/distro/shr.conf:VIRTUAL-RUNTIME_graphical_init_manager =
"xserver-nodm-init"
meta-ti
recipes-misc/images/cloud9-gfx-image.bb:                  xserver-nodm-init \
meta-xilinx
koen@dominion:/OE/tentacle/sources/openembedded-core$

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk799hwACgkQMkyGM64RGpG8DQCgpTLLLUbtp26ogHNk2/8n7Nfa
b1EAnRCmkeEZ1O4xDGc+qODwYCtrh0QU
=n0r9
-----END PGP SIGNATURE-----



