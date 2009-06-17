Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MGuAL-0005EF-NU
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 14:22:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MGu0F-00008M-9c
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 12:12:31 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 12:12:31 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 12:12:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Jun 2009 14:12:18 +0200
Message-ID: <h1amj3$to4$1@ger.gmane.org>
References: <1245240442-32628-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <1245240442-32628-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] fbprogress: make it work better
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
X-List-Received-Date: Wed, 17 Jun 2009 12:22:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-06-09 14:07, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> - images are kept in /usr/share/fbprogress
> - proper framebuffer is used
> - include paths and libraries to link with are given in recipe instead
>    of makefile
>
> Signed-off-by: Marcin Juszkiewicz<marcin@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/fbprogress/fbprogress_1.1.bb |   19 +++++++++++--------
>   1 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/recipes/fbprogress/fbprogress_1.1.bb b/recipes/fbprogress/fbprogress_1.1.bb
> index 8d603b8..855d1ca 100644
> --- a/recipes/fbprogress/fbprogress_1.1.bb
> +++ b/recipes/fbprogress/fbprogress_1.1.bb
> @@ -3,8 +3,8 @@ AUTHOR = "Angel Roman"
>   HOMEPAGE = "http://www.buglabs.net/"
>   LICENSE = "GPL"
>   DEPENDS = "freetype zlib virtual/kernel"
> -SRCREV = "9118"
> -PR = "r1"
> +SRCREV = "9405"
> +PR = "r2"
>
>   SRC_URI = "svn://svn.buglabs.net/bug/trunk;module=com.buglabs.bug.native.fbprogress;proto=svn \
>              file://fbprogress-init"
> @@ -13,14 +13,17 @@ S = "${WORKDIR}/com.buglabs.bug.native.fbprogress"
>
>   inherit update-rc.d
>
> -EXTRA_OEMAKE = "BUG_LINUX_SRC=${STAGING_KERNEL_DIR}"
> +TARGET_CXXFLAGS += "-I${STAGING_INCDIR}/freetype2 -I${STAGING_KERNEL_DIR}/include"
> +TARGET_LDFLAGS  += "-L${STAGING_LIBDIR} -lfreetype -lz"
>
>   do_install() {
> -  install -d ${D}/${sysconfdir}/fbprogress
> -  install -m 0644 ${S}/images/* ${D}/${sysconfdir}/fbprogress/
> -  install -d ${D}${layout_bindir}
> -  install -m 0755 fbprogress ${D}${layout_bindir}
> -  install -m 0755 fbprogress.sh ${D}${layout_bindir}
> +  install -d ${D}/${datadir}/fbprogress
> +  install -m 0644 ${S}/images/* ${D}/${datadir}/fbprogress/
> +
> +  install -d ${D}${bindir}
> +  install -m 0755 fbprogress ${D}${bindir}
> +  install -m 0755 fbprogress.sh ${D}${bindir}
> +
>     install -d ${D}/${sysconfdir}/init.d
>     install -m 0755 ${WORKDIR}/fbprogress-init ${D}/${sysconfdir}/init.d/fbprogress
>   }




