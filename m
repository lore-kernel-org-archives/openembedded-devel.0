Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8069E65C63
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 10:39:40 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so2701881wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 03:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=whATJOK866siW5IpUy9S/QFwqZvr7ZWNyA7A67dMHt0=;
	b=yRT9ndIxqTqD3heJPuElCtgBSzSTOkBFQ/9Ans1qH6qzktBQWmKTXkynerzTd7ycHn
	2S/R81je+hcfLgLX/00WaUmmEWGSPMvI2jHa5wWBhQE7zFfT2LJxnXOEEmQgVdAp+28c
	K50qPSn1voYpjHevbYHvFUBwm0SLGifib6EXKffdR03qf5SsmU16oVgquTkr+5kVatVh
	Yw/nzlKNStw1C4v/YXOk0FXGElDuv0VryjjQt7t+yQbjzQ2uz/CSX/Pc+yUll/F5dmBf
	YWIZRWebSGv65uFhkN92GcMyM4KM36/1c8KWTnGaTQ+LK50vClV06an7iGMxB3noGubr
	uH0g==
X-Received: by 10.194.192.33 with SMTP id hd1mr15038261wjc.96.1434019181436;
	Thu, 11 Jun 2015 03:39:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	em17sm1014659wid.11.2015.06.11.03.39.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jun 2015 03:39:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Jun 2015 12:39:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150611103956.GA2394@jama>
References: <cover.1433403866.git.yi.zhao@windriver.com>
	<a55cd1ca790ecc6a173648bc60bf3b37f98a82b0.1433403866.git.yi.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a55cd1ca790ecc6a173648bc60bf3b37f98a82b0.1433403866.git.yi.zhao@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/3] luajit: fix build failure for multilib
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
X-List-Received-Date: Thu, 11 Jun 2015 10:39:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2015 at 03:48:11PM +0800, Yi Zhao wrote:
> Fix libdir in Makefile
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_2.0.3.bb
> index 48137e3..f3235c9 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> @@ -16,8 +16,8 @@ inherit pkgconfig binconfig
>  BBCLASSEXTEND =3D "native"
> =20
>  do_configure_prepend() {
> -    sed -i -e s:/usr/local:${prefix}:g ${S}/Makefile
> -    sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
> +    sed -i 's:PREFIX=3D /usr/local:PREFIX=3D ${prefix}:g' ${S}/Makefile
> +    sed -i 's:MULTILIB=3D lib:MULTILIB=3D ${base_libdir}:g' ${S}/Makefile
>  }

This seems to break qemux86 build

| =3D=3D=3D=3D Successfully installed LuaJIT 2.0.3 to /home/jenkins/oe/worl=
d/shr-core/tmp-glibc/sysroots/x86_64-linux/usr =3D=3D=3D=3D
| rmdir: failed to remove `/home/jenkins/oe/world/shr-core/tmp-glibc/work/x=
86_64-linux/luajit-native/2.0.3-r0/image/home/jenkins/oe/world/shr-core/tmp=
-glibc/sysroots/x86_64-linux/usr/lib/lua/5.*': No such file or directory
| rmdir: failed to remove `/home/jenkins/oe/world/shr-core/tmp-glibc/work/x=
86_64-linux/luajit-native/2.0.3-r0/image/home/jenkins/oe/world/shr-core/tmp=
-glibc/sysroots/x86_64-linux/usr/lib/lua': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/x86_64-linux/luajit-native/2.0.3-r0/temp/l=
og.do_install.31954)
NOTE: recipe luajit-native-2.0.3-r0: task do_install: Failed
ERROR: Task 31965 (virtual:native:/home/jenkins/oe/world/shr-core/meta-open=
embedded/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb, do_install) faile=
d with exit code '1'


> =20
>  EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

