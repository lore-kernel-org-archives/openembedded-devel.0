Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5131D747CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 May 2018 23:06:18 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q22so15901157pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2018 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MUuhy484MBkufU+bykbsZ13suHat0fAMr+l+7P9cRIs=;
	b=dRdyLb8ZmZ20qjXZmCnnKGz84vYsFKMaGGnmt/+Sh/OxpwSE5kpeljCEN5CQUmwMpL
	7l2DP8tEyvHnywrpWa2vp3fO3R7VgrCQLLTX4n+DrZrnncpBlp4938O9UO2kKap3zOgl
	hRjE/M7QjFf31dVdVKC44It+tNXxtz6JL0yImpbjVkN7z6f6WTh7muX4tlyKmAnuxg9V
	1KRj524A3COyeULmZSIN8h10ZN9REM5zCVlhA5lvVTyWPppGQKnuXIcdXUTnxcOL0uPS
	V0YJbVBNmafFcn26BV1vHiEb/Wtq89fZX4Vn0dGPTHsRJck0V5xDUz+JmEJlpzEiMAqJ
	oajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MUuhy484MBkufU+bykbsZ13suHat0fAMr+l+7P9cRIs=;
	b=bBi9Btx3/+Hl26yUy8eMFwIH3WC073b8g9hoVOYKAS0WzClH0gwozTnGC9w9DuuMIu
	4vSh1iugyhMoj/IoZYCa7c2VIj7Ax5iVqbxpgM0UPipnVBGk3gMjDe9HvdGBx83xaG9S
	QGcxMy1D+B29gjjSopImdMZ23TPMuS45ev8hnqNAnrCb7YIAL2JJxi/ZMBmS8Mi1SVEC
	QA90BZvSFP1///2MTjAXoofVx+UVR9bOiWJ7Vdx2QONaDjvHNxo3p0kMzugTBbrw4dIm
	7GapIcEIYB0KHEv8qnRxr+ylYZrRwsZODsgehg2Hia5KqVORwL7GJ6T6Jm37+4/LrX8K
	CwQw==
X-Gm-Message-State: ALQs6tA8Tfmz2MU3FHqDg6QcsuETqdN1A91pzEqJjdBis1Wcnt1Jlo2S
	uP59PSBSGgT3sVrILtzmwJXp0OtPLKcn88+xscQ=
X-Google-Smtp-Source: AB8JxZqi/7fEBRWCSHOJRW3t7MxpiNC8/LbXPfc0qQVji68745iFtsXvO8xGQtLH0jpfPHTaoSwB+AWk8VPkiHvoHeM=
X-Received: by 10.98.127.145 with SMTP id a139mr24705913pfd.25.1525388778983; 
	Thu, 03 May 2018 16:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180503094308.7549-1-mac@mcrowe.com>
In-Reply-To: <20180503094308.7549-1-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 03 May 2018 23:06:08 +0000
Message-ID: <CAMKF1srKd6337K0rPSF9nkRdtHzcw+gE9khswY_VPt4Ka9jVEQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] jdepend: Update download hashes
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
X-List-Received-Date: Thu, 03 May 2018 23:06:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 3, 2018 at 2:58 AM Mike Crowe <mac@mcrowe.com> wrote:

> When Bitbake downloads jdepend-2.9.1.zip itself and I download
> https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
> the calculated hashes don't match the ones included in the recipe.
>
> The hashes were last changed in commit
> dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
> that the file being downloaded was published on 20th January, so I can't
> explain why they are wrong.


Yeah no one knows how these archives are generated but we know that they
can change with out notice. Perhaps we should switch to using git fetcher
pointing srcrev to same release SHA
And hope that remains consistent

>
>
> Nevertheless, let's update the recipe to use hashes that match the curren=
t
> download.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Cc: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/jdepend/jdepend_2.9.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend=
/
> jdepend_2.9.1.bb
> index 5f09a8b..a924f1d 100644
> --- a/recipes-core/jdepend/jdepend_2.9.1.bb
> +++ b/recipes-core/jdepend/jdepend_2.9.1.bb
> @@ -18,7 +18,7 @@ do_compile() {
>    fastjar cf ${JARFILENAME} -C build .
>  }
>
> -SRC_URI[md5sum] =3D "9b91efe1d770e023893f89f4dde8434e"
> -SRC_URI[sha256sum] =3D
> "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f278f72e522e7f7c9"
> +SRC_URI[md5sum] =3D "0cbaf43493cd30838bee261f69e76fe9"
> +SRC_URI[sha256sum] =3D
> "b9f34236aaea5ddc070caa29794d2f5ae79bc12e199bec6ebba6c29093a17a9e"
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.11.0
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

