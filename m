Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 342C371A18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:57:51 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id w95so30132wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hjToI5Hfx+HByam3Ky6Qy9U+AdXHMx5Lvio02B55rE8=;
	b=IkRHhXnwhS/QW7weee/e4adpVZ+ZskYtp5y84T8YCPyFki37VVuVm4v3WkAjC9mvpb
	Mz/LQZ+Z5uK9LAI06iuJaOMRHmYNexA78sPgC8hJoxKFOjfmR6+EEMTYdMZf97aMM4Yd
	j0Bm39Dgcqlg/ShZt7sUFc+4Ia78cbKJf2YK4xTK6aBu/n2hHKdim//heleYSz7TIdAg
	Qq2r0a8P+nAkQyYHHAsfNqVZ/HrupCL3jwHcOhsdtoxIT35F4DF3F+8S3pVqj+megMpA
	s2ZpTMwdY4G/znPaUNzK+kyLqAc1Xw0d2XH8mflmCXiaX+XBLta3UhgNM46PL/z/nFq2
	ePRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hjToI5Hfx+HByam3Ky6Qy9U+AdXHMx5Lvio02B55rE8=;
	b=WepiESRdqEM6eb9N4nHu+ZPLPgNpCCCBa2kLAYCagJZabg4SU8zmF/GsXLZ+1rGPdC
	r39aJM+AtQMKyp/Yxgajl0HhIhAry8oBUq+XAMv07fE5EKIYkk6pswV/rv8ptAbokhFN
	oXx8xLEPQERl9j3BWxm/OMVytwaMxvZERbKTG7zKYyWxqAPkhvVn8moCK0tNlskcXtuI
	2prC8ZUcZHNqrtA6QJQLapS4CTzoOtSXAxi1A4aNGEBcO+0O6F0EPZm9fOBGbVcgKTdi
	rw5a7G9T0AoJxDQxzG0ueB87isFTqjiFxJDkMVl2Jg+GU0YiIASTAhoohNJWXCKvlyrK
	QpFg==
X-Gm-Message-State: AJaThX5N2AWt8i0jrw3k3UQsCw3fpcy4UfncThM5L7L/4x0hvKKgRg8S
	mmrZaK+Ga4xNW5vJ4FYynwajsny4Ide9gl1NRNU=
X-Google-Smtp-Source: AGs4zMaLGOuGCRmao+4ucuzaByuoo2/dWkz+66SjZ5BfYHGjpGZ/NMhOvGQL81TE9b6p/0wkmWwmAVvjTFZVuzT4E/g=
X-Received: by 10.223.143.66 with SMTP id p60mr2157626wrb.99.1510858673188;
	Thu, 16 Nov 2017 10:57:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Thu, 16 Nov 2017 10:57:52 -0800 (PST)
In-Reply-To: <1510857125-8109-2-git-send-email-akuster808@gmail.com>
References: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
	<1510857125-8109-2-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Nov 2017 19:57:52 +0100
Message-ID: <CA+chaQf0yutP8Tfb8Er65DU0M=k8BQ__EU7pc-E5qn3-BWjqsQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty 2/3] flite-alsa: Fix QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 18:57:52 -0000
Content-Type: text/plain; charset="UTF-8"

does this issue exist in master as well? IIRC I haven't seen it in recent
reports.

You might want to use ${PN} as in PACKAGES:
PACKAGES += "lib${PN} lib${PN}-vox8 lib${PN}-vox16"


On Thu, Nov 16, 2017 at 7:32 PM, Armin Kuster <akuster808@gmail.com> wrote:

> ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/
> flite-alsa/1.3-r1/packages-split/libflite-alsa/usr/lib/
> libflite_cmulex.so.1.3'
>
> ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/
> flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/
> lib/libflite_cmu_us_kal.so.1.3' [ldflags]
>
> ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/
> flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/
> lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/flite/flite-alsa_1.3.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
> b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
> index 51012e6..19d789e 100644
> --- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
> +++ b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
> @@ -10,3 +10,7 @@ SRC_URI = "http://www.speech.cs.cmu.edu/
> flite/packed/flite-${PV}/flite-${PV}-rel
>
>  SRC_URI[md5sum] = "ae0aca1cb7b4801f4372f3a75a9e52b5"
>  SRC_URI[sha256sum] = "922225f7001e57a0fbace8833b0a48
> 790a68f6c7b491f2d47c78ad537ab78a8b"
> +
> +INSANE_SKIP_libflite-alsa = "ldflags"
> +INSANE_SKIP_libflite-alsa-vox8 = "ldflags"
> +INSANE_SKIP_libflite-alsa-vox16 = "ldflags"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

