Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ps8Jv-0000SS-0X for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 07:35:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ps8If-0002eI-J6 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 07:34:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 07:34:13 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 07:34:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Feb 2011 07:33:58 +0100
Message-ID: <ik29om$8m7$1@dough.gmane.org>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Wed, 23 Feb 2011 06:35:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-02-11 19:46, Filip Zyzniewski wrote:
> The whole reposotiry is about 24MB in size and it's rarely needed
> whole. It is now splitted into bus specific subpackages (and some
> device-specific for devices on a bus like SPI or SBUS) all depended
> on by the linux-firmware package.
> 
> Suggested improvement - split bus packages furtherly into device
> packages (so that we can either pull in a whole bus or just one
> device).
> 
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
> ---
>  recipes/linux-firmware/linux-firmware_git.bb |  144 +++++++++++++++++++++++++-
>  1 files changed, 142 insertions(+), 2 deletions(-)

> +
> +FILES_${PN}-wl12xx = "/lib/firmware/ti-connectivity/wl1271-*.bin"

The wl12xx files need to go into /lib/firmware, not
/lib/firmware/ti-connectivity

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNZKpWMkyGM64RGpERAgnPAKC4Yxrzomw/SWENX3F7t329lYvW8ACePhwJ
ttjmMyrgkry0bjZh5Derjp0=
=9TpP
-----END PGP SIGNATURE-----



