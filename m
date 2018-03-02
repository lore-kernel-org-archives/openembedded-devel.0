Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id A1EC0784F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 06:54:02 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id u99so5496305uau.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 22:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8orTjicIFqXLIylx2stzjlZsCmJ1fy+/kSp890n253g=;
	b=BP80IIpJeeiEywjAsgWN4taCkJOEQUshZZ1BJ7ffqtM6MCFJanGXq+NA6PRjdoJ7W8
	Ka+Lk4d7Emt7FcUuwipMpdKWHd2KageqcBBYxMOLmvnni9BvYnq59WGAiJryxrZ6DqzM
	GYYJ8jiqJ5o4qP5Pf4QbhlVpwAa0OMInwPaKaCsKwyHOH/cyZ9eQe4RhNm22OTcyvjHg
	3T+nk+XL1dPDvXsr4pUJq5gX0002JFui87MCVgNW/MYih1f68KygWQ6hENmeuUxmmfMW
	FBGZvvaYElpylRIKX0mSz8ckwugQAGonjxI97aeVlnvwi0f6lybCeVAEevLQ/81hUI8B
	z/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8orTjicIFqXLIylx2stzjlZsCmJ1fy+/kSp890n253g=;
	b=dq5hwBNV3At55WdBZ2Qfq0+2m5nahFfkQFZ+5Jjk0x5zyozOE1fQJ3GwqnXvQLAJRj
	dE7FH5m2RfXDjyNRX37+1Ql2CzqA5BhbjksdxRK8IuCY0BrhODmvJwl2IbM/S8Fp14ib
	s6iQ5401Z/4Ftb2nh1eBDSeU74yCm8gTVI8JMQ0+9nrZxF/jmopDj47mStzeeXR3dudM
	Qv7fpxHovIwBoo0cnL9jmqa/Idr6ONNsrvuRyB4oQ3TfFSzCXpKqQlZvAfrW0jt8ZU9a
	P+LJYo4Sb0+moCVvkGI5XJfJI8uoRepl+xHOVNq2rD94ZBZ3T/sjh8c2hN5alxHRnd/B
	4Mmg==
X-Gm-Message-State: APf1xPBroeopeFy8stk9YmLYfiOwCWgJRzdDyjDSCz6waIEzmQD4T/KF
	J77jzSaOulkQF4yZahpJxgl3siOqAGYGsQo4Kao=
X-Google-Smtp-Source: AG47ELtnydrl4Crk3Q6vo/7MeNRa3BYzfbXldFIUH+Xv71OOc1PSr+Vyzhu4b2NBB4SndrOX8nMZLNJJRube23hKA/A=
X-Received: by 10.176.75.109 with SMTP id i45mr3155062uaf.120.1519973643427;
	Thu, 01 Mar 2018 22:54:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.129.195 with HTTP; Thu, 1 Mar 2018 22:53:33 -0800 (PST)
In-Reply-To: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Mar 2018 22:53:33 -0800
Message-ID: <CAMKF1srpsx09j-GSZ_ZruOFPTUUeT4rkrEPdY8qQQVQBeC606w@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt][PATCH 1/5] openwrt-lua: remove hardcoded 'lib' string to a generic value CMAKE_INSTALL_LIBDIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2018 06:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2018 at 5:35 AM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> This solves a bunch of below errors and warnings when the libdir is /usr/=
lib64 for
> 64bit machine or in multilib environment:
>

Can you submit this series as github pull request please ?

> The libubox warning:
> -- snip --
> WARNING: libubox-2.0.0+gitAUTOINC+96305a3caf-r0 do_package: QA Issue: lib=
ubox: Files/directories were installed but not shipped in any package: /usr=
/lib/lua/5.1/uloop.so
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> libubox: 1 installed and not shipped files. [installed-vs-shipped]
> -- snip --
>
> The ubox recipe fails with below errors:
>
> -- snip --
> .../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavista-linux/../=
../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-linux/7.2.0/ld: ca=
nnot find -lubus collect2: error: ld returned 1 exit status
> -- snip --
>
> -- snip --
> | ../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavista-linux/..=
/../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-linux/7.2.0/ld: c=
annot find -luci
> | collect2: error: ld returned 1 exit status
> -- snip --
>
> -- snip --
> WARNING: ubox-git-r0 do_package: QA Issue: ubox: Files/directories were i=
nstalled but not shipped in any package: /usr/lib/libvalidate.so
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or
> delete them within do_install.
> ubox: 1 installed and not shipped files. [installed-vs-shipped]
> ERROR: ubox-git-r0 do_package_qa: QA Issue: /usr/sbin/validate_data conta=
ined in package ubox requires libvalidate.so()(64bit), but no providers fou=
nd in RDEPENDS_ubox? [file-rdeps]
> WARNING: ubox-git-r0 do_package_qa: QA Issue: ubox-dbg: found library in =
wrong location: /usr/lib/.debug/libvalidate.so [libdir]
> ERROR: ubox-git-r0 do_package_qa: QA run found fatal errors. Please consi=
der fixing them.
> ERROR: ubox-git-r0 do_package_qa: Function failed: do_package_qa
> -- snip --
>
> The ubus build fails with below error:
> -- snip --
> ERROR: ubus-git-r0 do_package_qa: QA Issue: /usr/bin/ubus contained in pa=
ckage ubus requires libubus.so()(64bit), but no providers found in RDEPENDS=
_ubus? [file-rdeps]
> WARNING: ubus-git-r0 do_package_qa: QA Issue: ubus-dbg: found library in =
wrong location: /usr/lib/.debug/libubus.so [libdir]
> ERROR: ubus-git-r0 do_package_qa: QA run found fatal errors. Please consi=
der fixing them.
> ERROR: ubus-git-r0 do_package_qa: Function failed: do_package_qa
> -- snip --
>
> -- snip --
> WARNING: ubus-git-r0 do_package: QA Issue: ubus: Files/directories were i=
nstalled but not shipped in any package: /usr/lib/lua/5.1/ubus.so
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> ubus: 1 installed and not shipped files. [installed-vs-shipped]
> -- snip --
>
> The netifd recipe fails with below error:
>
> -- snip --
> | cp: target =E2=80=98.../tmp_new/work/corei7-64-montavista-linux/netifd/=
git-r0/image/lib64/netifd/=E2=80=99 is not a directory
> | WARNING: .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/temp=
/run.do_install.27647:1 exit 1 from 'cp -dR --preserve=3Dmode,links .../tmp=
_new/work/corei7-64-montavista-linux/netifd/git-r0/git/scripts/* .../tmp_ne=
w/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/'
> -- snip --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  classes/openwrt-lua.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/classes/openwrt-lua.bbclass b/classes/openwrt-lua.bbclass
> index 793f363..d67ff58 100644
> --- a/classes/openwrt-lua.bbclass
> +++ b/classes/openwrt-lua.bbclass
> @@ -4,7 +4,7 @@
>  # for the terms.
>
>  OECMAKE_C_FLAGS +=3D "-DLUA_COMPAT_5_1"
> -EXTRA_OECMAKE +=3D "-DLUAPATH=3D/usr/lib/lua/5.1"
> +EXTRA_OECMAKE +=3D "-DLUAPATH=3D${libdir}/lua/5.1"
>
>  FILES_${PN}  +=3D "${libdir}/* ${datadir}/lua/5.*/"
>  FILES_${PN}-dbg  +=3D "${libdir}/lua/5.*/.debug"
> @@ -12,3 +12,12 @@ FILES_${PN}-dbg  +=3D "${libdir}/lua/5.*/.debug"
>  DEPENDS +=3D "lua5.1-native"
>  OECMAKE_C_FLAGS +=3D "-I${STAGING_INCDIR}/lua5.1"
>  CFLAGS +=3D "-I${STAGING_INCDIR}/lua5.1"
> +
> +do_configure_prepend () {
> +    if [ -e "${S}/CMakeLists.txt" ] ; then
> +        sed -i -e \
> +       "s:ARCHIVE DESTINATION lib:ARCHIVE DESTINATION \${CMAKE_INSTALL_L=
IBDIR}:g" \
> +       -e "s:LIBRARY DESTINATION lib:LIBRARY DESTINATION \${CMAKE_INSTAL=
L_LIBDIR}:g" \
> +       ${S}/CMakeLists.txt
> +    fi
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

