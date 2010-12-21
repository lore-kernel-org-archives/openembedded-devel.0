Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PV56N-0005qN-WE for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 17:30:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PV56D-00067R-Qf for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 17:30:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 17:30:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 17:30:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Dec 2010 17:26:09 +0100
Message-ID: <ieqkf1$8ql$3@dough.gmane.org>
References: <20101221133550.GI3282@jama>
	<1292940593-22743-2-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1292940593-22743-2-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] samba: use external talloc instead of building own
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
X-List-Received-Date: Tue, 21 Dec 2010 16:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 21-12-10 15:09, Martin Jansa wrote:
> * libtalloc now conflicts with libtalloc from talloc recipe
> * tested only with samba-3.2.15
> ---
>  recipes/samba/samba.inc       |    3 ++-
>  recipes/samba/samba_3.2.15.bb |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/samba/samba.inc b/recipes/samba/samba.inc
> index a95106d..e5fa06e 100644
> --- a/recipes/samba/samba.inc
> +++ b/recipes/samba/samba.inc
> @@ -1,6 +1,6 @@
>  SECTION = "console/network"
>  LICENSE = "GPL"
> -DEPENDS = "readline virtual/libiconv"
> +DEPENDS = "readline virtual/libiconv talloc"
>  
>  SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
>             file://volatiles.03_samba \
> @@ -37,6 +37,7 @@ EXTRA_OECONF='--disable-cups \
>                --with-mandir=${mandir} \
>                --with-swatdir=${datadir}/swat \
>                --with-aio-support \
> +              --without-libtalloc \
>                samba_cv_struct_timespec=yes \
>                libreplace_cv_HAVE_MMAP=${SAMBAMMAP}'
>  
> diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
> index 3f535b6..ef2707e 100644
> --- a/recipes/samba/samba_3.2.15.bb
> +++ b/recipes/samba/samba_3.2.15.bb
> @@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
>  SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
>  SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  EXTRA_OECONF += "\
>  	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNENUhMkyGM64RGpERAlOOAJ9y27X2rICdmXw/uija6QDTyFEzyQCeMcac
wsIjyIKY6gnmpIbwvh9qjrw=
=8Xom
-----END PGP SIGNATURE-----



