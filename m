Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 64B8A7E52D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 05:57:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s49so17382723edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 22:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Vp9RwH7PqWplBcVTTmQ07HH1wRR5D4PDdXtqWUIyDIQ=;
	b=iv3PYrWUf7lhMnLzJA0TmbezEuJtt+nOJzlRgXIfcEjmyaFMUBw4gV94CN87MDbaRB
	aSETwU1vTJB9Yi2i8bH8ZPFmp7uW12/7SPhF/GpS9co1vVtxEkJEdYTmVmVlhd4vm5w1
	HcGwbY7Lj9BWSc5naLR1w2YlqZ58xqkOfIeZjJZcwK9QVeYlIykFb2SnAa/tntiO3Gkg
	r+3k50ucfEtuG/yV/IwFWdvuBx3lOQ8aRrR/4v3WYbLrjJe5CWzlD16Zuc+8R/UcnMfR
	Zy4lYFWpBjlhXExX9goflDRrG+ehgZ8dCgWA1W05zbTC2Cyss4iWcHoSIMTdcjgr+sQc
	ZtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Vp9RwH7PqWplBcVTTmQ07HH1wRR5D4PDdXtqWUIyDIQ=;
	b=n5JNO850bLXHgPIcuFsc6+zSf6MRneuZLNC4B0KMOXIBel1tWt7sOIeoVJFy4EQmhM
	2uOeCFZyKWllPdOhBoOJuGv+IEZm7VEErKVnoz8g6TVuyiU7DC+XCZpdQCy3YNiDwpoW
	FaDarxJb9w6nyULY69JFWFBRmvgW8qgoG7i5W47BXewDvpkJNtk5G9PyOGOJf4RArk87
	S2j4BpE6qWQg6m2T/f/2JBoJEpzb/CmG+5JXvUHxngpChReQxOmKHIjVYQKWC87R0DqL
	IxvxhUjfKuSdoky8BlClFHQ9WIRb8OY8A8VnqQE9TMgV3iAl1zM+yXzIcYYUBRpBHGU5
	QCGg==
X-Gm-Message-State: APjAAAVSS56qJi6aejiCs3Zvsh8INExhu5RSdQXm24z1pnfslwPxrvwW
	g5iXPtFg3jPzuwGjvnFcPU1bFIH9o9Tw/ZrfDQZqm5Ql
X-Google-Smtp-Source: APXvYqx0pMSEDZbSXpp8CJ4HTcmjocx49e6N51+z0JLgErnS/uPKuL/fEjStb3o3+R0VJIyXurwR/yVx9UpK2Z9l6s8=
X-Received: by 2002:a05:6402:654:: with SMTP id
	u20mr16340996edx.216.1567490228878; 
	Mon, 02 Sep 2019 22:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190730171338.25-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190730171338.25-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Sep 2019 07:56:58 +0200
Message-ID: <CA+chaQfpMek1nqxmGf=_zRtvON1KNxT55-WNTTdfT0y7W_ru4A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [warrior][master][PATCH] oprofile: drop kernel-vmlinux from RRECOMMENDS
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
X-List-Received-Date: Tue, 03 Sep 2019 05:57:08 -0000
Content-Type: text/plain; charset="UTF-8"

ping for warrior, this one didn't make it through last PR.

On Tue, Jul 30, 2019 at 7:13 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * now with virtual/kernel dependency dropped we don't want to depend on
> kernel signature just for
>   this RRECOMMENDS
> * fixes:
>    === Comparing signatures for task do_package_write_ipk.sigdata between
> hammerhead and mako ===
>   ERROR: oprofile different signature for task
> do_package_write_ipk.sigdata between hammerhead and mako
>   NOTE: Starting bitbake server...
>   runtaskdeps changed:
>   ['binutils/binutils_2.32.bb.do_packagedata',
> -linux/linux-lg-hammerhead_git.bb.do_packagedata, +linux/
> linux-lg-mako_git.bb.do_packagedata,
> 'opkg-utils/opkg-utils_0.4.1.bb.do_populate_sysroot:virtual:native
> oprofile/oprofile_1.3.0.bb.do_package
> oprofile/oprofile_1.3.0.bb.do_packagedata
> pseudo/pseudo_git.bb.do_populate_sysroot:virtual:native
> xz/xz_5.2.4.bb.do_populate_sysroot:virtual:native']
>   linux/linux-lg-hammerhead_git.bb.do_packagedata with hash
> 0c5215deb4737611ad413f57cf5fbdef8a9b2cc6d04035f754a4e93fb38f61d1
>    changed to
>   linux/linux-lg-mako_git.bb.do_packagedata with hash
> 0f3b34773ca3e590739754c25959feb7cdcd67cf7904ac7fe6cc535e8d6519a8
>   Dependency on task linux/linux-lg-mako_git.bb.do_packagedata was added
> with hash 0f3b34773ca3e590739754c25959feb7cdcd67cf7904ac7fe6cc535e8d6519a8
>   Dependency on task linux/linux-lg-hammerhead_git.bb.do_packagedata was
> removed with hash
> 0c5215deb4737611ad413f57cf5fbdef8a9b2cc6d04035f754a4e93fb38f61d1
>
>   ERROR: 1 errors found in
> /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sstate-diff/1563368432/signatures.mako.do_package_write_ipk.sigdata.log
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-kernel/oprofile/oprofile.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc
> b/meta-oe/recipes-kernel/oprofile/oprofile.inc
> index 515ea8faf7..a9ee775d45 100644
> --- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
> @@ -12,7 +12,6 @@ SECTION = "devel"
>
>  DEPENDS = "popt binutils"
>  RDEPENDS_${PN} = "binutils-symlinks"
> -RRECOMMENDS_${PN} = "kernel-vmlinux"
>
>  FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
>  FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV}
> ${libdir}/${BPN}/lib*.la"
> --
> 2.17.1
>
>

