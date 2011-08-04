Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qosl9-0006PV-1Y for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 09:54:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qosgv-0006IC-Oj for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 09:50:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 09:50:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 09:50:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 04 Aug 2011 09:45:40 +0200
Message-ID: <j1din4$v7t$1@dough.gmane.org>
References: <1312440823-27671-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1312440823-27671-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH] systemd: Link with librt explicitly on uclibc
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
X-List-Received-Date: Thu, 04 Aug 2011 07:54:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-08-11 08:53, Khem Raj schreef:
> Latest systemd has started to use mq_* functions which are found on librt in uclibc.

I'm testing v33 + buildfix (http://cgit.freedesktop.org/systemd/commit/?id=612e58b45b84eda7e1f2a82fdfc006f1ae421cb5) right now, can you resubmit after that went in?

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- meta-oe/recipes-core/systemd/systemd_git.bb |    2 ++ 1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb index af4a9ae..fd9bfbd 100644 --- a/meta-oe/recipes-core/systemd/systemd_git.bb +++ b/meta-oe/recipes-core/systemd/systemd_git.bb @@ -29,6 +29,8 @@ UCLIBCPATCHES_libc-uclibc =
> "file://paper-over-mkostemp.patch \ file://format-replace-m-uclibc.patch \ "
> 
> +LDFLAGS_libc-uclibc_append = " -lrt" + S = "${WORKDIR}/git"
> 
> SYSTEMDDISTRO ?= "debian"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOOk4jMkyGM64RGpERAvTWAJ9nKbzS/bkAoUfbu+jzHSZQ7lCAZgCfR3rY
Knrm/e7PSQQZoTdXqKXJBQk=
=dJ5W
-----END PGP SIGNATURE-----



