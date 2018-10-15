Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 650317503E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 22:01:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x8-v6so12885995qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=25rXFKly7S2SJrcLTHVvMWqkiF1B84YXREDUqtDTKLM=;
	b=NQNBQ6mM1eqDaIFgsvgUDL1bBmFqN7jaE6LWbshsAAsH0hHoxx2lOakT2i7FPty0xP
	f2BPfzj27q2clC4skSVI5ItMG/U9FzV7P+3mh6RGM7ei9DAglcAP9TkuGywGpTcSh4zZ
	5TVxQNODaTIVC/Hd5ZydLnqNeN2VzKvFhvPJqKjykDhy+QvU1GFwbhSknSx2H7r0NSqO
	RKE3Amz0heoW/Fro/yQ2ysjlIaJahcmJweUco/Kwdy8NeJiNrsZXmL7XeUd+MAHflXX/
	zwHiD++7cpwA2vGRoXJRJeX0YiP49Ds4OCt9vszD3FHXsmcQpQsWC7HckIKJ01l0/Vd1
	QiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=25rXFKly7S2SJrcLTHVvMWqkiF1B84YXREDUqtDTKLM=;
	b=tKitIt+bdDD3iK+qu1ub8ah47vmZwgYaHO5i5VkNYxD5p+QctZN4SLBW9E1WMn0H6f
	9NdqzahNFknjIC7cnfOQjxAd3D/d+/os9QKxn9fMvcPQcLKKc9OgiNRtfk7mjB/6s0nP
	d9MP5oemuSV3LsrccxKuZUwH1rf+Wjcn+D9nBqF82nnTTHWzDtVh24cnyFGbW1cGVaWS
	dYAwiBkYdX3cxVoEnI9sC08ySAKyp0jk2XVd4t1OSz2dsMB4TdbL7pCdUiMoXWw8rTdx
	VnvYeQ6hwJbtVoLtTE8cj7GB0OkpoCSAXCw2CuJlisbUX00HrwXYFhnFCP4SYAkzuTNt
	vPYw==
X-Gm-Message-State: ABuFfojwy8KmWNQn9aSPHlUeUqiaEs2jVH5fqgJEwbhl+LdGsw6XEtdD
	8iqstp/F2713vhs9u+J9EipaDo8rvwtJFgi8sIkZAw==
X-Google-Smtp-Source: ACcGV62mK/kOaChnFQbszyDhhlHWNeouiWuUnlyOEMHKxuwiF4Gj8F/wzp24jQjQ7uESZfypOb1peFJza1PttuktHEA=
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr18596829qkl.2.1539640919823;
	Mon, 15 Oct 2018 15:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <1539637881-20308-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1539637881-20308-1-git-send-email-mark.asselstine@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Oct 2018 15:01:33 -0700
Message-ID: <CAMKF1sowVnGuDxLyK1mmgyT9B2=HbLv-pxWuW+jsAR1r+8Opnw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] polkit: fixup 'installed but not shipped' error
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
X-List-Received-Date: Mon, 15 Oct 2018 22:01:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 2:11 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> When building with 'installed-vs-shipped' QA check enabled you will
> see the following when building polkit:
>
>     ERROR: polkit-0.115-r0 do_package: QA Issue: polkit:
>      Files/directories were installed but not shipped in any package:
>       /usr/lib64/gir-1.0
>       /usr/lib64/gir-1.0/Polkit-1.0.gir
>       /usr/lib64/gir-1.0/PolkitAgent-1.0.gir
>     Please set FILES such that these items are packaged. Alternatively
>       if they are unneeded, avoid installing them or delete them within
>       do_install.
>     polkit: 3 installed and not shipped files. [installed-vs-shipped]
>     ERROR: polkit-0.115-r0 do_package: Fatal QA errors found, failing task.
>
> This is a result of the gobject instrospection GIR files not being
> included in any package. Create a do_install_append() to move these
> files to '/usr/share' where they will be picked up by the -dev
> package. This is also the commonly used location for these files.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-oe/recipes-extended/polkit/polkit_0.115.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
> index ad0f66a..ffaacaa 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
> @@ -53,3 +53,12 @@ USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysco
>
>  SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>  SYSTEMD_AUTO_ENABLE = "disable"
> +
> +do_install_append () {
> +    # should always be true since we inherit gobject-introspection, but let's just be sure
> +    if [ -d ${D}${libdir}/gir-1.0 ]; then
> +        install -d ${D}/usr
> +        install -d ${D}/usr/share

may be we can use bitbake variables here and also optimize it a bit if
possible ?
too many installs there

> +        mv ${D}${libdir}/gir-1.0 ${D}/usr/share/.



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

