Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJ8rD-0007fH-JN for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 20:37:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJ8oY-0004e7-MV for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 20:34:46 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 20:34:46 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 20:34:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 May 2011 20:34:34 +0200
Message-ID: <iq6nnr$ppn$1@dough.gmane.org>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH v3 01/11] fuse: add version 2.8.5
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
X-List-Received-Date: Sun, 08 May 2011 18:37:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-05-11 18:41, Otavio Salvador wrote:
> This recipes is required by ntfs-3g-ntfsprogs.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/fuse/fuse_2.8.5.bb |   33 ++++++++++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb
> 
> diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.5.bb b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
> new file mode 100644
> index 0000000..3176536
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
> +HOMEPAGE = "http://fuse.sf.net"
> +SECTION = "libs"
> +LICENSE = "GPLv2"

COPYING.LIB implies an LGPL component, is the above license correct?

> +RRECOMMENDS_${PN} = "kernel-module-fuse""

RRECOMMENDS go near the bottom, and you have a stray quote at the end

> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxuI6MkyGM64RGpERAkNHAJ9xVZrpxyWeIk6wqKMLDxzRfhEYTACgmYwS
005wnOX47jtpVaw14ZzRdL0=
=sRnj
-----END PGP SIGNATURE-----



