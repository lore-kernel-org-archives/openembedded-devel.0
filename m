Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 41A6D72366
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:42:17 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so15149112wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 01:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XX/wHl36FHOA9q6pSz5RFoZI+IVF67ibsheJZY0pQLo=;
	b=hU0bluOFKBmLSrshbVHJHkk7Jx3EMoexAo030va3QYuJyBR7mO4RBxzu0cqNevUzZA
	n72UGksc78YRNWvnmO5lXCl82LndMSQ04pfJ9mjvuxe30/xISd1MUyHwHPqMZlNo+ohn
	bIIlEikjVe12U88w33gI/tYyeL7NFZxIS+N12fdpEBP5uDf41t+Ebpi4Dm1wHjdDS+HG
	Y+zGjQ1UVNuoPx3d2ZDdCpuRg0qUG9Jl2nqtmeHEVef8BfwvYWpMGOh+tnBGtN8m68AS
	d68av2C3JZxZckeNBfrJD8yyunSNnq7VyeX5oGzQVxblNHZUxj9ljaK1rMBiTYe1geSs
	mbvg==
X-Gm-Message-State: ALoCoQlWi9cuZC7tl0EAFoAi4qyTo69iW+abC4wKDDb7f9kYxfEy1X/vZ1DhXtT9Y6SspiVEMthr
X-Received: by 10.180.107.193 with SMTP id he1mr48312657wib.27.1417081337485; 
	Thu, 27 Nov 2014 01:42:17 -0800 (PST)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id d2sm9907600wjs.32.2014.11.27.01.42.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Nov 2014 01:42:16 -0800 (PST)
Message-ID: <5476F1AB.3000507@dominion.thruhere.net>
Date: Thu, 27 Nov 2014 10:40:59 +0100
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1417079962-3455-1-git-send-email-qianl.fnst@cn.fujitsu.com>
In-Reply-To: <1417079962-3455-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH v3] tiptop: Add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Nov 2014 09:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Qian Lei schreef op 27-11-14 10:19:
> Tiptop is a performance monitoring tool for Linux. It provides a dynamic
> real-time view of the tasks running in the system. Tiptop is very similar
> to the top utility, but most of the information displayed comes from
> hardware counters.
> 
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com> --- 
> meta-oe/recipes-extended/tiptop/tiptop_2.2.bb | 26
> ++++++++++++++++++++++++++ 1 file changed, 26 insertions(+) create mode
> 100644 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> 
> diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb new file mode 100644 
> index 0000000..126976c --- /dev/null +++
> b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb @@ -0,0 +1,26 @@ +SUMMARY
> = "Hardware performance monitoring counters" +HOMEPAGE =
> "http://tiptop.gforge.inria.fr/" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" +DEPENDS = "ncurses
> libxml2" + +SRC_URI =
> "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz" +SRC_URI[md5sum] =
> "74255a29acf44569db021b080ad3e3f7" +SRC_URI[sha256sum] =
> "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86bed8a16aa96b171d" + 
> +inherit autotools-brokensep +EXTRA_OECONF = "CFLAGS="$CFLAGS
> -I${STAGING_INCDIR}/libxml2"" +COMPATIBLE_HOST =
> "(i.86|x86_64|arm|powerpc).*-linux"

What's broken on mips, armv8 and avr32?

> + +do_configure_prepend () { +    # Two bugs in configure.ac when
> cross-compiling. +    # 1. The path of libxml2. Specify it in
> EXTRA_OECONF. +    # 2. hw's value on other platforms. Replace it if the
> target is +    #    not i*86/x86_64. +    if ( echo "${TARGET_ARCH}" |
> grep -q -e 'i.86' -e 'x86_64' ); then +        sed -i 's=
> -I/usr/include/libxml2=='    ${S}/configure.ac +    else +        sed -i
> 's/hw=`uname -m`/hw="unknown"/'  ${S}/configure.ac +        sed -i 's=
> -I/usr/include/libxml2=='    ${S}/configure.ac +    fi +}

Drop the conditional, it should *never* use uname.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUdvGrMkyGM64RGpERAia5AJwKkcp5N1xKAWHA1kCbReH+iwZsWwCfaWvi
5gv7MvkZZz3lICXG/L4O3Xo=
=oxk6
-----END PGP SIGNATURE-----

