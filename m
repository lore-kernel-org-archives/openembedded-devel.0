Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2BD77ECA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:14:34 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r6so829882qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 20:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IvjzH6q3EEXgTHLD5Rym+STOdcfmqbxlVywrkqdlsVQ=;
	b=o3YX/KUyyXsEQJ6PJyHG6hDMdEPQN3wX/T4Hlg13Sq25RieMNENsZ7m17l/5PDHgAC
	nDtTcClrxfkjq/Fdli6iPLS7YLwqJf/Ntn3jur9OdJUhS0A4TyUsJ30iUeOV2C2N3I3G
	pNbMEecLfsMLtaUTq4OhTQnAp8uYiqu5n4xhAY2iDo4bijdvPAgRghD9grDyHejPyQfh
	varlOCVap4800xiLxuBPLo52KAY/+o/J0+kVKS+QJBd5P/YE0GrvPPeXeRdEC09zuAF1
	VQMuN2WPRhYlCVtJQ+yXm/MkdEwFFcKoga+5jccxhNwY6ckizYeEPNgUc8fjgtbXvTii
	9v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IvjzH6q3EEXgTHLD5Rym+STOdcfmqbxlVywrkqdlsVQ=;
	b=ij07joXW+tDTJ3ZTFU5muVbDTC8EJ8tbmBcXVV1C8sGdwe/fujCcdLRgPjLdUlSO4W
	blUoyrLTWfT4OX7pjgazMjO3CfWCaoMFlFGbaYqh7aKW3BNA/USc3U1XZ2WdRCXyQ9tR
	47jeOon34734lnO0pMnH8005rV0LdRXP8VJc6VaX/xQHWsWGjKLTelQyZBLpNon3O2S4
	pldx/TSHobhNcJV6SpGt/CZl+VaHBc1BZi0ao/0nsM1XQv/BmfOCKstgqPQOPXaBpInp
	YnttNoqEfq1cS96xUlNBLnLBt+dHhA0YJV4tW2xNEc6ts72M4FbMjjaB4O/+qdaWdXzL
	QQeg==
X-Gm-Message-State: APjAAAU77dccPWhHs1vXmlkRmzoxaHAIQCprXPQC0ij7fP7HGeOyU6TH
	MiERJjiN0viQyhTHgpkVfitkkM5bnKhDmffxdFo=
X-Google-Smtp-Source: APXvYqzScPiVwF03iJvj2AA9wi0JeUBK0jTbCGZctq/mcyUSysyicw5/4GM3i774UeIDXgNgOT4FJPMukSQnWq0lhco=
X-Received: by 2002:a37:4243:: with SMTP id p64mr21560378qka.9.1562728475588; 
	Tue, 09 Jul 2019 20:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190710023525.25506-1-kai.kang@windriver.com>
In-Reply-To: <20190710023525.25506-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 20:14:21 -0700
Message-ID: <CAMKF1sq+-Zic8ZBCwQ4vGoupT61DrSMbffeOrqoTnj73AM3QWw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libvncserver: update to latest commit 1354f7f
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
X-List-Received-Date: Wed, 10 Jul 2019 03:14:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 7:35 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update libvncserver to latest git commit 1354f7f which could help to fix
> do_package error when multilib is enabled:
>
> | Files/directories were installed but not shipped in any package:
> |   /usr/lib/libvncclient.so.0.9.12
> |   /usr/lib/libvncclient.so.1
> |   /usr/lib/libvncclient.so
> |   /usr/lib/libvncserver.so.0.9.12
> |   /usr/lib/libvncserver.so.1
> |   /usr/lib/libvncserver.so
> |   /usr/lib/pkgconfig
> |   /usr/lib/pkgconfig/libvncserver.pc
> |   /usr/lib/pkgconfig/libvncclient.pc
>
> Rename recipe name from _git.bb to _${version}.bb as well.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../{libvncserver_git.bb => libvncserver_0.9.12.bb}           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/libvncserver/{libvncserver_git.bb => libvncserver_0.9.12.bb} (92%)
>
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
> index bc47a3f15..683a29f94 100644
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
> @@ -31,7 +31,9 @@ FILES_libvncclient = "${libdir}/libvncclient.*"
>  inherit cmake
>
>  SRC_URI = "git://github.com/LibVNC/libvncserver"
> -SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
> +SRCREV = "1354f7f1bb6962dab209eddb9d6aac1f03408110"
>  PV = "0.9.12+git${SRCPV}"

now that PV is set in recipe name you might want to turn this into

PV .= "+git{SRCPV}"

>
>  S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

