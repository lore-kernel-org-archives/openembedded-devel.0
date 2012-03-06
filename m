Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4jnC-0003lk-Pg
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 03:06:26 +0100
Received: by dady9 with SMTP id y9so5527620dad.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 17:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.237.66 as permitted sender) client-ip=10.68.237.66; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.237.66 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.237.66])
	by 10.68.237.66 with SMTP id va2mr43709054pbc.32.1330999066874
	(num_hops = 1); Mon, 05 Mar 2012 17:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VmA11wOxe7VQe6QozvXDp/LRkXdS8Vj9qgNhW3n/0EI=;
	b=Gjbm7gc6Xxq1+2xIu6ckKytKG6Hk28V/j2Kr31hxP4nW14kw57Yf35W9po1UuyfKhP
	vYqlHfR0qu52OUq8DDw/eZZZ3PXV5NIXQOVtRd8rUKHkF36zPcdQilfRggGZYLzAv7tC
	Qb3FUIrLb3rpV5Xtu5kgqRye9yPkiTEgeqdRd4eyxMzu7ebcAlzWfe2UX7TObECpnoCa
	VoNyKZRMTpKDdIRdrlqPUdglk2xaiEcPOnkVq7v0w2jrbmdsHshM+/5Av5HMc1weyeTs
	bkhFNhELEpFCyL67uMmCp2uapiMTSEZmca8DXBqMXD2BoHlnwN5dWnx0LIARN4M459s4
	2hhg==
Received: by 10.68.237.66 with SMTP id va2mr37788380pbc.32.1330999066711;
	Mon, 05 Mar 2012 17:57:46 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f7sm5934197pbr.3.2012.03.05.17.57.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 17:57:45 -0800 (PST)
Date: Mon, 5 Mar 2012 17:59:41 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120306015941.GC6841@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1330980801-19523-1-git-send-email-tworaz666@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1330980801-19523-1-git-send-email-tworaz666@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe] zsh: Add initial recipe for version 4.3.17.
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
X-List-Received-Date: Tue, 06 Mar 2012 02:06:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/03/12 21:53), Peter Tworek wrote:
> Run tested on netbook pro.
> 
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
>  meta-oe/recipes-extended/zsh/zsh_4.3.17.bb |   51 ++++++++++++++++++++++++++++
>  1 files changed, 51 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
> 
> diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
> new file mode 100644
> index 0000000..9192f20
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION = "UNIX Shell similar to the Korn shell"
> +HOMEPAGE="http://www.zsh.org"
> +SECTION = "base/shell"
> +
> +LICENSE = "ZSH"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
> +
> +DEPENDS = "ncurses libcap libpcre gdbm groff-native"
> +
> +SRC_URI = "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
> +SRC_URI[md5sum] = "8258967060b2654f30001a011946ac6a"
> +SRC_URI[sha256sum] = "054e0452afd9c742c9f1489465175e1d4d7db50d88b602d132551d850cf7a704"
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
> +    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
> +    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
> +    "
> +
> +inherit autotools
> +
> +EXTRA_OECONF = " \
> +    --bindir=${base_bindir} \
> +    --enable-etcdir=${sysconfdir} \
> +    --enable-fndir=${datadir}/${PN}/${PV}/functions \
> +    --enable-site-fndir=${datadir}/${PN}/site-functions \
> +    --enable-function-subdirs \
> +    --with-term-lib='ncursesw ncurses' \
> +    --with-tcsetpgrp \
> +    --enable-pcre \
> +    --enable-cap \
> +    --enable-multibyte \
> +    --enable-gdbm \
> +    --enable-dynamic \
> +    zsh_cv_shared_environ=yes \
> +    "
> +
> +do_configure () {
> +    oe_runconf
> +}
> +

why do you need to run oe_runconf explicitly.


