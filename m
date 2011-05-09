Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJWE2-00047q-6G for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:34:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJWBO-0006zc-2z for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:31:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 21:31:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 21:31:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 09 May 2011 21:31:38 +0200
Message-ID: <iq9feq$rn7$1@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] Pull request for misc changes
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
X-List-Received-Date: Mon, 09 May 2011 19:34:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-05-11 21:19, Otavio Salvador wrote:
> Hello,
> 
> On the process of migrating our products to oe-core we have done some
> changes up to now...

I've merge the 12 patches and I'm doing some final sanity checking
before pushing them.

Thanks for addressing all the review comments!

regards,

Koen

> 
> The following changes since commit 1325cc262c3f1e3cb5153aff98287ea8c65b15cf:
> 
>   gcc-4.5: add checksums (2011-05-02 11:10:30 +0200)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe master
> 
> Otavio Salvador (8):
>       fuse: add 2.8.5
>       ntfs-3g-ntfsprogs: add 2011.4.12 recipes
>       setxkbmap: add 1.2.0 version
>       freerdp: add recipe based on GIT from 2009-03-29
>       pixman.inc: use Xorg mirror
>       p910nd: add 0.95 version
>       libiconv: drop hack since gettext was being inherited
>       libinih: add git recipe
> 
>  .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 +++
>  meta-oe/recipes-graphics/xorg-lib/pixman.inc       |    2 +-
>  meta-oe/recipes-support/freerdp/freerdp.inc        |   23 +++++++++
>  meta-oe/recipes-support/freerdp/freerdp_git.bb     |   15 ++++++
>  meta-oe/recipes-support/fuse/fuse_2.8.5.bb         |   32 ++++++++++++
>  meta-oe/recipes-support/inih/libinih_git.bb        |   18 +++++++
>  .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +--
>  .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   25 ++++++++++
>  meta-oe/recipes-support/p910nd/files/avahi         |    9 ++++
>  meta-oe/recipes-support/p910nd/files/p910nd.init   |   38 +++++++++++++++
>  meta-oe/recipes-support/p910nd/p910nd_0.95.bb      |   51 ++++++++++++++++++++
>  11 files changed, 221 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb
>  create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb
>  create mode 100644 meta-oe/recipes-support/inih/libinih_git.bb
>  create mode 100644
> meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
>  create mode 100644 meta-oe/recipes-support/p910nd/files/avahi
>  create mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init
>  create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyEEaMkyGM64RGpERAk5jAKCxRiaYjTBeM8qo1Js0Jg3U41tROACeK3KU
YcAkvpPEjh9vwYS+31qN6fU=
=pAcB
-----END PGP SIGNATURE-----



